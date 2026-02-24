unit uuManutencaoContasApagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, db,
  System.Generics.Collections, System.DateUtils, cxGridStrs, System.StrUtils,
  RealFramework, Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask, ExtCtrls,
  Menus, RxCurrEdit, RxToolEdit, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, Vcl.ComCtrls, AdvDateTimePicker, JvPageList, JvExControls,
  PngSpeedButton, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxCheckBox, cxTextEdit,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxCustomData, cxFilter,
  cxData, dxDateRanges, dxScrollbarAnnotations, System.ImageList, Vcl.ImgList,
  Vcl.Samples.Spin, cxImageList, cxImage, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, cxContainer, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxCore,
  cxDateUtils, cxCalendar, AdvGlassButton, Vcl.Grids, Vcl.DBGrids;

type
  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);

  TcxPainterAccess = class(TcxGridTableDataCellPainter);

type
  TfrmManutencaoContasApagar = class(Tfrm_modelo_vazio)
    pnGridDespesas: TPanel;
    PopupMenu1: TPopupMenu;
    Alterardados1: TMenuItem;
    N1: TMenuItem;
    Panel7: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Excluirttulo1: TMenuItem;
    Panel2: TPanel;
    Label10: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    stlRegistro: TcxStyle;
    stVencido: TcxStyle;
    stCancelada: TcxStyle;
    stAberto: TcxStyle;
    stPrevisto: TcxStyle;
    stBaixado: TcxStyle;
    VisualizarDANFEdecompra1: TMenuItem;
    stCabecalho: TcxStyle;
    dxComponentPrinter1: TdxComponentPrinter;
    I1: TMenuItem;
    N2: TMenuItem;
    dxComponentPrinter1Link1: TdxGridReportLink;
    pnOpcoesLancamento: TPanel;
    pgOutrosFiltros: TJvPageList;
    pgAlterarLancamento: TJvStandardPage;
    pgBaixarVariosTitulos: TJvStandardPage;
    pn912: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel12: TPanel;
    btCancelarAlteracao: TAdvGlassButton;
    btSalvarAlteracao: TAdvGlassButton;
    pnTopo: TPanel;
    btPesquisar: TPngSpeedButton;
    btNovoLancamento: TPngSpeedButton;
    btnNovaConsulta: TBitBtn;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    rdMesAtual: TRadioButton;
    rdAnoAtual: TRadioButton;
    rdEscolherPeriodo: TRadioButton;
    rdMesSelecionado: TRadioButton;
    pglSelecaoDatas: TJvPageList;
    pgSelecaoPeriodo: TJvStandardPage;
    Label6: TLabel;
    Label14: TLabel;
    edDe: TAdvDateTimePicker;
    edAte: TAdvDateTimePicker;
    pgSelecaoMes: TJvStandardPage;
    Label21: TLabel;
    cbMes: TComboBox;
    cbAno: TComboBox;
    pgSelecaoDatasNaoExibir: TJvStandardPage;
    pgNaoExibir: TJvStandardPage;
    rdMesAnterior: TRadioButton;
    Label15: TLabel;
    Label16: TLabel;
    Panel9: TPanel;
    Label2: TLabel;
    pnDadosDoLancamento: TPanel;
    Label12: TLabel;
    lbCodigoLancamento: TLabel;
    Label19: TLabel;
    lbOrigemDespesa: TLabel;
    Label18: TLabel;
    lbNomeEmpresa: TLabel;
    Label11: TLabel;
    lbUsuarioLancamento: TLabel;
    Label13: TLabel;
    lbDataLancamento: TLabel;
    lbBaixadoPorTitulo: TLabel;
    lbUsuarioBaixa: TLabel;
    lbDataDaBaixaTitulo: TLabel;
    lbDataBaixa: TLabel;
    Label23: TLabel;
    cbFornecedor: TcxLookupComboBox;
    lbTituloConta: TLabel;
    cbContaGerencial: TcxLookupComboBox;
    Label3: TLabel;
    edValorDespesa: TCurrencyEdit;
    Label8: TLabel;
    edValorEncargos: TCurrencyEdit;
    Label17: TLabel;
    edValorAtualizado: TCurrencyEdit;
    Label5: TLabel;
    edVencimentoDespesa: TcxDateEdit;
    Label4: TLabel;
    edCompetenciaDespesa: TcxDateEdit;
    rdSituacaoLancamento: TRadioGroup;
    Label7: TLabel;
    memoObsAlteracao: TMemo;
    rdInformacoesPagamento: TGroupBox;
    Label20: TLabel;
    cbContaBancaria: TcxLookupComboBox;
    edDataPagamento: TcxDateEdit;
    Label22: TLabel;
    cbkConciliado: TCheckBox;
    pgFiltros: TJvStandardPage;
    rdOrigem: TRadioGroup;
    rdgDespesaFixa: TRadioGroup;
    rdgConciliado: TRadioGroup;
    gpbSituacao: TGroupBox;
    ckbTodos: TCheckBox;
    ckbEmAberto: TCheckBox;
    ckbPrevistos: TCheckBox;
    ckbBaixados: TCheckBox;
    ckbVencidos: TCheckBox;
    ckbCancelados: TCheckBox;
    Panel1: TPanel;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton2: TAdvGlassButton;
    PngSpeedButton1: TPngSpeedButton;
    PngSpeedButton2: TPngSpeedButton;
    btEsconderDetalhes: TPngSpeedButton;
    rdgFiltroData: TRadioGroup;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label1: TLabel;
    edNomeFornecedor: TEdit;
    edNumeroNota: TCurrencyEdit;
    PngSpeedButton3: TPngSpeedButton;
    imgStatus: TcxImageList;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxgrdbclmnGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1SITUACAO_DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1CODIGO: TcxGridDBColumn;
    cxGrid1DBTableView1TIPO: TcxGridDBColumn;
    cxGrid1DBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    cxGrid1DBTableView1NUMERO_NOTA: TcxGridDBColumn;
    cxGrid1DBTableView1PARCELA: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_COMPETENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO_CONTA_GERENCIAL: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_PAGAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR: TcxGridDBColumn;
    cxGrid1DBTableView1MULTA: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR_ATUALIZADO: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1USUARIO_INCLUSAO: TcxGridDBColumn;
    cxGrid1DBTableView1OBS: TcxGridDBColumn;
    cxGrid1DBTableView1USUARIO_BAIXA: TcxGridDBColumn;
    cxGrid1DBTableView1COD_CONTA: TcxGridDBColumn;
    cxGrid1DBTableView1CODIGO_ENTRADA: TcxGridDBColumn;
    cxGrid1DBTableView1SITUACAO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_FORNECEDOR: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_FANTASIA: TcxGridDBColumn;
    cxGrid1DBTableView1CGC_CPF: TcxGridDBColumn;
    cxGrid1DBTableView1ID_CONTA_BANCARIA: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO_CONTA_BANCARIA: TcxGridDBColumn;
    cxGrid1DBTableView1COD_EMP_GRUPO: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO_EMPRESA: TcxGridDBColumn;
    cxGrid1DBTableView1FIXA: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    O1: TMenuItem;
    N3: TMenuItem;
    S1: TMenuItem;
    R1: TMenuItem;
    cxGrid1DBTableView1STATUS: TcxGridDBColumn;
    rdSituacaoLancamentoVariosTitulos: TRadioGroup;
    rdInformacoesPagamentoVarios: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    cxckbContaBancariaVariosPagamentos: TcxLookupComboBox;
    cbDataPagamentoVariosTitulos: TcxDateEdit;
    Panel3: TPanel;
    Label26: TLabel;
    Panel13: TPanel;
    AdvGlassButton3: TAdvGlassButton;
    AdvGlassButton4: TAdvGlassButton;
    N4: TMenuItem;
    Label28: TLabel;
    Label29: TLabel;
    lbTotalTitulosSelecionados: TLabel;
    lbQtTitulosSelecionados: TLabel;

    procedure AdvGlassButton2Click(Sender: TObject);
    procedure AdvGlassButton4Click(Sender: TObject);
    procedure btCancelarAlteracaoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Alterardados1Click(Sender: TObject);
    procedure btEsconderDetalhesClick(Sender: TObject);
    procedure ckbEmAbertoClick(Sender: TObject);
    procedure ckbTodosClick(Sender: TObject);
    procedure CSV1Click(Sender: TObject);
    procedure Excluirttulo1Click(Sender: TObject);

    procedure btPesquisarClick(Sender: TObject);
    procedure rdMesAtualClick(Sender: TObject);
    procedure ExcelXLSX1Click(Sender: TObject);
    procedure HTML1Click(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btSalvarAlteracaoClick(Sender: TObject);
    procedure cbAnoSelect(Sender: TObject);
    procedure cbMesSelect(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1CustomDrawColumnHeader(Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1SITUACAO_DESCRICAOCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1SITUACAO_DESCRICAOGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure edNomeFornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure VisualizarDANFEdecompra1Click(Sender: TObject);
    procedure XML1Click(Sender: TObject);
    procedure cxGrid1DBTableView1VALOR_ATUALIZADOStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure I1Click(Sender: TObject);
    procedure btNovoLancamentoClick(Sender: TObject);
    procedure cxgrdbclmnGrid1DBTableView1Column2GetProperties(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure PngSpeedButton2Click(Sender: TObject);
    procedure PngSpeedButton3Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure cxgrdbclmnGrid1DBTableView1Column2PropertiesEditValueChanged(Sender: TObject);
    procedure rdSituacaoLancamentoClick(Sender: TObject);
    procedure rdSituacaoLancamentoVariosTitulosClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
  private
    FUltimoRegistroSelecionado: string;

    FRegistrosSelecionados: TStringList;
    LImpressaoRelatorio: boolean;
    LDespesaVeioDasCompras: Boolean;
    LCodigoTituloPrincincipal, LCodigoTituloAlteracao, LTipoTituloAlteracao: string;
    LDataCompetenciaTituloSelecionado: Tdate;
    procedure getSQLConsulta(ALista: TstringList);
    procedure Pesquisar;
    procedure AdicionarFiltrosDaConsulta(ALista: TstringList);
    procedure VerificarFiltros;
    procedure verificaPossibilidadeDeCancelamento;
    procedure ExcluirTitulo(ACodigo: string);
    procedure ImprimirGrid;
    procedure RestoreColumnVisibility(GridView: TcxGridDBTableView; const OriginalVisibility: TArray<Boolean>);
    procedure SetColumnVisibilityForPrinting(GridView: TcxGridDBTableView; VisibleTags: Integer);
    procedure ExibirMenuOpcoes(APagina: TJvStandardPage);

    procedure FecharOpcoesERetornarAoGrid;
    procedure DesabilitaCamposLancamentoCompras;
    procedure HabilitaCampos;
    procedure AtualizarLancamento;
    function ValidarAlteracao: Boolean;

    procedure SelecionarTodosOsRegistros(ASelecionar: boolean);
    procedure SelecionaLancamento;
    function verificaTitulosPagosSelecao: boolean;

    procedure ProcessaAtualizacaoDeTitulosEmLote;

    function getQtdeLancamentosSelecionados: integer;
    function ValidarAlteracaoVariosTitulos: boolean;
    procedure AtualizarLancamentoEmLote(ALista: TList<string>);
    function GerarSQLAtualizacaoLancamento(ACodigo: string): string;
    procedure BaixarVariosTitulos;
    procedure MarcarSelecionados(const ListaCodigos: TStringList);
    procedure AlterarOuBaixarTituloIndividual(LCodigo: string);
    procedure CarregarDadosDoTituloParaAlteracao(ACodigo: string);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SalvarRegistroAtual;
    procedure RestaurarRegistroAtualNoGrid;



    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutencaoContasApagar: TfrmManutencaoContasApagar;

implementation

uses
  uu_data_module, uu_frm_principal, uuDmContasAPagar, uuContasAPagarEntradas,
  uuFrmDRE;

{$R *.dfm}

procedure TfrmManutencaoContasApagar.FormDestroy(Sender: TObject);
begin
  inherited;


  if Assigned(FRegistrosSelecionados) then
    FreeAndNil(FRegistrosSelecionados);
  if Assigned(dmContasAPagar) then
    FreeAndNil(dmContasAPagar);
end;

procedure TfrmManutencaoContasApagar.FormCreate(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdmContasAPagar, dmContasAPagar);
  FRegistrosSelecionados := Tstringlist.Create;



  carregaComboAnos(cbAno);
  carregaComboMeses(cbMes);
  configuraOpcoesData(rdMesAtual, edDe, edAte, cbMes, cbAno);
  LImpressaoRelatorio := false;
  btPesquisar.click;
end;

procedure TfrmManutencaoContasApagar.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmManutencaoContasApagar.FormActivate(Sender: TObject);
begin
  inherited;
//  btPesquisar.Click;
//  cxGrid1DBTableView1.OptionsView.GroupByBox.Caption := 'Arraste as colunas que desejar para esta caixa para criar agrupamentos';
end;

procedure TfrmManutencaoContasApagar.Alterardados1Click(Sender: TObject);
var
  LQtdRegistrosSelecionados: integer;
  LCodTituloSelecionado: string;
begin

  LCodTituloSelecionado := dmContasAPagar.QryContasAPagar.fieldbyname('codigo').value;
  LQtdRegistrosSelecionados := getQtdeLancamentosSelecionados;

  if LQtdRegistrosSelecionados < 2 then
    AlterarOuBaixarTituloIndividual(LCodTituloSelecionado)
  else
    BaixarVariosTitulos;

end;

procedure TfrmManutencaoContasApagar.AlterarOuBaixarTituloIndividual(LCodigo: string);
begin
  inherited;
  try
    try

      CarregarDadosDoTituloParaAlteracao(LCodigo);
      ExibirMenuOpcoes(pgAlterarLancamento);
      if rdSituacaoLancamento.ItemIndex <> 2 then
        edValorDespesa.setfocus;
    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', e.Message, 22, false);
        FecharOpcoesERetornarAoGrid;
      end;
    end;
  finally

  end;

end;

procedure TfrmManutencaoContasApagar.ExibirMenuOpcoes(APagina: TJvStandardPage);
begin
  pnOpcoesLancamento.Width := 357;
  pnOpcoesLancamento.Visible := true;
  APagina.Show;
end;

procedure TfrmManutencaoContasApagar.ckbEmAbertoClick(Sender: TObject);
begin
  inherited;
  if ((Sender as TCheckBox).Checked = false) then
    ckbTodos.Checked := false;

end;

procedure TfrmManutencaoContasApagar.ckbTodosClick(Sender: TObject);
begin
  inherited;
  if ckbTodos.Checked then
  begin
    ckbEmAberto.Checked := true;
    ckbPrevistos.Checked := true;
    ckbBaixados.Checked := true;
    ckbVencidos.Checked := true;
  end
  else
  begin
    ckbEmAberto.Checked := false;
    ckbPrevistos.Checked := false;
    ckbBaixados.Checked := false;
    ckbVencidos.Checked := false;
  end;

end;

procedure TfrmManutencaoContasApagar.CSV1Click(Sender: TObject);
begin
  inherited;
  dm.ExportarCXGrid(cxGrid1, TExpCSV);
end;

procedure TfrmManutencaoContasApagar.Excluirttulo1Click(Sender: TObject);
var
  LCodigoConta: string;
begin
  inherited;

  if dm.verificaPermissaoAcao('I80001004', true, true) = true then
  begin
    try
      if getQtdeLancamentosSelecionados > 1 then
        raise Exception.Create('Não é permitido excluir mais de um título selecionado por vez!');

      LCodigoConta := dmContasAPagar.QryContasAPagar.fieldbyname('codigo').value;

      verificaPossibilidadeDeCancelamento;
      if (ShowRealDialog(frm_principal, tmConfirmacaoPorPIN, 'Confirme', 'Tem certeza que deseja excluir este título?', 22, true) = teSim) then
      begin
        ExcluirTitulo(LCodigoConta);
        ShowRealDialog(frm_principal, tmSucesso, 'Sucesso', 'Exclusão efetuada com sucesso!');
        btPesquisar.Click;
      end;

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', e.Message, 22, false);
      end;
    end;

  end;

end;

procedure TfrmManutencaoContasApagar.ExcluirTitulo(ACodigo: string);
var
  LSQL: TStringlist;
begin
  dm.executaSQL('delete from contas_a_pagar cp where cp.codigo=' + Quotedstr(ACodigo));
end;

procedure TfrmManutencaoContasApagar.ExcelXLSX1Click(Sender: TObject);
begin
  inherited;
  dm.ExportarCXGrid(cxGrid1, TExpXLSX);
end;

procedure TfrmManutencaoContasApagar.HTML1Click(Sender: TObject);
begin
  inherited;
  dm.ExportarCXGrid(cxGrid1, TExpHTML);
end;

procedure TfrmManutencaoContasApagar.btPesquisarClick(Sender: TObject);
begin
  inherited;
  Pesquisar;

end;

procedure TfrmManutencaoContasApagar.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmManutencaoContasApagar.rdMesAtualClick(Sender: TObject);
begin
  inherited;
  configuraOpcoesData((Sender as TRadioButton), edDe, edAte, cbMes, cbAno);
  Pesquisar();
end;

procedure TfrmManutencaoContasApagar.XML1Click(Sender: TObject);
begin
  inherited;
  dm.ExportarCXGrid(cxGrid1, TExpXML);
end;

procedure TfrmManutencaoContasApagar.getSQLConsulta(ALista: TstringList);
begin
  ALista.add(' select 0 as SEL, cp.codigo, coalesce(cp.codigo_entrada, ' + Quotedstr('') + ') as codigo_entrada,cp.descricao_conta, cp.status, ');
  ALista.add('        cast(e.numero_nota as integer) as numero_nota,');
  ALista.add('        case');
  ALista.add('         when cp.codigo_entrada is null then ' + Quotedstr('Financeiro'));
  ALista.add('         when trim(cp.codigo_entrada) = ' + Quotedstr('') + ' then ' + Quotedstr('Financeiro'));
  ALista.add('         else');
  ALista.add('          ' + Quotedstr('Compras'));
  ALista.add('        end as tipo,');
  ALista.add(' ');
  ALista.add('        case');
  ALista.add('         when ((cp.status = 0) and (cp.data_vencimento >= current_date) ) then 0');
  ALista.add('         when ( ((cp.status = 0) or (cp.status=2)) and (cp.data_vencimento < current_date) ) then -1');
  ALista.add('         when (cp.status =1) then 1');
  ALista.add('         when  (cp.status = 2) then 2');
  ALista.add('        end as situacao,');
  ALista.add(' ');
  ALista.add('        case');
  ALista.add('         when ((cp.status = 0) and (cp.data_vencimento >= current_date) ) then');
  ALista.add('           ' + Quotedstr('Aberto'));
  ALista.add('         when ( ((cp.status = 0) or (cp.status=2)) and (cp.data_vencimento < current_date) ) then');
  ALista.add('           ' + Quotedstr('Vencido'));
  ALista.add('         when (cp.status =1) then');
  ALista.add('          ' + Quotedstr('Pago'));
  ALista.add('         when  (cp.status = 2) then');
  ALista.add('          ' + Quotedstr('Previsto'));
  ALista.add('        end as situacao_descricao,');
  ALista.add(' ');
  ALista.add(' ');
  ALista.add('        cp.cod_fornecedor,');
  ALista.add('        coalesce(f.razao_social, ' + Quotedstr('') + ') as razao_social, coalesce(f.nome_fantasia, ' + Quotedstr('') + ') as nome_fantasia, f.cgc_cpf,');
  ALista.add('        cp.data_entrada, cp.data_lancamento,');
  ALista.add('        coalesce(cp.data_competencia, cp.data_vencimento) as data_competencia, cp.data_pagamento,');
  ALista.add('        cp.data_vencimento,cp.usuario_inclusao,');
  ALista.add('        cp.usuario_baixa, cp.valor,cp.multa,(cp.valor + cp.multa) as valor_atualizado, cp.obs,');
  ALista.add('        cp.parcela,cp.id_conta_bancaria, cb.descricao as descricao_conta_bancaria,cod_primeiro_titulo,');
  ALista.add('        cp.cod_emp_grupo, p.descricao_empresa, cp.cod_conta, coalesce(pc.descricao, ' + Quotedstr('Compras diversas') + ') as descricao_conta_gerencial,');
  ALista.add('        coalesce(cp.fixa,0) as fixa,');
  ALista.add('        case');
  ALista.add('         when coalesce(cp.fixa,0) = 0 then ' + Quotedstr('Nao'));
  ALista.add('         when coalesce(cp.fixa,0) = 1 then ' + Quotedstr('Sim'));
  ALista.add('        end as fixa_descricao,');
  ALista.add('        coalesce(cp.conciliado,0) as conciliado,');
  ALista.add('        case');
  ALista.add('         when coalesce(cp.conciliado,0) = 0 then ' + Quotedstr('Nao'));
  ALista.add('         when coalesce(cp.conciliado,0) = 1 then ' + Quotedstr('Sim'));
  ALista.add('        end as conciliado_descricao,');
  ALista.add('     coalesce(e.chave_nfe,' + Quotedstr('') + ') as chave_nfe');
  ALista.add(' ');
  ALista.add('   from contas_a_pagar cp');
  ALista.add('     inner join fornecedor f on (f.cod_fornecedor = cp.cod_fornecedor)');
  ALista.add('     left join  entradas   e on (e.cod_entrada = cp.codigo_entrada)');
  ALista.add('     left join contas_bancarias cb on (cb.id = cp.id_conta_bancaria)');
  ALista.add('     left join plano_contas_financeiro pc on (pc.cod_conta = cp.cod_conta)');
  ALista.add('     inner join parametros p on (p.cod_empresa = cp.cod_emp_grupo)');

  case rdgFiltroData.ItemIndex of
    0:
      ALista.add('       where cp.data_vencimento  between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));
    1:
      ALista.add('       where cp.data_pagamento  between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));
    2:
      ALista.add('        where cp.data_competencia  between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));
    3:
      ALista.add('        where cp.data_lancamento  between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));
  end;

end;

procedure TfrmManutencaoContasApagar.Pesquisar();
var
  LSQL: TStringList;
begin
  dmContasAPagar.qryContasAPagar.DisableControls;
  LSQL := TStringList.Create;
  try
    try

      VerificarFiltros();
      LSQL.Add(' select * from (');
      getSQLConsulta(LSQL);
      LSQL.add(') ');
      AdicionarFiltrosDaConsulta(LSQL);
      dmContasAPagar.QryContasAPagar.Active := false;


      {
      dmContasAPagar.QryContasAPagar.Active := false;
      dmContasAPagar.QryContasAPagar.sql.Clear;
      dmContasAPagar.QryContasAPagar.sql.add(LSQL.Text);}


      dm.adicionaLog(LSQL.text);
//      dmContasAPagar.QryContasAPagar.Active := True;


      dm.getMemTable(dmContasAPagar.QryContasAPagar, LSQL.Text);

      cxGrid1DBTableView1.ViewData.Expand(true);

      MarcarSelecionados(FRegistrosSelecionados);

    except
      on E: exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao relizar consulta! ' + sLineBreak + sLineBreak + e.Message, 22, false);
      end;
    end;

  finally
    dmContasAPagar.qryContasAPagar.EnableControls;
    FreeAndNil(LSQL);
    if (trim(FUltimoRegistroSelecionado) <> '') then
      RestaurarRegistroAtualNoGrid;
  end;
end;

procedure TfrmManutencaoContasApagar.AdicionarFiltrosDaConsulta(ALista: TstringList);
var
  LFiltroSituacao: string;
  LFiltroOrigem: string;
begin
{
  case rdgFiltroData.ItemIndex of
    0:
      ALista.add('       where data_vencimento  between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));
    1:
      ALista.add('       where data_pagamento  between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));
    2:
      ALista.add('        where data_competencia  between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));
    3:
      ALista.add('        where data_lancamento  between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));
  end;

  }
  ALista.add(' where 1=1 ');

  if ckbTodos.Checked = false then
  begin
    LFiltroSituacao := '(' + Quotedstr('');
    if ckbEmAberto.Checked then
      LFiltroSituacao := LFiltroSituacao + ',' + QuotedstR('Aberto');

    if ckbPrevistos.Checked then
      LFiltroSituacao := LFiltroSituacao + ',' + QuotedstR('Previsto');

    if ckbVencidos.Checked then
      LFiltroSituacao := LFiltroSituacao + ',' + QuotedstR('Vencido');

    if ckbBaixados.Checked then
      LFiltroSituacao := LFiltroSituacao + ',' + QuotedstR('Pago');

    if ckbCancelados.Checked then
      LFiltroSituacao := LFiltroSituacao + ',' + QuotedstR('Cancelado');
    LFiltroSituacao := LFiltroSituacao + ')';
    ALista.add(' and situacao_descricao in ' + LFiltroSituacao);

  end;

  case rdOrigem.ItemIndex of
    1:
      ALista.add(' and tipo=' + Quotedstr('Compras'));
    2:
      ALista.add(' and tipo=' + Quotedstr('Financeiro'));
  end;

  case rdgDespesaFixa.ItemIndex of
    1:
      ALista.add(' and fixa=1');
    2:
      ALista.add(' and fixa=0');
  end;

  case rdgConciliado.ItemIndex of
    1:
      ALista.add(' and conciliado=1');
    2:
      ALista.add(' and conciliado=0');
  end;

  if trim(edNomeFornecedor.Text) <> '' then
    ALista.Add(' and (razao_social like ' + Quotedstr('%' + edNomeFornecedor.Text + '%') + ' or nome_fantasia like ' + Quotedstr('%' + edNomeFornecedor.Text + '%') + ')');

  if edNumeroNota.Value <> 0 then
    ALista.Add(' and numero_nota=' + floattostr(edNumeroNota.value));

end;

procedure TfrmManutencaoContasApagar.AdvGlassButton2Click(Sender: TObject);
begin
  inherited;
  Pesquisar;
end;

procedure TfrmManutencaoContasApagar.AdvGlassButton4Click(Sender: TObject);
var
  LMensagem: TStringList;
var
  LListaLancamentos: TList<string>;
begin
  inherited;
  LListaLancamentos := TList<string>.Create;
  LMensagem := Tstringlist.create;

  LMensagem.add('Confirma a operação abaixo ? ');
  LMensagem.add('');
  case rdSituacaoLancamentoVariosTitulos.ItemIndex of
    0:
      LMensagem.add('Operação: PROVISIONAMENTO');
    1:
      begin
        LMensagem.add('Operação: PAGAMENTO (BAIXA)');
        LMensagem.add('Data da baixa: ' + cbDataPagamentoVariosTitulos.Text);
      end;

  end;

  LMensagem.add('Nº de Títulos: ' + lbQtTitulosSelecionados.caption);
  LMensagem.add('Total: ' + lbTotalTitulosSelecionados.Caption);

  try
    try
      if ValidarAlteracaoVariosTitulos then
      begin
        if (ShowRealDialog(frmManutencaoContasApagar, tmConfirmacaoPorPINNumerico, 'Confirme', LMensagem.text) = teSim) then
        begin
          AtualizarLancamentoEmLote(LListaLancamentos);
          FecharOpcoesERetornarAoGrid;
          ShowRealDialog(frm_principal, tmSucesso, 'Sucesso', 'Atualização em lote realizada!');
        end;
      end;

    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', e.message);
      end;
    end;
  finally
    FreeAndNil(LMensagem);
    FreeAndNil(LListaLancamentos);
  end;

end;

procedure TfrmManutencaoContasApagar.btCancelarAlteracaoClick(Sender: TObject);
begin
  inherited;
  FecharOpcoesERetornarAoGrid;
end;

procedure TfrmManutencaoContasApagar.btSalvarAlteracaoClick(Sender: TObject);
begin
  inherited;

  try
    try
      if ValidarAlteracao then
      begin
        AtualizarLancamento;
        FecharOpcoesERetornarAoGrid;
        ShowRealDialog(frm_principal, tmSucesso, 'Sucesso', 'Alteração realizada!');
      end;

    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', e.message);
      end;
    end;
  finally

  end;

end;

procedure TfrmManutencaoContasApagar.ProcessaAtualizacaoDeTitulosEmLote();
var
  AListaSQL: TList<string>;
begin
  AListaSQL := TList<string>.Create;

  try
    try

    except
      on E: Exception do
      begin

      end;

    end;
  finally
    FreeAndNil(AListaSQL);
  end;

end;

procedure TfrmManutencaoContasApagar.cbAnoSelect(Sender: TObject);
begin
  inherited;
  configuraDataSelecaoPorMes(cbMes, cbAno, edDe, edAte);
  Pesquisar();
end;

procedure TfrmManutencaoContasApagar.cbMesSelect(Sender: TObject);
begin
  inherited;
  configuraDataSelecaoPorMes(cbMes, cbAno, edDe, edAte);
  Pesquisar();
end;

procedure TfrmManutencaoContasApagar.cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  LIndice: integer;
begin
  if dmContasAPagar.QryContasAPagar.IsEmpty = true then
    exit;

  if AViewInfo.Item = cxGrid1DBTableView1VALOR_ATUALIZADO then
  begin
    LIndice := AnsiIndexStr(UpperCase(AViewInfo.GridRecord.Values[1]), ['VENCIDO', 'ABERTO', 'PAGO', 'PREVISTO']);
    case LIndice of
      0:
        ACanvas.Font.Color := $005A5AEF;
      1:
        ACanvas.Font.Color := $00EF7E08;
      2:
        ACanvas.Font.Color := $2058A85D;
      3:
        ACanvas.Font.Color := $0031C5F0;

    end;
    ACanvas.Font.Style := [fsBold];
    ADone := False;
  end;
end;

procedure TfrmManutencaoContasApagar.verificaPossibilidadeDeCancelamento();
begin

  if UpperCase(dmContasAPagar.QryContasAPagar.FieldByName('TIPO').value) = 'COMPRAS' then
    raise Exception.Create('Não é possível excluir um título que foi originado através de compras. Para processar esta exclusão cancele a compra que originou este título!');

  if UpperCase(dmContasAPagar.QryContasAPagar.FieldByName('SITUACAO_DESCRICAO').value) = 'PAGO' then
    raise Exception.Create('Não é possível excluir um título que já foi pago!');
end;

procedure TfrmManutencaoContasApagar.cxGrid1DBTableView1CustomDrawColumnHeader(Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;

  // Desenha um fundo sem bordas
  ACanvas.Brush.Color := $00F9EFEE;
  ACanvas.FillRect(AViewInfo.Bounds);

  // Desenha o texto no cabeçalho
  ACanvas.Font.Color := clBlack;
  ACanvas.DrawTexT(AViewInfo.Text, AViewInfo.Bounds, cxAlignVCenter or cxAlignHCenter);

  // Indica que o desenho está concluído

//  ADone := True;

end;

procedure TFrmManutencaoContasApagar.RestaurarRegistroAtualNoGrid;
var
  RowIndex: Integer;
begin
  try
    try
      if (trim(FUltimoRegistroSelecionado) = '') then
        Exit;

      if not dmContasAPagar.qryContasAPagar.Locate('CODIGO', FUltimoRegistroSelecionado, []) then
        Exit;

      RowIndex := cxGrid1DBTableView1.DataController.FocusedRowIndex;
      if RowIndex >= 0 then
      begin
        cxGrid1DBTableView1.Controller.FocusedRowIndex := RowIndex;
      end;
      cxGrid1DBTableView1.Controller.FocusedRecord.Selected := True;
      cxGrid1DBTableView1.Controller.MakeFocusedRecordVisible;



    except
      on E: Exception do
      begin

      end;
    end;
  finally

  end;

end;

procedure TfrmManutencaoContasApagar.cxGrid1DBTableView1SITUACAO_DESCRICAOCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  LIndice: integer;
  X, Y: Integer;
//  APainter: TcxPainterAccess;
begin
  if LImpressaoRelatorio = false then
  begin

    if dmContasAPagar.QryContasAPagar.IsEmpty = true then
      exit;
    ACanvas.FillRect(AViewInfo.Bounds, AViewInfo.Params.Color);
    LIndice := AnsiIndexStr(UpperCase(AViewInfo.GridRecord.Values[1]), ['VENCIDO', 'ABERTO', 'PAGO', 'PREVISTO']);
    with AViewInfo.ClientBounds do
      imgStatus.Draw(ACanvas.Canvas, Left + 1, Top + 1, LIndice);

    ADone := True;
  end;

end;

procedure TFrmManutencaoContasApagar.SalvarRegistroAtual;
begin
  try
    if not dmContasAPagar.qryContasAPagar.IsEmpty then
      FUltimoRegistroSelecionado := dmContasAPagar.qryContasAPagar.FieldByName('CODIGO').Value;



  finally

  end;

end;

procedure TfrmManutencaoContasApagar.cxGrid1DBTableView1SITUACAO_DESCRICAOGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if LImpressaoRelatorio = false then
    AText := '';

end;

procedure TfrmManutencaoContasApagar.cxGrid1DBTableView1VALOR_ATUALIZADOStylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  LIndice: integer;
begin
 { if dmContasAPagar.QryContasAPagar.IsEmpty = true then
    exit;

  LIndice := AnsiIndexStr(UpperCase(ARecord.Values[0]), ['VENCIDO', 'ABERTO', 'PAGO', 'PREVISTO']);


  case LIndice of
    0:
      AStyle := stVencido;
    1:
      AStyle := stAberto;
    2:
      AStyle := stBaixado;
    3:
      AStyle := stPrevisto;

  end;
//    AStyle.Color := clNone; // Sem preenchimento de fundo
}
end;

procedure TfrmManutencaoContasApagar.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  {
  if Key = vk_return then
    Pesquisar();}
end;

procedure TfrmManutencaoContasApagar.edNomeFornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = vk_return then
    Pesquisar();
end;

procedure TfrmManutencaoContasApagar.I1Click(Sender: TObject);
begin
  inherited;
  try
    LImpressaoRelatorio := true;
    btPesquisar.Click;
    ImprimirGrid;
  finally
    LImpressaoRelatorio := false;
  end;

end;

procedure TfrmManutencaoContasApagar.VerificarFiltros();
begin

  if edDe.date > edAte.date then
    raise Exception.Create('Periodo de datas inválido!');

end;

procedure TfrmManutencaoContasApagar.VisualizarDANFEdecompra1Click(Sender: TObject);
var
  LChaveNFE: string;
  LTipoLancamento: string;
begin
  inherited;
  LChaveNFE := dmContasAPagar.QryContasAPagar.FieldByName('chave_nfe').value;
  LTipoLancamento := dmContasAPagar.QryContasAPagar.FieldByName('tipo').value;

  if ((dmContasAPagar.QryContasAPagar.IsEmpty = false) and (LTipoLancamento = 'Compras')) then
  begin
    if (trim(LChaveNFE) <> '') then
    begin
      dm.VisualizarDanfeCompra(LChaveNFE);
    end
    else
    begin
      showRealDialog(frm_principal, tmAviso, 'Aviso', 'Compra não possui DANFE associado. Provavelmente uma entrada avulsa!', 22, false);
    end
  end
  else
  begin
    showRealDialog(frm_principal, tmAviso, 'Aviso', 'Este lançamento não é uma compra!', 22, false);
  end;
end;

procedure TfrmManutencaoContasApagar.SetColumnVisibilityForPrinting(GridView: TcxGridDBTableView; VisibleTags: Integer);
var
  i: Integer;
begin
  for i := 0 to GridView.ColumnCount - 1 do
  begin
    GridView.Columns[i].Visible := false;
    // Torna invisível as colunas com Tag diferente do especificado
    if GridView.Columns[i].Tag <> 0 then
      GridView.Columns[i].Visible := true;
  end;
end;

procedure TfrmManutencaoContasApagar.RestoreColumnVisibility(GridView: TcxGridDBTableView; const OriginalVisibility: TArray<Boolean>);
var
  i: Integer;
begin
  for i := 0 to GridView.ColumnCount - 1 do
  begin
    // Restaura a visibilidade original das colunas
    if GridView.Columns[i].Tag <> -1 then
      GridView.Columns[i].Visible := true
    else
      GridView.Columns[i].Visible := false;
  end;
end;

procedure TfrmManutencaoContasApagar.ImprimirGrid;
var
  OriginalVisibility: TArray<Boolean>;
  i: Integer;
begin
  // Salva o estado atual de visibilidade das colunas
  dxComponentPrinter1Link1.PrinterPage.PageHeader.CenterTitle.Text := 'Listagem de contas à pagar';
  SetLength(OriginalVisibility, CxGrid1DBTableView1.ColumnCount);
  for i := 0 to CxGrid1DBTableView1.ColumnCount - 1 do
    OriginalVisibility[i] := CxGrid1DBTableView1.Columns[i].Visible;

  try
    // Ajusta a visibilidade para a impressão (somente colunas com Tag = 1)
    SetColumnVisibilityForPrinting(CxGrid1DBTableView1, 1);

    // Exibe a visualização do relatório
    dxComponentPrinter1.Preview(True);
  finally
    // Restaura o estado original das colunas
    RestoreColumnVisibility(CxGrid1DBTableView1, OriginalVisibility);
  end;
end;

procedure TfrmManutencaoContasApagar.btNovoLancamentoClick(Sender: TObject);
begin
  inherited;

  while dmContasAPagar.getLancouTitulo = false do
  begin
    Application.CreateForm(TfrmContasApagarEntradas, frmContasApagarEntradas);
    frmContasApagarEntradas.ShowModal;
    frmContasApagarEntradas.free;

    if dmContasAPagar.getLancouTitulo then
    begin
      if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'Deseja lançar outro título ?', 22, true) = teSim) then
      begin
        dmContasAPagar.setLancouTitulo(false);
      end;
    end
    else
    begin
      dmContasAPagar.setLancouTitulo(true);
    end;

  end;
  dmContasAPagar.setLancouTitulo(false);
  Pesquisar;
end;

procedure TfrmManutencaoContasApagar.FecharOpcoesERetornarAoGrid;
begin
  try
    pnGridDespesas.Enabled := true;
    pnOpcoesLancamento.Visible := false;
  finally
    Pesquisar;
  end;

end;

procedure TfrmManutencaoContasApagar.DesabilitaCamposLancamentoCompras;
begin
  cbFornecedor.Properties.ReadOnly := true;
  cbFornecedor.Style.Color := $00CDCDC9;
  lbTituloConta.Visible := false;
  cbContaGerencial.Visible := false;
  edValorDespesa.ReadOnly := true;
  edValorDespesa.Color := $00CDCDC9;
  lbTituloConta.Visible := false;
  cbContaGerencial.Visible := false;

end;

procedure TfrmManutencaoContasApagar.HabilitaCampos;
begin
  cbFornecedor.Properties.ReadOnly := False;
  cbFornecedor.Style.Color := clWhite;
  lbTituloConta.Visible := true;
  cbContaGerencial.Visible := True;
  edValorDespesa.ReadOnly := false;
  edValorDespesa.Color := clWhite;
  pnDadosDoLancamento.Enabled := true;
  btSalvarAlteracao.Enabled := true;
  lbTituloConta.Visible := true;
  cbContaGerencial.Visible := true;

end;

procedure TfrmManutencaoContasApagar.CarregarDadosDoTituloParaAlteracao(ACodigo: string);
begin

  dmContasAPagar.qryContasAPagar.DisableControls;
  dmContasAPagar.qryContasAPagar.Filtered := False;
  dmContasAPagar.qryContasAPagar.Filter := 'codigo = ' + Quotedstr(ACodigo);
  dmContasAPagar.qryContasAPagar.Filtered := True;

  try
    try
      cbContaBancaria.EditValue := dmContasAPagar.qryContasBancarias.FieldByName('id').Value;
      cbDataPagamentoVariosTitulos.EditValue := Date;

      LDespesaVeioDasCompras := false;
      edDataPagamento.Clear;
      edDataPagamento.EditValue := null;
      LCodigoTituloPrincincipal := dmContasAPagar.QryContasAPagar.FieldByName('cod_primeiro_titulo').Value;
      LCodigoTituloAlteracao := dmContasAPagar.QryContasAPagar.FieldByName('codigo').Value;
      LTipoTituloAlteracao := dmContasAPagar.QryContasAPagar.FieldByName('tipo').Value;
      LDataCompetenciaTituloSelecionado := dmContasAPagar.QryContasAPagar.FieldByName('data_competencia').Value;

      cbFornecedor.EditValue := dmContasAPagar.QryContasAPagar.FieldByName('cod_fornecedor').Value;
      lbNomeEmpresa.Caption := dmContasAPagar.QryContasAPagar.FieldByName('descricao_empresa').Value;
      lbUsuarioLancamento.Caption := dmContasAPagar.QryContasAPagar.FieldByName('usuario_inclusao').Value;
      lbDataLancamento.Caption := FormatDateTime('DD/MM/YYY', dmContasAPagar.QryContasAPagar.FieldByName('data_lancamento').Value);
      lbCodigoLancamento.Caption := dmContasAPagar.QryContasAPagar.FieldByName('codigo').Value;
      edValorDespesa.Value := dmContasAPagar.QryContasAPagar.FieldByName('valor').Value;
      edValorEncargos.Value := dmContasAPagar.QryContasAPagar.FieldByName('multa').Value;
      edValorAtualizado.Value := dmContasAPagar.QryContasAPagar.FieldByName('valor_atualizado').Value;
      edVencimentoDespesa.EditValue := dmContasAPagar.QryContasAPagar.FieldByName('data_vencimento').Value;
      edDataPagamento.EditValue := dmContasAPagar.QryContasAPagar.FieldByName('data_vencimento').Value;
      edCompetenciaDespesa.EditValue := dmContasAPagar.QryContasAPagar.FieldByName('data_competencia').Value;
      memoObsAlteracao.Text := dmContasAPagar.QryContasAPagar.FieldByName('descricao_conta').Value;
      lbOrigemDespesa.Caption := dmContasAPagar.QryContasAPagar.FieldByName('tipo').Value;
      if dmContasAPagar.QryContasAPagar.FieldByName('id_conta_bancaria').Value <> null then
        cbContaBancaria.EditValue := dmContasAPagar.QryContasAPagar.FieldByName('id_conta_bancaria').Value;

      cbkConciliado.Checked := IntToBol(dmContasAPagar.QryContasAPagar.FieldByName('conciliado').Value);

      if (Uppercase(dmContasAPagar.QryContasAPagar.FieldByName('tipo').Value) <> 'FINANCEIRO') then
        LDespesaVeioDasCompras := true;
      pnGridDespesas.Enabled := false;
//      pnTopo.Visible := false;
      lbDataDaBaixaTitulo.Visible := false;
      lbDataBaixa.Visible := false;
      lbBaixadoPorTitulo.Visible := false;
      lbUsuarioBaixa.Visible := false;
      lbUsuarioBaixa.Visible := false;
      rdInformacoesPagamento.Visible := false;
      HabilitaCampos;

      case dmContasAPagar.QryContasAPagar.FieldByName('status').Value of
        0:
          begin
            rdSituacaoLancamento.ItemIndex := 0;
          end;
        1:
          begin
            rdInformacoesPagamento.Visible := true;
            pnDadosDoLancamento.Enabled := false;
            btSalvarAlteracao.Enabled := false;
            showRealDialog(frm_principal, tmAviso, 'Informação', 'Esse título já foi pago e está disponível apenas para consulta!', 22, false);
            rdSituacaoLancamento.ItemIndex := 2;
            edDataPagamento.EditValue := dmContasAPagar.QryContasAPagar.FieldByName('data_pagamento').Value
          end;
        2:
          begin
            rdSituacaoLancamento.ItemIndex := 1;
          end;
      end;

      if LDespesaVeioDasCompras = false then
      begin
        cbContaGerencial.EditValue := dmContasAPagar.QryContasAPagar.FieldByName('cod_conta').Value;
      end
      else
      begin
        DesabilitaCamposLancamentoCompras;
      end;

    except
      on E: Exception do
      begin
        E.Message := 'Erro: ' + E.Message;
        raise Exception.Create(E.Message);

      end
    end;
  finally

    dmContasAPagar.qryContasAPagar.Filter := '';
    dmContasAPagar.qryContasAPagar.Filtered := false;

    dmContasAPagar.qryContasAPagar.EnableControls;
  end;
end;

procedure TfrmManutencaoContasApagar.AtualizarLancamento();
var
  LSQL: TStringlist;
  LSituacaoLancamento: integer;
begin
  LSQL := Tstringlist.Create;
  try
    try

      LSQL.clear;
      LSQL.add('update   contas_a_pagar cp set ');
      LSQL.add(' cp.cod_fornecedor=' + Quotedstr(cbFornecedor.EditValue) + ',');

      if LDespesaVeioDasCompras = false then
      begin
        LSQL.add('  cp.cod_conta =' + Quotedstr(cbContaGerencial.EditValue) + ',');
      end;
      LSQL.add('   cp.valor =' + dm.TrocaVirgPPto(FloatToStr(edValorDespesa.value)) + ',');
      LSQL.add('   cp.multa =' + dm.TrocaVirgPPto(FloatToStr(edValorEncargos.value)) + ',');
      LSQL.Add('  cp.data_vencimento=' + Quotedstr(FormatDateTime('DD.MM.YYY', edVencimentoDespesa.EditValue)) + ',');
      LSQL.Add('   cp.data_competencia=' + Quotedstr(FormatDateTime('DD.MM.YYY', edCompetenciaDespesa.EditValue)) + ',');
      case rdSituacaoLancamento.ItemIndex of
        0:
          LSituacaoLancamento := 0;
        1:
          LSituacaoLancamento := 2;
        2:
          begin
            LSituacaoLancamento := 1;
            LSQL.Add('   cp.data_pagamento=' + Quotedstr(FormatDateTime('DD.MM.YYY', edDataPagamento.EditValue)) + ',');
          end;
      end;
      LSQL.add('  cp.status =' + Inttostr(LSituacaoLancamento) + ',');
      LSQL.add('  cp.id_conta_bancaria =' + Inttostr(cbContaBancaria.EditValue) + ',');
      LSQL.add('  cp.descricao_conta =' + Quotedstr(memoObsAlteracao.Text) + ',');
      LSQL.add(' cp.conciliado =' + Inttostr(BoolToInt(cbkConciliado.Checked)));
      LSQL.add(' where cp.codigo=' + Quotedstr(lbCodigoLancamento.Caption));

      dm.adicionaLog(LSQL.Text);
      dm.executaSQL(LSQL.Text);

      if (UpperCase(LTipoTituloAlteracao) = 'COMPRAS') and (LDataCompetenciaTituloSelecionado <> edCompetenciaDespesa.Date) then
      begin
        LSQL.Clear;
        LSQL.add(' update contas_a_pagar cp set cp.data_competencia =' + Quotedstr(FormatDateTime('DD.MM.YYY', edCompetenciaDespesa.EditValue)));
        LSQL.add(' where cp.cod_primeiro_titulo =' + Quotedstr(LCodigoTituloPrincincipal));
        dm.adicionaLog(LSQL.Text);
        dm.executaSQL(LSQL.Text);
      end;

    except
      on E: Exception do
      begin
        E.Message := 'Erro ao atualizar lançamento: ' + E.Message;
        raise Exception.Create(E.Message);
      end;

    end;

  finally
    FreeAndNil(LSQL);
  end;

end;

function TfrmManutencaoContasApagar.GerarSQLAtualizacaoLancamento(ACodigo: string): string;
var
  LSQL: TStringlist;
  LSituacaoLancamento: integer;
begin
  LSQL := Tstringlist.Create;

  try
    try
      LSQL.clear;
      LSQL.add('update   contas_a_pagar cp set ');

      case rdSituacaoLancamentoVariosTitulos.ItemIndex of
        0:
          LSituacaoLancamento := 2;
        1:
          begin
            LSituacaoLancamento := 1;
            LSQL.Add('   cp.data_pagamento=' + Quotedstr(FormatDateTime('DD.MM.YYY', cbDataPagamentoVariosTitulos.EditValue)) + ',');
            LSQL.add('  cp.id_conta_bancaria =' + Inttostr(cxckbContaBancariaVariosPagamentos.EditValue) + ',');
          end;
      end;
      LSQL.add('  cp.status =' + Inttostr(LSituacaoLancamento));

      LSQL.add(' where cp.codigo=' + Quotedstr(ACodigo) + ';');
      result := LSQL.text;
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

procedure TfrmManutencaoContasApagar.AtualizarLancamentoEmLote(ALista: TList<string>);
var
  LSituacaoLancamento: integer;
  LCodigoLancamento: string;
  LQtdSelecionados: integer;
  LTotalSelecionados: Currency;
begin
  dmContasAPagar.qryContasAPagar.DisableControls;
  dmContasAPagar.qryContasAPagar.Filtered := False;
  dmContasAPagar.qryContasAPagar.Filter := 'SEL = 1';
  dmContasAPagar.qryContasAPagar.Filtered := True;

  try
    try

      dmContasAPagar.qryContasAPagar.first;
      while not dmContasAPagar.qryContasAPagar.eof do
      begin
        LCodigoLancamento := dmContasAPagar.QryContasAPagar.fieldbyname('codigo').value;
        ALista.Add(GerarSQLAtualizacaoLancamento(LCodigoLancamento));

        dmContasAPagar.qryContasAPagar.Next;
      end;

      dm.ExecutaBlocoDeInstrucoes(ALista, 150);
    except
      on E: Exception do
      begin
        E.Message := 'Erro ao atualizar lançamento: ' + E.Message;
        raise Exception.Create(E.Message);
      end;

    end;

  finally
    dmContasAPagar.qryContasAPagar.EnableControls;
    dmContasAPagar.qryContasAPagar.Filtered := False;

  end;

end;

procedure TfrmManutencaoContasApagar.BaixarVariosTitulos();
begin
  inherited;

  pnGridDespesas.Enabled := false;

  try
    try
      verificaTitulosPagosSelecao;

      dmContasAPagar.qryContasBancarias.First;
      cxckbContaBancariaVariosPagamentos.EditValue := dmContasAPagar.qryContasBancarias.FieldByName('id').Value;
      cbDataPagamentoVariosTitulos.EditValue := Date;

      ExibirMenuOpcoes(pgBaixarVariosTitulos);

    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', e.Message, 18, false);
        pnGridDespesas.Enabled := true;
      end;

    end;

  finally

  end;

end;

procedure TfrmManutencaoContasApagar.btEsconderDetalhesClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmManutencaoContasApagar.cxgrdbclmnGrid1DBTableView1Column2GetProperties(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
begin
  inherited;
{
  if ARecord.Values[30] <> 1 then
    TcxCheckBoxProperties(AProperties).ReadOnly := False
  else
    TcxCheckBoxProperties(AProperties).ReadOnly := true;
    }
end;

procedure TfrmManutencaoContasApagar.MarcarSelecionados(const ListaCodigos: TStringList);
var
  Codigo: string;
  DeveMarcar: Integer;
begin

  dmContasAPagar.qryContasAPagar.DisableControls;
  try
    dmContasAPagar.qryContasAPagar.First;
    while not dmContasAPagar.qryContasAPagar.Eof do
    begin
      Codigo := dmContasAPagar.qryContasAPagar.FieldByName('CODIGO').AsString;

      if ListaCodigos.IndexOf(Codigo) <> -1 then
        DeveMarcar := 1
      else
        DeveMarcar := 0;

      if dmContasAPagar.qryContasAPagar.FieldByName('SEL').AsInteger <> DeveMarcar then
      begin
        dmContasAPagar.qryContasAPagar.Edit;
        dmContasAPagar.qryContasAPagar.FieldByName('SEL').AsInteger := DeveMarcar;
        dmContasAPagar.qryContasAPagar.Post;
      end;

      dmContasAPagar.qryContasAPagar.Next;
    end;
  finally
    dmContasAPagar.qryContasAPagar.EnableControls;
  end;
end;

procedure TfrmManutencaoContasApagar.cxgrdbclmnGrid1DBTableView1Column2PropertiesEditValueChanged(Sender: TObject);
var
  LCodigo: string;
begin
  inherited;
  LCodigo := dmContasAPagar.qryContasAPagar.fieldbyname('codigo').value;
  if dmContasAPagar.qryContasAPagar.State in dsEditModes then
    dmContasAPagar.qryContasAPagar.Post;

  FRegistrosSelecionados.Sort;
  FRegistrosSelecionados.Sorted := true;
  FRegistrosSelecionados.CaseSensitive := false;

  if dmContasAPagar.qryContasAPagar.fieldbyname('sel').value = 1 then
  begin
    if FRegistrosSelecionados.IndexOf('Texto') = -1 then
      FRegistrosSelecionados.Add(LCodigo)
  end
  else
  begin
    FRegistrosSelecionados.Delete(FRegistrosSelecionados.IndexOf(LCodigo));
  end;

end;

procedure TfrmManutencaoContasApagar.cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  SalvarRegistroAtual;
end;

procedure TfrmManutencaoContasApagar.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  LCodTituloSelecionado: string;
begin
  inherited;
  SalvarRegistroAtual;
  try
    LCodTituloSelecionado := dmContasAPagar.QryContasAPagar.fieldbyname('codigo').value;
    AlterarOuBaixarTituloIndividual(LCodTituloSelecionado);

  except
    on e: Exception do
    begin
      showRealDialog(frm_principal, tmErro, 'Erro', e.Message, 22, false);
    end;

  end;

end;

procedure TfrmManutencaoContasApagar.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 32 then
    SelecionaLancamento;
end;

procedure TfrmManutencaoContasApagar.SelecionaLancamento;
var
  LOpcao: integer;
begin

  try
    if dmContasAPagar.qryContasAPagar.FieldByName('STATUS').value = 1 then
      exit;

    if dmContasAPagar.qryContasAPagar.IsEmpty = false then
    begin
      LOpcao := dmContasAPagar.qryContasAPagar.FieldByName('SEL').value;
      dmContasAPagar.qryContasAPagar.edit;
      if LOpcao = 0 then
        LOpcao := 1
      else
        LOpcao := 0;

      dmContasAPagar.qryContasAPagar.FieldByName('SEL').value := LOpcao;
      dmContasAPagar.qryContasAPagar.post;
    end;

  except
    on E: Exception do
    begin
      showRealDialog(frm_principal, tmErro, 'Erro', e.Message, 22, false);
    end;
  end;

end;

function TfrmManutencaoContasApagar.ValidarAlteracaoVariosTitulos: boolean;
begin
  result := false;

  try
    try

      if (rdSituacaoLancamentoVariosTitulos.ItemIndex = 2) then
      begin
        if ((cxckbContaBancariaVariosPagamentos.EditValue = 0) or (cbContaBancaria.EditValue = null)) then
          raise Exception.Create('Conta bancária inválida!');

        if cbDataPagamentoVariosTitulos.EditValue = null then
          raise Exception.Create('Data de pagamento inválida!');

      end;

    except
      on E: Exception do
      begin
        result := false;
        raise Exception.Create(E.message);
      end;

    end;

    result := true;
  finally

  end;

end;

function TfrmManutencaoContasApagar.ValidarAlteracao: Boolean;
var
  LDiasEntreDatas: integer;
begin
  result := false;

  if cbFornecedor.EditValue = null then
    raise Exception.Create('Fornecedor inválido!');

  if cbContaGerencial.EditValue = null then
    raise Exception.Create('Conta gerencial inválida!');

  if cbContaBancaria.EditValue = null then
    raise Exception.Create('Conta bancária inválida!');

  LDiasEntreDatas := DaysBetween(edVencimentoDespesa.EditValue, edCompetenciaDespesa.Date);

  if (LDiasEntreDatas > 32) then
  begin
    if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'A diferença entre o vencimento e a data de competência é maior que 32 dias. Tem certeza que está correto?') = teSim) then
      result := true
    else
    begin
      result := false;
      Exit;
    end;
  end;

  LDiasEntreDatas := DaysBetween(edVencimentoDespesa.EditValue, dmContasAPagar.QryContasAPagar.FieldByName('data_vencimento').Value);
  if (LDiasEntreDatas > 10) then
  begin
    if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', 'A diferença entre o vencimento original e a data de vencimento informada é maior que 10 dias. Tem certeza que está correto ?') = teSim) then
      result := true
    else
    begin
      result := false;
      Exit;
    end;
  end;

  if (rdSituacaoLancamento.ItemIndex = 2) then
  begin
    if ((cbContaBancaria.EditValue = 0) or (cbContaBancaria.EditValue = null)) then
      raise Exception.Create('Conta bancária inválida!');

    if edDataPagamento.EditValue = null then
      raise Exception.Create('Data de pagamento inválida!');

    LDiasEntreDatas := DaysBetween(edVencimentoDespesa.EditValue, edDataPagamento.Date);
    if ((LDiasEntreDatas > 5) and (edVencimentoDespesa.EditValue < date)) then
    begin
      if (ShowRealDialog(frm_principal, tmConfirmacaoPorPINNumerico, 'Confirme', 'A diferença entre o vencimento e a data de pagamento é maior que 5 dias. Tem certeza que está correto ?') = teSim) then
        result := true
      else
      begin
        result := false;
        Exit;
      end;
    end;

  end;

  if (UpperCase(LTipoTituloAlteracao) = 'COMPRAS') and (LDataCompetenciaTituloSelecionado <> edCompetenciaDespesa.Date) then
  begin

    if (ShowRealDialog(frmManutencaoContasApagar, tmConfirmacaoPorPINNumerico, 'Confirme', 'Você está alterando a competência de um título de compras. Todas as parcelas referente a esta compra serão alteradas para a mesma data.' + sLineBreak + 'Você confirma ?') = teSim) then
      result := true
    else
    begin
      result := false;
      Exit;
    end;

  end;

  result := true;

end;

procedure TfrmManutencaoContasApagar.Edit1Exit(Sender: TObject);
begin
  inherited;
  if ((Sender as TWinControl).Name = 'edValorEncargos') or ((Sender as TWinControl).Name = 'edValorDespesa') then
  begin
    try
      edValorAtualizado.Value := edValorDespesa.Value + edValorEncargos.value;
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro', e.message);
      end;
    end;
  end;
end;

procedure TfrmManutencaoContasApagar.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  ExibirMenuOpcoes(pgFiltros);
end;

procedure TfrmManutencaoContasApagar.PngSpeedButton2Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmDREVersaoNova, frmDREVersaoNova);
  frmDREVersaoNova.showmodal;
  frmDREVersaoNova.free;
end;

procedure TfrmManutencaoContasApagar.PngSpeedButton3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmManutencaoContasApagar.R1Click(Sender: TObject);
begin
  inherited;
  FRegistrosSelecionados.Clear;
  SelecionarTodosOsRegistros(false);
end;

procedure TfrmManutencaoContasApagar.S1Click(Sender: TObject);
begin
  inherited;
  SelecionarTodosOsRegistros(true);
end;

function TfrmManutencaoContasApagar.getQtdeLancamentosSelecionados(): integer;
begin
  dmContasAPagar.qryContasAPagar.DisableControls;
  dmContasAPagar.qryContasAPagar.Filtered := False;

  try
    dmContasAPagar.qryContasAPagar.Filtered := False;
    dmContasAPagar.qryContasAPagar.Filter := 'SEL = 1';
    dmContasAPagar.qryContasAPagar.Filtered := True;
    result := dmContasAPagar.qryContasAPagar.RecordCount;

  finally
    dmContasAPagar.qryContasAPagar.EnableControls;
    dmContasAPagar.qryContasAPagar.Filtered := False;
  end;

end;

procedure TfrmManutencaoContasApagar.rdSituacaoLancamentoClick(Sender: TObject);
begin
  inherited;
  rdInformacoesPagamento.visible := false;

  case rdSituacaoLancamento.ItemIndex of
    2:
      rdInformacoesPagamento.visible := true;

  end;

end;

procedure TfrmManutencaoContasApagar.rdSituacaoLancamentoVariosTitulosClick(Sender: TObject);
begin
  inherited;
  rdInformacoesPagamentoVarios.Visible := IntToBol(rdSituacaoLancamentoVariosTitulos.ItemIndex);
end;

function TfrmManutencaoContasApagar.verificaTitulosPagosSelecao: boolean;
var
  LMSG: TStringList;
  LQtdSelecionados: integer;
  LTotalSelecionados: Currency;
begin
  LMSG := TStringlist.create;
  result := false;

  LQtdSelecionados := 0;
  LTotalSelecionados := 0;

  try

    dmContasAPagar.qryContasAPagar.DisableControls;
    dmContasAPagar.qryContasAPagar.First;
    while not dmContasAPagar.qryContasAPagar.eof do
    begin
      if (dmContasAPagar.qryContasAPagar.FieldByName('SEL').value = 1) then
      begin
        if dmContasAPagar.qryContasAPagar.fieldbyname('STATUS').Value = 1 then
        begin
          LMSG.Add('O título abaixo já foi pago. Remova-o da lista de seleção para continuar.');
          LMSG.Add(' ');
          LMSG.add('Código:     ' + dmContasAPagar.qryContasAPagar.fieldbyname('CODIGO').Value);
          LMSG.add('Fornecedor: ' + dmContasAPagar.qryContasAPagar.FieldbyName('RAZAO_SOCIAL').value);
          LMSG.add('Vencimento: ' + FormatDateTime('DD/MM/YYY', DmContasAPagar.qryContasAPagar.FieldByname('DATA_VENCIMENTO').value));
          LMSG.add('Valor:      ' + FormatFloat('R$ ###,###,##0.00 ', DmContasAPagar.qryContasAPagar.fieldbyname('VALOR').AsFloat));
          raise Exception.Create(LMSG.text);
        end;

        LQtdSelecionados := LQtdSelecionados + 1;
        LTotalSelecionados := LTotalSelecionados + dmContasAPagar.QryContasAPagar.fieldbyname('valor').AsCurrency;
      end;
      dmContasAPagar.qryContasAPagar.Next;
    end;

    lbQtTitulosSelecionados.Caption := Inttostr(LQtdSelecionados);
    lbTotalTitulosSelecionados.Caption := LTotalSelecionados.ToString;

    result := true;
  finally
    dmContasAPagar.qryContasAPagar.EnableControls;
    FreeAndNil(LMSG);
  end;

end;

procedure TfrmManutencaoContasApagar.SelecionarTodosOsRegistros(ASelecionar: boolean);
var
  LOpcao: smallint;
  LCodigo: string;
begin
  LOpcao := 0;
  FRegistrosSelecionados.clear;
  FRegistrosSelecionados.Sort;
  FRegistrosSelecionados.Sorted := true;
  FRegistrosSelecionados.CaseSensitive := false;

  if ASelecionar then
    LOpcao := 1;
  dmContasAPagar.qryContasAPagar.DisableControls;
  dmContasAPagar.qryContasAPagar.First;
  while not dmContasAPagar.qryContasAPagar.eof do
  begin
    LCodigo := dmContasAPagar.qryContasAPagar.fieldbyname('codigo').value;
    if dmContasAPagar.qryContasAPagar.fieldbyname('STATUS').Value <> 1 then
    begin

      dmContasAPagar.qryContasAPagar.edit;
      dmContasAPagar.qryContasAPagar.FieldByname('SEL').value := LOpcao;
      dmContasAPagar.qryContasAPagar.post;

      if ASelecionar then
        FRegistrosSelecionados.Add(LCodigo);

    end;
    dmContasAPagar.qryContasAPagar.Next;
  end;

  dmContasAPagar.qryContasAPagar.first;
  dmContasAPagar.qryContasAPagar.EnableControls;
  btPesquisar.Click;
end;

end.

