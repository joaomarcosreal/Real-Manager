unit uuProducaoSubProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, ACBrUtil,
  RealFramework, System.StrUtils, System.Generics.Collections,
  uu_data_module, System.Classes, Vcl.Graphics, system.DateUtils, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, cxGraphics, cxControls, cxStyles,
  cxEdit, Data.DB, AdvGlassButton, AdvDateTimePicker, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, JvExControls, JvPageList, Vcl.Buttons, RxCurrEdit,
  cxTextEdit, cxDBLookupComboBox, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Menus, Vcl.ImgList, cxImageList, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxDataStorage, cxNavigator,
  cxDBData, cxCurrencyEdit, cxContainer, RxToolEdit,
  cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls,
  cxGridTableView, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, cxGridBandedTableView, cxGridDBBandedTableView, cxFilter,
  cxData, dxDateRanges, dxScrollbarAnnotations, System.ImageList, Vcl.Mask,
  cxLookupEdit, cxDBLookupEdit;

type
  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);

  TcxPainterAccess = class(TcxGridTableDataCellPainter);

  TcxCustomEditAccess = class(TCxCustomEdit);

  TfrmProducaoSubProdutos = class(Tfrm_modelo_vazio)
    jvPrincipal: TJvPageList;
    pgListagem: TJvStandardPage;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    pnCorpo: TPanel;
    Label4: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    frmTopo: TPanel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edDataInicial: TAdvDateTimePicker;
    edDataFinal: TAdvDateTimePicker;
    btPequisaInventarios: TAdvGlassButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label14: TLabel;
    Panel3: TPanel;
    pgCadastro: TJvStandardPage;
    Panel4: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Panel6: TPanel;
    AdvGlassButton2: TAdvGlassButton;
    AdvGlassButton5: TAdvGlassButton;
    pnCabecalhoProducao: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edDataProducao: TAdvDateTimePicker;
    cbHistoricoProducao: TcxLookupComboBox;
    memoObservacoes: TMemo;
    Panel5: TPanel;
    btPesqSubmateria: TSpeedButton;
    Label22: TLabel;
    Label9: TLabel;
    edCodSubmateria: TEdit;
    pnProdutosProducao: TPanel;
    Label21: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edDescricaoSubmateria: TEdit;
    edEstoqueSubproduto: TEdit;
    edRendimentoSubproduto: TEdit;
    edQuantidade: TCurrencyEdit;
    AdvGlassButton1: TAdvGlassButton;
    pnItensProducao: TPanel;
    Label10: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    stlRegistro: TcxStyle;
    stConfirmada: TcxStyle;
    stCancelada: TcxStyle;
    stCiencia: TcxStyle;
    stSemManifesto: TcxStyle;
    stNaoRealizada: TcxStyle;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1codProduto: TcxGridDBColumn;
    cxGridDBTableView1Descricao: TcxGridDBColumn;
    cxGridDBTableView1qtdeProduzida: TcxGridDBColumn;
    cxGridDBTableView1custoUnitario: TcxGridDBColumn;
    cxGridDBTableView1custoTotal: TcxGridDBColumn;
    cxGridDBTableView1percentualReceita: TcxGridDBColumn;
    cxGridDBTableView1Unidade: TcxGridDBColumn;
    HeaderStl: TcxStyle;
    pgFichaProducao: TJvStandardPage;
    Panel7: TPanel;
    Label15: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    Label16: TLabel;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Panel10: TPanel;
    Label20: TLabel;
    edDescricaoProdutoFichaProducao: TEdit;
    edQuantidadeFichaProducao: TEdit;
    Label17: TLabel;
    edPercentualFichaProducao: TEdit;
    Label18: TLabel;
    edUnidadeFichaProducao: TEdit;
    Label19: TLabel;
    Panel11: TPanel;
    AdvGlassButton7: TAdvGlassButton;
    cxGridDBTableView2COD_PRODUTO_BAIXA: TcxGridDBColumn;
    cxGridDBTableView2DESCRICAO_PROD_BAIXA: TcxGridDBColumn;
    cxGridDBTableView2ESTOQUEATUAL: TcxGridDBColumn;
    cxGridDBTableView2UNIDADEESTOQUE: TcxGridDBColumn;
    cxGridDBTableView2QTDERECEITA: TcxGridDBColumn;
    cxGridDBTableView2DESCRICAO_UNIDADE: TcxGridDBColumn;
    cxGridDBTableView2CUSTO_UNITARIO_PRODUTO: TcxGridDBColumn;
    cxGridDBTableView2CUSTORECEITA: TcxGridDBColumn;
    cxGridDBTableView2QTDEPRODUCAO: TcxGridDBColumn;
    cxGridDBTableView2CUSTOPRODUCAO: TcxGridDBColumn;
    Panel12: TPanel;
    popCadastro: TPopupMenu;
    V1: TMenuItem;
    E1: TMenuItem;
    Panel13: TPanel;
    Label23: TLabel;
    ed_desc_item: TEdit;
    RadioGroup2: TRadioGroup;
    Panel14: TPanel;
    bt_pesq_item_estoque_cod: TSpeedButton;
    Label24: TLabel;
    ed_cod_item: TEdit;
    Label25: TLabel;
    cbHistoricosConsulta: TcxLookupComboBox;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1PROCESSADA: TcxGridDBColumn;
    cxGrid1DBTableView1DATA: TcxGridDBColumn;
    cxGrid1DBTableView1HISTORICO: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_PROCESSAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_USUARIO: TcxGridDBColumn;
    cxGrid1DBTableView1CUSTO_PRODUCAO: TcxGridDBColumn;
    cxGrid1DBTableView1CUSTO_PERDAS: TcxGridDBColumn;
    cxImageList1: TcxImageList;
    popListagem: TPopupMenu;
    itExcluirProducao: TMenuItem;
    itEditarProducao: TMenuItem;
    btImprimirInventario: TAdvGlassButton;
    I1: TMenuItem;
    P1: TMenuItem;
    AdvGlassButton4: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    pgProcessamento: TJvStandardPage;
    Panel15: TPanel;
    Label26: TLabel;
    Label27: TLabel;
    Panel16: TPanel;
    AdvGlassButton6: TAdvGlassButton;
    AdvGlassButton8: TAdvGlassButton;
    Panel17: TPanel;
    Label28: TLabel;
    cxGrid4: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableView3COD_PRODUTO: TcxGridDBColumn;
    cxGridDBTableView3DESCRICAO: TcxGridDBColumn;
    cxGridDBTableView3UNIDADE: TcxGridDBColumn;
    cxGridDBTableView3PB: TcxGridDBColumn;
    cxGridDBTableView3PERC_PERDA: TcxGridDBColumn;
    cxGridDBTableView3PL: TcxGridDBColumn;
    cxGridDBTableView3PE: TcxGridDBColumn;
    cxGridDBTableView3QTDE_RETIRADA: TcxGridDBColumn;
    cxGridDBTableView3QTDE_UTILIZADA: TcxGridDBColumn;
    cxGridDBTableView3QTDE_PERDA: TcxGridDBColumn;
    cxGridDBTableView3QTDE_SOBRA: TcxGridDBColumn;
    cxGridDBTableView3PERCENTUAL_PERDA: TcxGridDBColumn;
    cxstyl1: TcxStyle;
    cxGrid4Level1: TcxGridLevel;
    cxGrid4DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid4DBBandedTableView1COD_PRODUTO: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DESCRICAO: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1UNIDADE: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1PB: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1PERC_PERDA: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1PL: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1PE: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1QTDE_RETIRADA: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1QTDE_UTILIZADA: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1QTDE_PERDA: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1QTDE_SOBRA: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1PERCENTUAL_PERDA: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DESVIO_PERDA: TcxGridDBBandedColumn;
    cxGrid4DBBandedTableView1DESVIO_QUANTIDADE: TcxGridDBBandedColumn;
    procedure AdvGlassButton4Click(Sender: TObject);
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure AdvGlassButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AdvGlassButton7Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure AdvGlassButton2Click(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgListagemShow(Sender: TObject);
    procedure btPequisaInventariosClick(Sender: TObject);
    procedure cxGrid1DBTableView1PROCESSADACustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1PROCESSADAGetDataText(Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure itExcluirProducaoClick(Sender: TObject);
    procedure itEditarProducaoClick(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure cxGridDBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure btImprimirInventarioClick(Sender: TObject);
    procedure cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
    procedure I1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure P1Click(Sender: TObject);
    procedure AdvGlassButton6Click(Sender: TObject);
    procedure cxGrid4DBBandedTableView1QTDE_SOBRAPropertiesEditValueChanged(Sender: TObject);
    procedure cxGrid4DBBandedTableView1QTDE_PERDAPropertiesEditValueChanged(Sender: TObject);
    procedure cxGrid4DBBandedTableView1QTDE_RETIRADAPropertiesEditValueChanged(Sender: TObject);
  private
    var
      LTipoOperacaoCrud: TTipoOperacaoCrud;
      LIDProducaoSelecionada: Largeint;
      PodeFecharFormulario: Boolean;
    procedure validarDadosProduto(ACodProduto: string; AQuantidadeProducao: Double);
    procedure AdicionarProduto(ACodProduto: string; AQuantidadeProducao: Double);
    procedure NovaProducao;
    procedure LimparFichaProducao;
    procedure ExibirFichaProducao;
    procedure ExcluirItem;
    procedure validaDadosProducao;
    procedure FinalizaProducao;
    procedure limpaCamposProduto;
    procedure buscarHistoricos(ATodos: Boolean);
    procedure FiltrarProducoes;
    function verificaSeProducaoJaFoiProcessada(AIdProducao: LargeInt): Boolean;
    procedure getDadosProducao(AIdProducao: LargeInt; ACodEmpresa: string);
    procedure getItensProducao(AIdProducao: LargeInt; ACodEmpresa: string);
    procedure BuscarDadosProducao(AIDProducao: Largeint; ACodEmpresa: string);
    procedure ExcluirProducao(AIdProducao: LargeInt; ACodEmpresa: string);
    procedure TentaExcluirProducao(AIDProducao: Largeint; ACodEmpresa: string);
    procedure SalvarItensProducao(AIDProducao, ACodEmpresa: string; AListaSQL: TList<string>);
    procedure SalvarProducao(ACodEmpresa: string);
    function SalvaDadosProducao(AIDProducao, ACodEmpresa: string; AListaSQL: TList<string>): Longint;
    procedure gerarListaDeInsumos(AIDProducao, ACodEmpresa: string; AListaSQL: TList<string>);
    procedure ExcluirItensProducao(AIdProducao: LargeInt; ACodEmpresa: string; AListaSQL: TList<string>);
    procedure visualizarFichaProducaoItem;
    procedure imprimirFichaProducaoSelecionada;
    procedure BuscaInformacoesDeImpressaoDaOrdemDeProducao(AIDProducao, ACodEmpresa: string);
    procedure BuscaProdutosFichaProducao(AIDProducao, ACodEmpresa: string);
    procedure BuscaInsumosFichaProducao(AIDProducao, ACodEmpresa: string);
    procedure ImprimeFichaDeProducao(AIDProducao, ACodEmpresa: string);
    procedure processarProducao(AIDProducao: largeint; ACodEmpresa, ANomeUsuario: string);
    procedure getInsumosProcessamentoProducao(AIDProducao, ACodEmpresa: string);
    procedure AbreProducaoParaProcessamento(AIDProducao: LargeInt; ACodEmpresa: string);
    function ValidarInsumosProcessamento: boolean;
    procedure AtualizarInsumosProducao;













    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProducaoSubProdutos: TfrmProducaoSubProdutos;

implementation

uses
  uu_frm_principal, UU_DM_RELATORIOS, uuDMProducaoSubprodutos, cxVariants,
  cxDataUtils;

{$R *.dfm}

procedure TfrmProducaoSubProdutos.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  try
    try
      validarDadosProduto(edCodSubmateria.Text, edQuantidade.Value);
      AdicionarProduto(edCodSubmateria.Text, edQuantidade.Value);
      limpaCamposProduto;
      edCodSubmateria.SetFocus;
      PodeFecharFormulario := false;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro(E.Message, 'Ok');
      end;
    end;
  finally

  end;

end;

procedure TfrmProducaoSubProdutos.limpaCamposProduto();
begin
  edCodSubmateria.Clear;
  edDescricaoSubmateria.Clear;
  edEstoqueSubproduto.Clear;
  edRendimentoSubproduto.Clear;
  edQuantidade.Value := 0;
end;

procedure TfrmProducaoSubProdutos.AdvGlassButton2Click(Sender: TObject);
begin
  inherited;
  try
    try
      validaDadosProducao();
      if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Tem certeza que deseja salvar a produção ?') = teSim) then
      begin

        SalvarProducao(codEmpresa);
        dm.exibe_painel_erro('Produção salva com sucesso!', 'Ok', mtInformation);
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

procedure TfrmProducaoSubProdutos.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmProducaoSubProdutos.FinalizaProducao();
begin
  LimparFichaProducao();
  buscarHistoricos(true);
  pgListagem.show;
end;

procedure TfrmProducaoSubProdutos.NovaProducao();
begin
  LTipoOperacaoCrud := TOperacaoNovo;
  dmProducaoSubprodutos.qryHistoricosProducao.Active := false;
  dmProducaoSubprodutos.qryHistoricosProducao.Active := True;
  cbHistoricoProducao.EditValue := dmProducaoSubprodutos.qryHistoricosProducao.fieldbyname('codigo').Value;
  edDataProducao.Date := now;
  memoObservacoes.Clear;
  LimparFichaProducao();
  limpaCamposProduto();
  buscarHistoricos(false);
  pgCadastro.Show;
  edDataProducao.SetFocus;
end;

procedure TfrmProducaoSubProdutos.AbreProducaoParaProcessamento(AIDProducao: LargeInt; ACodEmpresa: string);
begin
  try
    try
      getInsumosProcessamentoProducao(Inttostr(AIDProducao), ACodEmpresa);
      pgProcessamento.Show;
    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', E.Message, 22, false);

      end;
    end;
  finally

  end;
end;

procedure TfrmProducaoSubProdutos.P1Click(Sender: TObject);
begin
  inherited;

  if dmProducaoSubprodutos.tbListagemProducao.FieldByName('processada').Value = 0 then
  begin
    AbreProducaoParaProcessamento(dmProducaoSubprodutos.tbListagemProducao.FieldByName('id').Value, dmProducaoSubprodutos.tbListagemProducao.FieldByName('cod_empresa').Value);

  {
    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma o processamento da produção ?') = teSim) then
    begin
      processarProducao(dmProducaoSubprodutos.tbListagemProducao.FieldByName('id').Value, dmProducaoSubprodutos.tbListagemProducao.FieldByName('cod_empresa').Value, nome_usuario);

    end;

    }
  end
  else
  begin
    ShowRealDialog(frm_principal, tmAviso, 'Erro', 'O processamento desta produção já foi efetuado!');
  end;

end;

procedure TfrmProducaoSubProdutos.pgListagemShow(Sender: TObject);
begin
  inherited;
  PodeFecharFormulario := true;
  FiltrarProducoes;
end;

procedure TfrmProducaoSubProdutos.visualizarFichaProducaoItem();
begin

  try
    try
      if dmProducaoSubprodutos.tbSubprodutosProducao.IsEmpty then
        exit;
      ExibirFichaProducao();
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro(E.Message, 'Ok');
      end;

    end;
  finally

  end;

end;

procedure TfrmProducaoSubProdutos.FiltrarProducoes();
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  try
    try
      LSQL.add(' select p.id,p.cod_empresa,p.processada,                                                    ');
      LSQL.add('        p.data, h.descricao as historico,                                     ');
      LSQL.add('        p.data_processamento,                                                 ');
      LSQL.add('        p.nome_usuario,                                                       ');
      LSQL.add('        p.custo_producao,p.custo_perdas                                       ');
      LSQL.add('  from producoes_subprodutos p                                                ');
      LSQL.add('    inner join historicos_producao h on (h.codigo = p.cod_historico)          ');
      LSQL.add('      where p.data between :vpDataInicial and :vpDataFinal                    ');
      if cbHistoricosConsulta.EditValue <> 0 then
        LSQL.add('      and p.cod_historico =:vpHistorico                                       ');
      if (Trim(ed_cod_item.Text) <> '') then
      begin

        LSQL.add('    and p.id in                                                               ');
        LSQL.add('     (select  sb.id_producao  from                                            ');
        LSQL.add('         producoes_subprodutos_produtos sb                                    ');
        LSQL.add('         inner join producoes_subprodutos ps1 on (ps1.id = sb.id_producao)    ');
        LSQL.add('             where ps1.data between :vpDataInicial and :vpDataFinal           ');
        LSQL.add('          and sb.cod_produto=:vpCodProduto                                    ');
        LSQL.add('      )                                                                       ');
      end;
      LSQL.Add('     order by p.id desc');

      LSQL.Text := StringReplace(LSQL.Text, ':vpDataInicial', QuotedStr(FormatDateTime('DD.MM.YYY', edDataInicial.Date)), [rfReplaceAll, rfIgnoreCase]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpDataFinal', QuotedStr(FormatDateTime('DD.MM.YYY', edDataFinal.Date)), [rfReplaceAll, rfIgnoreCase]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpCodProduto', QuotedStr(ed_cod_item.Text), [rfReplaceAll, rfIgnoreCase]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpHistorico', cbHistoricosConsulta.EditValue, [rfReplaceAll, rfIgnoreCase]);

      dm.getMemTable(dmProducaoSubprodutos.tbListagemProducao, LSQL.Text);

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao filtrar produções! ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmProducaoSubProdutos.btImprimirInventarioClick(Sender: TObject);
begin
  inherited;
  try
    try
      imprimirFichaProducaoSelecionada;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro(E.Message, 'Ok', mtInformation);
      end;

    end;
  finally

  end;
end;

procedure TfrmProducaoSubProdutos.btPequisaInventariosClick(Sender: TObject);
begin
  inherited;
  try
    try
      FiltrarProducoes();
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro(E.Message, 'Ok');
      end;

    end;
  finally

  end;
end;

procedure TfrmProducaoSubProdutos.buscarHistoricos(ATodos: Boolean);
var
  LSQL: TStringList;
begin

  LSQL := TstringList.create;

  try
    try

      if ATodos then
      begin
        LSQL.add(' select * from (                                               ');
        LSQL.add('                                                               ');
        LSQL.add(' select 0 as codigo, ' + Quotedstr('TODOS') + ' as descricao from  rdb$database ');
        LSQL.add('    union all                                                  ');
        LSQL.add('  select h.codigo, h.descricao                                 ');
        LSQL.add(' 	 from HISTORICOS_PRODUCAO h                                  ');
        LSQL.add(' )                                                             ');
      end
      else
      begin
        LSQL.add('  select h.codigo, h.descricao                                 ');
        LSQL.add(' 	 from HISTORICOS_PRODUCAO h                                  ');
      end;
      LSQL.add('  order by codigo                                              ');
      dmProducaoSubprodutos.qryHistoricosProducao.Active := false;
      dmProducaoSubprodutos.qryHistoricosProducao.SQL.Clear;
      dmProducaoSubprodutos.qryHistoricosProducao.SQL.Add(LSQL.Text);
      dmProducaoSubprodutos.qryHistoricosProducao.Active := True;
      cbHistoricosConsulta.EditValue := dmProducaoSubprodutos.qryHistoricosProducao.FieldByName('codigo').Value;
      cbHistoricoProducao.EditValue := dmProducaoSubprodutos.qryHistoricosProducao.FieldByName('codigo').Value;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao buscar históricos!');
        dm.exibe_painel_erro('Erro ao buscar históricos!', 'Ok');
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmProducaoSubProdutos.processarProducao(AIDProducao: largeint; ACodEmpresa: string; ANomeUsuario: string);
var
  LSQL: TStringList;
begin

  LSQL := TstringList.create;

  try
    try
      LSQL.Clear;
      LSQL.Add('execute procedure r_processa_producao(' + IntToStr(AIDProducao) + ',' + QuotedStr(ACodEmpresa) + ',' + QuotedStr(ANomeUsuario) + ',0)');
      dm.executaSQL(LSQL.Text);
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao processar a produção.' + sLineBreak + sLineBreak + E.Message, 'Ok');
        raise Exception.Create('Erro ao realizar operação. ' + e.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);

  end;
end;

procedure TfrmProducaoSubProdutos.cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;

  if dmProducaoSubprodutos.tbListagemProducao.IsEmpty = False then
  begin
    itEditarProducao.Enabled := True;
    itExcluirProducao.Enabled := true;

    if dmProducaoSubprodutos.tbListagemProducao.FieldByName('processada').Value = 1 then
    begin
      itEditarProducao.Enabled := False;
      itExcluirProducao.Enabled := false;
    end

  end;
end;

procedure TfrmProducaoSubProdutos.cxGrid1DBTableView1PROCESSADACustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
begin
  inherited;

  if dmProducaoSubprodutos.tbListagemProducao.IsEmpty then
    exit;

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

      case AnsiIndexStr(UpperCase((AViewInfo.GridRecord.Values[cxGrid1DBTableView1PROCESSADA.Index])), ['0', '1']) of
        0:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 3);
//            AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column5.Index] := '.';

          end;
        1:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 0);
  //        AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column5.Index] := '.';
          end;

      end;

   //   if AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column5.Index] then


    finally
      Free;
    end;
  end;
  ADone := True;
end;

procedure TfrmProducaoSubProdutos.cxGrid1DBTableView1PROCESSADAGetDataText(Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  inherited;
  AText := '';
end;

procedure TfrmProducaoSubProdutos.cxGrid4DBBandedTableView1QTDE_PERDAPropertiesEditValueChanged(Sender: TObject);
var
  Edit: TcxCustomEdit;
  LQtdPerda, LQtdsobra, LQtdUtilizada, LQtdRetirada, LPercPerdaReal, LPercPerdaEstimada: Double;
  LDesvioQuantidade, LDesvioPerda, LQtdEstimada: double;
  View: TcxGridDBBandedTableView;
  clQtdUtilizada: TcxGridColumn;
  clQtdRetirada: TcxGridColumn;
  CLQtdSobra: TcxGridColumn;
  clPercPerda: TcxGridColumn;
  clDesvioQuantidade: TcxGridColumn;
  clDesvioPerda: TcxGridColumn;
  clQtdEstimada: TcxGridColumn;
  clPerdaEstimada: TcxGridColumn;
begin
  inherited;
  View := cxGrid4.FocusedView as TcxGridDBBandedTableView;
  Edit := Sender as TcxCustomEdit;
  clQtdRetirada := View.GetColumnByFieldName('QTDE_RETIRADA');

  if VarIsNumericEx(Edit.EditValue) then
  begin
    LQtdPerda := Edit.EditValue;
    clQtdRetirada := View.GetColumnByFieldName('QTDE_RETIRADA');
    LQtdRetirada := clQtdRetirada.EditValue;

    if LQtdPerda < 0 then
    begin
      showRealDialog(frm_principal, tmErro, 'Quantidade negativa!', 'Quantidade da perda não pode ser negativa', 22, false);
      Edit.EditValue := VarToStr(TcxCustomEditAccess(Sender).PrevEditValue);
      exit;
    end;

    if LQtdPerda >= LQtdRetirada then
    begin
      showRealDialog(frm_principal, tmErro, 'Erro!', 'Quantidade da perda não pode  maior ou igual a quantidade retirada!', 22, false);
      Edit.EditValue := VarToStr(TcxCustomEditAccess(Sender).PrevEditValue);
      exit;
    end;

    Edit.PostEditValue;

    clQtdUtilizada := View.GetColumnByFieldName('QTDE_UTILIZADA');

    CLQtdSobra := View.GetColumnByFieldName('QTDE_SOBRA');
    clPercPerda := View.GetColumnByFieldName('PERCENTUAL_PERDA');
    clQtdEstimada := View.GetColumnByFieldName('PL');
    clDesvioQuantidade := View.GetColumnByFieldName('DESVIO_QUANTIDADE');
    clDesvioPerda := View.GetColumnByFieldName('DESVIO_PERDA');
    clPerdaEstimada := View.GetColumnByFieldName('PERC_PERDA');

    LQtdUtilizada := clQtdUtilizada.EditValue;
    LQtdsobra := CLQtdSobra.EditValue;
    LPercPerdaReal := clPercPerda.EditValue;
    LPercPerdaEstimada := clPerdaEstimada.EditValue;

    LQtdEstimada := clQtdEstimada.EditValue;
    LQtdUtilizada := LQtdRetirada - (LQtdPerda + LQtdsobra);

    LDesvioQuantidade := ((RoundABNT(LQtdUtilizada, 3) * 100) / LQtdEstimada) - 100;
    LPercPerdaReal := ((LQtdPerda * 100) / LQtdRetirada);

    LDesvioPerda := LPercPerdaReal - LPercPerdaEstimada;

    View.DataController.SetEditValue(clQtdUtilizada.Index, LQtdUtilizada, evsValue);
    View.DataController.SetEditValue(clPercPerda.Index, LPercPerdaReal, evsValue);
    View.DataController.SetEditValue(clDesvioQuantidade.Index, LDesvioQuantidade, evsValue);
    View.DataController.SetEditValue(clDesvioPerda.Index, LDesvioPerda, evsValue);
  end;
end;

procedure TfrmProducaoSubProdutos.cxGrid4DBBandedTableView1QTDE_RETIRADAPropertiesEditValueChanged(Sender: TObject);
var
  LQtdPerda, LQtdsobra, LQtdUtilizada, LQtdRetirada, LPercPerdaReal, LPercPerdaEstimada: Double;
  LDesvioQuantidade, LDesvioPerda, LQtdEstimada: double;
  View: TcxGridDBBandedTableView;
  Edit: TcxCustomEdit;
  clQtdEstimada: TcxGridColumn;
  clQtdUtilizada: TcxGridColumn;
  clQtdRetirada: TcxGridColumn;
  clQtdSobra: TcxGridColumn;
  CLQtdPerda: TcxGridColumn;
  clPercPerda: TcxGridColumn;
  clDesvioQuantidade: TcxGridColumn;
  clDesvioPerda: TcxGridColumn;
  clPerdaEstimada: TcxGridColumn;
begin
  inherited;
  View := cxGrid4.FocusedView as TcxGridDBBandedTableView;
  Edit := Sender as TcxCustomEdit;
  if VarIsNumericEx(Edit.EditValue) then
  begin
    LQtdRetirada := Edit.EditValue;

    if LQtdRetirada < 0 then
    begin
      showRealDialog(frm_principal, tmErro, 'Quantidade negativa!', 'Quantidade retirada não pode ser negativa', 22, false);
      Edit.EditValue := VarToStr(TcxCustomEditAccess(Sender).PrevEditValue);
      exit;
    end;

    Edit.PostEditValue;

    clQtdUtilizada := View.GetColumnByFieldName('QTDE_UTILIZADA');
    clQtdRetirada := View.GetColumnByFieldName('QTDE_RETIRADA');
    CLQtdPerda := View.GetColumnByFieldName('QTDE_PERDA');
    clPercPerda := View.GetColumnByFieldName('PERCENTUAL_PERDA');
    clQtdSobra := View.GetColumnByFieldName('QTDE_SOBRA');
    clDesvioQuantidade := View.GetColumnByFieldName('DESVIO_QUANTIDADE');
    clDesvioPerda := View.GetColumnByFieldName('DESVIO_PERDA');
    clQtdEstimada := View.GetColumnByFieldName('PL');
    clPerdaEstimada := View.GetColumnByFieldName('PERC_PERDA');

    LPercPerdaEstimada := clPerdaEstimada.EditValue;
    LQtdUtilizada := clQtdUtilizada.EditValue;
//    LQtdRetirada := clQtdRetirada.EditValue;
    LQtdPerda := CLQtdPerda.EditValue;
    LPercPerdaReal := clPercPerda.EditValue;
    LQtdsobra := clQtdSobra.EditValue;
    LQtdEstimada := clQtdEstimada.EditValue;
    LQtdUtilizada := LQtdRetirada - (LQtdPerda + LQtdsobra);
    LDesvioQuantidade := ((RoundABNT(LQtdUtilizada, 3) * 100) / LQtdEstimada) - 100;
    LPercPerdaReal := ((LQtdPerda * 100) / LQtdRetirada);

    LDesvioPerda := LPercPerdaReal - LPercPerdaEstimada;

    View.DataController.SetEditValue(clQtdUtilizada.Index, LQtdUtilizada, evsValue);
    View.DataController.SetEditValue(clPercPerda.Index, LPercPerdaReal, evsValue);
    View.DataController.SetEditValue(clDesvioQuantidade.Index, LDesvioQuantidade, evsValue);
    View.DataController.SetEditValue(clDesvioPerda.Index, LDesvioPerda, evsValue);
  end;
end;

procedure TfrmProducaoSubProdutos.cxGrid4DBBandedTableView1QTDE_SOBRAPropertiesEditValueChanged(Sender: TObject);
var
  Edit: TcxCustomEdit;
  LQtdPerda, LQtdsobra, LQtdUtilizada, LQtdRetirada, LPercPerdaReal: Double;
  LDesvioQuantidade, LDesvioPerda, LQtdEstimada: double;
  View: TcxGridDBBandedTableView;
  clQtdUtilizada: TcxGridColumn;
  clQtdRetirada: TcxGridColumn;
  CLQtdPerda: TcxGridColumn;
  clPercPerda: TcxGridColumn;
  clQtdEstimada: TcxGridColumn;
  clDesvioQuantidade: TcxGridColumn;
  clDesvioPerda: TcxGridColumn;
begin
  inherited;
  View := cxGrid4.FocusedView as TcxGridDBBandedTableView;
  Edit := Sender as TcxCustomEdit;
  if VarIsNumericEx(Edit.EditValue) then
  begin
    LQtdsobra := Edit.EditValue;
    clQtdRetirada := View.GetColumnByFieldName('QTDE_RETIRADA');
    LQtdRetirada := clQtdRetirada.EditValue;

    if LQtdsobra < 0 then
    begin
      showRealDialog(frm_principal, tmErro, 'Quantidade negativa!', 'Quantidade da sobra não pode ser negativa', 22, false);
      Edit.EditValue := VarToStr(TcxCustomEditAccess(Sender).PrevEditValue);
      exit;
    end;

    if LQtdsobra >= LQtdRetirada then
    begin
      showRealDialog(frm_principal, tmErro, 'Erro!', 'Quantidade da sobra não pode  maior ou igual a quantidade retirada!', 22, false);
      Edit.EditValue := VarToStr(TcxCustomEditAccess(Sender).PrevEditValue);
      exit;
    end;

    Edit.PostEditValue;

    clQtdUtilizada := View.GetColumnByFieldName('QTDE_UTILIZADA');
    clQtdRetirada := View.GetColumnByFieldName('QTDE_RETIRADA');
    CLQtdPerda := View.GetColumnByFieldName('QTDE_PERDA');
    clPercPerda := View.GetColumnByFieldName('PERCENTUAL_PERDA');

    clDesvioQuantidade := View.GetColumnByFieldName('DESVIO_QUANTIDADE');
    clDesvioPerda := View.GetColumnByFieldName('DESVIO_PERDA');
    clQtdEstimada := View.GetColumnByFieldName('PL');

    LQtdUtilizada := clQtdUtilizada.EditValue;
    LQtdEstimada := clQtdEstimada.EditValue;
    LQtdUtilizada := LQtdRetirada - (LQtdPerda + LQtdsobra);
    LDesvioQuantidade := ((RoundABNT(LQtdUtilizada, 3) * 100) / LQtdEstimada) - 100;

    LQtdPerda := CLQtdPerda.EditValue;
    LPercPerdaReal := clPercPerda.EditValue;

    View.DataController.SetEditValue(clQtdUtilizada.Index, LQtdUtilizada, evsValue);
    View.DataController.SetEditValue(clPercPerda.Index, ((LQtdPerda * 100) / LQtdRetirada), evsValue);
    View.DataController.SetEditValue(clDesvioQuantidade.Index, LDesvioQuantidade, evsValue);
  end;
end;

procedure TfrmProducaoSubProdutos.cxGridDBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  visualizarFichaProducaoItem;
end;

procedure TfrmProducaoSubProdutos.cxGridDBTableView1EditKeyDown(Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Key = VK_RETURN) and (dmProducaoSubprodutos.tbSubprodutosProducao.State = dsEdit)) then
  begin
    dmProducaoSubprodutos.tbSubprodutosProducao.Post;
  end;
end;

procedure TfrmProducaoSubProdutos.LimparFichaProducao();
begin
  dmProducaoSubprodutos.tbSubprodutosProducao.Active := false;
  dmProducaoSubprodutos.tbSubprodutosProducao.Active := true;
  dmProducaoSubprodutos.tbFichaProducao.Active := false;

end;

procedure TfrmProducaoSubProdutos.AdicionarProduto(ACodProduto: string; AQuantidadeProducao: Double);
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  try
    try
      LSQL.Clear;

      LSQL.add(' select cs.*, ' + dm.TrocaVirgPPto(Floattostr(AQuantidadeProducao)) + ' as QtdeProducao,              ');
      LSQL.add('  udf_roundabnt((custoUnitario *' + dm.TrocaVirgPPto(Floattostr(AQuantidadeProducao)) + '),3) as CustoProducao, rendimento, ');
      LSQL.add('  udf_roundabnt( ((100 * ' + dm.TrocaVirgPPto(Floattostr(AQuantidadeProducao)) + ')/rendimento) ,3) as percentualReceita ');
      LSQL.add('  from                                                                                                       ');
      LSQL.add('   (                                                                                                         ');
      LSQL.add('     select cod_produto,p.descricao, rendimento,                                                             ');
      LSQL.add('       p.unidade_entrada as codUnidade,                                                                      ');
      LSQL.add('       u.descricao as descUnidade,                                                                           ');
      LSQL.add('       udf_roundabnt( ( (select coalesce(sum(cp.custo_baixa),0)');
      LSQL.add('           from calcula_custo_produto_novo(' + QuotedStr(ACodProduto) + ', ' + Quotedstr(ACodProduto) + ',p.rendimento) cp) / p.rendimento), 3) as custoUnitario     ');
      LSQL.add('     from produtos p                                                                                         ');
      LSQL.add('  inner join unidades u on (u.cod_unidade = p.unidade_entrada)                                               ');
      LSQL.Add(' where p.cod_produto=' + Quotedstr(ACodProduto));
      LSQL.add('   ) cs                                                                                                      ');

      dm.getMemTable(LTbAux, LSQL.Text);
      LTbAux.FetchAll;

      dmProducaoSubprodutos.tbSubprodutosProducao.Append;
      dmProducaoSubprodutos.tbSubprodutosProducaorendimentoReceita.Value := LTbAux.FieldByName('rendimento').Value;
      dmProducaoSubprodutos.tbSubprodutosProducaocodProduto.Value := ACodProduto;
      dmProducaoSubprodutos.tbSubprodutosProducaoDescricao.Value := LTbAux.FieldByName('descricao').Value;
      dmProducaoSubprodutos.tbSubprodutosProducaoqtdeProduzida.Value := AQuantidadeProducao;
      dmProducaoSubprodutos.tbSubprodutosProducaopercentualReceita.Value := LTbAux.FieldByName('percentualReceita').Value;
      dmProducaoSubprodutos.tbSubprodutosProducaocustoUnitario.Value := LTbAux.FieldByName('CustoUnitario').Value;
      dmProducaoSubprodutos.tbSubprodutosProducaocustoTotal.Value := LTbAux.FieldByName('CustoProducao').Value;
      dmProducaoSubprodutos.tbSubprodutosProducaocodUnidade.Value := LTbAux.FieldByName('codUnidade').Value;
      dmProducaoSubprodutos.tbSubprodutosProducaoUnidade.Value := LTbAux.FieldByName('descUnidade').Value;
      dmProducaoSubprodutos.tbSubprodutosProducao.Post;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao adicionar o produto na ficha de produção! ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmProducaoSubProdutos.validarDadosProduto(ACodProduto: string; AQuantidadeProducao: Double);
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  try
    try
      if (Trim(ACodProduto) = '') then
        raise Exception.Create('Código do produto inválido');

      try
        ACodProduto := FormatFloat('00000', StrToFloat(ACodProduto));
      except
        raise Exception.Create('Código do produto inválido!');
      end;

      if AQuantidadeProducao <= 0 then
        raise Exception.Create('Quantidade a ser produzida deve zer maior que zero');

      LSQL.Clear;
      LSQL.Add('select cod_produto, rendimento from produtos p where p.cod_produto=' + Quotedstr(ACodProduto) + ' and submateria=1');
      dm.getMemTable(LTbAux, LSQL.Text);
      LTbAux.FetchAll;

      if LTbAux.IsEmpty then
        raise Exception.Create('O produto informado não é um subproduto ou não existe!');

      if LTbAux.fieldbyname('rendimento').Value <= 0 then
        raise Exception.Create('Rendimento da ficha técnica do produto informado deve ser maior que zero!');

      LSQL.Clear;
      LSQL.add('       select coalesce(sum(cp.custo_baixa),0) as custoFicha');
      LSQL.add('           from calcula_custo_produto_novo(' + QuotedStr(ACodProduto) + ', ' + Quotedstr(ACodProduto) + ',1) cp');
      dm.getMemTable(LTbAux, LSQL.Text);

      if LTbAux.FieldByName('CustoFicha').Value <= 0 then
        raise Exception.Create('Custo da ficha técnica do produto inválido ou ficha técnica não definida. Verifique as informações  tente novamente!');

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao ao validar lançamento ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmProducaoSubProdutos.AdvGlassButton4Click(Sender: TObject);
begin
  inherited;
  NovaProducao();

end;

procedure TfrmProducaoSubProdutos.AdvGlassButton5Click(Sender: TObject);
begin
  inherited;
  if (PodeFecharFormulario = False) then
  begin
    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'A produção atual está em andamento.' + sLineBreak + sLineBreak + 'Tem certeza que deseja abandonar o procedimento ?') = teSim) then
    begin
      PodeFecharFormulario := True;
      FinalizaProducao;
    end
  end
  else
    FinalizaProducao;
end;

procedure TfrmProducaoSubProdutos.AdvGlassButton6Click(Sender: TObject);
begin
  inherited;
  if ValidarInsumosProcessamento then
  begin
    AtualizarInsumosProducao;
    processarProducao(dmProducaoSubprodutos.tbListagemProducao.FieldByName('id').Value, dmProducaoSubprodutos.tbListagemProducao.FieldByName('cod_empresa').Value, nome_usuario);
    showRealDialog(frm_principal, tmSucesso, 'Produção efetuada!', 'Produção processada com sucesso!', 22, false);
    pgListagem.Show;

  end;
end;

procedure TfrmProducaoSubProdutos.AtualizarInsumosProducao();
var
  LSQL: Tstringlist;
  LListaSQL: TList<string>;
  LIDInsumo: Largeint;
  LQtdeRetirada, LQtdeSobra, LQtdePerda, LQtdeUtilizada, LPercPerdaReal: real;
  LDesvioPerda, LDesvioQuantidade: Real;
begin
  LSQL := Tstringlist.Create;
  LListaSQL := TList<string>.Create;

  try
    try
      dmProducaoSubprodutos.tbInsumosProcessamento.first;

      while not dmProducaoSubprodutos.tbInsumosProcessamento.eof do
      begin
        LIDInsumo := dmProducaoSubprodutos.tbInsumosProcessamento.fieldbyname('ID').Value;
        LQtdeRetirada := dmProducaoSubprodutos.tbInsumosProcessamento.fieldbyname('QTDE_RETIRADA').Value;
        LQtdePerda := dmProducaoSubprodutos.tbInsumosProcessamento.fieldbyname('QTDE_PERDA').Value;
        LQtdeSobra := dmProducaoSubprodutos.tbInsumosProcessamento.fieldbyname('QTDE_SOBRA').Value;
        LQtdeUtilizada := dmProducaoSubprodutos.tbInsumosProcessamento.fieldbyname('QTDE_UTILIZADA').Value;
        LPercPerdaReal := dmProducaoSubprodutos.tbInsumosProcessamento.fieldbyname('PERCENTUAL_PERDA').Value;
        LPercPerdaReal := dmProducaoSubprodutos.tbInsumosProcessamento.fieldbyname('PERCENTUAL_PERDA').Value;
        LDesvioPerda := dmProducaoSubprodutos.tbInsumosProcessamento.fieldbyname('desvio_perda').Value;
        LDesvioQuantidade := dmProducaoSubprodutos.tbInsumosProcessamento.fieldbyname('desvio_quantidade').Value;

        LSQL.clear;
        LSQL.Add('  update producoes_lista_insumos set ');
        LSQL.add(' QTDE_RETIRADA= ' + dm.TrocaVirgPPto(FloatToStr(LQtdeRetirada)) + ',');
        LSQL.add(' QTDE_UTILIZADA= ' + dm.TrocaVirgPPto(FloatToStr(LQtdeUtilizada)) + ',');
        LSQL.add(' QTDE_PERDA= ' + dm.TrocaVirgPPto(FloatToStr(LQtdePerda)) + ',');
        LSQL.add(' QTDE_SOBRA= ' + dm.TrocaVirgPPto(FloatToStr(LQtdeSobra)) + ',');
        LSQL.add(' PERCENTUAL_PERDA= ' + dm.TrocaVirgPPto(FloatToStr(LPercPerdaReal)) + ',');
        LSQL.add(' desvio_perda= ' + dm.TrocaVirgPPto(FloatToStr(LDesvioPerda)) + ',');
        LSQL.add(' desvio_quantidade= ' + dm.TrocaVirgPPto(FloatToStr(LDesvioQuantidade)) + '');
        LSQL.Add(' where id=' + Inttostr(LIDInsumo) + ';');
        LListaSQL.Add(LSQL.Text);
        dmProducaoSubprodutos.tbInsumosProcessamento.Next;
      end;

      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 100);

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao atualizar lista de insumos ' + sLineBreak + e.Message);
      end;
    end;
  finally
    LListaSQL.Clear;
    FreeAndNil(LListaSQL);
  end;
end;

function TfrmProducaoSubProdutos.ValidarInsumosProcessamento(): boolean;
var
  LQtdRetirada, LQtdUtilizada, LQtdPerda, LQtdSobra, LSoma: real;
  LMensagem: Tstringlist;
begin
  LQtdUtilizada := 0;
  LQtdPerda := 0;
  LQtdSobra := 0;
  LQtdRetirada := 0;
  LSoma := 0;
  LMensagem := TStringList.Create;
  result := false;

  try

    dmProducaoSubprodutos.tbInsumosProcessamento.first;
    while not dmProducaoSubprodutos.tbInsumosProcessamento.eof do
    begin
//      dmProducaoSubprodutos.tbInsumosProcessamentoPERCENTUAL_PERDA.Value := (dmProducaoSubprodutos.tbInsumosProcessamentoQTDE_PERDA.Value * 100) / (dmProducaoSubprodutos.tbInsumosProcessamentoQTDE_RETIRADA.Value);
      LQtdUtilizada := dmProducaoSubprodutos.tbInsumosProcessamento.FieldByName('QTDE_UTILIZADA').Value;
      LQtdPerda := dmProducaoSubprodutos.tbInsumosProcessamento.fieldbyname('QTDE_PERDA').Value;
      LQtdSobra := dmProducaoSubprodutos.tbInsumosProcessamento.fieldbyname('QTDE_SOBRA').Value;
      LQtdRetirada := dmProducaoSubprodutos.tbInsumosProcessamento.FieldByName('QTDE_RETIRADA').Value;
      LSoma := LQtdUtilizada + LQtdPerda + LQtdSobra;

      if (RoundABNT(LSoma, 3) <> RoundABNT(LQtdRetirada, 3)) then
      begin
        LMensagem.Add('A soma  (Qtd. Utilizada + Qtd. Perda + Qtd. Sobra) deve ser igual à quantidade retirada.');
        LMensagem.add('Verifique o produto ' + dmProducaoSubprodutos.tbInsumosProcessamento.FieldByName('descricao').Value);
        LMensagem.add('Soma: ' + FLoattostr(LSoma));
        showRealDialog(frm_principal, tmErro, 'Erro', LMensagem.Text, 22, false);
        exit;
      end;
      dmProducaoSubprodutos.tbInsumosProcessamento.next;
    end;

    result := true;

  finally
    FreeAndNil(LMensagem);
  end;

end;

procedure TfrmProducaoSubProdutos.AdvGlassButton7Click(Sender: TObject);
begin
  inherited;
  dmProducaoSubprodutos.tbFichaProducao.Active := false;
  pgCadastro.Show;
end;

procedure TfrmProducaoSubProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if PodeFecharFormulario then
  begin
    Action := caFree;
  end
  else
  begin
    Action := caNone;
    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'A produção atual está em andamento.' + sLineBreak + sLineBreak + 'Tem certeza que deseja abandonar o procedimento ?') = teSim) then
    begin
      Action := caFree;
    end;
  end;
end;

procedure TfrmProducaoSubProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  PodeFecharFormulario := True;
  LTipoOperacaoCrud := TOperacaoNovo;
  dmProducaoSubprodutos := TdmProducaoSubprodutos.Create(self);
  buscarHistoricos(True);

  cbHistoricoProducao.EditValue := dmProducaoSubprodutos.qryHistoricosProducao.fieldbyname('codigo').Value;
  edDataProducao.Date := Date;
  edDataInicial.Date := StartOfTheMonth(date);
  edDataFinal.Date := EndOfTheMonth(Date);

end;

procedure TfrmProducaoSubProdutos.E1Click(Sender: TObject);
begin
  inherited;
  if dmProducaoSubprodutos.tbSubprodutosProducao.IsEmpty then
    exit;
  ExcluirItem();
end;

procedure TfrmProducaoSubProdutos.itExcluirProducaoClick(Sender: TObject);
begin
  inherited;
  TentaExcluirProducao(dmProducaoSubprodutos.tbListagemProducao.FieldByName('id').Value, dmProducaoSubprodutos.tbListagemProducao.FieldByName('cod_empresa').Value);
end;

procedure TfrmProducaoSubProdutos.itEditarProducaoClick(Sender: TObject);
begin
  inherited;

  BuscarDadosProducao(dmProducaoSubprodutos.tbListagemProducao.FieldByName('id').Value, dmProducaoSubprodutos.tbListagemProducao.FieldByName('cod_empresa').Value);
end;

procedure TfrmProducaoSubProdutos.BuscarDadosProducao(AIDProducao: Largeint; ACodEmpresa: string);
begin
  try
    try
      LTipoOperacaoCrud := ToperacaoAlterar;
      LIDProducaoSelecionada := AIDProducao;
      getDadosProducao(AIDProducao, ACodEmpresa);
      getItensProducao(AIDProducao, ACodEmpresa);
      pgCadastro.Show;
      edCodSubmateria.SetFocus;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro(E.Message, 'Ok');
      end;

    end;
  finally

  end;

end;

procedure TfrmProducaoSubProdutos.TentaExcluirProducao(AIDProducao: Largeint; ACodEmpresa: string);
begin

  try
    try

      if (verificaSeProducaoJaFoiProcessada(AIDProducao) = False) then
      begin
        if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma a exclusão da produção  ?') = teSim) then
        begin
          ExcluirProducao(AIDProducao, ACodEmpresa);
          dm.exibe_painel_erro('Produção excluída com sucesso!', 'Ok', mtInformation);
          FiltrarProducoes;
        end;

      end
      else
      begin
        dm.exibe_painel_troco('Não é possível excluir uma produção que já foi processada!', 'Ok');
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

procedure TfrmProducaoSubProdutos.V1Click(Sender: TObject);
begin
  inherited;
  visualizarFichaProducaoItem;
end;

procedure TfrmProducaoSubProdutos.getDadosProducao(AIdProducao: LargeInt; ACodEmpresa: string);
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  try
    try
      buscarHistoricos(False);
      LSQL.Clear;
      LSQL.add(' select ps.id,                  ');
      LSQL.add('        ps.observacoes,         ');
      LSQL.add('        ps.cod_historico,       ');
      LSQL.add('        ps.data                 ');
      LSQL.add('  from producoes_subprodutos ps ');
      LSQL.add('   where ps.id = :VpIdProducao  and ps.cod_empresa=:vpCodEmpresa');
      LSQL.Text := StringReplace(LSQL.Text, ':vpIdProducao', Inttostr(AIdProducao), [rfReplaceAll, rfIgnoreCase]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpCodEmpresa', QuotedStr(ACodEmpresa), [rfReplaceAll, rfIgnoreCase]);
      dm.getMemTable(LTbAux, LSQL.Text);
      LTbAux.FetchAll;
      cbHistoricoProducao.EditValue := LTbAux.FieldByName('cod_historico').Value;
      memoObservacoes.Text := LTbAux.FieldByName('observacoes').Value;
      edDataProducao.Date := LTbAux.FieldByName('data').Value;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao buscar dados da produção ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmProducaoSubProdutos.getItensProducao(AIdProducao: LargeInt; ACodEmpresa: string);
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  try
    try
      LSQL.add(' select pd.id,                                                               ');
      LSQL.add('        pd.id_producao,                                                      ');
      LSQL.add('        pd.cod_produto,                                                      ');
      LSQL.add('        p.descricao,                                                         ');
      LSQL.add('        pd.cod_unidade,                                                      ');
      LSQL.add('        u.descricao as unidade,                                              ');
      LSQL.add('        pd.qtde_produzida as quantidade,                                                   ');
      LSQL.add('        pd.custo_total,                                                      ');
      LSQL.add('        pd.percentual_receita                                                ');
      LSQL.add('  from  producoes_subprodutos_produtos pd                                    ');
      LSQL.add('   inner join produtos p on (p.cod_produto = pd.cod_produto)                 ');
      LSQL.add('   inner join unidades u on (u.cod_unidade = pd.cod_unidade)                 ');
      LSQL.add('      where pd.id_producao = :VpIdProducao  and pd.cod_empresa=:vpCodEmpresa ');
      LSQL.add('      order by pd.id                                                         ');
      LSQL.Text := StringReplace(LSQL.Text, ':vpIdProducao', Inttostr(AIdProducao), [rfReplaceAll, rfIgnoreCase]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpCodEmpresa', QuotedStr(ACodEmpresa), [rfReplaceAll, rfIgnoreCase]);
      dm.adicionaLog(LSQL.Text);
      dm.getMemTable(LTbAux, LSQL.Text);
      LTbAux.FetchAll;

      LTbAux.First;

      while not LTbAux.Eof do
      begin
        AdicionarProduto(LTbAux.FieldByName('cod_produto').Value, LTbAux.FieldByName('quantidade').Value);
        LTbAux.Next;
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao buscar itens da produção. ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmProducaoSubProdutos.I1Click(Sender: TObject);
begin
  inherited;
  ImprimeFichaDeProducao(dmProducaoSubprodutos.tbListagemProducao.FieldByName('id').Value, dmProducaoSubprodutos.tbListagemProducao.FieldByName('cod_empresa').Value);
end;

procedure TfrmProducaoSubProdutos.ImprimeFichaDeProducao(AIDProducao: string; ACodEmpresa: string);
begin
  dmProducaoSubprodutos.qryRelOrdemProducao.Active := False;
  dmProducaoSubprodutos.qryProdutosOrdemProducao.Active := false;
  dmProducaoSubprodutos.qryInsumosOrdemProducao.Active := false;

  try
    try
      BuscaInformacoesDeImpressaoDaOrdemDeProducao(AIDProducao, ACodEmpresa);
      BuscaProdutosFichaProducao(AIDProducao, ACodEmpresa);
      BuscaInsumosFichaProducao(AIDProducao, ACodEmpresa);
      dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relOrdemProducao.fr3', true);
      dm_relatorios.rpt.ShowReport(true);
      dm_relatorios.rpt.Clear;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro(E.Message, 'Ok');
      end;

    end;
  finally
    dmProducaoSubprodutos.qryRelOrdemProducao.Active := False;
    dmProducaoSubprodutos.qryProdutosOrdemProducao.Active := false;
    dmProducaoSubprodutos.qryInsumosOrdemProducao.Active := false;
  end;

end;

procedure TfrmProducaoSubProdutos.BuscaInformacoesDeImpressaoDaOrdemDeProducao(AIDProducao: string; ACodEmpresa: string);
var
  LSQL: TStringList;
begin
  LSQL := TstringList.create;
  try
    try

      LSQL.add('    select ps.id, ps.cod_empresa,                                        ');
      LSQL.add('           pm.descricao_empresa as Empresa,                              ');
      LSQL.add('           ps.data,                                                      ');
      LSQL.add('           ps.data_processamento,                                        ');
      LSQL.add('           ps.nome_usuario,                                              ');
      LSQL.add('           hs.descricao as historico,                                    ');
      LSQL.add('           ps.custo_producao,                                            ');
      LSQL.add('           ps.custo_perdas,                                              ');
      LSQL.add('           ps.observacoes                                                ');
      LSQL.add('      from  producoes_subprodutos ps                                     ');
      LSQL.add('      inner join historicos_producao hs on (hs.codigo = ps.cod_historico)');
      LSQL.add('      inner join parametros pm on (pm.cod_empresa = ps.cod_empresa)      ');
      LSQL.add('      where ps.id =:vpIdProducao and ps.cod_empresa = :vpCodEmpresa        ');

      LSQL.Text := StringReplace(LSQL.Text, ':vpCodEmpresa', QuotedStr(ACodEmpresa), [rfReplaceAll, rfIgnoreCase]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpIdProducao', AIDProducao, [rfReplaceAll, rfIgnoreCase]);
      dmProducaoSubprodutos.qryRelOrdemProducao.Active := false;
      dmProducaoSubprodutos.qryRelOrdemProducao.SQL.clear;
      dmProducaoSubprodutos.qryRelOrdemProducao.SQL.Add(LSQL.Text);
      dmProducaoSubprodutos.qryRelOrdemProducao.Active := true;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao buscar os dados da ficha de produção!' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmProducaoSubProdutos.BuscaProdutosFichaProducao(AIDProducao: string; ACodEmpresa: string);
var
  LSQL: TStringList;
begin
  LSQL := TstringList.create;
  try
    try

      LSQL.add('select pd.id,                                                ');
      LSQL.add('		pd.id_producao,                                        ');
      LSQL.add('		pd.cod_produto,                                        ');
      LSQL.add('		p.descricao,                                           ');
      LSQL.add('		pd.cod_unidade,                                        ');
      LSQL.add('		pd.qtde_produzida as quantidade,                       ');
      LSQL.add('		u.descricao as unidade                                 ');
      LSQL.add('  from  producoes_subprodutos_produtos pd                    ');
      LSQL.add('   inner join produtos p on (p.cod_produto = pd.cod_produto) ');
      LSQL.add('   inner join unidades u on (u.cod_unidade = pd.cod_unidade) ');
      LSQL.add('where pd.id_producao =:vpIdProducao and pd.cod_empresa = :vpCodEmpresa ');
      LSQL.add('	  order by p.descricao                                           ');
      LSQL.Text := StringReplace(LSQL.Text, ':vpCodEmpresa', QuotedStr(ACodEmpresa), [rfReplaceAll, rfIgnoreCase]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpIdProducao', AIDProducao, [rfReplaceAll, rfIgnoreCase]);
      dmProducaoSubprodutos.qryProdutosOrdemProducao.Active := false;
      dmProducaoSubprodutos.qryProdutosOrdemProducao.SQL.clear;
      dmProducaoSubprodutos.qryProdutosOrdemProducao.SQL.Add(LSQL.Text);
      dm.adicionaLog(LSQL.Text);
      dmProducaoSubprodutos.qryProdutosOrdemProducao.Active := true;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao gerar lista de produtos para a ficha de impressão da produção!' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmProducaoSubProdutos.BuscaInsumosFichaProducao(AIDProducao: string; ACodEmpresa: string);
var
  LSQL: TStringList;
begin
  LSQL := TstringList.create;
  try
    try

      LSQL.add(' select pl.id,                                                   ');
      LSQL.add(' 	   pl.id_producao,                                             ');
      LSQL.add(' 	   pl.cod_empresa,                                             ');
      LSQL.add(' 	   pl.cod_produto,                                             ');
      LSQL.add(' 	   pd.descricao as produto,                                    ');
      LSQL.add(' 	   pl.cod_unidade as codUnidade,                               ');
      LSQL.add(' pl.qtde_calculada as PL,');
      LSQL.add(' ((pl.qtde_calculada * 100) / (100 - pd.perc_perda)) as PB,');
      LSQL.add('   pd.perc_perda,');
      LSQL.add(' (((pl.qtde_calculada * 100) / (100 - pd.perc_perda)) - pl.qtde_calculada) as PE,');
      LSQL.add(' 	   u.sigla as unidade,                                     ');
      LSQL.add(' 	   coalesce(pl.qtde_retirada,0) as qtde_retirada,                                           ');
      LSQL.add(' 	   coalesce(pl.qtde_utilizada,0) as qtde_utilizada,                                          ');
      LSQL.add(' 	   coalesce(pl.qtde_perda,0) as qtde_perda,                                              ');
      LSQL.add(' 	   coalesce(pl.qtde_sobra,0) as qtde_sobra                                               ');
      LSQL.add(' 	  from producoes_lista_insumos  pl                             ');
      LSQL.add(' 	   inner join produtos pd on (pd.cod_produto = pl.cod_produto) ');
      LSQL.add(' 	   inner join unidades u on (u.cod_unidade = pl.cod_unidade)   ');
      LSQL.add('where pl.id_producao =:vpIdProducao and pl.cod_empresa = :vpCodEmpresa ');
      LSQL.Add(' order by pd.descricao');
      LSQL.Text := StringReplace(LSQL.Text, ':vpCodEmpresa', QuotedStr(ACodEmpresa), [rfReplaceAll, rfIgnoreCase]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpIdProducao', AIDProducao, [rfReplaceAll, rfIgnoreCase]);

      dmProducaoSubprodutos.qryInsumosOrdemProducao.Active := false;
      dmProducaoSubprodutos.qryInsumosOrdemProducao.SQL.clear;
      dmProducaoSubprodutos.qryInsumosOrdemProducao.SQL.Add(LSQL.Text);
      dm.adicionaLog(LSQL.Text);
      dmProducaoSubprodutos.qryInsumosOrdemProducao.Active := true;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao gerar lista de insumos para a ficha de impressão da produção!' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

function TfrmProducaoSubProdutos.verificaSeProducaoJaFoiProcessada(AIdProducao: LargeInt): Boolean;
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  try
    try
      LSQL.Add('select pd.processada  from producoes_subprodutos pd where pd.id =' + Inttostr(AIdProducao));
      dm.getMemTable(LTbAux, LSQL.Text);
      LTbAux.FetchAll;
      result := dm.IntToBol(LTbAux.FieldByName('processada').Value);
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao verificar se produção já foi processada!' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmProducaoSubProdutos.ExcluirProducao(AIdProducao: LargeInt; ACodEmpresa: string);
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
  LListaSQL: TList<string>;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;
  LListaSQL := TList<string>.Create;

  try
    try
      LSQL.Clear;
      LSQL.Add(' delete  from producoes_subprodutos p where p.id = ' + Inttostr(AIdProducao) + ' and p.cod_empresa=' + QuotedStr(ACodEmpresa) + ';');
      LListaSQL.Add(LSQL.Text);
      ExcluirItensProducao(AIdProducao, ACodEmpresa, LListaSQL);
      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 25);

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao  ao excluir produção ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
    LListaSQL.clear;
    FreeAndNil(LListaSQL);
  end;
end;

procedure TfrmProducaoSubProdutos.ExcluirItensProducao(AIdProducao: LargeInt; ACodEmpresa: string; AListaSQL: TList<string>);
var
  LSQL: TStringList;
begin

  LSQL := TstringList.create;
  AListaSQL := TList<string>.Create;

  try
    try
      LSQL.Clear;
      LSQL.Add(' delete  from producoes_subprodutos_produtos pd where pd.id_producao = ' + Inttostr(AIdProducao) + ' and pd.cod_empresa=' + QuotedStr(ACodEmpresa) + ';');
      AListaSQL.Add(LSQL.Text);
      LSQL.Clear;
      LSQL.Add(' delete  from producoes_lista_insumos pd where pd.id_producao = ' + Inttostr(AIdProducao) + ' and pd.cod_empresa=' + QuotedStr(ACodEmpresa) + ';');
      AListaSQL.Add(LSQL.Text);
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao  ao excluir produção ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    AListaSQL.clear;
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmProducaoSubProdutos.ExcluirItem();
begin

  if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma a exclusão ?') = teSim) then
    dmProducaoSubprodutos.tbSubprodutosProducao.Delete;
end;

procedure TfrmProducaoSubProdutos.validaDadosProducao();
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  try
    try

      if dmProducaoSubprodutos.tbSubprodutosProducao.IsEmpty then
        raise Exception.Create('Nenhum produto registrado para esssa produção!');

      if DaysBetween(Now, edDataProducao.Date) >= 5 then
        raise Exception.Create('Intervalo de dias entre a data atual e a data de produção não pode ser superior a 4 dias');

      LSQL.Clear;
      LSQL.Add('select codigo from historicos_producao cp where cp.codigo =' + Inttostr(cbHistoricoProducao.EditValue));
      dm.getMemTable(LTbAux, LSQL.Text);
      LTbAux.FetchAll;

      if (LTbAux.IsEmpty = true) then
        raise Exception.Create('Histórico informado é inválido');

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao validar a produção: ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmProducaoSubProdutos.SalvarProducao(ACodEmpresa: string);
var
  LSQL: TStringList;
  LListaSQL: TList<string>;
  LIDProducao: string;
begin

  LSQL := TstringList.create;
  LListaSQL := TList<string>.Create;

  try
    try
      case LTipoOperacaoCrud of
        TOperacaoNovo:
          LIDProducao := IntToStr(dm.geraID('G_ID_PRODUCAO_SUBPRODUTOS'));
        ToperacaoAlterar:
          begin
            LIDProducao := IntToStr(LIDProducaoSelecionada);
            ExcluirProducao(LIDProducaoSelecionada, ACodEmpresa);
          end;
      end;

      SalvaDadosProducao(LIDProducao, ACodEmpresa, LListaSQL);
      SalvarItensProducao(LIDProducao, ACodEmpresa, LListaSQL);
      gerarListaDeInsumos(LIDProducao, ACodEmpresa, LListaSQL);
      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 25);
      FinalizaProducao();
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao salvar produção!  ' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LListaSQL.clear;
    FreeAndNil(LListaSQL);
  end;
end;

function TfrmProducaoSubProdutos.SalvaDadosProducao(AIDProducao: string; ACodEmpresa: string; AListaSQL: TList<string>): Longint;
var
  LSQL: TStringList;
begin

  LSQL := TstringList.create;

  try
    try
      LSQL.Add('insert into PRODUCOES_SUBPRODUTOS(id,cod_empresa,data,cod_usuario,nome_usuario,');
      LSQL.Add('observacoes, cod_historico,data_sistema) values (');
      LSQL.Add(AIDProducao + ',');
      LSQL.Add(Quotedstr(ACodEmpresa) + ',');
      LSQL.Add(QuotedStr(FormatDateTime('DD.MM.YYY', edDataProducao.Date)) + ',');
      LSQL.Add(Quotedstr(codigo_usuario) + ',');
      LSQL.Add(Quotedstr(nome_usuario) + ',');
      LSQL.Add(Quotedstr(memoObservacoes.Text) + ',');
      LSQL.Add(Inttostr(cbHistoricoProducao.EditValue) + ',');
      LSQL.Add(QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ');');
      AListaSQL.Add(LSQL.Text);

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao gravar os dados da produção! ' + sLineBreak + sLineBreak + e.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);

  end;
end;

procedure TfrmProducaoSubProdutos.SalvarItensProducao(AIDProducao: string; ACodEmpresa: string; AListaSQL: TList<string>);
var
  LSQL: TStringList;
  LIdItemProducao: string;
begin

  LSQL := TstringList.create;

  try
    try
      dmProducaoSubprodutos.tbSubprodutosProducao.First;
      while not dmProducaoSubprodutos.tbSubprodutosProducao.Eof do
      begin
        LIdItemProducao := IntToStr(dm.geraID('G_ID_PRODUCAO_PRODUTOS'));
        LSQL.Clear;
        LSQL.Add('  insert into PRODUCOES_SUBPRODUTOS_PRODUTOS(id, id_producao,cod_empresa,cod_produto,qtde_produzida,');
        LSQL.Add('    custo_unitario,custo_total, percentual_receita, cod_unidade) values (');
        LSQL.Add(LIdItemProducao + ',');
        LSQL.Add(AIDProducao + ',');
        LSQL.Add(Quotedstr(ACodEmpresa) + ',');
        LSQL.Add(Quotedstr(dmProducaoSubprodutos.tbSubprodutosProducaocodProduto.Value) + ',');
        LSQL.Add(dm.TrocaVirgPPto(Floattostr(dmProducaoSubprodutos.tbSubprodutosProducaoqtdeProduzida.Value)) + ',');
        LSQL.Add(dm.TrocaVirgPPto(Floattostr(dmProducaoSubprodutos.tbSubprodutosProducaocustoUnitario.Value)) + ',');
        LSQL.Add(dm.TrocaVirgPPto(Floattostr(dmProducaoSubprodutos.tbSubprodutosProducaocustoTotal.Value)) + ',');
        LSQL.Add(dm.TrocaVirgPPto(Floattostr(dmProducaoSubprodutos.tbSubprodutosProducaopercentualReceita.Value)) + ',');
        LSQL.Add(Quotedstr(dmProducaoSubprodutos.tbSubprodutosProducaocodUnidade.Value) + ');');
        AListaSQL.Add(LSQL.Text);
        dmProducaoSubprodutos.tbSubprodutosProducao.Next;
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao gravar os ítens da produção! ' + sLineBreak + sLineBreak + e.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);

  end;
end;

procedure TfrmProducaoSubProdutos.getInsumosProcessamentoProducao(AIDProducao: string; ACodEmpresa: string);
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;
  try
    try
      LSQL.add(' select pl.id,                                                                                 ');
      LSQL.add(' 		pl.cod_produto,                                                                          ');
      LSQL.add(' 		pd.descricao,                                                                            ');
      LSQL.add(' 		pl.cod_unidade as codUnidade,                                                            ');
      LSQL.add(' 		u.sigla as unidade,                                                                      ');
      LSQL.add('  ((pl.qtde_calculada * 100) / (100 - pd.perc_perda)) as PB,                                   ');
      LSQL.add('    pd.perc_perda,                                                                             ');
      LSQL.add('    pl.qtde_calculada as PL,                                                                   ');
      LSQL.add('    (((pl.qtde_calculada * 100) / (100 - pd.perc_perda)) - pl.qtde_calculada) as PE,           ');
      LSQL.add(' 		((pl.qtde_calculada * 100) / (100 - pd.perc_perda)) as qtde_retirada,                    ');
      LSQL.add(' 		pl.qtde_calculada as qtde_utilizada,                                                  ');
      LSQL.add(' 		(((pl.qtde_calculada * 100) / (100 - pd.perc_perda)) - pl.qtde_calculada) as qtde_perda, ');
      LSQL.add(' 		0.000 as qtde_sobra,                                                                            ');
      LSQL.add(' 		pd.perc_perda as percentual_perda,                                      ');
      LSQL.add(' 		0.000 as desvio_perda,                                      ');
      LSQL.add(' 		0.000 as desvio_quantidade                                      ');
      LSQL.add(' 	   from producoes_lista_insumos  pl                                                          ');
      LSQL.add(' 		inner join produtos pd on (pd.cod_produto = pl.cod_produto)                              ');
      LSQL.add(' 		inner join unidades u on (u.cod_unidade = pl.cod_unidade)                                ');
      LSQL.add('where pl.id_producao =:vpIdProducao and pl.cod_empresa = :vpCodEmpresa ');
      LSQL.Add(' order by pd.descricao');
      LSQL.Text := StringReplace(LSQL.Text, ':vpCodEmpresa', QuotedStr(ACodEmpresa), [rfReplaceAll, rfIgnoreCase]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpIdProducao', AIDProducao, [rfReplaceAll, rfIgnoreCase]);
      dm.adicionaLog(LSQL.Text);
      dm.getMemTable(dmProducaoSubprodutos.tbInsumosProcessamento, LSQL.text);
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro buscar os insumos da produção!' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmProducaoSubProdutos.gerarListaDeInsumos(AIDProducao: string; ACodEmpresa: string; AListaSQL: TList<string>);
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;
  try
    try

      LSQL.Clear;
      LSQL.Add('delete from producoes_lista_insumos pl where pl.id_producao=:vpIdProducao and pl.cod_empresa =:vpCodEmpresa;');
      LSQL.Text := StringReplace(LSQL.Text, ':vpCodEmpresa', QuotedStr(ACodEmpresa), [rfReplaceAll, rfIgnoreCase]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpIdProducao', AIDProducao, [rfReplaceAll, rfIgnoreCase]);
      AListaSQL.Add(LSQL.Text);

      LSQL.Clear;
      LSQL.add(' insert into producoes_lista_insumos(id, id_producao, cod_empresa, cod_produto, ');
      LSQL.add('    cod_unidade, qtde_calculada,estoque_antes,custo_unitario)                                  ');
      LSQL.add('      select                                                                    ');
      LSQL.add('       gen_id(G_ID_PRODUCAO_INSUMOS,1),                                         ');
      LSQL.add('        :vpIdProducao,:vpCodEmpresa,                                                       ');
      LSQL.add('        rc1.cod_produto,                                                        ');
      LSQL.add('        u.cod_unidade,                                                          ');
      LSQL.add('        (rc1.quantidade / u.parametro),                           ');
      LSQL.add('        (p.estoque_liquido / u.parametro) as estoqueAtual, custo_unitario                        ');
      LSQL.add('        from (                                                                  ');
      LSQL.add('    select rc.cod_produto,                                                      ');
      LSQL.add('          sum(rc.quantidade) as quantidade, custo_unitario                   ');
      LSQL.add('           from r_calcula_ficha_producao(:vpIdProducao) rc                      ');
      LSQL.add('           group by rc.cod_produto, custo_unitario                            ');
      LSQL.add('           ) rc1                                                                ');
      LSQL.add('       inner join produtos p on (p.cod_produto = rc1.cod_produto)               ');
      LSQL.add('       inner join unidades u on (u.cod_unidade = p.unidade_entrada);             ');
      LSQL.Text := StringReplace(LSQL.Text, ':vpCodEmpresa', QuotedStr(ACodEmpresa), [rfReplaceAll, rfIgnoreCase]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpIdProducao', AIDProducao, [rfReplaceAll, rfIgnoreCase]);
      AListaSQL.Add(LSQL.Text);
      LSQL.clear;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao gerar lista de insumos da produção!' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmProducaoSubProdutos.ExibirFichaProducao();
var
  LSQL: TStringList;
  LCodProduto: string;
  LPercentualProducao: string;
begin

  LSQL := TstringList.create;
  try
    try
      dmProducaoSubprodutos.tbFichaProducao.Active := false;
      LCodProduto := dmProducaoSubprodutos.tbSubprodutosProducaocodProduto.Value;
      LPercentualProducao := dm.TrocaVirgPPto(FloatToStr(dmProducaoSubprodutos.tbSubprodutosProducaopercentualReceita.Value / 100));

      edDescricaoProdutoFichaProducao.Text := dmProducaoSubprodutos.tbSubprodutosProducaoDescricao.Value;
      edQuantidadeFichaProducao.Text := FloatToStr(dmProducaoSubprodutos.tbSubprodutosProducaoqtdeProduzida.Value);
      edPercentualFichaProducao.Text := FloatToStr(dmProducaoSubprodutos.tbSubprodutosProducaopercentualReceita.Value);
      edUnidadeFichaProducao.Text := dmProducaoSubprodutos.tbSubprodutosProducaoUnidade.Value;

      LSQL.add(' select cp.cod_produto, cod_produto_baixa,                                               ');
      LSQL.add('        descricao_prod_baixa,                                         ');
      LSQL.add('        (p.estoque_liquido / u.parametro) as estoqueAtual,            ');
      LSQL.add('        u.sigla as unidadeEstoque,                                    ');
      LSQL.add('        qtd_baixa_prod as qtdeReceita,                                ');
      LSQL.add('        descricao_unidade,                                            ');
      LSQL.add('        custo_unitario_produto,                                       ');
      LSQL.add('        custo_baixa as custoReceita,                                  ');
//      LSQL.add('        udf_roundabnt( (qtd_baixa_prod *' + LPercentualProducao + '),3) as qtdeProducao,    ');
  //    LSQL.add('        udf_roundabnt( (custo_baixa * ' + LPercentualProducao + ' ),3)   as custoProducao     ');//

      LSQL.add('        udf_roundabnt( (qtd_baixa_prod),3) as qtdeProducao,    ');
      LSQL.add('        udf_roundabnt( (custo_baixa ),3)   as custoProducao     ');
      LSQL.add('     from                                                             ');
      LSQL.add('       calcula_custo_produto_novo(' + QuotedStr(LCodProduto) + ', ' + QuotedStr(LCodProduto) + ',' + dm.TrocaVirgPPto(edQuantidadeFichaProducao.Text) + ')' + ' cp ');
      LSQL.add('       inner join produtos p on (p.cod_produto = cp.cod_produto_baixa)');
      LSQL.add('       inner join unidades u on (u.cod_unidade = p.unidade_entrada)   ');
      dm.adicionaLog(LSQL.Text);
      dm.getMemTable(dmProducaoSubprodutos.tbFichaProducao, LSQL.Text);
      dmProducaoSubprodutos.tbFichaProducao.FetchAll;

      if (dmProducaoSubprodutos.tbFichaProducao.IsEmpty = false) then
      begin
        pgFichaProducao.Show;
      end
      else
      begin
        raise Exception.Create('Nenhum produto na ficha de produção. Verifique a ficha técnica e tente novamente.');
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao exibir a ficha de produção!' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmProducaoSubProdutos.imprimirFichaProducaoSelecionada();
var
  LSQL: TStringList;
  LCodProduto: string;
  LPercentualProducao: string;
begin

  LSQL := TstringList.create;
  try
    try
      LCodProduto := dmProducaoSubprodutos.tbSubprodutosProducaocodProduto.Value;
      LPercentualProducao := dm.TrocaVirgPPto(FloatToStr(dmProducaoSubprodutos.tbSubprodutosProducaopercentualReceita.Value / 100));
      LSQL.add(' select ');
      LSQL.Add(Quotedstr(edDescricaoProdutoFichaProducao.Text) + ' as ProdutoProducao' + ',');
      LSQL.Add(dm.TrocaVirgPPto(edQuantidadeFichaProducao.Text) + ' as QtdeAProduzir' + ',');
      LSQL.Add(dm.TrocaVirgPPto(edPercentualFichaProducao.Text) + ' as PercentualFichaProduzir' + ',');
      LSQL.Add(Quotedstr(edUnidadeFichaProducao.Text) + ' as UnidadeProducao' + ',');
      LSQL.add('cp.cod_produto, cod_produto_baixa,                                               ');
      LSQL.add('        descricao_prod_baixa,                                         ');
      LSQL.add('        (p.estoque_liquido / u.parametro) as estoqueAtual,            ');
      LSQL.add('        u.sigla as unidadeEstoque,                                    ');
      LSQL.add('        qtd_baixa_prod as qtdeReceita,                                ');
      LSQL.add('        descricao_unidade,                                            ');
      LSQL.add('        custo_unitario_produto,                                       ');
      LSQL.add('        custo_baixa as custoReceita,                                  ');
      LSQL.add('        udf_roundabnt( (qtd_baixa_prod ),3) as qtdeProducao,    ');
      LSQL.add('        udf_roundabnt( (custo_baixa ),3)   as custoProducao     ');
      LSQL.add('     from                                                             ');
      LSQL.add('       calcula_custo_produto_novo(' + QuotedStr(LCodProduto) + ', ' + QuotedStr(LCodProduto) + ',' + dm.TrocaVirgPPto(FloatToStr(dmProducaoSubprodutos.tbSubprodutosProducaoqtdeProduzida.Value)) + ' ) cp ');
      LSQL.add('       inner join produtos p on (p.cod_produto = cp.cod_produto_baixa)');
      LSQL.add('       inner join unidades u on (u.cod_unidade = p.unidade_entrada)   ');
      dm.adicionaLog(LSQL.Text);
      dmProducaoSubprodutos.qryRelFichaProducao.Active := false;
      dmProducaoSubprodutos.qryRelFichaProducao.sql.Clear;
      dmProducaoSubprodutos.qryRelFichaProducao.SQL.Add(LSQL.Text);
      dmProducaoSubprodutos.qryRelFichaProducao.Active := True;

      dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relFichaProducaoProduto.fr3', true);
      dm_relatorios.rpt.ShowReport(true);
      dm_relatorios.rpt.Clear;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao imprimir a ficha de produção produção!' + sLineBreak + sLineBreak + E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    dmProducaoSubprodutos.qryRelFichaProducao.Active := false;
  end;
end;

procedure TfrmProducaoSubProdutos.FormDestroy(Sender: TObject);
begin
  inherited;
  dmProducaoSubprodutos.Free;
end;

end.


