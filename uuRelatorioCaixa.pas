unit uuRelatorioCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, JclStrings, Classes, RealFramework,
  DateUtils, Graphics, Controls, Forms, Dialogs, uu_modelo_Vazio, StdCtrls,
  ExtCtrls, Buttons, DBCtrls, Data.DB, RxToolEdit, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, PngSpeedButton, AdvGlassButton,
  Vcl.Menus, cxCheckBox, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckComboBox, Vcl.ComCtrls, AdvDateTimePicker, cxStyles,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxCurrencyEdit, cxRadioGroup, Vcl.ImgList, cxImageList, JvPageList,
  JvExControls, JvgPage, dxBarBuiltInMenu, cxPC, cxGridBandedTableView,
  cxGridDBBandedTableView, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSFillPatterns, dxPSEdgePatterns, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, cxCustomData, cxFilter, cxData, dxDateRanges,
  dxScrollbarAnnotations, dxPSCompsProvider, dxPSPDFExportCore, dxPSPDFExport,
  System.ImageList, cxGroupBox, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);

  TcxPainterAccess = class(TcxGridTableDataCellPainter);

  TTipoRelatorioCaixa = (RelProdutosVendidos, RelVendas, RelSangrias, RelEstornosProdutos, RelEstornosMesa, RelTransferenciasProdutos, RelTransferenciasMesa);

type
  TfrmRelatorioCaixa = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    PopupMenu1: TPopupMenu;
    I70003009: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    stlRegistro: TcxStyle;
    stConfirmada: TcxStyle;
    stCancelada: TcxStyle;
    stCiencia: TcxStyle;
    stSemManifesto: TcxStyle;
    stNaoRealizada: TcxStyle;
    cxImageList1: TcxImageList;
    pgList: TJvPageList;
    pgListagem: TJvStandardPage;
    pgAuditoria: TJvStandardPage;
    Panel6: TPanel;
    btExibirCaixas: TPngSpeedButton;
    GroupBox1: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Label4: TLabel;
    Label1: TLabel;
    cbk_visualizar: TCheckBox;
    ed_data_inicial: TAdvDateTimePicker;
    ed_data_final: TAdvDateTimePicker;
    rdStatusAuditoria: TcxRadioGroup;
    btFechar: TAdvGlassButton;
    pgGrid: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1CODIGO: TcxGridDBColumn;
    cxGrid1DBTableView1AUDITADO: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO_EMPRESA: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_USUARIO: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_SISTEMA: TcxGridDBColumn;
    cxGrid1DBTableView1ABERTURA: TcxGridDBColumn;
    cxGrid1DBTableView1PARCIAIS_IMPRESSOS: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL_SUPRIMENTOS: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL_RECEBIMENTOS: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL_SANGRIAS: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL_SISTEMA: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL_OPERADOR: TcxGridDBColumn;
    cxGrid1DBTableView1DIFERENCA_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1DIFERENCA_PAGAR: TcxGridDBColumn;
    cxGrid1DBTableView1USUARIO_AUDITORIA: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_AUDITORIA: TcxGridDBColumn;
    cxGrid1DBTableView1SINCRONIZADO: TcxGridDBColumn;
    cxGrid1DBTableView1STATUS: TcxGridDBColumn;
    cxGrid1DBTableView1FECHAMENTO: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dsa: TPanel;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    PngSpeedButton3: TPngSpeedButton;
    Panel1: TPanel;
    PngSpeedButton4: TPngSpeedButton;
    I70003007: TMenuItem;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Panel3: TPanel;
    cxGrid2: TcxGrid;
    cxgrdlvlGrid2Level1: TcxGridLevel;
    gridAuditoria: TcxGridDBBandedTableView;
    gridAuditoriaDESCRICAO: TcxGridDBBandedColumn;
    gridAuditoriaTOTAL_SUPRIMENTOS: TcxGridDBBandedColumn;
    gridAuditoriaTOTAL_SANGRIAS: TcxGridDBBandedColumn;
    gridAuditoriaTOTAL_RECEBIMENTOS_VENDAS: TcxGridDBBandedColumn;
    gridAuditoriaTOTAL_RECEBIMENTOS_PENDURAS: TcxGridDBBandedColumn;
    gridAuditoriaSALDO_SISTEMA: TcxGridDBBandedColumn;
    gridAuditoriaTOTAL_OPERADOR: TcxGridDBBandedColumn;
    gridAuditoriaDIFERENCA_OPERADOR: TcxGridDBBandedColumn;
    cxstyl1: TcxStyle;
    gridAuditoriaTOTAL_AUDITORIA: TcxGridDBBandedColumn;
    gridAuditoriaDIFERENCA_AUDITORIA: TcxGridDBBandedColumn;
    gridAuditoriaOBS: TcxGridDBBandedColumn;
    cxTabSheet2: TcxTabSheet;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    popDetalhamento: TPopupMenu;
    Imprimirdetalhamentoderecebimentos1: TMenuItem;
    VisualizardaNFe1: TMenuItem;
    Detalhamentodavenda1: TMenuItem;
    cxTabSheet3: TcxTabSheet;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1COD_VENDA: TcxGridDBColumn;
    cxGridDBTableView1HORA: TcxGridDBColumn;
    cxGridDBTableView1MESA: TcxGridDBColumn;
    cxGridDBTableView1VALOR_BRUTO: TcxGridDBColumn;
    cxGridDBTableView1VALOR_TXSERV: TcxGridDBColumn;
    cxGridDBTableView1VALOR_DESCONTO: TcxGridDBColumn;
    cxGridDBTableView1VALOR_TOTAL: TcxGridDBColumn;
    cxGridDBTableView1NUMERO_NFCE: TcxGridDBColumn;
    cxGridDBTableView1TABELA_PRECO: TcxGridDBColumn;
    cxGridDBTableView1CHAVE_NFCE: TcxGridDBColumn;
    cxGridDBTableView1LOGIN: TcxGridDBColumn;
    I2: TMenuItem;
    N1: TMenuItem;
    R1: TMenuItem;
    E1: TMenuItem;
    E2: TMenuItem;
    Estornosdemesa1: TMenuItem;
    N2: TMenuItem;
    T1: TMenuItem;
    T2: TMenuItem;
    N3: TMenuItem;
    S1: TMenuItem;
    V1: TMenuItem;
    I70003008: TMenuItem;
    N4: TMenuItem;
    Panel4: TPanel;
    Label3: TLabel;
    PngSpeedButton2: TPngSpeedButton;
    Label5: TLabel;
    lbNumeroCaixa: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    lbNomeOperadorCaixa: TLabel;
    lbDataMovimentoCaixa: TLabel;
    Label7: TLabel;
    lbHoraAberturaCaixa: TLabel;
    Label9: TLabel;
    lbHoraFechamentoCaixa: TLabel;
    Label11: TLabel;
    lbUsuarioAuditoria: TLabel;
    Panel5: TPanel;
    btSalvar: TAdvGlassButton;
    btVoltar: TAdvGlassButton;
    Panel7: TPanel;
    memoObservacoesAuditoria: TMemo;
    Label8: TLabel;
    cbHistoricoAuditoria: TcxLookupComboBox;
    Label10: TLabel;
    cxgrdbclmnGrid1DBTableView1Historico: TcxGridDBColumn;
    pnMotivoAlteracaoForma: TPanel;
    pnGridFormasRecebimento: TPanel;
    gridDetalhamentoRecebimentos: TcxGrid;
    gridDetalhamentoRecebimentosDBTableView1: TcxGridDBTableView;
    gridDetalhamentoRecebimentosDBTableView1COD_VENDA: TcxGridDBColumn;
    gridDetalhamentoRecebimentosDBTableView1MESA: TcxGridDBColumn;
    gridDetalhamentoRecebimentosDBTableView1HORA: TcxGridDBColumn;
    gridDetalhamentoRecebimentosDBTableView1VALOR_TOTAL: TcxGridDBColumn;
    gridDetalhamentoRecebimentosDBTableView1NUMERO_NFCE: TcxGridDBColumn;
    gridDetalhamentoRecebimentosDBTableView1VALOR_TXSERV: TcxGridDBColumn;
    gridDetalhamentoRecebimentosDBTableView1DESCRICAO: TcxGridDBColumn;
    gridDetalhamentoRecebimentosDBTableView1VALOR: TcxGridDBColumn;
    gridDetalhamentoRecebimentosDBTableView1LOGIN: TcxGridDBColumn;
    gridDetalhamentoRecebimentosDBTableView1CLIENTE: TcxGridDBColumn;
    gridDetalhamentoRecebimentosLevel1: TcxGridLevel;
    Panel9: TPanel;
    Label12: TLabel;
    PngSpeedButton5: TPngSpeedButton;
    cxLookupComboBox1: TcxLookupComboBox;
    Label13: TLabel;
    Label14: TLabel;
    Panel10: TPanel;
    PngSpeedButton6: TPngSpeedButton;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton2: TAdvGlassButton;
    Memo1: TMemo;
    Label15: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure btFecharClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PngSpeedButton3Click(Sender: TObject);
    procedure I70003009Click(Sender: TObject);
    procedure cxGrid1DBTableView1AUDITADOCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1SINCRONIZADOCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1STATUSCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure I70003007Click(Sender: TObject);
    procedure btVoltarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure Imprimirdetalhamentoderecebimentos1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Detalhamentodavenda1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure I2Click(Sender: TObject);
    procedure I70003008Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure T2Click(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure VisualizardaNFe1Click(Sender: TObject);
  private
    { Private declarations }
    GBookMark: TBookmark;
    LCodEmpresa, LCodCaixa, LCodVenda, LNomeOperador: string;
    LDataCaixa: TDate;
    LErrorMessage: Tstringlist;
    LIdAuditoria: Largeint;
    procedure ExibirCaixas;
    procedure EscondeColunasNaoPermitidas;
    procedure SalvarAuditoria;
    procedure ImprimirDetalheRecebimentos(ACodEmpresa, ACodCaixa: string);
    procedure FiltrarProdutosVendidosCaixa(ACodempresa: string; ACodigoCaixa: string; ADataCaixa: TDate);

    procedure emitirRelatorioModeloAntigo(ACodempresa, ACodigoCaixa: string; ADataCaixa: TDate);
    procedure OpenOrCloseDatasetsReportA4(AOpen: Boolean);
    procedure ImprimirRelatorio(ARelatorio: TTipoRelatorioCaixa);
    procedure FiltrarEstornosDeProdutos(ACodempresa, ACodigoCaixa: string; ADataCaixa: TDate);
    procedure FiltrarEstornosDeMesas(ACodempresa, ACodigoCaixa: string; ADataCaixa: TDate);
    procedure FiltrarTransferenciaDeProdutos(ACodempresa, ACodigoCaixa: string; ADataCaixa: TDate);
    procedure FiltrarTransferenciasDeMesa(ACodempresa, ACodigoCaixa: string; ADataCaixa: TDate);
    procedure FiltrarSangriasCaixa(ACodempresa, ACodigoCaixa: string; ADataCaixa: TDate);
    procedure FiltrarVendasDoCAixa(ACodempresa, ACodigoCaixa: string; ADataCaixa: TDate);
    procedure PreencherLabelsAuditoria;

  public
    { Public declarations }

  end;

var
  frmRelatorioCaixa: TfrmRelatorioCaixa;

implementation

uses
  uu_data_module, uu_frm_principal, uuDmAuditoriaCaixa, UU_DM_RELATORIOS,
  uuDmRelatorios;

{$R *.dfm}

procedure TfrmRelatorioCaixa.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  ExibirCaixas;

end;

procedure TfrmRelatorioCaixa.PngSpeedButton3Click(Sender: TObject);
begin
  inherited;
  btFechar.Click;
end;

procedure TfrmRelatorioCaixa.ExibirCaixas;
var
  LSQL: TstringList;
  LFiltroSQL, LErrorMessage: TstringList;
  LDataInicial, LDataFinal: string;
  LEmpresasSelecionadas: TSelecaoComboPesquisa;
  I: integer;
begin
  LSQL := TStringList.create;
  LFiltroSQL := TStringList.create;
  LErrorMessage := TStringList.create;
  LEmpresasSelecionadas := TSelecaoComboPesquisa.Create;

  try
    try

      if cbEmpresas.States[0] = cbsChecked then
      begin
        for I := 0 to cbEmpresas.Properties.Items.Count - 1 do
          cbEmpresas.States[I] := cbsChecked;
      end;
      getSelecaoCombo(cbEmpresas, LEmpresasSelecionadas, tiEmpresas);

      dmAuditoriaCaixas.QryListagemCaixas.Active := false;
      dmAuditoriaCaixas.QryListagemCaixas.sql.Clear;
      LSQL.text := dmAuditoriaCaixas.getSQListagemCaixas;
      LDataInicial := Quotedstr(FormatDateTime('DD.MM.YYYY', ed_data_inicial.Date));
      LDataFinal := Quotedstr(FormatDateTime('DD.MM.YYYY', ed_data_final.Date));

      LFiltroSQL.add(' and c.data_sistema between ' + LDataInicial + ' and ' + LDataFinal);
      case rdStatusAuditoria.ItemIndex of

        1:
          LFiltroSQL.Add(' and coalesce(auditado,0) = 0');
        2:
          LFiltroSQL.Add(' and coalesce(auditado,0) = 1');

        3:
          LFiltroSQL.Add(' and coalesce(auditado,0) = 2');
      end;

      LSQL.Text := StringReplace(LSQL.Text, ':FiltrosAdicionais', LFiltroSQL.text, [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpDataInicial', LDataInicial, [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpDataFinal', LDataFinal, [rfReplaceAll]);
      dm.adicionaLog(LSQL.text);
      dmAuditoriaCaixas.QryListagemcaixas.UpdateOptions.ReadOnly := true;
      dmAuditoriaCaixas.QryListagemCaixas.SQL.add(LSQL.Text);
      dmAuditoriaCaixas.QryListagemCaixas.Active := true;
      if dmAuditoriaCaixas.QryListagemCaixas.IsEmpty = true then
      begin
        ShowRealDialog(self, tmAviso, 'Atenção', 'Nenhum caixa para o período e/ou parâmetros informados!');
      end;

    except
      on E: Exception do
      begin
        LErrorMessage.clear;
        LErrorMessage.add('Erro ao listar caixas.');
        LErrorMessage.add('Mensagem do erro: ' + E.Message);
        ShowRealDialog(self, tmErro, 'Erro', LErrorMessage.text);
      end;
    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LFiltroSQL);
    FreeAndNil(LEmpresasSelecionadas);
    FreeAndNil(LErrorMessage);
  end;
end;

procedure TfrmRelatorioCaixa.FormActivate(Sender: TObject);
begin
  inherited;
  pgListagem.Show;

end;

procedure TfrmRelatorioCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmAuditoriaCaixas.qryDetalhamentoFormas.Active := false;
  dmAuditoriaCaixas.QryListagemCaixas.Active := False;
  dmAuditoriaCaixas.qryVendasCaixa.Active := false;
end;

procedure TfrmRelatorioCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  dmAuditoriaCaixas := TdmAuditoriaCaixas.Create(self);
  ed_data_inicial.Date := IncDay(Now, -10);
  ed_data_final.Date := now;
  carregaDadosCombo(cbEmpresas, tiEmpresas);
  EscondeColunasNaoPermitidas;
  ExibirCaixas;
end;

procedure TfrmRelatorioCaixa.EscondeColunasNaoPermitidas();
begin
  if dm.verificaPermissaoAcao('I70003006', false, false) = false then
  begin
    cxGrid1DBTableView1PARCIAIS_IMPRESSOS.Visible := false;
    cxGrid1DBTableView1TOTAL_SUPRIMENTOS.Visible := false;
    cxGrid1DBTableView1TOTAL_RECEBIMENTOS.visible := false;
    cxGrid1DBTableView1TOTAL_SANGRIAS.Visible := false;
    cxGrid1DBTableView1TOTAL_SISTEMA.visible := false;
    cxGrid1DBTableView1TOTAL_OPERADOR.Visible := false;
    cxGrid1DBTableView1DIFERENCA_TOTAL.Visible := false;
    cxGrid1DBTableView1DIFERENCA_PAGAR.Visible := false;
  end;
end;

procedure TfrmRelatorioCaixa.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmAuditoriaCaixas);
end;

procedure TfrmRelatorioCaixa.I70003007Click(Sender: TObject);
var
  LCaixaFechado: Boolean;
  LCaixaAuditado, LAuditoriaReaberta: boolean;
begin
  inherited;

  LAuditoriaReaberta := false;
  LCaixaFechado := false;
  LCaixaAuditado := false;

  if dm.verificaPermissaoAcao('I70003007', true, true) = false then
    exit;

  LErrorMessage := TStringList.Create;
  gridAuditoria.OptionsData.Editing := true;
  btSalvar.Enabled := true;
  cbHistoricoAuditoria.Enabled := true;
  memoObservacoesAuditoria.enabled := True;

  try
    try
      LCodEmpresa := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('cod_empresa').Value;
      LCodCaixa := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('codigo').Value;
      LDataCaixa := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('data_sistema').Value;

      case dmAuditoriaCaixas.QryListagemCaixas.FieldByName('status').Value of
        0:
          LCaixaFechado := true;
        1:
          LCaixaFechado := false;
      end;

      case dmAuditoriaCaixas.QryListagemCaixas.FieldByName('auditado').Value of
        0:
          LCaixaAuditado := false;
        1:
          LCaixaAuditado := True;
        2:
          begin
            LAuditoriaReaberta := true;
            LCaixaAuditado := False;

          end;

      end;

      if ((LCaixaAuditado = false) and (LAuditoriaReaberta = false)) then
        LIdAuditoria := dm.GerarAuditoriaDeCaixa(LCodEmpresa, LCodCaixa);

      if (LCaixaAuditado = true) then
      begin
        ShowRealDialog(self, tmAviso, 'Aviso', 'O caixa selecionado já foi auditado e não será possível realizar alterações nessa auditoria.' + sLineBreak + ' Para reabrir a auditoria deste caixa, selecione o caixa e clique na opção "Desfazer auditoria" no menu de opções.');
      end;

      if (LCaixaFechado = false) then
      begin
        ShowRealDialog(self, tmAviso, 'Aviso', 'O caixa selecionado ainda está aberto!' + sLineBreak + ' Não será possível fazer auditoria ou salvar alterações!');
      end;

      if (LCaixaFechado = false) or (LCaixaAuditado = true) then
      begin
        gridAuditoria.OptionsData.Editing := false;
        btSalvar.Enabled := false;
        cbHistoricoAuditoria.Enabled := false;
        memoObservacoesAuditoria.enabled := false;
      end;
      PreencherLabelsAuditoria;
      LIdAuditoria := dm.getIdAuditoriaDeCAixa(LCodEmpresa, LCodCaixa);
      dm.getDadosAuditoriaDeCaixa(dmAuditoriaCaixas.tbAuditoriaDeCaixa, LIdAuditoria);
      dmAuditoriaCaixas.FiltrarVendasDoCaixa(LCodEmpresa, LCodCaixa);
      dmAuditoriaCaixas.FiltrarDetalhamentoDeRecebimentosCaixa(LCodEmpresa, LCodCaixa);
      dmAuditoriaCaixas.QryListagemCaixas.Active := true;
      pgAuditoria.Show;

    except
      on E: Exception do
      begin
        LErrorMessage.add('Erro ao gerar auditoria de caixa!');
        LErrorMessage.add(sLineBreak + 'Erro: ' + E.Message);
        ShowRealDialog(self, tmErro, 'Erro', LErrorMessage.text);
      end;

    end;

  finally
    FreeAndNil(LErrorMessage);

  end;
end;

procedure TfrmRelatorioCaixa.PreencherLabelsAuditoria();
begin
  lbNumeroCaixa.caption := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('codigo').Value;
  lbDataMovimentoCaixa.Caption := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('data_sistema').AsString;
  lbNomeOperadorCaixa.Caption := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('nome_usuario').AsString;
  lbHoraAberturaCaixa.Caption := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('abertura').AsString;
  lbHoraFechamentoCaixa.caption := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('fechamento').AsString;
  lbUsuarioAuditoria.Caption := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('usuario_auditoria').AsString;
  memoObservacoesAuditoria.Lines.Text := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('obs_auditoria').AsString;
  cbHistoricoAuditoria.EditValue := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('ID_HISTORICO_AUDITORIA').AsString;

end;

procedure TfrmRelatorioCaixa.I70003009Click(Sender: TObject);
var
  LCodigoCaixa, LCodigoEmpresa: string;
begin
  inherited;
  GBookMark := dmAuditoriaCaixas.QryListagemCaixas.GetBookmark;
  try

    if dm.verificaPermissaoAcao('I70003009', true, true) = false then
      exit;

    if dmAuditoriaCaixas.QryListagemCaixas.IsEmpty = false then
    begin
      if (dmAuditoriaCaixas.QryListagemCaixas.FieldByName('status').Value = 0) then
      begin
        if dm.verificaPermissaoAcao('I70003005', true, true) = true then
        begin
          LCodigoCaixa := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('codigo').Value;
          LCodigoEmpresa := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('cod_empresa').Value;
          dm.EmitirRelatorioDeCaixaNaMiniPrinter(LCodigoEmpresa, LCodigoCaixa, TRReimpressao);
          ShowRealDialog(self, tmSucesso, 'Impressão enviada', 'Impressão enviada corretamente para impressora!');
        end;
      end
      else
      begin
        ShowRealDialog(frm_principal, tmAviso, 'Caixa aberto', 'Não é possível reimprimir um caixa que ainda está aberto. Faça a impressão através das opções de caixa - Relatório parcial!');
      end;
    end
    else
    begin
      ShowRealDialog(frm_principal, tmAviso, 'Atenção', 'Nenhum caixa selecionado!');
    end;
  finally
    dmAuditoriaCaixas.QryListagemCaixas.GotoBookmark(GBookMark);
  end;

end;

procedure TfrmRelatorioCaixa.btFecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioCaixa.btSalvarClick(Sender: TObject);
begin
  inherited;
  SalvarAuditoria;
end;

procedure TfrmRelatorioCaixa.cxGrid1DBTableView1AUDITADOCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
  LIndice: smallint;
  CellRect, ImageRect: TRect;
  ImageWidth, ImageHeight: Integer;
begin
  inherited;
  if dmAuditoriaCaixas.QryListagemCaixas.IsEmpty then
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
      LIndice := StrIndex(AViewInfo.GridRecord.Values[cxGrid1DBTableView1AUDITADO.Index], ['0', '1', '2']);
      ACanvas.FillRect(AViewInfo.Bounds);

      ImageWidth := cxImageList1.Width;
      ImageHeight := cxImageList1.Height;

      CellRect := AViewInfo.Bounds;

    // Calculate the position to center the image horizontally and vertically
      ImageRect.Left := CellRect.Left + (CellRect.Width - ImageWidth) div 2;
      ImageRect.Top := CellRect.Top + (CellRect.Height - ImageHeight) div 2;
      ImageRect.Right := ImageRect.Left + ImageWidth;
      ImageRect.Bottom := ImageRect.Top + ImageHeight;

      case LIndice of

        0:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, ImageRect.Left, ImageRect.Top, 4);

          end;
        1:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, ImageRect.Left, ImageRect.Top, 3);
          end;

        2:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, ImageRect.Left, ImageRect.Top, 6);
          end;
      end;

    finally
      Free;
    end;
  end;
  ADone := True;
end;

procedure TfrmRelatorioCaixa.cxGrid1DBTableView1SINCRONIZADOCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
  LIndice: smallint;
  CellRect, ImageRect: TRect;
  ImageWidth, ImageHeight: Integer;
begin
  inherited;
  if dmAuditoriaCaixas.QryListagemCaixas.IsEmpty then
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
      LIndice := StrIndex(AViewInfo.GridRecord.Values[cxGrid1DBTableView1SINCRONIZADO.Index], ['0', '1']);
      ACanvas.FillRect(AViewInfo.Bounds);

      ImageWidth := cxImageList1.Width;
      ImageHeight := cxImageList1.Height;

      CellRect := AViewInfo.Bounds;

    // Calculate the position to center the image horizontally and vertically
      ImageRect.Left := CellRect.Left + (CellRect.Width - ImageWidth) div 2;
      ImageRect.Top := CellRect.Top + (CellRect.Height - ImageHeight) div 2;
      ImageRect.Right := ImageRect.Left + ImageWidth;
      ImageRect.Bottom := ImageRect.Top + ImageHeight;

      case LIndice of

        0:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, ImageRect.Left, ImageRect.Top, 2);

          end;
        1:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, ImageRect.Left, ImageRect.Top, 1);
          end;
      end;

    finally
      Free;
    end;
  end;
  ADone := True;
end;

procedure TfrmRelatorioCaixa.cxGrid1DBTableView1STATUSCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
  LIndice: smallint;
  CellRect, ImageRect: TRect;
  ImageWidth, ImageHeight: Integer;
begin
  inherited;
  if dmAuditoriaCaixas.QryListagemCaixas.IsEmpty then
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
      LIndice := StrIndex(AViewInfo.GridRecord.Values[cxGrid1DBTableView1STATUS.Index], ['0', '1']);
      ACanvas.FillRect(AViewInfo.Bounds);

      ImageWidth := cxImageList1.Width;
      ImageHeight := cxImageList1.Height;

      CellRect := AViewInfo.Bounds;

    // Calculate the position to center the image horizontally and vertically
      ImageRect.Left := CellRect.Left + (CellRect.Width - ImageWidth) div 2;
      ImageRect.Top := CellRect.Top + (CellRect.Height - ImageHeight) div 2;
      ImageRect.Right := ImageRect.Left + ImageWidth;
      ImageRect.Bottom := ImageRect.Top + ImageHeight;

      case LIndice of

        0:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, ImageRect.Left, ImageRect.Top, 3);

          end;
        1:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, ImageRect.Left, ImageRect.Top, 4);
          end;
      end;

    finally
      Free;
    end;
  end;
  ADone := True;
end;

procedure TfrmRelatorioCaixa.Detalhamentodavenda1Click(Sender: TObject);
begin
  inherited;
  if dmAuditoriaCaixas.qryDetalhamentoFormas.IsEmpty = false then
  begin
    case cxPageControl1.ActivePageIndex of
      1:
        begin
          LCodEmpresa := dmAuditoriaCaixas.qryDetalhamentoFormas.fieldbyname('cod_empresa').value;
          LCodVenda := dmAuditoriaCaixas.qryDetalhamentoFormas.fieldbyname('cod_venda').value;
        end;
      2:
        begin
          LCodEmpresa := dmAuditoriaCaixas.qryVendasCaixa.fieldbyname('cod_empresa').value;
          LCodVenda := dmAuditoriaCaixas.qryVendasCaixa.fieldbyname('cod_venda').value;

        end;
    end;

    dm.VisualizarDetalhamentoDaVenda(LCodEmpresa, LCodVenda);
  end
  else
  begin
    ShowRealDialog(frm_principal, tmErro, 'Erro', 'Nenhuma venda selecionada!');
  end;
end;

procedure TfrmRelatorioCaixa.btVoltarClick(Sender: TObject);
begin
  inherited;
  dmAuditoriaCaixas.tbAuditoriaDeCaixa.Active := false;
  ExibirCaixas;
  pgListagem.Show;
end;

procedure TfrmRelatorioCaixa.SalvarAuditoria;
begin

  try
    try
      GBookMark := dmAuditoriaCaixas.QryListagemCaixas.GetBookmark;
      dm.SalvarAuditoriaDeCaixa(dmAuditoriaCaixas.tbAuditoriaDeCaixa, memoObservacoesAuditoria.Lines.Text, cbHistoricoAuditoria.EditValue);
      dmAuditoriaCaixas.tbAuditoriaDeCaixa.Active := false;
      ShowRealDialog(frm_principal, tmSucesso, 'Sucesso!', 'A auditoria foi salva com sucesso!');
      ExibirCaixas;
      pgListagem.Show;
    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro ao salvar', 'Ocorreu um erro ao salvar a auditoria!' + sLineBreak + sLineBreak + E.Message);
      end;

    end;

  finally
    dmAuditoriaCaixas.QryListagemCaixas.GotoBookmark(GBookMark);
  end;

end;

procedure TfrmRelatorioCaixa.VisualizardaNFe1Click(Sender: TObject);
var
  LChaveNFE: string;
begin
  inherited;
  case cxPageControl1.ActivePageIndex of
    1:
      begin
        LChaveNFE := dmAuditoriaCaixas.qryVendasCaixa.fieldbyname('chave_nfce').value;

      end;
    2:
      begin
        LChaveNFE := dmAuditoriaCaixas.qryVendasCaixa.fieldbyname('chave_nfce').value;
      end;
  end;

  dm.reimprimirDanfe(LChaveNFE, 1, true, false);
end;

procedure TfrmRelatorioCaixa.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioCaixa.E1Click(Sender: TObject);
begin
  inherited;
  ImprimirRelatorio(RelEstornosProdutos);
end;

procedure TfrmRelatorioCaixa.E2Click(Sender: TObject);
begin
  inherited;
  ImprimirRelatorio(RelEstornosMesa);
end;

procedure TfrmRelatorioCaixa.Imprimirdetalhamentoderecebimentos1Click(Sender: TObject);
begin
  inherited;
  ImprimirDetalheRecebimentos(LCodEmpresa, LCodCaixa);
end;

procedure TfrmRelatorioCaixa.ImprimirDetalheRecebimentos(ACodEmpresa: string; ACodCaixa: string);
begin
  dxComponentPrinter1Link1.PrinterPage.PageHeader.CenterTitle.Text := 'Detalhamento de recebimentos - Empresa:' + ACodEmpresa + '  ' + 'Caixa: ' + ACodCaixa;
  dxComponentPrinter1.CurrentLink.Component := gridDetalhamentoRecebimentos;
  dxComponentPrinter1Link1.Preview();
end;

procedure TfrmRelatorioCaixa.OpenOrCloseDatasetsReportA4(AOpen: Boolean);
begin
  dm_relatorios.qryProdutosVendidosCaixa.Active := AOpen;
  dm_relatorios.qryProdutosVendidosCaixa.Active := AOpen;
  dm_relatorios.qryEstornosCaixa.Active := AOpen;
  dm_relatorios.qryTransferenciasProdutos.Active := AOpen;
  dm_relatorios.qryTransferenciasMesa.Active := AOpen;
  dm_relatorios.qryEstornosMesa.Active := AOpen;
  dm_relatorios.qryVendas.Active := AOpen;
  dm_relatorios.qrySangrias.Active := AOpen;

end;

procedure TfrmRelatorioCaixa.FiltrarProdutosVendidosCaixa(ACodempresa: string; ACodigoCaixa: string; ADataCaixa: TDate);
var
  LSQL: TStringlist;
begin

  LSQL := TStringList.Create;
  try
    try
      dm_relatorios.qryProdutosVendidosCaixa.active := false;
    // Seleção de Produtos vendidos

      LSQL.clear;
      LSQL.add(' select                                                                                               ');
      LSQL.add('    p.cod_barras, p.descricao,trim(rg.cod_grupo_raiz) as cod_g_raiz,                                  ');
      LSQL.add('    trim(rg.desc_grupo_raiz) as desc_g_raiz,                                                          ');
      LSQL.add('    trim(rg.cod_grupo_pai) as cod_g_pai,                                                              ');
      LSQL.add('    trim(rg.desc_grupo_pai) as desc_g_pai,                                                            ');
      LSQL.add('    trim(rg.cod_grupo_pai) as cod_grupo,                                                              ');
      LSQL.add('    trim(rg.descricao)                                                                                ');
      LSQL.add('      as desc_grupo,avg(mv.valor_unitario) as valor_unitario,                                                                ');
      LSQL.add('    udf_roundabnt(sum(mv.quantidade),2) as quantidade_real,                                           ');
      LSQL.add('    udf_roundabnt(sum(mv.quantidade * mv.valor_unitario),2) as subtotal,                              ');
      LSQL.add('    udf_roundabnt(sum(mv.desconto),2) as descontos,                                                   ');
      LSQL.add('    udf_roundabnt(sum((mv.quantidade * mv.valor_unitario) - MV.desconto),2) as TOTAL                  ');
      LSQL.add('   from movimento_venda mv                                                                            ');
      LSQL.add('     inner join produtos p on (p.cod_produto = mv.cod_produto)                                        ');
      LSQL.add('     inner join r_grupos rg on (rg.cod_grupo = p.cod_grupo)                                           ');
      LSQL.Add('    where mv.cod_empresa=:ACodEmpresa                                                   ');
      LSQL.Add('      and mv.cod_caixa =:ACodCaixa                                                      ');
      LSQL.add('   group by  rg.cod_grupo_raiz, rg.desdobramento_pai, rg.desdobramento_filho,1,2,3,4,5,6,7,8        ');
      LSQL.add('   order by rg.cod_grupo_raiz, rg.desdobramento_pai, rg.desdobramento_filho                           ');
      LSQL.Text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodigoCaixa), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodempresa), [rfReplaceAll]);
      dm.adicionaLog(LSQL.text);
      dm_relatorios.qryProdutosVendidosCaixa.SQL.Text := LSQL.text;
      dm_relatorios.qryProdutosVendidosCaixa.active := true;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmRelatorioCaixa.FiltrarEstornosDeProdutos(ACodempresa: string; ACodigoCaixa: string; ADataCaixa: TDate);
var
  LSQL: TStringlist;
begin

  LSQL := TStringList.Create;
  try
    try
      dm_relatorios.qryEstornosCaixa.active := false;
      LSQL.clear;
      LSQL.Add(' select  es.*, (es.valor_unitario * es.quantidade) as total ');
      LSQL.Add('    from estornos es');
      LSQL.Add('  where es.cod_empresa=:ACodEmpresa');
      LSQL.Add('  and es.cod_caixa=:ACodCaixa');
      LSQL.Text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodigoCaixa), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodempresa), [rfReplaceAll]);
      dm.adicionaLog(LSQL.text);
      dm_relatorios.qryEstornosCaixa.SQL.Text := LSQL.text;
      dm_relatorios.qryEstornosCaixa.active := true;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmRelatorioCaixa.FiltrarEstornosDeMesas(ACodempresa: string; ACodigoCaixa: string; ADataCaixa: TDate);
var
  LSQL: TStringlist;
begin

  LSQL := TStringList.Create;
  try
    try
      dm_relatorios.qryEstornosMesa.active := false;
      LSQL.clear;
      LSQL.Add('select em.* from estornos_mesa em ');
      LSQL.Add('  where em.cod_empresa=:ACodEmpresa');
      LSQL.Add('    and em.cod_caixa=:ACodCaixa');
      LSQL.Text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodigoCaixa), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodempresa), [rfReplaceAll]);
      dm.adicionaLog(LSQL.text);
      dm_relatorios.qryEstornosMesa.sql.text := LSQL.Text;
      dm_relatorios.qryEstornosMesa.Active := true;

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmRelatorioCaixa.FiltrarTransferenciaDeProdutos(ACodempresa: string; ACodigoCaixa: string; ADataCaixa: TDate);
var
  LSQL: TStringlist;
begin

  LSQL := TStringList.Create;
  try
    try
      dm_relatorios.qryTransferenciasProdutos.active := false;
      LSQL.clear;
      LSQL.Add('select  tf.*, (tf.valor_unitario * tf.quantidade) as total ');
      LSQL.Add('  from  transferencias_produto tf');
      LSQL.Add('  where tf.cod_empresa=:ACodEmpresa');
      LSQL.Add('    and tf.cod_caixa=:ACodCaixa');
      LSQL.Text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodigoCaixa), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodempresa), [rfReplaceAll]);
      dm.adicionaLog(LSQL.text);
      dm_relatorios.qryTransferenciasProdutos.SQL.Text := LSQL.text;
      dm_relatorios.qryTransferenciasProdutos.Active := true;

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmRelatorioCaixa.FiltrarTransferenciasDeMesa(ACodempresa: string; ACodigoCaixa: string; ADataCaixa: TDate);
var
  LSQL: TStringlist;
begin

  LSQL := TStringList.Create;
  try
    try
      dm_relatorios.qryTransferenciasMesa.active := false;
      LSQL.clear;
      LSQL.Add('select tm.* from transferencias_mesa tm ');
      LSQL.Add('  where tm.cod_empresa=:ACodEmpresa');
      LSQL.Add('    and tm.cod_caixa=:ACodCaixa');
      LSQL.Text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodigoCaixa), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodempresa), [rfReplaceAll]);
      dm.adicionaLog(LSQL.text);
      dm_relatorios.qryTransferenciasMesa.SQL.text := LSQL.Text;
      dm_relatorios.qryTransferenciasMesa.active := true;

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmRelatorioCaixa.FiltrarSangriasCaixa(ACodempresa: string; ACodigoCaixa: string; ADataCaixa: TDate);
var
  LSQL: TStringlist;
begin

  LSQL := TStringList.Create;
  try
    try
      dm_relatorios.qrySangrias.Active := false;
      LSQL.clear;
      LSQL.Add('select s.codigo,s.data,tp.descricao,s.valor, s.codigo_tipo, s.obs, s.cod_caixa,s.cod_usuario_autorizou,s.nome_usuario_autorizou');
      LSQL.Add('   from sangrias s ');
      LSQL.Add(' inner join tipos_sangria tp on (tp.codigo = s.codigo_tipo)');
      LSQL.Add('     where s.cod_empresa=:ACodEmpresa');
      LSQL.Add('    and s.cod_caixa=:ACodCaixa');
      LSQL.Text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodigoCaixa), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodempresa), [rfReplaceAll]);
      dm.adicionaLog(LSQL.text);
      dm_relatorios.qrySangrias.SQL.text := LSQL.Text;
      dm_relatorios.qrySangrias.Active := True;

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmRelatorioCaixa.FiltrarVendasDoCAixa(ACodempresa: string; ACodigoCaixa: string; ADataCaixa: TDate);
var
  LSQL: TStringlist;
begin

  LSQL := TStringList.Create;
  try
    try
      dm_relatorios.qryVendas.active := false;
      LSQL.clear;
      LSQL.Add(' select v.cod_venda as codigoVenda,v.* from vendas v');
      LSQL.Add('  where v.cod_empresa=:ACodEmpresa');
      LSQL.Add('    and v.cod_caixa=:ACodCaixa');
      LSQL.Add(' order by  v.cod_venda');
      LSQL.Text := StringReplace(LSQL.Text, ':ACodCaixa', Quotedstr(ACodigoCaixa), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':ACodEmpresa', Quotedstr(ACodempresa), [rfReplaceAll]);
      dm.adicionaLog(LSQL.text);
      dm_relatorios.qryVendas.SQL.text := LSQL.Text;
      dm_relatorios.qryVendas.active := true;

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmRelatorioCaixa.emitirRelatorioModeloAntigo(ACodempresa: string; ACodigoCaixa: string; ADataCaixa: TDate);
var
  LSQL: TStringlist;
begin
  inherited;

  LSQL := TStringList.Create;

  try
    try


                   {




    // Seleção de Estornos





  // Seleção de Transferências de Produtos


  // Transferências de Mesa


  //Estornos de Mesa

  //Vendas



    //Sangrias






  //Seleção dos Recebimentos

  {
  dm_relatorios.qryResumoCaixa.Active := false;
  dm_relatorios.qryResumoCaixa.sql.clear;
  dm_relatorios.qryResumoCaixa.sql.add('  select ap.cod_forma,fp.descricao,  sum(ap.total_sistema) as TotalSistema ,sum(ap.total_operador) as TotalOperador,');
  dm_relatorios.qryResumoCaixa.sql.add('  sum(ap.total_suprimentos) as TotalEntradas,sum(ap.total_sangrias) as TotalSangrias,');
  dm_relatorios.qryResumoCaixa.sql.add('       sum(ap.diferenca) as TotalDiferenca, cx.data_sistema ');
  dm_relatorios.qryResumoCaixa.sql.add('   from apuracao_caixa ap');
  dm_relatorios.qryResumoCaixa.sql.add('   inner join caixas cx on (cx.codigo = ap.cod_caixa)');
  dm_relatorios.qryResumoCaixa.sql.add('   inner join formas_pagamento fp on (fp.cod_forma = ap.cod_forma)');
  dm_relatorios.qryResumoCaixa.sql.add('   where cx.data_sistema=' + Quotedstr(FormatDateTime('DD.MM.YYY', StrToDate(edData.Text))) + ' ');

  dm_relatorios.qryResumoChurrascaria.Active := false;
  dm_relatorios.qryResumoChurrascaria.sql.clear;

  dm_relatorios.qryTransferenciasMesa.SQL.add('   and tm.cod_caixa=' + Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value));
  dm_relatorios.qryEstornosMesa.SQL.add('   and em.cod_caixa=' + Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value));
  dm_relatorios.qrySangrias.SQL.add(' and s.cod_caixa=' + Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value));
  dm_relatorios.qryResumoCaixa.sql.add('  and cx.codigo=' + Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value));

//  dm_relatorios.qryResumoChurrascaria.sql.add('select * from  medias_caixa(' + Quotedstr(FormatDateTime('DD.MM.YYY', StrToDate(edData.Text))) + ',' + Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value) + ')');

  dm_relatorios.setNomeOperador(dRelatorios.qryCaixas.fieldbyname('nome_usuario').value);
  dm_relatorios.setNumeroCaixa(dRelatorios.qryCaixas.fieldbyname('codigo').value);

  {
  case gpOrdemDetalhamento.ItemIndex of
    0:
      begin
        dm_relatorios.qryVendas.SQL.add(' order by  v.mesa');
      end;
    1:
      begin

      end;
  end;

  dm_relatorios.qryIndicadoresCaixa.Active := false;
  dm_relatorios.qryIndicadoresCaixa.SQL.Clear;

  case rdRelatorioCaixa.ItemIndex of
    0:
      begin
        dm_relatorios.qryIndicadoresCaixa.sql.Add('select * from resumo_caixa(' + Quotedstr(FormatDateTime('DD.MM.YYY', StrToDate(edData.Text))) + ',' + QuotedStr('') + ')');
      end;
    1:
      begin
        dm_relatorios.qryIndicadoresCaixa.sql.add('select * from  resumo_caixa(' + Quotedstr(FormatDateTime('DD.MM.YYY', StrToDate(edData.Text))) + ',' + Quotedstr(dRelatorios.qryCaixas.fieldbyname('codigo').value) + ')');
      end;
  end;

  dm_relatorios.qryIndicadoresCaixa.Active := true;



  dm_relatorios.qryResumoCaixa.sql.add('   group by ap.cod_forma,fp.descricao,  cx.data_sistema');
  dm_relatorios.qryResumoCaixa.sql.add('   order by ap.cod_forma');

   }


      dm_relatorios.dtRelatorioMargemProdutos.DataSet := dm_relatorios.qryProdutosVendidosCaixa;
      dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\RelProdutosVendidosCaixa.fr3', true);
      dm_relatorios.setPeriodoRelatorio('Data: ' + FormatDateTime('DD/MM/YYY', ADataCaixa));

      OpenOrCloseDatasetsReportA4(true);

      dm_relatorios.qryProdutosVendidosCaixa.Close;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;

  finally
    OpenOrCloseDatasetsReportA4(false);
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmRelatorioCaixa.I2Click(Sender: TObject);
begin
  inherited;
  ImprimirRelatorio(RelProdutosVendidos);
end;

procedure TfrmRelatorioCaixa.I70003008Click(Sender: TObject);
begin
  inherited;
  GBookMark := dmAuditoriaCaixas.QryListagemCaixas.GetBookmark;

  if dmAuditoriaCaixas.QryListagemCaixas.FieldByName('auditado').Value = 1 then
  begin

    if dm.verificaPermissaoAcao('I70003008', true, true) = false then
      exit
    else
    begin

      LCodEmpresa := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('cod_empresa').Value;
      LCodCaixa := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('codigo').Value;

      if (ShowRealDialog(Self, tmConfirmacaoPorPIN, 'Atenção', 'Tem certeza que deseja cancelar a auditoria já realizada ?', 22, true) = teSim) then
      begin
        dmAuditoriaCaixas.ReabrirAuditoriaCaixa(LCodEmpresa, LCodCaixa);
        ShowRealDialog(self, tmSucesso, 'Feito!', 'Auditoria cancelada com sucesso!');
        btExibirCaixas.Click;
        dmAuditoriaCaixas.QryListagemCaixas.GotoBookmark(GBookMark);
      end;
    end;
  end
  else
  begin
    ShowRealDialog(self, tmAviso, 'Caixa não auditado', 'Este caixa ainda não foi auditado!');
  end;
end;

procedure TfrmRelatorioCaixa.ImprimirRelatorio(ARelatorio: TTipoRelatorioCaixa);
var
  LNomeArquivoRelatorio: string;
begin
  inherited;
  LErrorMessage := TStringList.Create;

  try
    try
      LCodEmpresa := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('cod_empresa').Value;
      LCodCaixa := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('codigo').Value;
      LDataCaixa := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('data_sistema').Value;
      LNomeOperador := dmAuditoriaCaixas.QryListagemCaixas.FieldByName('nome_usuario').Value;
      emitirRelatorioModeloAntigo(LCodEmpresa, LCodCaixa, LDataCaixa);

//   TTipoRelatorioCaixa = (RelProdutosVendidos, RelVendas, RelSangrias, RelEstornosProdutos, RelEstornosMesa, RelTransferencias, RelTransferenciasMesa);
      case ARelatorio of
        RelProdutosVendidos:
          begin
            FiltrarProdutosVendidosCaixa(LCodEmpresa, LCodCaixa, LDataCaixa);
            LNomeArquivoRelatorio := 'RelProdutosVendidosCaixa.fr3';
          end;
        RelEstornosProdutos:
          begin
            FiltrarEstornosDeProdutos(LCodEmpresa, LCodCaixa, LDataCaixa);
            LNomeArquivoRelatorio := 'RelEstornosProdutos.fr3';
          end;

        RelEstornosMesa:
          begin
            FiltrarEstornosDeMesas(LCodEmpresa, LCodCaixa, LDataCaixa);
            LNomeArquivoRelatorio := 'RelEstornosMesas.fr3';
          end;

        RelTransferenciasProdutos:
          begin
            FiltrarTransferenciaDeProdutos(LCodEmpresa, LCodCaixa, LDataCaixa);
            LNomeArquivoRelatorio := 'RelTransferenciasProdutos.fr3';
          end;

        RelTransferenciasMesa:
          begin
            FiltrarTransferenciasDeMesa(LCodEmpresa, LCodCaixa, LDataCaixa);
            LNomeArquivoRelatorio := 'RelTransferenciaMesas.fr3';
          end;

        RelSangrias:
          begin
            FiltrarSangriasCaixa(LCodEmpresa, LCodCaixa, LDataCaixa);
            LNomeArquivoRelatorio := 'RelSangriasCaixa.fr3';
          end;
        RelVendas:
          begin
            FiltrarVendasDoCAixa(LCodEmpresa, LCodCaixa, LDataCaixa);
            LNomeArquivoRelatorio := 'RelVendasCaixas.fr3';
          end;
      end;

      dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\' + LNomeArquivoRelatorio, true);
      dm_relatorios.setPeriodoRelatorio('Data: ' + FormatDateTime('DD/MM/YYY', LDataCaixa));
      dm_relatorios.setNomeOperador(LNomeOperador);
      dm_relatorios.setNumeroCaixa(LCodCaixa);
      dm_relatorios.rpt.ShowReport(true);

    except
      on E: Exception do
      begin
        LErrorMessage.add('Erro ao gerar relatório!');
        LErrorMessage.add(sLineBreak + 'Erro: ' + E.Message);
        ShowRealDialog(self, tmErro, 'Erro', LErrorMessage.text);
      end;

    end;

  finally
    FreeAndNil(LErrorMessage);
    OpenOrCloseDatasetsReportA4(false);
  end;
end;

procedure TfrmRelatorioCaixa.S1Click(Sender: TObject);
begin
  inherited;
  ImprimirRelatorio(RelSangrias);
end;

procedure TfrmRelatorioCaixa.T1Click(Sender: TObject);
begin
  inherited;
  ImprimirRelatorio(RelTransferenciasProdutos);
end;

procedure TfrmRelatorioCaixa.T2Click(Sender: TObject);
begin
  inherited;
  ImprimirRelatorio(RelTransferenciasMesa);
end;

procedure TfrmRelatorioCaixa.V1Click(Sender: TObject);
begin
  inherited;
  ImprimirRelatorio(RelVendas);
end;

end.

