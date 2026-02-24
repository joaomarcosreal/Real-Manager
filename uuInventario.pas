unit uuInventario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  RealFramework, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, System.Generics.Collections, uu_modelo_Vazio,
  Advglassbutton, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  AdvDateTimePicker, cxGraphics, cxControls, cxDBLookupEdit, cxDBLookupComboBox,
  cxStyles, cxGridLevel, cxClasses, cxGridDBTableView, cxGrid, CurvyControls,
  uuDMInventarios, JvValidateEdit, Vcl.Menus, uu_data_module, uu_frm_principal,
  FireDAC.Comp.Client, uuDmRelatorios, cxLookAndFeels, cxLookAndFeelPainters,
  cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  Vcl.ComCtrls, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, JvExStdCtrls, JvEdit, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, cxCheckBox, cxCustomData, cxFilter, cxData,
  dxDateRanges, dxScrollbarAnnotations, cxLookupEdit;

type
  TfrmInventario = class(Tfrm_modelo_vazio)
    frmCorpo: TPanel;
    frmTopo: TPanel;
    Panel1: TPanel;
    Label8: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    AdvGlassButton1: TAdvGlassButton;
    AdvGlassButton3: TAdvGlassButton;
    Label4: TLabel;
    AdvGlassButton2: TAdvGlassButton;
    edDataInventario: TAdvDateTimePicker;
    cbHistoricoInventario: TcxLookupComboBox;
    edEstoqueApurado: TJvValidateEdit;
    edValorUnitario: TJvValidateEdit;
    Label2: TLabel;
    Label6: TLabel;
    memoObservacoes: TMemo;
    PopupMenu1: TPopupMenu;
    E1: TMenuItem;
    Label12: TLabel;
    ed_cod_item: TEdit;
    bt_pesq_item_estoque_cod: TSpeedButton;
    Panel2: TPanel;
    ed_desc_item: TEdit;
    Label5: TLabel;
    gdProdutosInventarioDBTableView1: TcxGridDBTableView;
    gdProdutosInventarioLevel1: TcxGridLevel;
    gdProdutosInventario: TcxGrid;
    gdProdutosInventarioDBTableView1COD_PRODUTO: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1DESCRICAO: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1QTDE_APURADA: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1AJUSTE: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1CUSTO: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1VALOR_AJUSTE: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1QTDE_SISTEMA: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1TOTAL_ESTOQUE: TcxGridDBColumn;
    gdProdutosInventarioDBTableView1Column1: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    bt_pesq_grupo: TAdvGlassButton;
    ckbFolhaCOnferencia: TCheckBox;
    gdProdutosInventarioDBTableView1Column2: TcxGridDBColumn;
    procedure FormDestroy(Sender: TObject);
    procedure AdvGlassButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AdvGlassButton2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure E1Click(Sender: TObject);
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure bt_pesq_grupoClick(Sender: TObject);
    procedure botao_pesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gdProdutosInventarioDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    PodeFecharFormulario: Boolean;
    procedure adicionarProdutoInventario;
    function verificaValidadeLancamento: boolean;
    function verificaValidadeInventario: boolean;
    procedure gravarInventario;
    procedure gravarItensDoInventario(ACodigoInventario: string; AListaSQL: TList<string>);



    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInventario: TfrmInventario;
  GPodeFecharFormulario: boolean;

implementation

{$R *.dfm}

procedure TfrmInventario.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
//  SalvarInventario();
  if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Você tem certeza que deseja salvar o inventário ?') = teSim) then
  begin
    gravarInventario;
  end;
end;

function TfrmInventario.verificaValidadeInventario(): boolean;
begin

  if dmInventarios.tbItensInventarioTemp.RecordCount <= 0 then
  begin
    ShowMessage('Nenhum produto adicionado ao inventáriO!');
    result := false;
    exit;
  end;

  if edDataInventario.Date < (data_do_sistema - 3) then
  begin
    showmessage('Data do inventário não pode ser menor do que a data do sistema em mais de 3 dias');
    result := false;
    exit;
  end;

  result := true;
end;

procedure TfrmInventario.AdvGlassButton2Click(Sender: TObject);
begin
  inherited;
//  Application.CreateForm(TfrmAdicionaProdutoIventario, frmAdicionaProdutoIventario);
//  frmAdicionaProdutoIventario.showmodal;
//  frmAdicionaProdutoIventario.Free;

  if verificaValidadeLancamento then
  begin
    adicionarProdutoInventario();
    edValorUnitario.Value := 0;
    edEstoqueApurado.Value := 0;
    ed_desc_item.Clear;
    ed_cod_item.Clear;
    ed_cod_item.SetFocus;
  end;
end;

procedure TfrmInventario.AdvGlassButton3Click(Sender: TObject);
begin
  inherited;
  GPodeFecharFormulario := true;
  close;
end;

procedure TfrmInventario.botao_pesquisaClick(Sender: TObject);
var
  LZerarQuantidade: Boolean;
begin
  inherited;

  LZerarQuantidade := false;

  if (Sender as TControl).Name = 'bt_pesq_grupo' then
  begin
    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Deseja lançar os produtos com a quantidade inicial zerada ?', 18) = teSim) then
    begin
      LZerarQuantidade := true;
    end;
  end;

  if trim(string_auxiliar) <> '' then
  begin
    dmInventarios.qryCsProdutosPorGrupo.SQL.Clear;
    dmInventarios.qryCsProdutosPorGrupo.Active := false;
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add(' select cod_produto, descricao, estoque_atual,                                                            ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('        case when qtdComposicoes > 0 then                                                                 ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('          (select sum(custo_baixa) from  calcula_custo_produto_novo(cod_produto,cod_produto,1))           ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('         else                                                                                             ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('           valor_custo                                                                                    ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('        end as valor_custo,                                                                               ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('        valor_estoque, cod_unidade, descricao_unidade, grupo                                              ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('   from (                                                                                                 ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('                                                                                                          ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('   select p.cod_produto, p.descricao, (p.estoque_liquido / un.parametro) as estoque_atual,                ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('    (select count(*) from composicoes_produto cp where cp.cod_produto = p.cod_produto) as qtdComposicoes, ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('    p.valor_custo, ((p.estoque_liquido / un.parametro) * p.valor_custo) as valor_estoque, un.cod_unidade, ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('    un.descricao as descricao_unidade, gp.descricao as grupo                                              ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('     from produtos p                                                                                      ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('       inner join unidades un on ( un.cod_unidade = p.unidade_entrada)                                    ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('       inner join grupos gp on (gp.cod_grupo = p.cod_grupo)                                               ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('      where p.compra = 1 and p.cod_grupo like ' + Quotedstr(string_auxiliar) + '||' + Quotedstr('%'));
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('                                                                                                          ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('  order by p.descricao                                                                                    ');
    dmInventarios.qryCsProdutosPorGrupo.SQL.Add('  )                                                                                                       ');
    dmInventarios.qryCsProdutosPorGrupo.Active := true;
    dmInventarios.qryCsProdutosPorGrupo.First;
    dmInventarios.tbItensInventarioTemp.DisableControls;

    while not dmInventarios.qryCsProdutosPorGrupo.Eof do
    begin
      if dmInventarios.tbItensInventarioTemp.Locate('COD_PRODUTO', dmInventarios.qryCsProdutosPorGrupoCOD_PRODUTO.Value) = false then
      begin
        dmInventarios.tbItensInventarioTemp.Append;
        dmInventarios.tbItensInventarioTempCOD_PRODUTO.Value := dmInventarios.qryCsProdutosPorGrupoCOD_PRODUTO.Value;
        dmInventarios.tbItensInventarioTempDESCRICAO.Value := dmInventarios.qryCsProdutosPorGrupoDESCRICAO.Value;
        dmInventarios.tbItensInventarioTempQTDE_SISTEMA.Value := dmInventarios.qryCsProdutosPorGrupoESTOQUE_ATUAL.AsFloat;
        dmInventarios.tbItensInventarioTempCOD_UNIDADE.Value := dmInventarios.qryCsProdutosPorGrupoCOD_UNIDADE.Value;
        dmInventarios.tbItensInventarioTempDESC_UNIDADE.Value := dmInventarios.qryCsProdutosPorGrupoDESCRICAO_UNIDADE.Value;

        if (LZerarQuantidade) then
          dmInventarios.tbItensInventarioTempQTDE_APURADA.Value := 0
        else
          dmInventarios.tbItensInventarioTempQTDE_APURADA.Value := dmInventarios.qryCsProdutosPorGrupoESTOQUE_ATUAL.AsFloat;

        dmInventarios.tbItensInventarioTempCUSTO.Value := dmInventarios.qryCsProdutosPorGrupoVALOR_CUSTO.Value;
        dmInventarios.tbItensInventarioTempAJUSTE.Value := dmInventarios.tbItensInventarioTempQTDE_APURADA.Value - dmInventarios.tbItensInventarioTempQTDE_SISTEMA.Value;
        dmInventarios.tbItensInventarioTempTOTAL_AJUSTE.Value := dmInventarios.tbItensInventarioTempAJUSTE.Value * dmInventarios.tbItensInventarioTempCUSTO.Value;
        dmInventarios.tbItensInventarioTempTOTAL_ESTOQUE.Value := dmInventarios.tbItensInventarioTempQTDE_APURADA.Value * dmInventarios.tbItensInventarioTempCUSTO.Value;
        dmInventarios.tbItensInventarioTemp.Post;
      end;
      dmInventarios.qryCsProdutosPorGrupo.Next;
    end;
  end;

  dmInventarios.tbItensInventarioTemp.EnableControls;
  dmInventarios.tbItensInventarioTemp.First;

end;

procedure TfrmInventario.bt_pesq_grupoClick(Sender: TObject);
begin
  inherited;
  showmessage(string_auxiliar);
end;

procedure TfrmInventario.E1Click(Sender: TObject);
begin
  inherited;
  if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma a exclusão dos ítens do inventário ?') = teSim) then
  begin
    dmInventarios.apagaItensSelecionados;
  //  gdProdutosInventarioDBTableView1.DataController.DeleteFocused;

  end;

end;

procedure TfrmInventario.Edit1Enter(Sender: TObject);
begin
  inherited;
  if Sender is TcxLookupComboBox then
  begin
    if ((Sender as TcxLookupComboBox).Name = 'cbProdutoEstoque') then
    begin
      (Sender as TcxLookupComboBox).SelectAll;
    end;
  end;

  if Sender is TCustomEdit then
  begin
    if ((Sender as TCustomEdit).Name = 'edEstoqueApurado') then
    begin
      dmInventarios.qryCsProdutos.Locate('COD_PRODUTO', ed_cod_item.Text);
      edEstoqueApurado.Value := 0;
      edValorUnitario.value := dmInventarios.qryCsProdutos.FieldByName('valor_custo').Value;
    end;

  end;

end;

procedure TfrmInventario.adicionarProdutoInventario();
begin
  dmInventarios.tbItensInventarioTemp.Append;
  dmInventarios.tbItensInventarioTempCOD_PRODUTO.Value := dmInventarios.qryCsProdutosCOD_PRODUTO.Value;
  dmInventarios.tbItensInventarioTempDESCRICAO.Value := dmInventarios.qryCsProdutosDESCRICAO.Value;
  dmInventarios.tbItensInventarioTempQTDE_SISTEMA.Value := dmInventarios.qryCsProdutosESTOQUE_ATUAL.AsFloat;
  dmInventarios.tbItensInventarioTempCOD_UNIDADE.Value := dmInventarios.qryCsProdutosCOD_UNIDADE.Value;
  dmInventarios.tbItensInventarioTempDESC_UNIDADE.Value := dmInventarios.qryCsProdutosDESCRICAO_UNIDADE.Value;
  dmInventarios.tbItensInventarioTempQTDE_APURADA.Value := edEstoqueApurado.Value;
  dmInventarios.tbItensInventarioTempCUSTO.Value := edValorUnitario.Value;
  dmInventarios.tbItensInventarioTempAJUSTE.Value := dmInventarios.tbItensInventarioTempQTDE_APURADA.Value - dmInventarios.tbItensInventarioTempQTDE_SISTEMA.Value;
  dmInventarios.tbItensInventarioTempCUSTO.Value := edValorUnitario.Value;
  dmInventarios.tbItensInventarioTempTOTAL_AJUSTE.Value := dmInventarios.tbItensInventarioTempAJUSTE.Value * dmInventarios.tbItensInventarioTempCUSTO.Value;
  dmInventarios.tbItensInventarioTempTOTAL_ESTOQUE.Value := dmInventarios.tbItensInventarioTempQTDE_APURADA.Value * dmInventarios.tbItensInventarioTempCUSTO.Value;
  dmInventarios.tbItensInventarioTemp.Post;

end;

function TfrmInventario.verificaValidadeLancamento(): boolean;
begin
  if dmInventarios.tbItensInventarioTemp.Locate('COD_PRODUTO', dmInventarios.qryCsProdutosCOD_PRODUTO.Value) then
  begin
    ShowMessage('Produto já existe neste inventário. Caso deseje alterar a sua quantidade, exclua o produto da lista e refaça o lançamento!');
    result := false;
    exit;
  end;

  if edValorUnitario.Value <= 0 then
  begin
    Showmessage('Valor unitário inválido!');
    Result := false;
    exit;
  end;

  if edEstoqueApurado.Value < 0 then
  begin
    showmessage('Estoque atual não pode ser negativo!');
    result := false;
    exit;
  end;
  result := true;
end;

procedure TfrmInventario.gravarItensDoInventario(ACodigoInventario: string; AListaSQL: TList<string>);
var
  LSQL: TStringList;
  LIDItemIventario: string;
begin
  LSQL := TstringList.create;
  try
    try

      dmInventarios.tbItensInventarioTemp.DisableControls;
      dmInventarios.tbItensInventarioTemp.First;

      while not dmInventarios.tbItensInventarioTemp.eof do
      begin
        LSQL.Clear;
        LSQL.Add('insert into itens_inventario (CODIGO,COD_INVENTARIO,COD_PRODUTO,');
        LSQL.Add('ESTOQUE_SISTEMA,ESTOQUE_APURADO,');
        LSQL.Add('AJUSTE,COD_UNIDADE,CUSTO,');
        LSQL.Add('TOTAL_INVENTARIO) values (');
        LSQL.Add('  gen_id(G_INVENTARIOS_ITENS,1),');
        LSQL.Add('' + ACodigoInventario + ',');
        LSQL.Add('' + Quotedstr(dmInventarios.tbItensInventarioTempCOD_PRODUTO.Value) + ',');
        LSQL.Add('' + dm.TrocaVirgPPto(FloatToStr(dmInventarios.tbItensInventarioTempQTDE_SISTEMA.Value)) + ',');
        LSQL.Add('' + dm.TrocaVirgPPto(FloatToStr(dmInventarios.tbItensInventarioTempQTDE_APURADA.Value)) + ',');
        LSQL.Add('' + dm.TrocaVirgPPto(FloatToStr(dmInventarios.tbItensInventarioTempAJUSTE.Value)) + ',');
        LSQL.Add('' + Quotedstr(dmInventarios.tbItensInventarioTempCOD_UNIDADE.Value) + ',');
        LSQL.Add('' + dm.TrocaVirgPPto(FloatToStr(dmInventarios.tbItensInventarioTempCUSTO.Value)) + ',');
        LSQL.Add('' + dm.TrocaVirgPPto(FloatToStr(dmInventarios.tbItensInventarioTempTOTAL_ESTOQUE.Value)) + ');');
        AListaSQL.Add(LSQL.Text);
        dmInventarios.tbItensInventarioTemp.Next;
      end;
      dmInventarios.tbItensInventarioTemp.EnableControls;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao ', 'Ok');
        raise Exception.Create('Erro ao gerar ítens do inventário');
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmInventario.gdProdutosInventarioDBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = vk_return then
  begin
    if not dmInventarios.tbItensInventarioTemp.Eof then
    begin
      dmInventarios.tbItensInventarioTemp.next;
    end;
  end;

end;

procedure TfrmInventario.gravarInventario();
var
  LSQL: TStringList;
  LCodigoInventario: string;
  LListaSQL: TList<string>;
  TS: TFDTransaction;
begin

  LSQL := TstringList.create;
  LListaSQL := TList<string>.Create;
  TS := TFDTransaction.Create(self);
  TS.Connection := dm.fdRestaurante;

  try
    try
      LSQL.Clear;
      LCodigoInventario := IntToStr(dm.geraID('G_INVENTARIOS'));
      LSQL.Clear;
      LSQL.add(' insert into inventarios(CODIGO,DATA_INVENTARIO, ');
      LSQL.add(' DATA_SISTEMA,COD_HISTORICO,COD_USUARIO,');
      LSQL.add('     NOME_USUARIO,');
      LSQL.add('     COD_EMPRESA,OBS) values (');
      LSQL.Add('' + LCodigoInventario + ',');
      LSQL.Add('' + QuotedStr(FormatDateTime('DD.MM.YYY', edDataInventario.Date)) + ',');
      LSQL.Add('' + QuotedStr(FormatDateTime('DD.MM.YYY', data_do_sistema)) + ',');
      LSQL.Add('' + Quotedstr(cbHistoricoInventario.EditValue) + ',');
      LSQL.Add('' + Quotedstr(codigo_usuario) + ',');
      LSQL.Add('' + Quotedstr(nome_usuario) + ',');
      LSQL.Add('' + (codEmpresa) + ',');
      LSQL.Add('' + Quotedstr(memoObservacoes.Lines.Text) + ');');

      LListaSQL.Add(LSQL.Text);
      LSQL.Clear;

      gravarItensDoInventario(LCodigoInventario, LListaSQL);

      if ckbFolhaCOnferencia.Checked = false then
      begin
        LSQL.Clear;
        LSQL.Add('execute procedure proc_processa_inventario(' + (LCodigoInventario) + ');');
        LListaSQL.Add(LSQL.Text);
      end;

      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 150);
      dmInventarios.tbItensInventarioTemp.Active := false;
      dmInventarios.tbItensInventarioTemp.Active := true;
      dmInventarios.tbItensInventarioTemp.EnableControls;
      memoObservacoes.Clear;
      edDataInventario.Date := now;
      edDataInventario.SetFocus;
      edEstoqueApurado.Value := 0;
      edValorUnitario.Value := 0;

      dRelatorios.qryRelInventario.Transaction := TS;
      dRelatorios.qryRelItensInventario.Transaction := TS;
      dRelatorios.qryResumoInventarios.transaction := TS;
      TS.StartTransaction;

      dRelatorios.qryRelInventario.Active := false;
      dRelatorios.qryRelItensInventario.Active := false;
      dRelatorios.qryRelInventario.ParamByName('VpInventario').Value := StrToInt(LCodigoInventario);
      dRelatorios.qryRelItensInventario.ParamByName('VpInventario').Value := StrToInt(LCodigoInventario);
      dRelatorios.qryRelInventario.Active := true;
      dRelatorios.qryRelItensInventario.Active := true;

      dRelatorios.qryResumoInventarios.Active := false;
      dRelatorios.qryResumoInventarios.ParamByName('vpInventario').Value := StrToInt(LCodigoInventario);
      dRelatorios.qryResumoInventarios.Active := true;

      if ckbFolhaCOnferencia.Checked then
        dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relFichaConferenciaEstoque.fr3', true)
      else
        dRelatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relInventario.fr3', true);

      dRelatorios.rpt.PrepareReport(true);
      dRelatorios.rpt.ShowReport(true);
      showmessage('Inventário incluído com sucesso!');

      if ckbFolhaCOnferencia.Checked = true then
      begin
        LListaSQL.Clear;
        LSQL.Clear;
        LSQL.Add('delete from inventarios where codigo=' + LCodigoInventario + ';');
        LListaSQL.Add(LSQL.Text);
        dm.ExecutaBlocoDeInstrucoes(LListaSQL, 150);
      end;

      GPodeFecharFormulario := true;
      close;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao gravar o inventario. ' + E.Message, 'Ok');
        raise Exception.Create('Erro ao gravar inventário');
      end;
    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LListaSQL);
    TS.Rollback;
  end;
end;

procedure TfrmInventario.Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  codigo: string;
begin
  inherited;
  if Key = VK_RETURN then
  begin

    if Sender is TcxLookupComboBox then
    begin
      codigo := (Sender as TcxLookupComboBox).Properties.ListSource.DataSet.FieldByName((Sender as TcxLookupComboBox).Properties.KeyFieldNames).Value;
      (Sender as TcxLookupComboBox).EditValue := codigo;
    end;
  end;

end;

procedure TfrmInventario.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInventario.Date := now;
  edDataInventario.SetFocus;
end;

procedure TfrmInventario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if GPodeFecharFormulario then
  begin
    dm.LimpaInformacoesDaMesa(mesaDelivery, numero_caixa);
    Action := caFree;
  end
  else
  begin
    Action := caNone;
    if (ShowRealDialog(Self, tmConfirmacao, 'Inventário em andamento', 'Tem certeza que deseja abandonar o inventário sem salvar  ?') = teSim) then
    begin
      Action := caFree;
    end;
  end;
end;

procedure TfrmInventario.FormCreate(Sender: TObject);
begin
  inherited;
  dmInventarios := TdmInventarios.Create(self);
  dmInventarios.tbItensInventarioTemp.Active := false;
  dmInventarios.tbItensInventarioTemp.Active := true;
  dmInventarios.qryHistoricosInventarios.Active := false;
  dmInventarios.qryHistoricosInventarios.Active := true;
  cbHistoricoInventario.EditValue := dmInventarios.qryHistoricosInventarios.fieldbyname('codigo').Value;
  edDataInventario.Date := now;
  GPodeFecharFormulario := false;

end;

procedure TfrmInventario.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmInventarios);

end;

end.

