unit uuControleContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, db,
  System.DateUtils, RealFramework, Dialogs, uu_modelo_Vazio,
  StdCtrls, Buttons, Mask, ExtCtrls, Menus, RxCurrEdit,
  RxToolEdit, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, Vcl.ComCtrls, AdvDateTimePicker, JvPageList, JvExControls,
  cxGraphics, cxStyles, cxClasses, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxCurrencyEdit, cxCustomData, cxFilter, cxData, dxDateRanges,
  dxScrollbarAnnotations, cxImageList, System.ImageList, Vcl.ImgList;

type
  TfrmControleContasAPagar = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    Panel8: TPanel;
    PopupMenu1: TPopupMenu;
    Alterardados1: TMenuItem;
    BaixarttuloPagar1: TMenuItem;
    ImageList1: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    Excluirttulo1: TMenuItem;
    Label13: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    stlRegistro: TcxStyle;
    stConfirmada: TcxStyle;
    stCancelada: TcxStyle;
    stCiencia: TcxStyle;
    stSemManifesto: TcxStyle;
    stNaoRealizada: TcxStyle;
    cxImageList1: TcxImageList;
    pnPesquisa: TPanel;
    pnGridPesquisa: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DESCRICAO_EMPRESA: TcxGridDBColumn;
    cxGrid1DBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    cxGrid1DBTableView1DOCUMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1PARCELA: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR: TcxGridDBColumn;
    cxGrid1DBTableView1ORIGEM: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_COMPETENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_PAGAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1OBS: TcxGridDBColumn;
    cxGrid1DBTableView1STATUS: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    pgMenuFechado: TJvPageList;
    pgMenuAberto: TJvStandardPage;
    JvStandardPage2: TJvStandardPage;
    Panel3: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    ed_parametro: TEdit;
    RadioGroup1: TRadioGroup;
    btPesquisar: TBitBtn;
    btImprimir: TBitBtn;
    rdFiltroData: TRadioGroup;
    edNumeroNota: TEdit;
    BitBtn1: TBitBtn;
    edValorNota: TCurrencyEdit;
    GroupBox1: TGroupBox;
    Panel7: TPanel;
    rdMesAtual: TRadioButton;
    rdAnoAtual: TRadioButton;
    rdEscolherPeriodo: TRadioButton;
    rdMesSelecionado: TRadioButton;
    pglSelecaoDatas: TJvPageList;
    pgSelecaoPeriodo: TJvStandardPage;
    Label2: TLabel;
    Label6: TLabel;
    edDataInicial: TAdvDateTimePicker;
    edDataFinal: TAdvDateTimePicker;
    pgSelecaoMes: TJvStandardPage;
    Label21: TLabel;
    Label8: TLabel;
    cbMes: TComboBox;
    cbAno: TComboBox;
    pgSelecaoDatasNaoExibir: TJvStandardPage;
    pgNaoExibir: TJvStandardPage;
    rdMesAnterior: TRadioButton;
    pglistPrincipal: TJvPageList;
    pgPesquisa: TJvStandardPage;
    procedure processarConsulta(relatorio: boolean);
    procedure btImprimirClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BaixarttuloPagar1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Alterardados1Click(Sender: TObject);
    procedure Excluirttulo1Click(Sender: TObject);
    procedure edNumeroNotaExit(Sender: TObject);
    procedure EstornarTitulo();
    procedure rdMesAtualClick(Sender: TObject);
    procedure cbMesSelect(Sender: TObject);
    procedure cbAnoSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure ConfiguraSQLConsulta(ASQL: TStringList);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControleContasAPagar: TfrmControleContasAPagar;

implementation

uses
  uu_data_module, uu_frm_principal, UU_DM_RELATORIOS, uuBaixaTitulosContasApagar,
  uuLancamentoContasAPagar, uuDmContasAPagar;

{$R *.dfm}

procedure TfrmControleContasAPagar.processarConsulta(relatorio: boolean);
begin
  if (trim(edNumeroNota.Text) <> '') then
  begin

    try
      edNumeroNota.Text := FormatFloat('000000000000000', StrToFloat(edNumeroNota.Text));
    except
      begin
        showmessage('Número da nota fiscal inválido!');
        edNumeroNota.SetFocus;
        exit;
      end;
    end;
  end;

  dmContasAPagar.QryContasAPagar.Active := false;
  dmContasAPagar.QryContasAPagar.SQL.clear;
  dmContasAPagar.QryContasAPagar.SQL.add('   select rc.*,en.data_emissao,lr.data_rd,lr.data_documento, lr.observacoes, f.nome_fantasia, pc.* from r_contas_a_pagar rc ');
  dmContasAPagar.QryContasAPagar.SQL.add('   inner join fornecedor f on (f.cod_fornecedor = rc.cod_fornecedor) ');
  dmContasAPagar.QryContasAPagar.SQL.add('   inner join v_plano_contas_financeiro pc on (pc.cod_conta = rc.cod_conta) ');
  dmContasAPagar.QryContasAPagar.SQL.add('   left join entradas en on (en.cod_entrada = rc.codigo_entrada) ');
  dmContasAPagar.QryContasAPagar.SQL.add('        left join lancamentos_rd lr on (lr.cod_ct_pagar = rc.codigo) ');
  dmContasAPagar.QryContasAPagar.SQL.Add(' where  1=1 ');

  if (trim(edNumeroNota.text) <> '') then
  begin
    dmContasAPagar.QryContasAPagar.sql.add(' and rc.numero_nota_fiscal=' + Quotedstr(edNumeroNota.text));
  end;

  if (edValorNota.Value <> 0) then
  begin
    dmContasAPagar.QryContasAPagar.sql.add(' and rc.valorconta=' + dm.TrocaVirgPPto(dm.removePonto(FloatToStr(edValorNota.Value))));
  end;

  case rdFiltroData.ItemIndex of
    0:
      begin
        dmContasAPagar.QryContasAPagar.sql.add(' and rc.data_vencimento between ' + Quotedstr(FormatDateTime('DD.MM.YYYY', edDataInicial.Date)));
        dmContasAPagar.QryContasAPagar.sql.add(' and ' + Quotedstr(FormatDateTime('DD.MM.YYYY', edDataFinal.date)));
      end;

    1:
      begin
        dmContasAPagar.QryContasAPagar.sql.add(' and rc.datapagamento between ' + Quotedstr(FormatDateTime('DD.MM.YYYY', edDataInicial.Date)));
        dmContasAPagar.QryContasAPagar.sql.add(' and ' + Quotedstr(FormatDateTime('DD.MM.YYYY', edDataFinal.date)));
      end;

    2:
      begin
        dmContasAPagar.QryContasAPagar.sql.add(' and rc.data_entrada between ' + Quotedstr(FormatDateTime('DD.MM.YYYY', edDataInicial.Date)));
        dmContasAPagar.QryContasAPagar.sql.add(' and ' + Quotedstr(FormatDateTime('DD.MM.YYYY', edDataFinal.date)));
      end;

    3:
      begin
        dmContasAPagar.QryContasAPagar.sql.add(' and lr.data_rd between ' + Quotedstr(FormatDateTime('DD.MM.YYYY', edDataInicial.Date)));
        dmContasAPagar.QryContasAPagar.sql.add(' and ' + Quotedstr(FormatDateTime('DD.MM.YYYY', edDataFinal.date)));
      end;

    4:
      begin
        dmContasAPagar.QryContasAPagar.sql.add(' and lr.data_documento between ' + Quotedstr(FormatDateTime('DD.MM.YYYY', edDataInicial.Date)));
        dmContasAPagar.QryContasAPagar.sql.add(' and ' + Quotedstr(FormatDateTime('DD.MM.YYYY', edDataFinal.date)));
      end;

  end;

  if relatorio = false then
    dmContasAPagar.QryContasAPagar.SQL.add('order by rc.status,rc.data_vencimento')
  else
    dmContasAPagar.QryContasAPagar.SQL.add('order by pc.contaraiz,pc.contapai,pc.cod_conta, rc.data_vencimento ');


//  frm_principal.memo_avisos.Lines := dmContasAPagar.QryContasAPagar.SQL;
  dmContasAPagar.QryContasAPagar.Active := true;
  dm.adicionalog(dmContasAPagar.QryContasAPagar.SQL.Text);
  TFloatField(dmContasAPagar.QryContasAPagar.Fields[10]).DisplayFormat := 'R$ ###,###,##0.00';
  TFloatField(dmContasAPagar.QryContasAPagar.Fields[11]).DisplayFormat := 'R$ ###,###,##0.00';
  TFloatField(dmContasAPagar.QryContasAPagar.Fields[12]).DisplayFormat := 'R$ ###,###,##0.00';
  TFloatField(dmContasAPagar.QryContasAPagar.Fields[13]).DisplayFormat := 'R$ ###,###,##0.00';
  TFloatField(dmContasAPagar.QryContasAPagar.Fields[14]).DisplayFormat := 'R$ ###,###,##0.00';
  TFloatField(dmContasAPagar.QryContasAPagar.Fields[15]).DisplayFormat := 'R$ ###,###,##0.00';

  if dmContasAPagar.QryContasAPagar.IsEmpty then
  begin
    btImprimir.Enabled := false;
//     Showmessage('Sem resultados para os filtros aplicados!');
  end
  else
  begin
    btImprimir.Enabled := true;
  end;
end;

procedure TfrmControleContasAPagar.rdMesAtualClick(Sender: TObject);
begin
  inherited;
  configuraOpcoesData((Sender as TRadioButton), edDataInicial, edDataFinal, cbMes, cbAno);
  btPesquisar.Click;

end;

procedure TfrmControleContasAPagar.btImprimirClick(Sender: TObject);
begin
  inherited;
  processarConsulta(true);
  if ((dmContasAPagar.QryContasAPagar.Active = true) and (dmContasAPagar.QryContasAPagar.IsEmpty = false)) then
  begin

    dm_relatorios.qryContasApagar.Active := false;
    dm_relatorios.qryContasApagar.SQL.clear;
    dm_relatorios.qryContasApagar.SQL := dmContasAPagar.QryContasAPagar.SQL;
    dm_relatorios.qryContasApagar.Active := true;

    dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\RelContasApagar.fr3', true);
    dm_relatorios.rpt.ShowReport(true);
    dm_relatorios.qryPlanoContas.Active := false;
  end;

end;

procedure TfrmControleContasAPagar.ConfiguraSQLConsulta(ASQL: TStringList);
var
  LFiltroData: string;
begin

  try

    case rdFiltroData.ItemIndex of
      0:
        LFiltroData := 'data_vencimento';
      1:
        LFiltroData := 'data_competencia';

      2:
        LFiltroData := 'data_lancamento';
      3:
        LFiltroData := 'data_pagamento';
    end;

    ASQL.add(' select cp.codigo, cp.cod_emp_grupo as codEmpresa, p.descricao_empresa,                             ');
    ASQL.add(' cp.origem, cp.cod_fornecedor,f.razao_social,coalesce(cp.cod_conta,' + Quotedstr('----') + ') as cod_conta, documento, ');
    ASQL.add(' coalesce(pf.descricao,' + Quotedstr('------') + ') as descricao_conta,                                             ');
    ASQL.add(' cp.parcela, cp.valor, cp.data_vencimento, cp.data_pagamento, cp.data_competencia,                  ');
    ASQL.add(' cp.obs, cp.cod_entrada, cp.status                                                                  ');
    ASQL.add('  from                                                                                              ');
    ASQL.add('(                                                                                                   ');
    ASQL.add('                                                                                                    ');
    ASQL.add('  with cp_entradas as                                                                               ');
    ASQL.add('   (                                                                                                ');
    ASQL.add('   select cp.codigo,                                                                                ');
    ASQL.add('		  cp.cod_emp_grupo,                                                                           ');
    ASQL.add('		  ' + Quotedstr('Compras') + ' as origem,                                                                        ');
    ASQL.add('		  cp.cod_fornecedor,                                                                          ');
    ASQL.add('		  null as cod_conta,                                                                          ');
    ASQL.add('		  cast(cp.numero_nota_fiscal as bigint) as documento,                                         ');
    ASQL.add('		  cp.parcela,                                                                                 ');
    ASQL.add('		  cp.valor,                                                                                   ');
    ASQL.add('		  cp.data_lancamento,                                                                         ');
    ASQL.add('		  cp.data_vencimento,                                                                         ');
    ASQL.add('		  cp.data_pagamento,                                                                          ');
    ASQL.add('		  cp.data_competencia,                                                                        ');
    ASQL.add('		  cp.descricao_conta||' + Quotedstr(' ') + '||cp.obs  as obs,                                                    ');
    ASQL.add('		  cp.cod_entrada,                                                                             ');
    ASQL.add('		  cp.status                                                                                   ');
    ASQL.add('		  from                                                                                        ');
    ASQL.add('			contas_a_pagar cp                                                                         ');
    ASQL.add('		   where                                                                                      ');
    ASQL.add('			  cp.cod_entrada is not null                                                              ');
    ASQL.add('			  and cp.#filtroData                                                                      ');
    ASQL.add('				between :LDataInicial and :LDataFinal                                                 ');
    ASQL.add('  ),                                                                                                ');
    ASQL.add('  cp_outras as                                                                                      ');
    ASQL.add(' (                                                                                                  ');
    ASQL.add('   select cp.codigo,                                                                                ');
    ASQL.add('		  cp.cod_emp_grupo,                                                                           ');
    ASQL.add('		  ' + Quotedstr('Financeiro') + ' as origem,                                                                     ');
    ASQL.add('		  cp.cod_fornecedor,                                                                          ');
    ASQL.add('		  cp.cod_conta as cod_conta,                                                                  ');
    ASQL.add('		  cast(cp.numero_nota_fiscal as bigint) as documento,                                         ');
    ASQL.add('		  cp.parcela,                                                                                 ');
    ASQL.add('		  cp.valor,                                                                                   ');
    ASQL.add('		  cp.data_lancamento,                                                                         ');
    ASQL.add('		  cp.data_vencimento,                                                                         ');
    ASQL.add('		  cp.data_pagamento,                                                                          ');
    ASQL.add('		  cp.data_competencia,                                                                        ');
    ASQL.add('		  cp.descricao_conta||' + Quotedstr(' ') + '||cp.obs  as obs,                                                    ');
    ASQL.add('		  cp.cod_entrada,                                                                             ');
    ASQL.add('		  cp.status                                                                                   ');
    ASQL.add('		  from                                                                                        ');
    ASQL.add('			contas_a_pagar cp                                                                         ');
    ASQL.add('		   where                                                                                      ');
    ASQL.add('			  cp.cod_entrada is null                                                                  ');
    ASQL.add('			  and cp.#filtroData                                                                      ');
    ASQL.add('				between :LDataInicial and :LDataFinal                                                 ');
    ASQL.add('  )                                                                                                 ');
    ASQL.add('                                                                                                    ');
    ASQL.add('   select * from cp_entradas                                                                        ');
    ASQL.add('	 union all                                                                                        ');
    ASQL.add('   select * from cp_outras                                                                          ');
    ASQL.add('                                                                                                    ');
    ASQL.add(') cp                                                                                                ');
    ASQL.add(' left join plano_contas_financeiro pf                                                               ');
    ASQL.add('  on (pf.cod_conta = cp.cod_conta)                                                                  ');
    ASQL.add(' inner join fornecedor f                                                                            ');
    ASQL.add('  on (f.cod_fornecedor = cp.cod_fornecedor)                                                         ');
    ASQL.add(' inner join parametros p                                                                            ');
    ASQL.add('  on (p.cod_empresa = cp.cod_emp_grupo)                                                             ');
    ASQL.add('  order by cp.#filtroData, cp.codigo                                                                                 ');
    ASQL.Text := StringReplace(ASQL.text, '#filtroData', LFiltroData, [rfReplaceAll]);
    ASQL.Text := StringReplace(ASQL.text, ':LDataInicial', Quotedstr(FormatDateTime('DD.MM.YYYY', edDataInicial.Date)), [rfReplaceAll]);
    ASQL.Text := StringReplace(ASQL.text, ':LDataFinal', Quotedstr(FormatDateTime('DD.MM.YYYY', edDataFinal.Date)), [rfReplaceAll]);

  finally

  end;
end;

procedure TfrmControleContasAPagar.btPesquisarClick(Sender: TObject);
var
  LSQL: Tstringlist;
begin
  inherited;

  LSQL := TStringList.Create;
  try
    ConfiguraSQLConsulta(LSQL);
    dm.adicionaLog(LSQL.Text);
    dmContasAPagar.QryContasAPagar.active := false;
    dmContasAPagar.QryContasAPagar.sql.clear;
    dmContasAPagar.QryContasAPagar.sql.add(LSQL.text);
    DmContasAPagar.QryContasAPagar.active := true;

  finally
    FreeAndNil(LSQL);
  end;

  //  btImprimir.Enabled := false;
//  processarConsulta(false);

end;

procedure TfrmControleContasAPagar.cbAnoSelect(Sender: TObject);
begin
  inherited;
  configuraDataSelecaoPorMes(cbMes, cbAno, edDataInicial, edDataFinal);
end;

procedure TfrmControleContasAPagar.cbMesSelect(Sender: TObject);
begin
  inherited;
  configuraDataSelecaoPorMes(cbMes, cbAno, edDataInicial, edDataFinal);
end;

procedure TfrmControleContasAPagar.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmControleContasAPagar.BaixarttuloPagar1Click(Sender: TObject);
begin
  inherited;

  if dm.verificaPermissaoAcao('I80001005', true, true) = true then
  begin
    if (dmContasAPagar.QryContasAPagar.IsEmpty = false) then
    begin
      if (getStatusContaApagar(dmContasAPagar.QryContasAPagar.fieldbyname('codigo').Value) <> 0) then
      begin
        showmessage('Não é possível realizar pagamento de um título que já foi pago ou cancelado!');
        exit;
      end
      else
      begin
        Application.CreateForm(TfrmBaixaTituloContasApagar, frmBaixaTituloContasApagar);
        frmBaixaTituloContasApagar.edNumeroTitulo.Text := dmContasAPagar.QryContasAPagar.fieldbyname('codigo').value;
        frmBaixaTituloContasApagar.showmodal;
        frmBaixaTituloContasApagar.Free;
      end;
    end;
  end;

end;

procedure TfrmControleContasAPagar.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInicial.Date := StartOfTheMonth(now);
  edDataFinal.Date := Today;
  carregaComboAnos(cbAno);
  carregaComboMeses(cbMes);
  configuraOpcoesData(rdMesAtual, edDataInicial, edDataFinal, cbMes, cbAno);
  btPesquisar.Click;
end;

procedure TfrmControleContasAPagar.FormCreate(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdmContasAPagar, dmContasAPagar);
end;

procedure TfrmControleContasAPagar.FormDestroy(Sender: TObject);
begin
  inherited;
  dmContasAPagar.QryContasAPagar.active := false;
  FreeAndNil(dmContasAPagar);
end;

procedure TfrmControleContasAPagar.Alterardados1Click(Sender: TObject);
begin
  inherited;

  if dm.verificaPermissaoAcao('I80001002', true, true) = true then
  begin
    if (dmContasAPagar.QryContasAPagar.IsEmpty = false) then
    begin
      if (getStatusContaApagar(dmContasAPagar.QryContasAPagar.fieldbyname('codigo').Value) <> 0) then
      begin
        showmessage('Não é possível alterar dados de um título que já foi pago ou cancelado!');
        exit;
      end
      else
      begin
        Application.CreateForm(TfrmLancamentoContasApagar, frmLancamentoContasApagar);
        frmLancamentoContasApagar.setEvento(2);
        frmLancamentoContasApagar.ed_codigo.Text := dmContasAPagar.QryContasAPagar.fieldbyname('codigo').Value;
        frmLancamentoContasApagar.ShowModal;
        frmLancamentoContasApagar.free;
        btPesquisar.Click;

      end;
    end;
  end;

end;

procedure TfrmControleContasAPagar.Excluirttulo1Click(Sender: TObject);
var
  msg: string;
begin
  inherited;

  if dm.verificaPermissaoAcao('I80001004', true, true) = true then
  begin
    if (dmContasAPagar.QryContasAPagar.IsEmpty = false) then
    begin
      if (getStatusContaApagar(dmContasAPagar.QryContasAPagar.fieldbyname('codigo').Value) <> 0) then
      begin
        showmessage('Não é possível alterar dados de um título que já foi pago ou cancelado!');
        exit;
      end
      else
      begin
        Application.CreateForm(TfrmLancamentoContasApagar, frmLancamentoContasApagar);
        frmLancamentoContasApagar.setEvento(3);
        frmLancamentoContasApagar.ed_codigo.Text := dmContasAPagar.QryContasAPagar.fieldbyname('codigo').Value;
        frmLancamentoContasApagar.ShowModal;
        frmLancamentoContasApagar.free;
        btPesquisar.Click;

      end;
    end;
  end;

end;

procedure TfrmControleContasAPagar.edNumeroNotaExit(Sender: TObject);
begin
  inherited;
  if trim(edNumeroNota.Text) = '' then
    exit;

  try
    edNumeroNota.Text := FormatFloat('000000000000000', StrToFloat(edNumeroNota.Text));
  except
    begin
      showmessage('Número da nota fiscal inválido!');
      edNumeroNota.SetFocus;
      exit;
    end;
  end;

end;

procedure TfrmControleContasAPagar.EstornarTitulo();
var
  msg: string;
  codContaAPagar: string;
  codContaSelecionada: string;
  codLancamentoRDSelecionado: string;
  codNovoLancamentoRD: string;
begin
  inherited;
  codContaSelecionada := dmContasAPagar.QryContasAPagar.fieldbyname('codigo').Value;

  if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Tem certeza que deseja realizar o estorno deste título ?') = teSim) then
  begin

    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.sql.Add('select lr.codigo  from lancamentos_rd lr where lr.cod_ct_pagar=' + Quotedstr(codContaSelecionada));
    dm.qryauxiliar.Active := true;
    codLancamentoRDSelecionado := dm.qryauxiliar.fieldbyname('codigo').Value;

    codContaAPagar := dm.geraCodigo('G_CONTAS_A_PAGAR', 6);
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.sql.add('           insert into contas_a_pagar ( ');
    dm.qryauxiliar.sql.add('      CODIGO,STATUS,VALOR,COD_LANC_CANCELAMENTO, COD_FORNECEDOR,COD_CONTA,DESCRICAO_CONTA,');
    dm.qryauxiliar.sql.add('      DATA_ENTRADA,DATA_VENCIMENTO,MULTA,FLAG_MULTA,');
    dm.qryauxiliar.sql.add('      MORA,FLAG_MORA,DESCONTO, FLAG_DESCONTO,DIAS_ANTES_DESCONTO,');
    dm.qryauxiliar.sql.add('      USUARIO_INCLUSAO, USUARIO_BAIXA, CODIGO_ENTRADA,');
    dm.qryauxiliar.sql.add('      NUMERO_NOTA_FISCAL, COD_PRIMEIRO_TITULO, ATUALIZAR_PARCELA,');
    dm.qryauxiliar.sql.add('      OBS,DATA_PAGAMENTO,VALOR_PAGO,VALOR_PAGO_MULTA,');
    dm.qryauxiliar.sql.add('      VALOR_PAGO_JUROS,VALOR_PAGO_DESCONTO,COD_EMP_GRUPO,');
    dm.qryauxiliar.sql.add('      PARCELA,COD_FORMA_PAGTO,DATA_LANCAMENTO');
    dm.qryauxiliar.sql.add('  )');
    dm.qryauxiliar.sql.add('    select');
    dm.qryauxiliar.sql.add('');
    dm.qryauxiliar.sql.add('      ' + QuotedStr(codContaAPagar) + ',');
    dm.qryauxiliar.sql.add('       2,');
    dm.qryauxiliar.sql.add('      cp.valor * (-1),');
    dm.qryauxiliar.sql.add('      ' + QuotedStr(codContaSelecionada) + ',');
    dm.qryauxiliar.sql.add('      cp.COD_FORNECEDOR,cp.COD_CONTA,cp.DESCRICAO_CONTA,');
    dm.qryauxiliar.sql.add('      cp.DATA_ENTRADA,cp.DATA_VENCIMENTO  ,cp.MULTA,cp.FLAG_MULTA,');
    dm.qryauxiliar.sql.add('      cp.MORA,cp.FLAG_MORA,cp.DESCONTO, cp.FLAG_DESCONTO,cp.DIAS_ANTES_DESCONTO,');
    dm.qryauxiliar.sql.add('      cp.USUARIO_INCLUSAO, cp.USUARIO_BAIXA, cp.CODIGO_ENTRADA,');
    dm.qryauxiliar.sql.add('      cp.NUMERO_NOTA_FISCAL, cp.COD_PRIMEIRO_TITULO, cp.ATUALIZAR_PARCELA,');
    dm.qryauxiliar.sql.add('      cp.OBS,cp.DATA_PAGAMENTO,cp.VALOR_PAGO,cp.VALOR_PAGO_MULTA,');
    dm.qryauxiliar.sql.add('      cp.VALOR_PAGO_JUROS,cp.VALOR_PAGO_DESCONTO,cp.COD_EMP_GRUPO,');
    dm.qryauxiliar.sql.add('      cp.PARCELA,cp.COD_FORMA_PAGTO,cp.DATA_LANCAMENTO');
    dm.qryauxiliar.sql.add('      from contas_a_pagar cp where');
    dm.qryauxiliar.sql.add('        cp.codigo = ' + Quotedstr(codContaSelecionada));
         ////////dm.adicionalog(dm.qryauxiliar.SQL.Text);
    dm.qryauxiliar.ExecSQL;

    codNovoLancamentoRD := dm.geraCodigo('G_LANCAMENTOS_RD', 8);
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.sql.add('        insert into lancamentos_rd (codigo,nome_usuario,status,data_cancelamento,cod_lanc_cancelamento,COD_CT_PAGAR, ');
    dm.qryauxiliar.sql.add('          COD_FORNECEDOR,NUM_DOC,DATA_LANCAMENTO,DATA_DOCUMENTO,');
    dm.qryauxiliar.sql.add('          DATA_RD,OBSERVACOES,');
    dm.qryauxiliar.sql.add('          TOTAL)');
    dm.qryauxiliar.sql.add('             select');
    dm.qryauxiliar.sql.add('          ' + Quotedstr(codNovoLancamentoRD) + ',');
    dm.qryauxiliar.sql.add('          ' + Quotedstr(nome_usuario) + ',');
    dm.qryauxiliar.sql.add('          2,');
    dm.qryauxiliar.sql.add('          current_date,');
    dm.qryauxiliar.sql.add('          ' + Quotedstr(codLancamentoRDSelecionado) + ',');
    dm.qryauxiliar.sql.add('          ' + Quotedstr(codContaAPagar) + ',');
    dm.qryauxiliar.sql.add('          lr.COD_FORNECEDOR,lr.NUM_DOC,lr.DATA_LANCAMENTO,lr.DATA_DOCUMENTO,');
    dm.qryauxiliar.sql.add('          lr.DATA_RD,');
    dm.qryauxiliar.sql.add('          ' + Quotedstr('(ESTORNO LANCTO ' + codLancamentoRDSelecionado + ')') + ',');
    dm.qryauxiliar.sql.add('          (lr.TOTAL * (-1))');
    dm.qryauxiliar.sql.add('              from lancamentos_rd  lr where lr.codigo=' + Quotedstr(codLancamentoRDSelecionado));
         ////////dm.adicionalog(dm.qryauxiliar.SQL.Text);
    dm.qryauxiliar.ExecSQL;

    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.sql.add('       insert into itens_lancamento_rd  (cod_lanc_rd,cod_grupo, valor) ');
    dm.qryauxiliar.sql.add('         select ');
    dm.qryauxiliar.sql.add('              ' + Quotedstr(codNovoLancamentoRD) + ',');
    dm.qryauxiliar.sql.add('          itr.cod_grupo, (itr.valor * (-1) ) ');
    dm.qryauxiliar.sql.add('          from itens_lancamento_rd itr where itr.cod_lanc_rd=' + Quotedstr(codLancamentoRDSelecionado));
         ////////dm.adicionalog(dm.qryauxiliar.SQL.Text);
    dm.qryauxiliar.ExecSQL;

    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.sql.add('update lancamentos_rd lr set lr.status=2 where lr.codigo=' + Quotedstr(codLancamentoRDSelecionado));
    dm.qryauxiliar.ExecSQL;

    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.sql.add('  update contas_a_pagar cp set cp.status=2 where cp.codigo =' + Quotedstr(codContaSelecionada));
    dm.qryauxiliar.ExecSQL;

    dm.qryauxiliar.Active := false;
    if dm.transacao.Active = FALSE then
      dm.transacao.Active := TRUE;
    dm.transacao.Commit;
    dm.transacao.Active := false;
    dm.transacao.Active := true;
    btPesquisar.Click;
  end;
end;

end.

