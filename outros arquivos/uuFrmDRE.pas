unit uuFrmDRE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Math,
  pcnConversaoNFe, RealFramework, uuRealDialog, System.DateUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.Menus,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions, Vcl.StdCtrls,
  Vcl.Buttons, PngSpeedButton, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, AdvGlassButton, JvPageList,
  JvExControls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit,
  cxGridBandedTableView, cxGridDBBandedTableView, Vcl.ComCtrls, sPageControl,
  dxBarBuiltInMenu, cxPC, System.ImageList, Vcl.ImgList, cxImageList,
  cxImageComboBox, cxCheckBox, CurvyControls, dxGDIPlusClasses, cxImage,
  sSkinProvider, sSkinManager;

type
  TfrmDREVersaoNova = class(Tfrm_modelo_vazio)
    pnTitulo: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    JvPageList1: TJvPageList;
    pgPrincipal: TJvStandardPage;
    pnDadosDRE: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyle1: TcxStyle;
    repositorio: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxStyleRepository3: TcxStyleRepository;
    Headers: TcxStyle;
    cxStyle4: TcxStyle;
    cxNegrito: TcxStyle;
    pnGridDRE: TPanel;
    pnDetalhamento: TPanel;
    pgDetalhamento: TsPageControl;
    Panel6: TPanel;
    lbDetalhamentoGrupo: TLabel;
    btEsconderDetalhes: TPngSpeedButton;
    Panel3: TPanel;
    lbTotalGrupoDetalhamento: TLabel;
    lbPercFaturamentoDetalhamento: TLabel;
    lbPercDespesaDetalhamento: TLabel;
    imlSinais: TcxImageList;
    stlNoGrid: TcxStyle;
    pnTopo: TPanel;
    cbAno: TcxComboBox;
    cbMes: TcxComboBox;
    imlEntradas: TcxImageList;
    popCompras: TPopupMenu;
    E1: TMenuItem;
    E2: TMenuItem;
    cxDRE: TcxGrid;
    cxDREDBBandedTableView1: TcxGridDBBandedTableView;
    cxDREDBBandedTableView1DESCRICAO_EXT: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1TOTAL_MES: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1MC_MES: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1TOTAL_MES_ANT: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1MC_MES_ANT: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1TOTAL_ANO_ANT: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1MC_ANO_ANT: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1TIPO: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1MC_DESP_ATUAL: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1MC_DESP_MES_ANT: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1MC_DESP_ANO_ANT: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1VARIACAO_MC_MES_ANT: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1VARIACAO_MC_ANO_ANT: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1SINAL_MES: TcxGridDBBandedColumn;
    cxDREDBBandedTableView1SINAL_ANO: TcxGridDBBandedColumn;
    cxDRELevel1: TcxGridLevel;
    pnTotais: TPanel;
    CurvyPanel1: TCurvyPanel;
    Label19: TLabel;
    lbFaturamentoMesAtual: TLabel;
    Label21: TLabel;
    lbFatMesAnterior: TLabel;
    lbVariacaoFatMesAnterior: TLabel;
    imgFaturamentoMes: TcxImage;
    Panel8: TPanel;
    lbVariacaoFatPercentualMesAnterior: TLabel;
    Label6: TLabel;
    lbFatAnoAnterior: TLabel;
    imgFaturamentoAno: TcxImage;
    lbVariacaoFatAnoAnterior: TLabel;
    lbVariacaoFatPercentualAnoAnterior: TLabel;
    CurvyPanel2: TCurvyPanel;
    Panel12: TPanel;
    CurvyPanel3: TCurvyPanel;
    Panel14: TPanel;
    imgPositivo: TcxImage;
    imgNegativo: TcxImage;
    Panel2: TPanel;
    Panel10: TPanel;
    Panel9: TPanel;
    Label2: TLabel;
    Panel13: TPanel;
    tmExecutarConsulta: TTimer;
    CurvyPanel4: TCurvyPanel;
    Label4: TLabel;
    lbDespesaMesAtual: TLabel;
    Label5: TLabel;
    lbDespMesAnterior: TLabel;
    lbVariacaoDespMesAnterior: TLabel;
    lbVariacaoDespPercentualMesAnterior: TLabel;
    Label7: TLabel;
    lbDespAnoAnterior: TLabel;
    lbVariacaoDespAnoAnterior: TLabel;
    lbVariacaoDespPercentualAnoAnterior: TLabel;
    imgDespesaMes: TcxImage;
    Panel15: TPanel;
    imgDespesaAno: TcxImage;
    Label8: TLabel;
    Label9: TLabel;
    CurvyPanel5: TCurvyPanel;
    Label10: TLabel;
    lbResultadoMesAtual: TLabel;
    Label11: TLabel;
    lbResMesAnterior: TLabel;
    lbVariacaoResMesAnterior: TLabel;
    lbVariacaoResPercentualMesAnterior: TLabel;
    Label12: TLabel;
    lbResAnoAnterior: TLabel;
    lbVariacaoResAnoAnterior: TLabel;
    lbVariacaoResPercentualAnoAnterior: TLabel;
    imgResultadoMes: TcxImage;
    Panel16: TPanel;
    imgResultadoAno: TcxImage;
    cxImage1: TcxImage;
    cxImage2: TcxImage;
    cxImage3: TcxImage;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    imgStatus: TcxImageList;
    btImprimir: TAdvGlassButton;
    popProdutos: TPopupMenu;
    A1: TMenuItem;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    cxPageControl1: TcxPageControl;
    tabComprasDaConta: TcxTabSheet;
    Panel5: TPanel;
    Panel7: TPanel;
    pnEntradasGrupo: TPanel;
    cxEntradasGrupo: TcxGrid;
    cxEntradasGrupoDBBandedTableView1: TcxGridDBBandedTableView;
    cxEntradasGrupoDBBandedTableView1COD_ENTRADA: TcxGridDBBandedColumn;
    cxEntradasGrupoDBBandedTableView1TIPO_ENTRADA: TcxGridDBBandedColumn;
    cxEntradasGrupoDBBandedTableView1RAZAO_SOCIAL: TcxGridDBBandedColumn;
    cxEntradasGrupoDBBandedTableView1NUMERONOTA: TcxGridDBBandedColumn;
    cxEntradasGrupoDBBandedTableView1DATA_EMISSAO: TcxGridDBBandedColumn;
    cxEntradasGrupoDBBandedTableView1DATA_ENTRADA: TcxGridDBBandedColumn;
    cxEntradasGrupoDBBandedTableView1DATA_LANCAMENTO: TcxGridDBBandedColumn;
    cxEntradasGrupoDBBandedTableView1TOTALGRUPO: TcxGridDBBandedColumn;
    cxEntradasGrupoDBBandedTableView1TOTALNOTA: TcxGridDBBandedColumn;
    cxEntradasGrupoDBBandedTableView1COD_FORNECEDOR: TcxGridDBBandedColumn;
    cxEntradasGrupoDBBandedTableView1CHAVE_NFE: TcxGridDBBandedColumn;
    cxEntradasGrupoDBBandedTableView1USUARIO_LANCAMENTO: TcxGridDBBandedColumn;
    cxEntradasGrupoLevel1: TcxGridLevel;
    pnDetalhamentoDaEntrada: TPanel;
    pgDetalhamentoEntrada: TsPageControl;
    sTabSheet1: TsTabSheet;
    Panel4: TPanel;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBTableView1CONTA_FINANCEIRA: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBTableView1COD_CONTA: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ckbExibirApenas: TcxCheckBox;
    sTabSheet2: TsTabSheet;
    cxGrid2: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    Panel11: TPanel;
    Label3: TLabel;
    btEsconderProdutosDaEntrada: TPngSpeedButton;
    tabContasAPagar: TcxTabSheet;
    cxGrid4: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView1SITUACAO_DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1CODIGO: TcxGridDBColumn;
    cxGrid1DBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    cxGrid1DBTableView1NUMERO_NOTA: TcxGridDBColumn;
    cxGrid1DBTableView1PARCELA: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_LANCAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_COMPETENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR_ATUALIZADO: TcxGridDBColumn;
    cxGrid1DBTableView1USUARIO_INCLUSAO: TcxGridDBColumn;
    cxGrid1DBTableView1OBS: TcxGridDBColumn;
    cxGrid1DBTableView1COD_CONTA: TcxGridDBColumn;
    cxGrid1DBTableView1SITUACAO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_FORNECEDOR: TcxGridDBColumn;
    cxGrid1DBTableView1ID_CONTA_BANCARIA: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO_CONTA_BANCARIA: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    tabProdutosDaConta: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1COD_PRODUTO: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1QUANTIDADE: TcxGridDBColumn;
    cxGrid1DBTableView1CUSTO_MEDIO: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure A1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxDREDBBandedTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure cxDREDBBandedTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxDREDBBandedTableView1DblClick(Sender: TObject);
    procedure btEsconderDetalhesClick(Sender: TObject);
    procedure btEsconderProdutosDaEntradaClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure cxEntradasGrupoDBBandedTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure E1Click(Sender: TObject);
    procedure ckbExibirApenasPropertiesEditValueChanged(Sender: TObject);
    procedure cxEntradasGrupoDBBandedTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure E2Click(Sender: TObject);
    procedure cbAnoPropertiesEditValueChanged(Sender: TObject);
    procedure cbMesPropertiesCloseUp(Sender: TObject);
    procedure cbAnoPropertiesCloseUp(Sender: TObject);
    procedure cxDREDBBandedTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure tabContasAPagarShow(Sender: TObject);
    procedure tmExecutarConsultaTimer(Sender: TObject);
  private
    procedure FiltrarContasAPagar(ACodConta: string);
    procedure GerarDadosDRE;
    procedure ProcessarConsulta;

    procedure EsconderDetalhamento;
    procedure MostrarDetalhamento;
    procedure MostraDadosContaSelecionada;
    procedure DetalharEntradasPorConta(AConta: string);
    procedure DetalharProdutosPorConta(AConta, ANomeConta: string);

    procedure MostrarNFESelecionada;
    procedure DetalharProdutosPorEntrada(ACodEntrada, AConta: string);
    procedure EsconderProdutosDaEntrada;
    procedure ExibiRProdutosDaEntrada;
    procedure CloseAllDatasets;
    procedure MostrarPainelDeProdutosDaEntrada;
    procedure AtualizarCards;
    procedure AtualizarCardFaturamento;
    procedure LimparCards;
    procedure GerarRelatorio;
    procedure AtualizarCardDespesas;
    procedure AtualizarCardResultados;
    procedure frxReport1GetValue(const VarName: string; var Value: Variant);
    function getNomeMes(AMes: smallint): string;
    function MesAnoAbreviado(const ADate: TDate): string;
    procedure GerarRelatorioGerencialDeDesempenho;







    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDREVersaoNova: TfrmDREVersaoNova;

implementation

uses
  uu_data_module, uu_frm_principal, UU_DM_RELATORIOS, uu_produtos;

const
  cTabNormalHex = '#F3F6FB';
  cTabActiveHex = '#1E73BE';
  cTextNormalHex = '#333F4A';
  cTextActiveHex = '#FFFFFF';

{$R *.dfm}

procedure TfrmDREVersaoNova.A1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(Tfrm_produtos, frm_produtos);
  frm_produtos.setCodProdutoSelecionado(dm.qryProdutosDRE.FieldByName('cod_produto').value);
  frm_produtos.setAbriCadastroSelecionado;
  frm_produtos.ShowModal;
  frm_produtos.free;
end;

procedure TfrmDREVersaoNova.FormCreate(Sender: TObject);
begin
  inherited;
  LimparCards;
  cbMes.ItemIndex := MonthOf(Date) - 1;
  cbAno.Text := IntToStr(YearOf(Date));
  tmExecutarConsulta.Enabled := True;

end;

procedure TfrmDREVersaoNova.FormDestroy(Sender: TObject);
begin
  inherited;
  CloseAllDatasets;
end;

procedure TfrmDREVersaoNova.GerarRelatorio;
begin
  inherited;
  try
    LimparCards;
    GerarDadosDRE;
    ProcessarConsulta;
    AtualizarCards;
    pnTotais.Visible := true;
  except
    on E: Exception do
    begin
      Showmessage('Ocorreu um erro: ' + E.Message);
    end;

  end;
end;

procedure TfrmDREVersaoNova.cxDREDBBandedTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  if pnDetalhamento.Visible = true then
    MostraDadosContaSelecionada;
end;

procedure TfrmDREVersaoNova.cxDREDBBandedTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  LTipoConta: Integer;
  Num: Double;
  ImgIdx, Pad, X, Y: Integer;
  RText: TRect;
  S: string;
begin
  if not (AViewInfo.GridRecord is TcxGridDataRow) then
    Exit;

  LTipoConta := StrToInt(VartoStr(AViewInfo.GridRecord.Values[cxDREDBBandedTableView1TIPO.Index]));
  if LTipoConta in [1, 2] then
    ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];

end;

procedure TfrmDREVersaoNova.cxDREDBBandedTableView1DblClick(Sender: TObject);
begin
  inherited;
  MostraDadosContaSelecionada;
end;

procedure TfrmDREVersaoNova.MostraDadosContaSelecionada;
var
  LCodigoConta: string;
  LDescricaoContaFormatada: string;
begin
  try
    EsconderProdutosDaEntrada;
    if dm.qryDRE.IsEmpty = false then
    begin
      LCodigoConta := dm.qryDRE.FieldByName('cod_conta').value;
      LDescricaoContaFormatada := dm.qryDRE.FieldByName('descricao_ext').value;

      lbTotalGrupoDetalhamento.Caption := 'Total = ' + FormatFloat('"R$ " #,##0.00', dm.qryDRE.FieldByName('total_mes').value);
      lbPercFaturamentoDetalhamento.Caption := '% Faturamento = ' + FormatFloat('#0.000', dm.qryDRE.FieldByName('MC_ATUAL').value);
      lbPercDespesaDetalhamento.caption := '% Despesas =  ' + FormatFloat('#0.000', dm.qryDRE.FieldByName('MC_DESP_ATUAL').value);

      DetalharProdutosPorConta(LCodigoConta, LDescricaoContaFormatada);
      DetalharEntradasPorConta(LCodigoConta);
      FiltrarContasAPagar(LCodigoConta);
      MostrarDetalhamento;
    end;

  except
    on E: Exception do
    begin
      ShowRealDialog(frmDREVersaoNova, tmErro, 'Ocorreu  um erro', 'Erro ao datalhar: ' + sLineBreak + E.Message, 16);
    end;

  end;

end;

procedure TfrmDREVersaoNova.EsconderDetalhamento();
begin
  try
    dm.qryProdutosDRE.active := false;
    pnDetalhamento.Visible := false;
    pnTopo.Visible := true;
    pnTitulo.Visible := true;
    cxDREDBBandedTableView1.Bands[0].Width := 278;

  except
    on E: Exception do
    begin
      ShowRealDialog(frmDREVersaoNova, tmErro, 'Ocorreu  um erro', 'Erro ao ocultar detalhamento: ' + sLineBreak + E.Message, 16);
    end;
  end;

  pnTotais.Visible := true;

end;

procedure TfrmDREVersaoNova.MostrarDetalhamento();
begin
  try
    pnTotais.Visible := false;
    pnTopo.Visible := false;
    pnTitulo.Visible := false;
    pnDetalhamento.Width := 800;
    pnDetalhamento.Visible := true;
    cxDREDBBandedTableView1.Bands[0].Width := 255;

  except
    on E: Exception do
    begin
      ShowRealDialog(frm_principal, tmErro, 'Ocorreu  um erro', 'Erro ao exibir detalhamento: ' + sLineBreak + E.Message, 16);
    end;
  end;

end;

procedure TfrmDREVersaoNova.GerarDadosDRE;
var
  LPeriodoMesAtual, LPeriodoMesAnterior, LPeriodoAnoAnterior: TEstruturaPeriodo;
  LMesSelecionado, LAnoSelecionado: integer;
  LSQL: TStringList;
begin

  LSQL := TStringList.Create;
  try
    try

      LMesSelecionado := cbMes.ItemIndex + 1;
      LAnoSelecionado := StrToInt(cbAno.Text);
      LPeriodoMesAtual.Inicio := EncodeDate(LAnoSelecionado, LMesSelecionado, 1);
      LPeriodoMesAtual.Fim := EndOfTheMonth(LPeriodoMesAtual.Inicio);

      LPeriodoMesAnterior := dm.getPeriodoMesAnterior(LPeriodoMesAtual.Inicio, LPeriodoMesAtual.fim);
      LPeriodoAnoAnterior := dm.getPeriodoAnoAnterior(LPeriodoMesAtual.Inicio, LPeriodoMesAtual.fim);

      LSQL.add(' delete from tmp_dados_dre;                                                                                                                              ');
      LSQL.add(' execute procedure sp_calcula_despesas_dre_mes(:vpInicioMesAtual, :vpFimMesAtual,1);                                                                     ');
      LSQL.add(' execute procedure sp_calcula_despesas_dre_mes(:vpInicioMesAnterior, :vpFimMesAnterior,2);                                                               ');
      LSQL.add(' execute procedure sp_calcula_despesas_dre_mes(:vpInicioAnoAnterior, :vpFimAnoAnterior,3);                                                               ');
      LSQL.add('                                                                                                                                                         ');

      LSQL.add(' update tmp_dados_dre tp set tp.tipo=1 where strlen(tp.cod_conta)=1; ');
      LSQL.add(' update tmp_dados_dre tp set tp.tipo=2 where strlen(tp.cod_conta)=2; ');
      LSQL.add(' update tmp_dados_dre tp set tp.tipo=5 where strlen(tp.cod_conta)=6; ');

      LSQL.add(' update tmp_dados_dre tp set tp.total_mes_ant = (select sum (tp2.total_mes) from tmp_dados_dre tp2 where tp2.mes = 2 and tp2.cod_conta = tp.cod_conta);  ');
      LSQL.add(' update tmp_dados_dre tp set tp.total_ano_ant = (select sum (tp2.total_mes) from tmp_dados_dre tp2 where tp2.mes = 3 and tp2.cod_conta = tp.cod_conta);  ');

      LSQL.add(' update tmp_dados_dre tp set tp.total_desp_mes = (select coalesce(sum (tp2.total_mes),0) from tmp_dados_dre tp2 where tp2.mes = 1 and tp2.tipo =5);');
      LSQL.add(' update tmp_dados_dre tp set tp.total_desp_mes_anterior = (select coalesce(sum (tp2.total_mes_ant ),0) from tmp_dados_dre tp2 where tp2.mes = 2 and tp2.tipo =5);');
      LSQL.add(' update tmp_dados_dre tp set tp.total_desp_ano_anterior = (select coalesce(sum (tp2.total_ano_ant),0) from tmp_dados_dre tp2 where tp2.mes = 3 and tp2.tipo =  5);');
      LSQL.add(' delete from tmp_dados_dre tp where tp.mes in (2,3);                                                                                                     ');
      LSQL.add('                                                                                                                                                         ');
      LSQL.add(' update tmp_dados_dre tp set tp.fat_mes = (select sum(v.valor_total) from vendas v where v.data between :vpInicioMesAtual and :vpFimMesAtual);            ');
      LSQL.add(' update tmp_dados_dre tp set tp.fat_mes_ant = (select sum(v.valor_total) from vendas v where v.data between :vpInicioMesAnterior and :vpFimMesAnterior); ');
      LSQL.add(' update tmp_dados_dre tp set tp.fat_ano_ant = (select sum(v.valor_total) from vendas v where v.data between  :vpInicioAnoAnterior and :vpFimAnoAnterior);');

      LSQL.add(' update tmp_dados_dre tp set tp.total_mes = (select coalesce(sum (tp2.total_mes),0) from tmp_dados_dre tp2 where tp2.conta_pai = tp.cod_conta )          ');
      LSQL.add('  where strlen(tp.cod_conta) = 3;');
      LSQL.add(' update tmp_dados_dre tp set tp.total_mes = (select coalesce(sum (tp2.total_mes),0) from tmp_dados_dre tp2 where tp2.conta_pai = tp.cod_conta )          ');
      LSQL.add('  where strlen(tp.cod_conta) = 1;');
      LSQL.add('');
      LSQL.add(' update tmp_dados_dre tp set tp.total_mes_ant = (select coalesce(sum (tp2.total_mes_ant),0) from tmp_dados_dre tp2 where tp2.conta_pai = tp.cod_conta )');
      LSQL.add('  where strlen(tp.cod_conta) = 3;');
      LSQL.add('update tmp_dados_dre tp set tp.total_mes_ant = (select coalesce(sum (tp2.total_mes_ant),0) from tmp_dados_dre tp2 where tp2.conta_pai = tp.cod_conta )');
      LSQL.add('  where strlen(tp.cod_conta) = 1;');
      LSQL.add('');
      LSQL.add('');
      LSQL.add(' update tmp_dados_dre tp set tp.total_ano_ant = (select coalesce(sum (tp2.total_ano_ant),0) from tmp_dados_dre tp2 where tp2.conta_pai = tp.cod_conta )');
      LSQL.add('  where strlen(tp.cod_conta) = 3;');
      LSQL.add('update tmp_dados_dre tp set tp.total_ano_ant = (select coalesce(sum (tp2.total_ano_ant),0) from tmp_dados_dre tp2 where tp2.conta_pai = tp.cod_conta )');
      LSQL.add('  where strlen(tp.cod_conta) = 1;');

      LSQL.Text := StringReplace(LSQL.Text, ':vpInicioMesAtual', dm.FormataDataFirebird(LPeriodoMesAtual.Inicio), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpFimMesAtual', dm.FormataDataFirebird(LPeriodoMesAtual.fim), [rfReplaceAll]);

      LSQL.Text := StringReplace(LSQL.Text, ':vpInicioMesAnterior', dm.FormataDataFirebird(LPeriodoMesAnterior.Inicio), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpFimMesAnterior', dm.FormataDataFirebird(LPeriodoMesAnterior.fim), [rfReplaceAll]);

      LSQL.Text := StringReplace(LSQL.Text, ':vpInicioAnoAnterior', dm.FormataDataFirebird(LPeriodoAnoAnterior.Inicio), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpFimAnoAnterior', dm.FormataDataFirebird(LPeriodoAnoAnterior.fim), [rfReplaceAll]);

      dm.adicionaLog(LSQL.Text);
      dm.ExecutaBlocoDeInstrucoes(dm.StringListToList(LSQL), 200);
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

procedure TfrmDREVersaoNova.AtualizarCards;
begin
  try
    AtualizarCardFaturamento;
    AtualizarCardDespesas;
    AtualizarCardResultados;
  except
    on E: Exception do
    begin
      ShowRealDialog(frmDREVersaoNova, tmErro, 'Erro:', e.Message, 16);
    end;

  end;
end;

procedure TfrmDREVersaoNova.AtualizarCardFaturamento;
var
  LSinalMesAnterior, LSinalAnoAnterior: string;
  LVariacaoMesAnteriorMoeda, LVariacaoMesAnteriorPercentual: Currency;
  LVariacaoAnoAnteriorMoeda, LVariacaoAnoAnteriorPercentual: Real;
  LCorFonteMesAnterior, LCorFonteMesAnoAnterior: LongInt;
begin
  LVariacaoMesAnteriorMoeda := 0;
  LVariacaoMesAnteriorPercentual := 0;
  LVariacaoMesAnteriorPercentual := 0;
  LVariacaoAnoAnteriorPercentual := 0;
  LSinalMesAnterior := '+';
  LSinalAnoAnterior := '+';
  LCorFonteMesAnterior := 3308846;
  LCorFonteMesAnoAnterior := 3308846;
  imgFaturamentoAno.Picture := imgPositivo.picture;
  imgFaturamentoMes.Picture := imgPositivo.picture;

  try
    if dm.qryDRE.FieldByName('fat_mes_ant').value > 0 then
      LVariacaoMesAnteriorMoeda := dm.qryDRE.FieldByName('fat_mes').value - dm.qryDRE.FieldByName('fat_mes_ant').value;

    if (dm.qryDRE.FieldByName('fat_mes_ant').value <> 0) then
    begin
      LVariacaoMesAnteriorPercentual := ((LVariacaoMesAnteriorMoeda / dm.qryDRE.FieldByName('fat_mes_ant').value) * 100);

      if LVariacaoMesAnteriorPercentual < 0 then
      begin
        LSinalMesAnterior := '';
        LCorFonteMesAnterior := 2631878;
        imgFaturamentoMes.Picture := imgNegativo.Picture;
      end;

    end;
    if dm.qryDRE.FieldByName('fat_ano_ant').value > 0 then
      LVariacaoAnoAnteriorMoeda := dm.qryDRE.FieldByName('fat_mes').value - dm.qryDRE.FieldByName('fat_ano_ant').value;
    if (dm.qryDRE.FieldByName('fat_ano_ant').value <> 0) then
    begin
      LVariacaoAnoAnteriorPercentual := ((LVariacaoAnoAnteriorMoeda / dm.qryDRE.FieldByName('fat_ano_ant').value) * 100);
      if LVariacaoAnoAnteriorPercentual < 0 then
      begin
        LSinalAnoAnterior := '';
        LCorFonteMesAnoAnterior := 2631878;
        imgFaturamentoAno.Picture := imgNegativo.Picture;
      end;
    end;

    lbFaturamentoMesAtual.Caption := FormatFloat('"R$ " #,##0.00', dm.qryDRE.FieldByName('fat_mes').value);

    lbFatMesAnterior.Caption := FormatFloat('"R$ " #,##0.00', dm.qryDRE.FieldByName('fat_mes_ant').value);
    lbVariacaoFatMesAnterior.Caption := LSinalMesAnterior + FormatFloat('"R$ " #,##0.00', LVariacaoMesAnteriorMoeda);
    lbVariacaoFatPercentualMesAnterior.Caption := LSinalMesAnterior + FormatFloat('0.###"%"', LVariacaoMesAnteriorPercentual);

    lbFatAnoAnterior.Caption := FormatFloat('"R$ " #,##0.00', dm.qryDRE.FieldByName('fat_ano_ant').value);
    lbVariacaoFatAnoAnterior.Caption := LSinalAnoAnterior + FormatFloat('"R$ " #,##0.00', LVariacaoAnoAnteriorMoeda);
    lbVariacaoFatPercentualAnoAnterior.Caption := LSinalAnoAnterior + FormatFloat('0.###"%"', LVariacaoAnoAnteriorPercentual);

    lbVariacaoFatMesAnterior.Font.Color := LCorFonteMesAnterior;
    lbVariacaoFatPercentualMesAnterior.Font.Color := LCorFonteMesAnterior;

    lbVariacaoFatAnoAnterior.Font.Color := LCorFonteMesAnoAnterior;
    lbVariacaoFatPercentualAnoAnterior.Font.Color := LCorFonteMesAnoAnterior;

  except
    on E: exception do
    begin
      raise Exception.Create('Erro ao atualizar card de faturamento: ' + E.message);
    end;

  end;
end;

procedure TfrmDREVersaoNova.AtualizarCardDespesas;
var
  LSinalMesAnterior, LSinalAnoAnterior: string;
  LVariacaoMesAnteriorMoeda, LVariacaoMesAnteriorPercentual: Currency;
  LVariacaoAnoAnteriorMoeda, LVariacaoAnoAnteriorPercentual: Real;
  LCorFonteMesAnterior, LCorFonteMesAnoAnterior: LongInt;
begin
  LVariacaoMesAnteriorMoeda := 0;
  LVariacaoMesAnteriorPercentual := 0;
  LVariacaoMesAnteriorPercentual := 0;
  LVariacaoAnoAnteriorPercentual := 0;
  LSinalMesAnterior := '+';
  LSinalAnoAnterior := '+';
  LCorFonteMesAnterior := 3308846;
  LCorFonteMesAnoAnterior := 3308846;
  imgDespesaAno.Picture := imgPositivo.picture;
  imgDespesaMes.Picture := imgPositivo.picture;

  try
    if dm.qryDRE.FieldByName('total_desp_mes_anterior').value > 0 then
      LVariacaoMesAnteriorMoeda := dm.qryDRE.FieldByName('total_desp_mes').value - dm.qryDRE.FieldByName('total_desp_mes_anterior').value;

    if (dm.qryDRE.FieldByName('total_desp_mes_anterior').value <> 0) then
    begin
      LVariacaoMesAnteriorPercentual := ((LVariacaoMesAnteriorMoeda / dm.qryDRE.FieldByName('total_desp_mes_anterior').value) * 100);

      if LVariacaoMesAnteriorPercentual < 0 then
      begin
        LSinalMesAnterior := '';
        LCorFonteMesAnterior := 2631878;
        imgDespesaMes.Picture := imgNegativo.Picture;
      end;

    end;

    if dm.qryDRE.FieldByName('total_desp_ano_anterior').value > 0 then
      LVariacaoAnoAnteriorMoeda := dm.qryDRE.FieldByName('total_desp_mes').value - dm.qryDRE.FieldByName('total_desp_ano_anterior').value;
    if (dm.qryDRE.FieldByName('total_desp_ano_anterior').value <> 0) then
    begin
      LVariacaoAnoAnteriorPercentual := ((LVariacaoAnoAnteriorMoeda / dm.qryDRE.FieldByName('total_desp_ano_anterior').value) * 100);
      if LVariacaoAnoAnteriorPercentual < 0 then
      begin
        LSinalAnoAnterior := '';
        LCorFonteMesAnoAnterior := 2631878;
        imgDespesaAno.Picture := imgNegativo.Picture;
      end;
    end;

    lbDespesaMesAtual.Caption := FormatFloat('"R$ " #,##0.00', dm.qryDRE.FieldByName('total_desp_mes').value);

    lbDespMesAnterior.Caption := FormatFloat('"R$ " #,##0.00', dm.qryDRE.FieldByName('total_desp_mes_anterior').value);
    lbVariacaoDespMesAnterior.Caption := LSinalMesAnterior + FormatFloat('"R$ " #,##0.00', LVariacaoMesAnteriorMoeda);
    lbVariacaoDespPercentualMesAnterior.Caption := LSinalMesAnterior + FormatFloat('0.###"%"', LVariacaoMesAnteriorPercentual);

    lbDespAnoAnterior.Caption := FormatFloat('"R$ " #,##0.00', dm.qryDRE.FieldByName('total_desp_ano_anterior').value);
    lbVariacaoDespAnoAnterior.Caption := LSinalAnoAnterior + FormatFloat('"R$ " #,##0.00', LVariacaoAnoAnteriorMoeda);
    lbVariacaoDespPercentualAnoAnterior.Caption := LSinalAnoAnterior + FormatFloat('0.###"%"', LVariacaoAnoAnteriorPercentual);

    lbVariacaoDespMesAnterior.Font.Color := LCorFonteMesAnterior;
    lbVariacaoDespPercentualMesAnterior.Font.Color := LCorFonteMesAnterior;

    lbVariacaoDespAnoAnterior.Font.Color := LCorFonteMesAnoAnterior;
    lbVariacaoDespPercentualAnoAnterior.Font.Color := LCorFonteMesAnoAnterior;

  except
    on E: exception do
    begin
      raise Exception.Create('Erro ao atualizar card de Despesa: ' + E.message);
    end;

  end;
end;

procedure TfrmDREVersaoNova.AtualizarCardResultados;
var
  LSinalMesAnterior, LSinalAnoAnterior: string;
  LVariacaoMesAnteriorMoeda, LVariacaoMesAnteriorPercentual: Currency;
  LVariacaoAnoAnteriorMoeda, LVariacaoAnoAnteriorPercentual: Real;
  LCorFonteMesAnterior, LCorFonteMesAnoAnterior: LongInt;
  LResultadoMesAtual, LResultadoMesAnterior, LResultadoAnoAnoAnterior: Currency;
begin
  LVariacaoMesAnteriorMoeda := 0;
  LVariacaoMesAnteriorPercentual := 0;
  LVariacaoMesAnteriorPercentual := 0;
  LVariacaoAnoAnteriorPercentual := 0;
  LSinalMesAnterior := '+';
  LSinalAnoAnterior := '+';
  LCorFonteMesAnterior := 3308846;
  LCorFonteMesAnoAnterior := 3308846;
  imgResultadoAno.Picture := imgPositivo.picture;
  imgResultadoMes.Picture := imgPositivo.picture;

  try
    LResultadoMesAtual := dm.qryDRE.FieldByName('fat_mes').value - dm.qryDRE.FieldByName('total_desp_mes').value;
    LResultadoMesAnterior := dm.qryDRE.FieldByName('fat_mes_ant').value - dm.qryDRE.FieldByName('total_desp_mes_anterior').value;
    LResultadoAnoAnoAnterior := dm.qryDRE.FieldByName('fat_ano_ant').value - dm.qryDRE.FieldByName('total_desp_mes_anterior').value;

    if LResultadoMesAnterior > 0 then
      LVariacaoMesAnteriorMoeda := LResultadoMesAtual - LResultadoMesAnterior;

    if (LResultadoMesAnterior <> 0) then
    begin
      LVariacaoMesAnteriorPercentual := ((LVariacaoMesAnteriorMoeda / LResultadoMesAnterior) * 100);

      if LVariacaoMesAnteriorPercentual < 0 then
      begin
        LSinalMesAnterior := '';
        LCorFonteMesAnterior := 2631878;
        imgResultadoMes.Picture := imgNegativo.Picture;
      end;

    end;
    if LResultadoAnoAnoAnterior > 0 then
      LVariacaoAnoAnteriorMoeda := LResultadoMesAtual - LResultadoAnoAnoAnterior;
    if (LResultadoAnoAnoAnterior <> 0) then
    begin
      LVariacaoAnoAnteriorPercentual := ((LVariacaoAnoAnteriorMoeda / LResultadoAnoAnoAnterior) * 100);
      if LVariacaoAnoAnteriorPercentual < 0 then
      begin
        LSinalAnoAnterior := '';
        LCorFonteMesAnoAnterior := 2631878;
        imgResultadoAno.Picture := imgNegativo.Picture;
      end;
    end;

    lbResultadoMesAtual.Caption := FormatFloat('"R$ " #,##0.00', LResultadoMesAtual);

    lbResMesAnterior.Caption := FormatFloat('"R$ " #,##0.00', LResultadoMesAnterior);
    lbVariacaoResMesAnterior.Caption := LSinalMesAnterior + FormatFloat('"R$ " #,##0.00', LVariacaoMesAnteriorMoeda);
    lbVariacaoResPercentualMesAnterior.Caption := LSinalMesAnterior + FormatFloat('0.###"%"', LVariacaoMesAnteriorPercentual);

    lbResAnoAnterior.Caption := FormatFloat('"R$ " #,##0.00', LResultadoAnoAnoAnterior);
    lbVariacaoResAnoAnterior.Caption := LSinalAnoAnterior + FormatFloat('"R$ " #,##0.00', LVariacaoAnoAnteriorMoeda);
    lbVariacaoResPercentualAnoAnterior.Caption := LSinalAnoAnterior + FormatFloat('0.###"%"', LVariacaoAnoAnteriorPercentual);

    lbVariacaoResMesAnterior.Font.Color := LCorFonteMesAnterior;
    lbVariacaoResPercentualMesAnterior.Font.Color := LCorFonteMesAnterior;

    lbVariacaoResAnoAnterior.Font.Color := LCorFonteMesAnoAnterior;
    lbVariacaoResPercentualAnoAnterior.Font.Color := LCorFonteMesAnoAnterior;

  except
    on E: exception do
    begin
      raise Exception.Create('Erro ao atualizar card de Resultado: ' + E.message);
    end;

  end;
end;

procedure TfrmDREVersaoNova.LimparCards();
begin

end;

procedure TfrmDREVersaoNova.ProcessarConsulta();
var
  LSQL: TStringList;
begin
  LSQL := TStringList.Create;

  try
    try

      LSQL.add(' select c.*,');
      LSQL.add(' case');
      LSQL.add('  when VARIACAO_MC_MES_ANT  = 0 then 0');
      LSQL.add('  when VARIACAO_MC_MES_ANT  < 0 then 1');
      LSQL.add('   when VARIACAO_MC_MES_ANT > 0 then 2');
      LSQL.add('  end as sinal_mes,');
      LSQL.add('  case');
      LSQL.add('    when VARIACAO_MC_ANO_ANT  = 0 then 0');
      LSQL.add('     when VARIACAO_MC_ANO_ANT  < 0 then 1');
      LSQL.add('     when VARIACAO_MC_ANO_ANT > 0 then 2');
      LSQL.add('  end as sinal_ano');
      LSQL.add(' ');
      LSQL.add('   from (');
      LSQL.add(' ');
      LSQL.add(' select LPAD(TP.cod_conta_formatado, (char_length(cod_conta_formatado) + tp.tipo), ' + Quotedstr(' ') + ') ||' + Quotedstr(' - ') + '||tp.descricao as descricao_ext,');
      LSQL.add('      tp.total_mes,');
      LSQL.add('     COALESCE( (TP.total_mes / NULLIF(TP.fat_mes, 0)) * 100.0, 0 )        AS MC_ATUAL,');
      LSQL.add('     tp.total_desp_mes,');
      LSQL.add('     COALESCE( (TP.total_mes / NULLIF(TP.total_desp_mes, 0)) * 100.0, 0 )        AS MC_DESP_ATUAL,');
      LSQL.add('  ');
      LSQL.add('     tp.total_mes_ant,');
      LSQL.add('     COALESCE( (TP.total_mes_ant / NULLIF(TP.fat_mes_ant, 0)) * 100.0, 0 ) AS MC_MES_ANT,');
      LSQL.add('  ');
      LSQL.add('     coalesce( CAST(((CAST(TP.total_mes - TP.total_mes_ant AS DECIMAL(18,6)) / NULLIF(CAST(TP.total_mes_ant AS DECIMAL(18,6)),0)) * 100) AS DECIMAL(18,4)),0) AS VARIACAO_MC_MES_ANT,');
      LSQL.add('     tp.total_desp_mes_anterior,');
      LSQL.add('     COALESCE( (TP.total_mes_ant / NULLIF(TP.total_desp_mes_anterior, 0)) * 100.0, 0 )        AS MC_DESP_MES_ANT,');
      LSQL.add('    tp.total_ano_ant,');
      LSQL.add('   COALESCE( (TP.total_ano_ant / NULLIF(TP.fat_ano_ant, 0)) * 100.0, 0 ) AS MC_ANO_ANT,');
      LSQL.add('    coalesce( CAST(((CAST(TP.total_mes - TP.total_ano_ant AS DECIMAL(18,6)) / NULLIF(CAST(TP.total_ano_ant AS DECIMAL(18,6)),0)) * 100) AS DECIMAL(18,4)),0) AS VARIACAO_MC_ANO_ANT,');
      LSQL.add(' ');
      LSQL.add('     tp.total_desp_ano_anterior,');
      LSQL.add('     COALESCE( (TP.total_ano_ant / NULLIF(TP.total_desp_ano_anterior, 0)) * 100.0, 0 )        AS MC_DESP_ANO_ANT,');
      LSQL.add('  ');
      LSQL.add('      TP.cod_conta_formatado,');
      LSQL.add('      tp.cod_conta, tp.tipo,');
      LSQL.add('      tp.descricao as descricao_conta,');
      LSQL.add(' coalesce(tp.fat_mes,tp.fat_mes_ant,0) as fat_mes,');
      LSQL.add(' coalesce(tp.fat_mes_ant,tp.fat_mes_ant,0) as fat_mes_ant,');
      LSQL.add(' coalesce(tp.fat_ano_ant,tp.fat_ano_ant,0) as fat_ano_ant');
      LSQL.add('    from tmp_dados_dre TP');
      LSQL.add('   order by tp.cod_conta_raiz, tp.desdobramento_pai,tp.cod_conta');
      LSQL.add('   ) c');

      dm.adicionaLog(LSQL.text);
      dm.qryDRE.SQL.Clear;
      dm.qryDRE.SQL.add(LSQL.text);
      dm.qryDRE.Active := true;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro: ' + E.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmDREVersaoNova.DetalharEntradasPorConta(AConta: string);
var
  LSQL: TStringList;
  LPeriodoMesAtual: TEstruturaPeriodo;
  LMesSelecionado, LAnoSelecionado: integer;
begin
  LSQL := TStringList.Create;

  try
    try
      LMesSelecionado := cbMes.ItemIndex + 1;
      LAnoSelecionado := StrToInt(cbAno.Text);
      dm.qryEntradasGrupoDRE.Active := false;

      LPeriodoMesAtual.Inicio := EncodeDate(LAnoSelecionado, LMesSelecionado, 1);
      LPeriodoMesAtual.Fim := EndOfTheMonth(LPeriodoMesAtual.Inicio);

      LSQL.add('  WITH  ');
      LSQL.add('   cte_entradas AS (  ');
      LSQL.add('       SELECT DISTINCT cp.codigo_entrada  ');
      LSQL.add('       FROM contas_a_pagar cp  ');
      LSQL.add('       WHERE cp.data_competencia BETWEEN  :vpInicioMesAtual AND :vpFimMesAtual');
      LSQL.add('         AND cp.cod_conta is null');
      LSQL.add('     ),  ');
      LSQL.add('     cte_dados_compras AS (  ');
      LSQL.add('       SELECT  ');
      LSQL.add('         ite.cod_entrada,  ');
      LSQL.add('         p.cod_plano_contas AS cod_conta,  ');
      LSQL.add('         COALESCE(ite.quantidade,0)      AS quantidade,  ');
      LSQL.add('         COALESCE(ite.valor_unitario,0)  AS valor_unitario,  ');
      LSQL.add('         COALESCE(ite.desconto,0)        AS desconto,  ');
      LSQL.add('         COALESCE(ite.valor_ipi,0)       AS valor_ipi,  ');
      LSQL.add('         COALESCE(ite.valor_frete,0)     AS valor_frete,  ');
      LSQL.add('         COALESCE(ite.valor_seguro,0)    AS valor_seguro,  ');
      LSQL.add('         COALESCE(ite.valor_fcp,0)       AS valor_fcp,  ');
      LSQL.add('         COALESCE(ite.outras_despesas,0) AS outras_despesas  ');
      LSQL.add('       FROM itens_entrada ite  ');
      LSQL.add('       inner JOIN cte_entradas ce ON ce.codigo_entrada = ite.cod_entrada  ');
      LSQL.add('       inner JOIN produtos      p  ON p.cod_produto    = ite.cod_item  ');
      LSQL.add('  ');
      LSQL.add('     ),  ');
      LSQL.add('     cte_totais AS (  -- soma compras + despesas, por conta  ');
      LSQL.add('       SELECT cod_entrada, cod_conta, SUM(total) AS total  ');
      LSQL.add('       FROM (  ');
      LSQL.add('         SELECT  ');
      LSQL.add('           c.cod_entrada,  ');
      LSQL.add('           pf.cod_conta,  ');
      LSQL.add('           SUM(  ');
      LSQL.add('             ((COALESCE(c.quantidade,0) * COALESCE(c.valor_unitario,0)) - COALESCE(c.desconto,0)) +  ');
      LSQL.add('              COALESCE(c.valor_ipi,0) +  ');
      LSQL.add('              COALESCE(c.valor_frete,0) +  ');
      LSQL.add('              COALESCE(c.valor_seguro,0) +  ');
      LSQL.add('              COALESCE(c.valor_fcp,0) +  ');
      LSQL.add('              COALESCE(c.outras_despesas,0)  ');
      LSQL.add('           ) AS total  ');
      LSQL.add('         FROM cte_dados_compras c  ');
      LSQL.add('         JOIN plano_contas_financeiro pf ON pf.cod_conta = c.cod_conta  ');
      LSQL.add('         GROUP BY c.cod_entrada, pf.cod_conta  ');
      LSQL.add('       )  ');
      LSQL.add('       GROUP BY cod_entrada,cod_conta  ');
      LSQL.add('     )  ');
      LSQL.add('  ');
      LSQL.add('      select ct.cod_entrada, e.tipo_entrada, f.cod_fornecedor, f.razao_social,  ');
      LSQL.add('              cast(coalesce(e.numero_nota,0) as bigint) as numeroNota,  ');
      LSQL.add('              e.chave_nfe,e.data_emissao,  ');
      LSQL.add('              e.data_entrada,  ');
      LSQL.add('              e.data as data_lancamento,  ');
      LSQL.add('               ct.total as totalGrupo,  ');
      LSQL.add('              e.total_nota as totalNota,  ');
      LSQL.add('              e.nome_usuario_entrada as usuario_lancamento  ');
      LSQL.add('         from cte_totais ct  ');
      LSQL.add('           inner join entradas   e on (e.cod_entrada = ct.cod_entrada)  ');
      LSQL.add('           inner join fornecedor f on (f.cod_fornecedor = e.cod_fornecedor)  ');
      LSQL.add('           inner join plano_contas_financeiro pf on (pf.cod_conta = ct.cod_conta)  ');
      LSQL.add('       where  ');
      LSQL.add('        ct.cod_conta  like :vpcodConta||' + Quotedstr('%'));

      LSQL.Text := StringReplace(LSQL.Text, ':vpInicioMesAtual', dm.FormataDataFirebird(LPeriodoMesAtual.Inicio), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpFimMesAtual', dm.FormataDataFirebird(LPeriodoMesAtual.fim), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpcodConta', Quotedstr(AConta), [rfReplaceAll]);

      dm.qryEntradasGrupoDRE.sql.clear;
      dm.adicionaLog(LSQL.text);
      dm.qryEntradasGrupoDRE.sql.Add(LSQL.text);
      dm.qryEntradasGrupoDRE.Active := true;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao detalhar entradas por conta: ' + E.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmDREVersaoNova.DetalharProdutosPorConta(AConta: string; ANomeConta: string);
var
  LSQL: TStringList;
  LPeriodoMesAtual: TEstruturaPeriodo;
  LMesSelecionado, LAnoSelecionado: integer;
begin
  LSQL := TStringList.Create;

  try
    try
      LMesSelecionado := cbMes.ItemIndex + 1;
      LAnoSelecionado := StrToInt(cbAno.Text);
      dm.qryProdutosDRE.Active := false;

      LPeriodoMesAtual.Inicio := EncodeDate(LAnoSelecionado, LMesSelecionado, 1);
      LPeriodoMesAtual.Fim := EndOfTheMonth(LPeriodoMesAtual.Inicio);
      lbDetalhamentoGrupo.Caption := 'Conta:  ' + Trim(ANomeConta);

      LSQL.add('  WITH');
      LSQL.add('    cte_entradas AS (');
      LSQL.add('      SELECT DISTINCT cp.codigo_entrada');
      LSQL.add('      FROM contas_a_pagar cp');
      LSQL.add('      WHERE cp.data_competencia BETWEEN :vpInicioMesAtual AND :vpFimMesAtual');
      LSQL.add('        AND cp.cod_conta is null');
      LSQL.add('    ),');
      LSQL.add('    cte_dados_compras AS (');
      LSQL.add('      SELECT');
      LSQL.add('        ce.codigo_entrada,');
      LSQL.add('        p.cod_plano_contas AS cod_conta,');
      LSQL.add('        p.cod_produto,');
      LSQL.add('        p.descricao,');
      LSQL.add('        COALESCE(ite.quantidade,0)      AS quantidade,');
      LSQL.add('        COALESCE(ite.valor_unitario,0)  AS valor_unitario,');
      LSQL.add('        (COALESCE(ite.quantidade,0) * COALESCE(ite.valor_unitario,0)) as subtotal,');
      LSQL.add('        COALESCE(ite.desconto,0)        AS desconto,');
      LSQL.add('         (COALESCE(ite.valor_ipi,0) + COALESCE(ite.valor_frete,0)+  COALESCE(ite.valor_seguro,0) + COALESCE(ite.valor_fcp,0)+ COALESCE(ite.outras_despesas,0))   as outras_despesas');
      LSQL.add(' ');
      LSQL.add('      FROM itens_entrada ite');
      LSQL.add('      JOIN cte_entradas ce ON ce.codigo_entrada = ite.cod_entrada');
      LSQL.add('      JOIN produtos      p  ON p.cod_produto    = ite.cod_item');
      LSQL.add('    )');
      LSQL.add('    select ct.cod_conta,');
      LSQL.add('           ct.cod_produto,');
      LSQL.add('           ct.descricao,');
      LSQL.add('           sum(ct.quantidade) as quantidade,');
      LSQL.add('          avg(coalesce( (ct.subtotal + ct.outras_despesas - ct.desconto) / ct.quantidade,0)) as custo_medio,');
      LSQL.add('          sum(coalesce( (ct.subtotal + ct.outras_despesas - ct.desconto),0)) as total');
      LSQL.add('       from cte_dados_compras ct');
      LSQL.add('        where ct.cod_conta like :vpcodConta||' + Quotedstr('%'));
      LSQL.add('       group by ct.cod_conta, ct.cod_produto, ct.descricao  order by ct.descricao');

      LSQL.Text := StringReplace(LSQL.Text, ':vpInicioMesAtual', dm.FormataDataFirebird(LPeriodoMesAtual.Inicio), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpFimMesAtual', dm.FormataDataFirebird(LPeriodoMesAtual.fim), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpcodConta', Quotedstr(AConta), [rfReplaceAll]);

      dm.qryProdutosDRE.sql.clear;
      dm.adicionaLog(LSQL.text);
      dm.qryProdutosDRE.sql.Add(LSQL.text);
      dm.qryProdutosDRE.Active := true;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao detalhar produtos por conta: ' + E.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmDREVersaoNova.DetalharProdutosPorEntrada(ACodEntrada: string; AConta: string);
var
  LSQL: TStringList;
begin
  LSQL := TStringList.Create;

  try
    try
      dm.qryProdutosEntradaDRE.Active := false;
      dm.qryProdutosEntradaDRE.sql.clear;

      LSQL.clear;
      LSQL.add(' WITH');
      LSQL.add('     cte_entradas AS (');
      LSQL.add('       SELECT ' + Quotedstr(ACodEntrada) + ' as codigo_entrada from  RDB$DATABASE');
      LSQL.add('     ),');
      LSQL.add('     cte_dados_compras AS (');
      LSQL.add('       SELECT');
      LSQL.add('         ce.codigo_entrada,');
      LSQL.add('         p.cod_plano_contas AS cod_conta,');
      LSQL.add('         p.cod_produto,');
      LSQL.add('         p.descricao,');
      LSQL.add('         pf.descricao as conta_financeira,');
      LSQL.add('         COALESCE(ite.quantidade,0)      AS quantidade,');
      LSQL.add('         COALESCE(ite.valor_unitario,0)  AS valor_unitario,');
      LSQL.add('         (COALESCE(ite.quantidade,0) * COALESCE(ite.valor_unitario,0)) as subtotal,');
      LSQL.add('         COALESCE(ite.desconto,0)        AS desconto,');
      LSQL.add('          (COALESCE(ite.valor_ipi,0) + COALESCE(ite.valor_frete,0)+  COALESCE(ite.valor_seguro,0) + COALESCE(ite.valor_fcp,0)+ COALESCE(ite.outras_despesas,0))   as outras_despesas');
      LSQL.add('  ');
      LSQL.add('       FROM itens_entrada ite');
      LSQL.add('       JOIN cte_entradas ce ON ce.codigo_entrada = ite.cod_entrada');
      LSQL.add('       JOIN produtos      p  ON p.cod_produto    = ite.cod_item');
      LSQL.add('       join plano_contas_financeiro pf on (pf.cod_conta = p.cod_plano_contas)');
      LSQL.add('     )');
      LSQL.add('     select ct.cod_conta,');
      LSQL.add('            ct.cod_produto,');
      LSQL.add('            ct.descricao,');
      LSQL.add('            ct.conta_financeira,');
      LSQL.add('            sum(ct.quantidade) as quantidade,');
      LSQL.add('           avg(coalesce( (ct.subtotal + ct.outras_despesas - ct.desconto) / ct.quantidade,0)) as custo_medio,');
      LSQL.add('           sum(coalesce( (ct.subtotal + ct.outras_despesas - ct.desconto),0)) as total');
      LSQL.add('        from cte_dados_compras ct');
      if ckbExibirApenas.Checked then
        LSQL.add('         where ct.cod_conta like :vpcodConta||' + Quotedstr('%'));
      LSQL.add('        group by ct.cod_conta, ct.cod_produto,ct.conta_financeira, ct.descricao  order by ct.descricao');
      LSQL.Text := StringReplace(LSQL.Text, ':vpcodConta', Quotedstr(AConta), [rfReplaceAll]);
      dm.adicionaLog(LSQL.text);
      dm.qryProdutosEntradaDRE.sql.Add(LSQL.text);
      dm.qryProdutosEntradaDRE.Active := true;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao detalhar produtos por entrada: ' + E.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmDREVersaoNova.btEsconderDetalhesClick(Sender: TObject);
begin
  inherited;
  EsconderProdutosDaEntrada;
  EsconderDetalhamento;
end;

procedure TfrmDREVersaoNova.btEsconderProdutosDaEntradaClick(Sender: TObject);
begin
  inherited;
  EsconderProdutosDaEntrada;
end;

procedure TfrmDREVersaoNova.btImprimirClick(Sender: TObject);
begin
  inherited;
  try
    GerarRelatorioGerencialDeDesempenho;
  except
    on E: Exception do
    begin
      ShowRealDialog(frmDREVersaoNova, tmErro, 'Ocorreu  um erro', 'Erro ao gerar o relatório gerencial ' + sLineBreak + E.Message, 16);
    end;

  end;

end;

procedure TfrmDREVersaoNova.GerarRelatorioGerencialDeDesempenho();
begin
  try
    dm.qryDRE.DisableControls;
    try

      dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relGerencialDesepenhoPorConta.fr3', true);
      dm_relatorios.rpt.OnGetValue := frxReport1GetValue;
      dm_relatorios.rpt.PrepareReport(True);
      dm_relatorios.rpt.ShowPreparedReport;

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    dm.qryDRE.EnableControls;
  end;

end;

function TfrmDREVersaoNova.getNomeMes(AMes: smallint): string;
var
  LNomeMesAtual, LNomeMesAnterior, NomeAnoAnterior: string;
  LPeriodoMesAtual, LPeriodoMesAnterior, LPeriodoAnoAnterior: TEstruturaPeriodo;
  LMesSelecionado, LAnoSelecionado: integer;
begin

  LMesSelecionado := cbMes.ItemIndex + 1;
  LAnoSelecionado := StrToInt(cbAno.Text);
  LPeriodoMesAtual.Inicio := EncodeDate(LAnoSelecionado, LMesSelecionado, 1);
  LPeriodoMesAtual.Fim := EndOfTheMonth(LPeriodoMesAtual.Inicio);
  LPeriodoMesAnterior := dm.getPeriodoMesAnterior(LPeriodoMesAtual.Inicio, LPeriodoMesAtual.fim);
  LPeriodoAnoAnterior := dm.getPeriodoAnoAnterior(LPeriodoMesAtual.Inicio, LPeriodoMesAtual.fim);
  case AMes of
    1:
      result := MesAnoAbreviado(LPeriodoMesAtual.inicio);
    2:
      result := MesAnoAbreviado(LPeriodoMesAnterior.inicio);
    3:
      result := MesAnoAbreviado(LPeriodoAnoAnterior.inicio);
  end;
end;

function TfrmDREVersaoNova.MesAnoAbreviado(const ADate: TDate): string;
var
  FS: TFormatSettings;
  M: string;
begin
  FS := TFormatSettings.Create('pt-BR'); // requer Delphi moderno
  M := FS.ShortMonthNames[MonthOf(ADate)];
  if Length(M) > 3 then
    M := Copy(M, 1, 3); // garante 3 letras
  // Capitaliza: 1ª maiúscula, resto minúsculas
  M := UpperCase(Copy(M, 1, 1)) + LowerCase(Copy(M, 2, Max(0, Length(M) - 1)));
  Result := M + '/' + IntToStr(YearOf(ADate));
end;

procedure TfrmDREVersaoNova.frxReport1GetValue(const VarName: string; var Value: Variant);
begin

  if SameText(VarName, 'NOME_MES_ATUAL') then
    Value := getNomeMes(1);

  if SameText(VarName, 'NOME_MES_ANTERIOR') then
    Value := getNomeMes(2);

  if SameText(VarName, 'NOME_ANO_ANTERIOR') then
    Value := getNomeMes(3);

  if SameText(VarName, 'FAT_MES_ATUAL') then
    Value := lbFaturamentoMesAtual.Caption;

  if SameText(VarName, 'FAT_M1') then
    Value := lbFatMesAnterior.caption;

  if SameText(VarName, 'RES_FAT_M1') then
    Value := '1';

  if SameText(VarName, 'FAT_A1') then
    Value := lbFatAnoAnterior.caption;

  if SameText(VarName, 'VAR_FAT_M1') then
    Value := lbVariacaoFatPercentualMesAnterior.Caption;

  if SameText(VarName, 'VAR_FAT_A1') then
    Value := lbVariacaoFatPercentualAnoAnterior.Caption;

  if SameText(VarName, 'DESP_MES_ATUAL') then
    Value := lbDespesaMesAtual.Caption;

  if SameText(VarName, 'DESP_M1') then
    Value := lbDespMesAnterior.Caption;

  if SameText(VarName, 'DESP_A1') then
    Value := lbDespAnoAnterior.Caption;

  if SameText(VarName, 'VAR_DESP_M1') then
    Value := lbVariacaoDespPercentualMesAnterior.Caption;

  if SameText(VarName, 'VAR_DESP_A1') then
    Value := lbVariacaoDespPercentualAnoAnterior.caption;

  if SameText(VarName, 'RES_MES_ATUAL') then
    Value := lbResultadoMesAtual.Caption;

  if SameText(VarName, 'RES_M1') then
    Value := lbResMesAnterior.Caption;

  if SameText(VarName, 'RES_A1') then
    Value := lbResAnoAnterior.Caption;

  if SameText(VarName, 'VAR_RES_M1') then
    Value := lbVariacaoResPercentualMesAnterior.Caption;

  if SameText(VarName, 'VAR_RES_A1') then
    Value := lbVariacaoResPercentualAnoAnterior.Caption;
end;

procedure TfrmDREVersaoNova.cbAnoPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  GerarRelatorio;
end;

procedure TfrmDREVersaoNova.cbAnoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  GerarRelatorio;
end;

procedure TfrmDREVersaoNova.cbMesPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  GerarRelatorio;
end;

procedure TfrmDREVersaoNova.ckbExibirApenasPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  ExibiRProdutosDaEntrada;
end;

procedure TfrmDREVersaoNova.CloseAllDatasets;
begin
  dm.qryEntradasGrupoDRE.Close;
  dm.qryProdutosDRE.Close;
  dm.qryProdutosEntradaDRE.Close;
  dm.qryContasAPagarDRE.Close;

end;

procedure TfrmDREVersaoNova.cxDREDBBandedTableView1FocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if (AFocusedRecord <> nil) then
    AFocusedRecord.Selected := True;
end;

procedure TfrmDREVersaoNova.EsconderProdutosDaEntrada;
begin
  pnProdutosEntrada.Visible := false;
  dm.qryProdutosEntradaDRE.Active := false;
end;

procedure TfrmDREVersaoNova.cxEntradasGrupoDBBandedTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  ExibiRProdutosDaEntrada;
end;

procedure TfrmDREVersaoNova.cxEntradasGrupoDBBandedTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  MostrarPainelDeProdutosDaEntrada;
end;

procedure TfrmDREVersaoNova.ExibiRProdutosDaEntrada();
var
  LCodigoConta: string;
begin
  inherited;
  try
    if pnProdutosEntrada.Visible = true then
    begin
      LCodigoConta := dm.qryDRE.FieldByName('cod_conta').Value;
      DetalharProdutosPorEntrada(dm.qryEntradasGrupoDRE.FieldByName('cod_entrada').Value, LCodigoConta);
    end;

  except
    on E: Exception do
    begin
      ShowRealDialog(frmDREVersaoNova, tmErro, 'Ocorreu  um erro', 'Erro ao exibir produtos da entrada! ' + sLineBreak + E.Message, 16);
    end;

  end;

end;

procedure TfrmDREVersaoNova.E1Click(Sender: TObject);
begin
  MostrarNFESelecionada;
end;

procedure TfrmDREVersaoNova.E2Click(Sender: TObject);
begin
  inherited;
  MostrarPainelDeProdutosDaEntrada;

end;

procedure TfrmDREVersaoNova.MostrarPainelDeProdutosDaEntrada;
begin
  pnProdutosEntrada.Visible := true;
  ExibiRProdutosDaEntrada;
end;

procedure TfrmDREVersaoNova.MostrarNFESelecionada();
var
  LChaveNFE: string;
begin
  inherited;
  try
    case dm.qryEntradasGrupoDRE.FieldByName('tipo_entrada').Value of
      0:
        begin
          LChaveNFE := dm.qryEntradasGrupoDRE.FieldByName('chave_nfe').Value;
          dm.VisualizarNFEDeEntrada(LChaveNFE);
        end;
      1:
        begin
          ShowRealDialog(frmDREVersaoNova, tmAviso, 'Informação', 'A entrada selecionada é AVULSA, logo não possui NF-e');
        end;
    end;
  except
    on E: exception do
    begin
      ShowRealDialog(frmDREVersaoNova, tmErro, 'Ocorreu  um erro', 'Erro tentar visualizar a NF-e de entrada' + sLineBreak + E.Message, 16);
    end;

  end;

end;

procedure TfrmDREVersaoNova.tmExecutarConsultaTimer(Sender: TObject);
begin
  inherited;
  tmExecutarConsulta.Enabled := false;
  GerarRelatorio;
end;

procedure TfrmDREVersaoNova.FiltrarContasAPagar(ACodConta: string);
var
  LSQL: Tstringlist;
  LPeriodoMesAtual: TEstruturaPeriodo;
  LMesSelecionado, LAnoSelecionado: integer;
begin
  LMesSelecionado := cbMes.ItemIndex + 1;
  LAnoSelecionado := StrToInt(cbAno.Text);

  LPeriodoMesAtual.Inicio := EncodeDate(LAnoSelecionado, LMesSelecionado, 1);
  LPeriodoMesAtual.Fim := EndOfTheMonth(LPeriodoMesAtual.Inicio);
  LSQL := Tstringlist.Create;

  try
    try
      LSQL.add('select * from (');
      LSQL.add(' select cp.codigo, coalesce(cp.codigo_entrada, ' + Quotedstr('') + ') as codigo_entrada,cp.descricao_conta, cp.status, ');
      LSQL.add('        cast(e.numero_nota as integer) as numero_nota,');
      LSQL.add('        case');
      LSQL.add('         when cp.codigo_entrada is null then ' + Quotedstr('Financeiro'));
      LSQL.add('         when trim(cp.codigo_entrada) = ' + Quotedstr('') + ' then ' + Quotedstr('Financeiro'));
      LSQL.add('         else');
      LSQL.add('          ' + Quotedstr('Compras'));
      LSQL.add('        end as tipo,');
      LSQL.add(' ');
      LSQL.add('        case');
      LSQL.add('         when ((cp.status = 0) and (cp.data_vencimento >= current_date) ) then 0');
      LSQL.add('         when ( ((cp.status = 0) or (cp.status=2)) and (cp.data_vencimento < current_date) ) then -1');
      LSQL.add('         when (cp.status =1) then 1');
      LSQL.add('         when  (cp.status = 2) then 2');
      LSQL.add('        end as situacao,');
      LSQL.add(' ');
      LSQL.add('        case');
      LSQL.add('         when ((cp.status = 0) and (cp.data_vencimento >= current_date) ) then');
      LSQL.add('           ' + Quotedstr('Aberto'));
      LSQL.add('         when ( ((cp.status = 0) or (cp.status=2)) and (cp.data_vencimento < current_date) ) then');
      LSQL.add('           ' + Quotedstr('Vencido'));
      LSQL.add('         when (cp.status =1) then');
      LSQL.add('          ' + Quotedstr('Pago'));
      LSQL.add('         when  (cp.status = 2) then');
      LSQL.add('          ' + Quotedstr('Previsto'));
      LSQL.add('        end as situacao_descricao,');
      LSQL.add(' ');
      LSQL.add(' ');
      LSQL.add('        cp.cod_fornecedor,');
      LSQL.add('        coalesce(f.razao_social, ' + Quotedstr('') + ') as razao_social, coalesce(f.nome_fantasia, ' + Quotedstr('') + ') as nome_fantasia, f.cgc_cpf,');
      LSQL.add('        cp.data_entrada, cp.data_lancamento,');
      LSQL.add('        coalesce(cp.data_competencia, cp.data_vencimento) as data_competencia, cp.data_pagamento,');
      LSQL.add('        cp.data_vencimento,cp.usuario_inclusao,');
      LSQL.add('        cp.usuario_baixa, cp.valor,cp.multa,(cp.valor + cp.multa) as valor_atualizado, cp.obs,');
      LSQL.add('        cp.parcela,cp.id_conta_bancaria, cb.descricao as descricao_conta_bancaria,');
      LSQL.add('        cp.cod_emp_grupo, p.descricao_empresa, cp.cod_conta, coalesce(pc.descricao, ' + Quotedstr('Compras diversas') + ') as descricao_conta_gerencial,');
      LSQL.add('        coalesce(cp.fixa,0) as fixa,');
      LSQL.add('        case');
      LSQL.add('         when coalesce(cp.fixa,0) = 0 then ' + Quotedstr('Nao'));
      LSQL.add('         when coalesce(cp.fixa,0) = 1 then ' + Quotedstr('Sim'));
      LSQL.add('        end as fixa_descricao,');
      LSQL.add('        coalesce(cp.conciliado,0) as conciliado,');
      LSQL.add('        case');
      LSQL.add('         when coalesce(cp.conciliado,0) = 0 then ' + Quotedstr('Nao'));
      LSQL.add('         when coalesce(cp.conciliado,0) = 1 then ' + Quotedstr('Sim'));
      LSQL.add('        end as conciliado_descricao,');
      LSQL.add('     coalesce(e.chave_nfe,' + Quotedstr('') + ') as chave_nfe');
      LSQL.add(' ');
      LSQL.add('   from contas_a_pagar cp');
      LSQL.add('     inner join fornecedor f on (f.cod_fornecedor = cp.cod_fornecedor)');
      LSQL.add('     left join  entradas   e on (e.cod_entrada = cp.codigo_entrada)');
      LSQL.add('     left join contas_bancarias cb on (cb.id = cp.id_conta_bancaria)');
      LSQL.add('     left join plano_contas_financeiro pc on (pc.cod_conta = cp.cod_conta)');
      LSQL.add('     inner join parametros p on (p.cod_empresa = cp.cod_emp_grupo)');

      LSQL.add('  where cp.data_competencia between :vpInicioMesAtual AND :vpFimMesAtual');
      LSQL.add(') ');
      LSQL.add(' where 1=1 ');
      LSQL.add('  and  cod_conta  like :vpcodConta||' + Quotedstr('%'));

      LSQL.Text := StringReplace(LSQL.Text, ':vpInicioMesAtual', dm.FormataDataFirebird(LPeriodoMesAtual.Inicio), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpFimMesAtual', dm.FormataDataFirebird(LPeriodoMesAtual.fim), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpcodConta', Quotedstr(ACodConta), [rfReplaceAll]);

      dm.qryContasAPagarDRE.Close;
      dm.qryContasAPagarDRE.sql.clear;
      dm.qryContasAPagarDRE.sql.add(LSQL.Text);
      dm.adicionaLog(LSQL.Text);
      dm.qryContasAPagarDRE.Active := true;

    except
      on E: Exception do
      begin
        ShowRealDialog(frmDREVersaoNova, tmErro, 'Ocorreu  um erro', 'Erro ao buscar contas a pagar do grupo!' + sLineBreak + sLineBreak + E.Message, 16);
      end;

    end;

  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmDREVersaoNova.tabContasAPagarShow(Sender: TObject);
begin
  inherited;
  btEsconderProdutosDaEntrada.Click;
end;

function HexToColor(const AHex: string): TColor;
var
  s: string;
  r, g, b: Integer;
begin
  s := AHex;
  if (Length(s) > 0) and (s[1] = '#') then
    Delete(s, 1, 1);
  if Length(s) <> 6 then
    Exit(clBtnFace);
  r := StrToInt('$' + Copy(s, 1, 2));
  g := StrToInt('$' + Copy(s, 3, 2));
  b := StrToInt('$' + Copy(s, 5, 2));
  Result := RGB(r, g, b);
end;

end.

