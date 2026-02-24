unit uuFrenteCaixa;

interface

uses
  Windows, Messages, SysUtils, uu_modelo_Vazio, ImgList, Controls, RealFramework,
  System.StrUtils, Produto, ACBrCalculadora, ExtCtrls, StdCtrls, JvCtrls,
  ComCtrls, Mask, Classes, JvExControls, JvTransparentButton, variants, Graphics,
  Forms, Dialogs, Buttons, Grids, DBGrids, db, Menus, ibx.ibquery, jpeg,
  RxCurrEdit, AdvPanel, dxGDIPlusClasses, CurvyControls, Vcl.DBCGrids,
  uuDMFrenteCaixa, PngSpeedButton, Vcl.DBCtrls, AdvOfficeImage, AdvScrollBox,
  JvPageList, System.ImageList, ACBrBase, JvButton, RxToolEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmFrenteCaixa = class(Tfrm_modelo_vazio)
    memo_codigos_formas: TMemo;
    Panel2: TPanel;
    lb_hora: TLabel;
    Timer1: TTimer;
    ACBrCalculadora1: TACBrCalculadora;
    pnMovimentoMesa: TPanel;
    lb_cod_produto: TLabel;
    pnQtde: TPanel;
    Label6: TLabel;
    Label2: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    ed_quantidade: TCurrencyEdit;
    edValorUnitario: TCurrencyEdit;
    edTotalProduto: TCurrencyEdit;
    pnDescricaoProduto: TPanel;
    Label3: TLabel;
    ed_descricao_produto: Tedit;
    pnBotoes: TPanel;
    Label4: TLabel;
    btFecharConta: TJvTransparentButton;
    B20002003: TJvTransparentButton;
    btOperacoesCaixa: TJvTransparentButton;
    Panel16: TPanel;
    pnGrupos: TPanel;
    Label9: TLabel;
    peed: TImageList;
    JvTransparentButton2: TJvTransparentButton;
    SpeedButton3: TSpeedButton;
    btAcessoDelivery: TJvTransparentButton;
    dbgGrupos: TDBCtrlGrid;
    PngSpeedButton1: TPngSpeedButton;
    Panel1: TPanel;
    DBText1: TDBText;
    imgGrupo: TImage;
    Panel4: TPanel;
    Label8: TLabel;
    pnProdutos: TPanel;
    Label11: TLabel;
    dbgProdutos: TDBCtrlGrid;
    Panel3: TPanel;
    DBText2: TDBText;
    ed_total_conta: TCurrencyEdit;
    AdvOfficeImage1: TAdvOfficeImage;
    Label7: TLabel;
    lbNomeUsuario: TLabel;
    pnScroll: TPanel;
    ScrollBox1: TAdvScrollBox;
    painelProdutos: TAdvPanel;
    lbOrdem: TLabel;
    lbDescricaoProduto: TLabel;
    lbQuantidadeProduto: TLabel;
    lbX: TLabel;
    lbValorUnitarioProduto: TLabel;
    lbTotalProduto: TLabel;
    btDeleteProduto: TPngSpeedButton;
    btObsProduto: TPngSpeedButton;
    Panel5: TPanel;
    DBText3: TDBText;
    AdvOfficeImage2: TAdvOfficeImage;
    lbDataSistema: TLabel;
    AdvOfficeImage4: TAdvOfficeImage;
    lbNumeroEstacao: TLabel;
    AdvOfficeImage5: TAdvOfficeImage;
    JvTransparentButton1: TPngSpeedButton;
    JvTransparentButton3: TPngSpeedButton;
    lbDescontoItem: TLabel;
    pgListPrincipal: TJvPageList;
    pgMovimentoCaixa: TJvStandardPage;
    CurvyPanel1: TCurvyPanel;
    Label5: TLabel;
    ed_cod_produto: TEdit;
    pgCombos: TJvStandardPage;
    Panel6: TPanel;
    pnPrincipalCombos: TPanel;
    Panel8: TPanel;
    Panel7: TPanel;
    pnTopoGrupos: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    DBCtrlGrid2: TDBCtrlGrid;
    Panel17: TPanel;
    DBText5: TDBText;
    DBText6: TDBText;
    Panel9: TPanel;
    Panel13: TPanel;
    pnGruposAdicionais: TPanel;
    pnTitulo: TPanel;
    lbTituloGrupoCompo: TLabel;
    pnDataHora: TPanel;
    btSom: TPngSpeedButton;
    timerRecriaMemo: TTimer;
    Panel11: TPanel;
    lbNomeTabelaEmUso: TLabel;
    Label10: TLabel;
    procedure ed_numero_mesaExit(Sender: TObject);
    function busca_movimento_da_mesa: boolean;
    function pesquisar_produto: boolean;
    function verifica_validade_lancamento: boolean;
    function pesquisa_produto: boolean;
    procedure l(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure ed_numero_mesaEnter(Sender: TObject);
    procedure B20002002Click(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure bt_pesq_produtoClick(Sender: TObject);
    procedure B20002001KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure adicionaProdutoLista(idProduto: Largeint);
    procedure recriaMemo();
    procedure B300010040Click(Sender: TObject);
    procedure verificar_permissoes;
    procedure voltar_mesa;
    procedure B20002014Click(Sender: TObject);
    procedure D30001011Exit(Sender: TObject);
    procedure D30001011MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure apagaItemMovimento(qtde: double; codMotivo: string; descricaoMotivo: string; obs: string);
    procedure fecharConta();
    procedure efetuar_lancamento;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ed_numero_mesaChange(Sender: TObject);
    procedure ed_cod_produtoChange(Sender: TObject);
    procedure ed_quantidadeChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure timerAtualizaTelaMesasTimer(Sender: TObject);
    function verifica_movimento: boolean;
    procedure enter_botao(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btCalculadoraClick(Sender: TObject);
    procedure B20001003Click(Sender: TObject);
    procedure CancelamentodeProduto1Click(Sender: TObject);
    procedure gravarEstornoMesa(mesa: string);
    procedure muda_acao(tipo: integer);
    procedure pisca1Timer(Sender: TObject);
    procedure pisca2Timer(Sender: TObject);
    procedure pnExpedicaoClick(Sender: TObject);
    procedure imgAtencaoClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure lbPedidosClick(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure btMapaMesasClick(Sender: TObject);
    procedure btOpCaixaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure JvGradient1Click(Sender: TObject);
    procedure MakeRounded(Control: TWinControl);
    procedure FormCreate(Sender: TObject);
    procedure btpd011Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure btsairClick(Sender: TObject);
    procedure btFecharContaClick(Sender: TObject);
    procedure JvTransparentButton2Click(Sender: TObject);
    procedure B20002003Click(Sender: TObject);
    procedure btOperacoesCaixaClick(Sender: TObject);
    procedure btConsultarProdutosClick(Sender: TObject);
    procedure btgp1Click(Sender: TObject);
    procedure JvTransparentButton1Click(Sender: TObject);
    function lerPesoDaBalanca(codProduto: string): boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btObsProdutoClick(Sender: TObject);
    procedure btDeleteProdutoClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure btAcessoDeliveryClick(Sender: TObject);
    procedure ed_cod_produtoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure dbgGruposPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure dbgGruposClick(Sender: TObject);
    procedure dbgProdutosClick(Sender: TObject);
    procedure JvTransparentButton3Click(Sender: TObject);
    procedure ed_cod_produtoDblClick(Sender: TObject);
    procedure DBText5Click(Sender: TObject);
    procedure DBText6Click(Sender: TObject);
    procedure Panel17Click(Sender: TObject);
    procedure DBCtrlGrid2Click(Sender: TObject);
    procedure btSomClick(Sender: TObject);
    procedure timerRecriaMemoTimer(Sender: TObject);
  private
    { Private declarations }
    modo_exibicao: integer;
    paginaAtual: integer;
    paginasGrupoCriadas: integer;
    numeroMesaPdv: string;
    codigoGarconPdv: string;
    quantidadeLancamento: Double;
    MyHandle: THandle;
    HandleMaeFocus: THandle;
    HandleFilhaFocus: THandle;
    codGrupoComboAtual: integer;
    function VerificaProblemaNegativo: boolean;
    procedure apagarItemLista(id: integer);
    procedure ApplicationMessage(var Msg: TMsg; var Handled: Boolean);

    procedure selecionaItemcombo;
    procedure ClickSelecaoGrupoCombo(Sender: TObject);
    procedure lancarProdutosCombo;
    procedure LancarAdicionaisFixos(ACodProduto: string; AIDCombo: Integer);
    function adicionar_produto_conta(mesa: string; enviar_impressao: boolean; idCombo: Integer; AItemAdicional: boolean): LongInt;
    procedure AtualizaNomeTabelaPreco;


    //0 normal
    //1 resumido

  public
    { Public declarations }
    tipo_caixa_atual: integer;
    desistirCancelamento: Boolean;
    permiteFecharForm: boolean;
  end;

var
  frmFrenteCaixa: TfrmFrenteCaixa;
  tx_serv: double;
  pagina: TScrollbox;
  tipo_botao: integer;
  selecionado: string;
  total_mesas: integer;
  resumido: boolean;

implementation

uses
  uu_data_module, uu_cs_produtos, uu_frm_principal, uu_encerramento,
  uu_obs_lancamento_caixa, uuPrincipalDelivery, uuSelecaoSaboresPizza,
  uuExpedicaoDelivery, uuMapaMesas, uuOperacoesCaixa, Math,
  uuDigitaPesoManualmente, uuPrototipoCaixaREstaurante, uuSelecionaTabelaPrecos;
{$R *.dfm}

procedure TfrmFrenteCaixa.ed_numero_mesaExit(Sender: TObject);
var
  qtdeCalculada: double;
begin

  if Sender is TDBGrid then
  begin
    (Sender as TDBGrid).Color := clWhite;
  end;

  if ((Sender is Tedit and ((Sender as Tedit).Name = 'ed_cod_produto'))) then
  begin
    if (trim(ed_cod_produto.Text) = '') then
      exit;

    if trim(ed_quantidade.text) = '' then
      ed_quantidade.text := '1';

    try
      begin
        StrToInt64(ed_cod_produto.Text);
        ed_cod_produto.Text := FormatFloat('00000', strtofloat(ed_cod_produto.Text));
      end;
    except
      begin
      end;
    end;

    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.Clear;
    dm.qryauxiliar.SQL.Add('select * from produtos where cod_barras=' + Quotedstr(ed_cod_produto.Text));
    dm.qryauxiliar.Active := true;

    if dm.qryauxiliar.IsEmpty then
    begin
      dm.exibe_painel_erro('O código informado não pertence a um produto cadastrado!', 'Continuar');

      ed_cod_produto.SetFocus;
      ed_cod_produto.Clear;
      exit;
    end;

    lb_cod_produto.Caption := dm.qryauxiliar.fieldbyname('cod_produto').value;
    ed_descricao_produto.Text := dm.centralizar(dm.qryauxiliar.fieldbyname('descricao').value, 30);
    edValorUnitario.Value := dm.qryauxiliar.fieldbyname('valor_unitario').value;

    if (verificaProdutoDigitaPreco(ed_cod_produto.Text) = true) then
    begin
     // Tratar esse caso aqui pro PDV
    end
    else
    begin

    end;

  end;

  if ((Sender is Tedit and ((Sender as Tedit).Name = 'ed_quantidade'))) then
  begin
    if (trim(ed_quantidade.text) = '') then
      exit;

    efetuar_lancamento();

  end;

end;

function TfrmFrenteCaixa.busca_movimento_da_mesa: boolean;
var
  valor_bruto: double;
  valor_tx_serv: double;
  valorDescontos: double;
  Marcado: TBooleanField;
  qtde: string;
begin

  dm.transacao.Active := false;
  dm.transacao.Active := true;
  percentualTaxaServico := 0;

  dm.qryMovimentoMesa.Active := false;
  dm.qryMovimentoMesa.sql.clear;
  dm.qryMovimentoMesa.SQL.Add('select mv.cod_mesa,pr.cod_barras,id,');
  dm.qryMovimentoMesa.sql.Add(' mv.cod_produto,pr.cod_produto,');
  dm.qryMovimentoMesa.sql.Add(' pr.descricao,mv.quantidade as quantidade, pr.un_ecf,');
  dm.qryMovimentoMesa.sql.Add('mv.valor_unitario,');
  dm.qryMovimentoMesa.sql.add('udf_roundabnt((mv.valor_unitario * mv.quantidade),2) as total');
  dm.qryMovimentoMesa.sql.Add(',mv.comanda, mv.cod_garcon, g.apelido,u.login,mv.hora_lancamento, mv.estado,mv.cod_movimento, mv.desconto,id,impresso,observacoes,sabores,obs_paf,cancelado, mv.tipo_massa, mv.id');
  dm.qryMovimentoMesa.SQL.Add('  from movimento_mesa mv ');
  dm.qryMovimentoMesa.sql.Add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
  dm.qryMovimentoMesa.sql.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
  dm.qryMovimentoMesa.SQL.add('  inner join usuarios u on (u.cod_usuario=mv.cod_usuario)');
  dm.qryMovimentoMesa.SQL.add('  where cancelado=0 and  mv.cod_mesa=' + Quotedstr(numeroMesaPdv) + ' order by mv.id');
  dm.qryMovimentoMesa.Active := true;

  valor_bruto := 0;
  valor_tx_serv := 0;
  valorDescontos := 0;

  dm.qryMovimentoMesa.First;
  dm.qryMovimentoMesa.FetchAll;
  dm.InsereChavesMovimento(numero_caixa, numeroMesaPdv);

  dm.qryauxiliar.Active := FALSE;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.SQL.add('select * from rodapeextrato3(' + Quotedstr(numeroMesaPdv) + ',' + dm.TrocaVirgPPto(Floattostr(percentualTaxaServico)) + ')');
  dm.qryauxiliar.Active := true;

  if (dm.qryauxiliar.IsEmpty = false) then
  begin
    if tipo_caixa_atual = 1 then
    begin
      ed_total_conta.Value := dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
    end
    else
    begin
      ed_total_conta.Value := dm.qryauxiliar.fieldbyname('VALORTOTAL').Value;
    end;

  end
  else
  begin
    ed_total_conta.Value := 0;
  end;

end;

procedure TfrmFrenteCaixa.apagarItemLista(id: integer);
var
  x: integer;
  cp: TWinControl;
begin

  for x := 0 to ScrollBox1.ComponentCount - 1 do
  begin
    cp := TWinControl(ScrollBox1.Components[x]);
    if ((cp.Tag = id) and (cp.ClassName = 'TPanel')) then
    begin
      cp.Visible := false;
//          FreeAndNil(cp);
      exit;
    end;
  end;

  //     ScrollBox1.Refresh;
//       ScrollBox1.Repaint;

end;

procedure TfrmFrenteCaixa.recriaMemo();
var
  qtde: string;
  x: integer;
  cp: TComponent;
begin
  dm.qryMovimentoMesa.First;
  dm.qryMovimentoMesa.FetchAll;

  ScrollBox1 := TAdvScrollBox(pnScroll.FindComponent('ScrollBox1'));
  if ScrollBox1 <> nil then
  begin
    FreeAndNil(ScrollBox1);
  end;

  ScrollBox1 := TAdvScrollBox.Create(pnScroll);
  ScrollBox1.Name := 'ScrollBox1';
  ScrollBox1.Parent := pnScroll;
  ScrollBox1.Left := 1;
  ScrollBox1.Top := 1;
  ScrollBox1.Width := 335;
  ScrollBox1.Height := 465;
  ScrollBox1.Align := alClient;
  ScrollBox1.BevelInner := bvNone;
  ScrollBox1.BevelOuter := bvNone;
  ScrollBox1.DoubleBuffered := True;
  ScrollBox1.Ctl3D := False;
  ScrollBox1.ParentCtl3D := False;
  ScrollBox1.ParentDoubleBuffered := False;
  ScrollBox1.TabOrder := 0;

  ScrollBox1.VertScrollBar.ButtonSize := 5;
  ScrollBox1.VertScrollBar.Color := 12615680;
  ScrollBox1.VertScrollBar.ParentColor := False;
  ScrollBox1.VertScrollBar.Size := 5;
  ScrollBox1.Repaint;
  ScrollBox1.Refresh;
  ScrollBox1.Visible := false;

  dm.qryMovimentoMesa.First;
  dm.qryMovimentoMesa.FetchAll;

  while not dm.qryMovimentoMesa.Eof do
  begin
    qtde := FormatFloat('###,###,##0.000 ', dm.qryMovimentoMesa.fieldbyname('quantidade').Value);
    qtde := qtde + dm.qryMovimentoMesa.fieldbyname('un_ecf').Value + ' X ';
    adicionaProdutoLista(dm.qryMovimentoMesa.fieldbyname('id').Value);
    dm.qryMovimentoMesa.Next;
  end;

  ScrollBox1.VertScrollBar.Position := 5000;
  ScrollBox1.Visible := true;
end;

function TfrmFrenteCaixa.pesquisar_produto: boolean;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select * from produtos ');
  dm.qry_consultas.Active := true;

  if dm.qry_consultas.IsEmpty then
  begin
    dm.exibe_painel_erro('Não existem produtos cadastrados!', 'Ok');
    exit;
  end
  else
  begin
    Application.CreateForm(Tfrm_consulta_produtos, frm_consulta_produtos);
    frm_consulta_produtos.ShowModal;
    ed_cod_produto.Text := string_aux_cod_barras;
    frm_consulta_produtos.Free;
  end;
end;

function TfrmFrenteCaixa.verifica_validade_lancamento: boolean;
begin
  result := true;

  try
    StrToFloat(ed_quantidade.Text);
  except
    begin
      dm.exibe_painel_erro('Quantidade inválida', 'Ok');
      ed_quantidade.Value := 1;
      ed_quantidade.SetFocus;
      exit;
    end;
  end;

  if not (verificaSeProdutoVendeFracionado(ed_cod_produto.Text, 2)) then
  begin
    try
      strToInt(ed_quantidade.Text);
    except
      begin
        dm.exibe_painel_erro('O produto informado não pode ser vendido fracionadamente', 'Ok');
        ed_quantidade.Value := 1;
        ed_cod_produto.SetFocus;
        ed_cod_produto.SelectAll;
//       ed_quantidade.SetFocus;
        Result := false;
        exit;
      end;
    end;
  end;


 {
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('select * from produtos where cod_barras=' + Quotedstr(trim(ed_cod_produto.Text)));
  dm.qryauxiliar.Active := true;

  if dm.qryauxiliar.IsEmpty then
  begin
    dm.exibe_painel_erro('Produto não cadastrado!','Ok');
    ed_cod_produto.SetFocus;
    ed_cod_produto.Clear;
    Result := false;
    exit;
  end;

}

  if (StrToFloat(ed_quantidade.Text) >= 5) then
  begin
    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', '  A quantidade informada é considerada alta!' + #13#10 + #13#10 + '    Tem certeza que deseja lançar ' + FormatFloat('#0.000', StrToFloat(ed_quantidade.Text)) + '  ' + ed_descricao_produto.Text + ' nesta conta ?') = teSim) then
    begin
      Result := true;
    end
    else
    begin
      Result := false;
      ed_quantidade.Value := 1;
      exit;
    end;
  end;

  Result := true;
end;

function TfrmFrenteCaixa.adicionar_produto_conta(mesa: string; enviar_impressao: boolean; idCombo: LongInt; AItemAdicional: boolean): LongInt;
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

  if (ed_quantidade.Value <= 0) then
  begin
    ed_quantidade.Value := 1;
    ////dm.adicionalog('Ocorreu o problema da quantidade');
  end;

  if ((verificaSeProdutoEhPizza(lb_cod_produto.Caption, 1) = true) and (AItemAdicional = false)) then
  begin
    frm_principal.obsSaborPizza := '';
    dm.tbSaboresPizzaTemp.Active := false;
    dm.tbSaboresPizzaTemp.EmptyTable;
    Application.CreateForm(TfrmSelecaoSaboresPizza, frmSelecaoSaboresPizza);
    frmSelecaoSaboresPizza.ShowModal;
    frmSelecaoSaboresPizza.Free;
    edValorUnitario.Value := getValorPizza(lb_cod_produto.Caption, 1, 1);
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

  permiteFecharForm := false;
  idMovimentoMesa := strToInt(dm.geraCodigo('G_MOVIMENTO_MESA', 15));

  if (ed_quantidade.Value <= 0) then
  begin
    ed_quantidade.Value := 1;
  end;

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('insert into movimento_mesa (cod_mesa,cod_garcon,cod_produto,quantidade,comanda,cod_movimento,');
  dm.qryauxiliar.sql.add('numero_caixa,cod_usuario,valor_unitario,id,observacoes,sabores,id_combo) values (');
  dm.qryauxiliar.sql.add('' + QuotedStr(mesa) + ',');
  dm.qryauxiliar.sql.add('' + QuotedStr(codigoGarconPDV) + ',');
  dm.qryauxiliar.sql.add('' + QuotedStr(lb_cod_produto.Caption) + ',');
  dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(ed_quantidade.text) + ',');
  dm.qryauxiliar.sql.add('' + QuotedStr('') + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_lancamento) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(numero_caixa) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_usuario) + ',');
  dm.qryauxiliar.SQL.Add('' + dm.TrocaVirgPPto(FloatToStr(edValorUnitario.Value)) + ',');
  dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(observacoesProducao) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(saboresProducao) + ',');
  dm.qryauxiliar.sql.add('' + IntToStr(idCombo) + ')');


  ////dm.adicionalog(dm.qryauxiliar.SQL.Text);


  try
    begin
      //////dm.adicionalog(dm.qryauxiliar.SQL.Text);
      dm.qryauxiliar.ExecSQL;
      Result := idMovimentoMesa;
    end;
  except
    begin
      dm.cria_log_de_erros(dm.qryauxiliar.sql, 'Caixa - Restaurante ', 'Erro ao lançar produto no movimento da mesa ', codigo_usuario);
      Result := 0;
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
  ed_cod_produto.Clear;
  strObsProduto := '';
  observacoesProducao := '';
  ed_descricao_produto.Clear;
  ed_quantidade.Text := '1';
  edValorUnitario.Value := 0;
  edTotalProduto.Value := 0;
end;

procedure TfrmFrenteCaixa.l(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Column.Field.FieldName = 'TOTAL') then
  begin
    {         DBGrid1.Canvas.Brush.Color:= clRed;
             DBGrid1.Canvas.Font.Style:=[fsbold];
             DBGrid1.Canvas.Font.Color:= clWhite;
             DBGrid1.Canvas.FillRect(Rect);
             DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
             }
  end;

end;

procedure TFrmFrenteCaixa.AtualizaNomeTabelaPreco();
begin
  lbNomeTabelaEmUso.Caption := dm.getTabelaPrecoAtual.descricao;
end;

procedure TfrmFrenteCaixa.FormActivate(Sender: TObject);
var
  pn1: TPanel;
  OldValue: LongBool;
begin
  dm.setTabelaPrecoAtual(0);
  AtualizaNomeTabelaPreco;

  //dm.desabilitaCltrAltDel();
  lbNomeUsuario.Caption := nome_completo_usuario;
  lbNumeroEstacao.Caption := numero_caixa;
  lbDataSistema.Caption := FormatDateTime('DD/MM/YY', data_do_sistema);
  //lbHora.Caption := FormatDateTime('HH:MM:SS', now);

  permiteFecharForm := false;

  ed_quantidade.Value := 1;

  resumido := false;
  muda_acao(1);

//  frmFrenteCaixa.Top := 0;

  if trim(numeroMesaPdv) <> '' then
  begin
    busca_movimento_da_mesa;
    ed_cod_produto.SetFocus;
    if tipo_caixa_atual = 2 then

  end;

  busca_movimento_da_mesa();

  recriaMemo();

end;

procedure TfrmFrenteCaixa.ed_numero_mesaEnter(Sender: TObject);
begin

  if Sender is Tedit and (((Sender as Tedit).Name = 'ed_cod_produto')) then
  begin

    ed_cod_produto.SelectAll;

  end;

end;

procedure TfrmFrenteCaixa.B20002002Click(Sender: TObject);
var
  linha: integer;
  valor_total: double;
begin

  if (dm.verificaPermissaoAcao((Sender as TBitBtn).Name, true, true) = true) then
    fecharConta();

end;

procedure TfrmFrenteCaixa.dbgGruposClick(Sender: TObject);
begin
  inherited;
  dmFrenteCaixa.qryProdutosTouch.Active := false;
  dmFrenteCaixa.qryProdutosTouch.SQL.clear;
  dmFrenteCaixa.qryProdutosTouch.SQL.Add('  select p.cod_produto, p.cod_barras, p.cod_grupo_touch, p.descricao, p.valor_unitario  from produtos p ');
  dmFrenteCaixa.qryProdutosTouch.SQL.Add(' where p.vende=1 and  (p.cod_grupo_touch=' + Quotedstr(dmFrenteCaixa.qryGruposTouch.FieldByName('codigo').Value) + ')');
  dmFrenteCaixa.qryProdutosTouch.SQL.Add(' order by p.descricao ');
  dmFrenteCaixa.qryProdutosTouch.Active := true;

end;

procedure TfrmFrenteCaixa.dbgGruposPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
var
  descricao: string;
begin
  inherited;
  ShowScrollBar(dbgGrupos.Handle, SB_VERT, False);

  if (dmFrenteCaixa.qryGruposTouch.IsEmpty = false) then
  begin

    imgGrupo.Picture := nil;

      //lbGrupo.Caption :=  dm.StrtoMultilineStr(dmFrenteCaixa.qryGruposTouch.FieldByName('descricao').Value,10);


    if (dmFrenteCaixa.qryGruposTouch.FieldByName('imagem').Value <> null) and (trim(dmFrenteCaixa.qryGruposTouch.FieldByName('imagem').Value) <> '') then
    begin
      try
        imgGrupo.Picture.LoadFromFile(patchAplicacao + 'imagens\grupos touch\' + trim(dmFrenteCaixa.qryGruposTouch.FieldByName('imagem').Value));
        dbgGrupos.Canvas.Draw(31, 0, imgGrupo.Picture.Graphic);
      except
      end;
    end;

  end;

end;

procedure TfrmFrenteCaixa.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
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

procedure TfrmFrenteCaixa.DBText5Click(Sender: TObject);
begin
  inherited;
  selecionaItemcombo;
end;

procedure TfrmFrenteCaixa.DBText6Click(Sender: TObject);
begin
  inherited;
  selecionaItemcombo;
end;

procedure TfrmFrenteCaixa.selecionaItemcombo();
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
      pgMovimentoCaixa.Show;
    end;
  end     {

  codGrupoComboAtual := codGrupoComboAtual + 1;
  }
end;

procedure TfrmFrenteCaixa.LancarAdicionaisFixos(ACodProduto: string; AIDCombo: LongInt);
var
  LSQL: TStringList;
  LTbAdicionaisFixos: TFDmemtable;
begin
  LSQL := TStringList.Create;
  LTbAdicionaisFixos := TFDMemTable.Create(self);
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
        edValorUnitario.Value := LTbAdicionaisFixos.FieldByName('valor').Value;
        ed_quantidade.Value := LTbAdicionaisFixos.FieldByName('qtd').Value;
        edTotalProduto.Value := LTbAdicionaisFixos.FieldByName('valor').Value * LTbAdicionaisFixos.FieldByName('qtd').Value;
        adicionar_produto_conta(numeroMesaPdv, IntToBol(LTbAdicionaisFixos.FieldByName('imprimeProducao').Value), AIDCombo, true);
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

procedure TfrmFrenteCaixa.lancarProdutosCombo();
var
  codProduto: string;
  qtdeProdutoCombo: double;
  IDCombo: string;
begin
  IDCombo := dm.geraCodigo('G_ID_COMBOS_VENDIDOS', 10);
  adicionar_produto_conta(numeroMesaPdv, dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption), StrToInt(IDCombo), True);
  LancarAdicionaisFixos(lb_cod_produto.Caption, StrToInt(IDCombo));
  dm.tbGruposCombo.First;

  while not dm.tbGruposCombo.Eof do
  begin
    codProduto := dm.tbGruposCombo.FieldByName('codProdutoSelecionado').Value;
    lb_cod_produto.Caption := codProduto;
    ed_descricao_produto.Text := getDescricaoProduto(codProduto, 1);
    edValorUnitario.Value := dm.tbGruposCombo.FieldByName('valorProdutoSelecionado').Value;
    ed_quantidade.Value := 1;
    edTotalProduto.Value := edValorUnitario.Value * ed_quantidade.Value;
    edTotalProduto.Value := edValorUnitario.Value * ed_quantidade.Value;
    dm.qryMovimentoMesa.Last;

    adicionar_produto_conta(numeroMesaPdv, dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption), StrToInt(IDCombo), true);
    dm.tbGruposCombo.Next;
  end;

  recriaMemo;
end;

function TfrmFrenteCaixa.pesquisa_produto: boolean;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select * from produtos ');
  dm.qry_consultas.Active := true;

  if dm.qry_consultas.IsEmpty then
  begin
    dm.exibe_painel_erro('Não existem produtos cadastrados!', 'Ok');

    exit;
  end
  else
  begin
    Application.CreateForm(Tfrm_consulta_produtos, frm_consulta_produtos);
    frm_consulta_produtos.ShowModal;
    ed_cod_produto.Text := string_aux_cod_barras;
    frm_consulta_produtos.Free;

  end;
end;

procedure TfrmFrenteCaixa.bt_pesq_produtoClick(Sender: TObject);
begin
  pesquisa_produto;
end;

procedure TfrmFrenteCaixa.B20002001KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if ((Key = vk_escape) and (dm.verificaMesaBalcao(numeroMesaPdv) = false)) then
  begin
    dm.qryMovimentoMesa.Active := false;
    ed_cod_produto.clear;
    ed_descricao_produto.Clear;

    ed_total_conta.Text := '0,00';

    voltar_mesa;
  end
  else
    voltar_mesa;
end;

procedure TfrmFrenteCaixa.B300010040Click(Sender: TObject);
begin

  if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', '  Confirma cancelamento do produto ?' + sLineBreak + sLineBreak + sLineBreak + 'Se este produto pertencer à um combo, todos os complementos também serão excluídos.') = teSim) then
  begin
    dm.qrymax.Active := false;
    dm.qrymax.SQL.Clear;
    dm.qrymax.SQL.Add('delete from movimento_mesa where cod_mesa=' + quotedstr(numeroMesaPdv) + ' and cod_movimento=' + Quotedstr(dm.qryMovimentoMesa.fieldbyname('cod_movimento').value));
    dm.qrymax.ExecSQL;
    if dm.transacao.Active = false then
      dm.transacao.Active := true;
    dm.transacao.Commit;
    busca_movimento_da_mesa;
    recriaMemo;

  end

end;

procedure TfrmFrenteCaixa.verificar_permissoes;
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

//        rdg_modo_visualizacao.Visible:=false;
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

procedure TfrmFrenteCaixa.voltar_mesa;
begin
//  alternarTipoCaixa(tipo ;
  resumido := false;
  ed_cod_produto.Clear;
  ed_descricao_produto.clear;
  ed_quantidade.value := 1;
  dm.qryMovimentoMesa.Active := false;

  ed_total_conta.Value := 0;

end;

procedure TfrmFrenteCaixa.B20002014Click(Sender: TObject);
begin
  if (dm.verificaPermissaoAcao((Sender as TBitBtn).Name, true, true) = true) then
  begin
  end;

  // voltar_mesa;
end;

procedure TfrmFrenteCaixa.D30001011Exit(Sender: TObject);
begin
  if Sender is TDBGrid then
  begin
    (Sender as TDBGrid).Color := clWhite;
  end;

end;

procedure TfrmFrenteCaixa.apagaItemMovimento(qtde: double; codMotivo: string; descricaoMotivo: string; obs: string);
var
  impCancelamentoLocalProducao: boolean;
  idProduto: integer;
begin

  if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', '  Confirma cancelamento do produto ?' + #13#10 + 'Se este produto pertencer à um combo, todos os complementos também serão excluídos.') = teSim) then
  begin
    idProduto := dm.qryMovimentoMesa.fieldbyname('ID').value;
    impCancelamentoLocalProducao := false;
    dm.gravarEstornoDeItem(numeroMesaPdv, codMotivo, descricaoMotivo, dm.qryMovimentoMesa.fieldbyname('cod_barras').value, dm.qryMovimentoMesa.fieldbyname('descricao').value, qtde, (dm.qryMovimentoMesa.fieldbyname('valor_unitario').value), obs, impCancelamentoLocalProducao, '', '', dm.qryMovimentoMesa.fieldbyname('ID').value);
    dm.executaSQL('delete from movimento_mesa where id=' + IntTostr(dm.qryMovimentoMesa.fieldbyname('id').value));
//  apagarItemLista(idProduto);
    busca_movimento_da_mesa;

  end;
end;

procedure TfrmFrenteCaixa.D30001011MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
{  if ((dm.qryMovimentoMesa.Active) and (dm.qryMovimentoMesa.IsEmpty = false) and (resumido = false )) then
  begin
    try
      begin
        D30001011.Hint := 'Garçon: ' + dm.qryMovimentoMesa.fieldbyname('apelido').Value +
          #13 + 'Comanda: ' + dm.qryMovimentoMesa.fieldbyname('comanda').AsString +
          #13 + 'Produto: ' + dm.qryMovimentoMesa.fieldbyname('descricao').AsString +
          #13 + 'Quantidade: ' + FormatFloat('###,###,##0.000',dm.qryMovimentoMesa.fieldbyname('quantidade').Value) +
          #13 + 'Lançado por: ' + dm.qryMovimentoMesa.fieldbyname('login').AsString + ' às ' + FormatDateTime('HH:MM:SS', dm.qryMovimentoMesa.fieldbyname('hora_lancamento').value)+
          #13+#13 + 'Sabores :'+#13+ dm.qryMovimentoMesa.fieldbyname('sabores').AsString+
          #13+#13+ 'Obs :'+#13+ dm.qryMovimentoMesa.fieldbyname('observacoes').AsString;

      end;
    except
    end;           end;
    }
end;

procedure TfrmFrenteCaixa.DBCtrlGrid2Click(Sender: TObject);
begin
  inherited;
  selecionaItemcombo;
end;

procedure TfrmFrenteCaixa.dbgProdutosClick(Sender: TObject);
var
  x: integer;
  k: word;
  sf: TShiftState;
begin
  inherited;
  k := VK_RETURN;
  x := 0;

//  ed_cod_produto.Text := formatfloat('00000',btProduto.Tag);
  ed_cod_produto.Text := dmFrenteCaixa.qryProdutosTouch.FieldByName('cod_barras').Value;

  if (verificaSeProdutoLeQuantidadeDaBalanca(ed_cod_produto.Text, 2) = false) then
  begin
    ed_numero_mesaExit(ed_cod_produto);
    ed_cod_produtoKeyDown(ed_cod_produto, k, sf);
     // ed_numero_mesaExit(ed_quantidade );
  end
  else
  begin
    if (lerPesoDaBalanca(ed_cod_produto.Text) = true) then
    begin
      ed_numero_mesaExit(ed_cod_produto);
      ed_cod_produtoKeyDown(ed_cod_produto, k, sf);
    end
    else
    begin
      string_auxiliar := 'N';

      pesoLidoBalanca := '0';
      if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Deseja digitar o peso manualmente ?') = teSim) then
      begin
        if dm.verificaPermissaoAcao('I20001012', true, true) = true then
        begin
          Application.CreateForm(TfrmDigitaPesoManualmente, frmDigitaPesoManualmente);
          frmDigitaPesoManualmente.ShowModal;
          frmDigitaPesoManualmente.Free;

          if (StrToFloat(pesoLidoBalanca) <= 0) then
          begin
            exibe_painel_erro('Peso digitado é inválido', 'Ok');
            exit;
          end
          else
          begin
            ed_quantidade.Value := StrToFloat(pesoLidoBalanca);
            ed_cod_produto.SetFocus;
            ed_numero_mesaExit(ed_cod_produto);

            ed_cod_produtoKeyDown(ed_cod_produto, k, sf);
          end;
        end;
      end
      else
      begin
        pesoLidoBalanca := '0';
        Exit;
      end;
    end;

  end;
  ed_quantidade.Value := 1;

end;

procedure TfrmFrenteCaixa.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key = vk_f2 then
  begin
    pesquisa_produto;
  end;

  if (Key = 123) then
  begin
    ed_cod_produto.clear;

  end;

  if (Key = VK_F4) then
  begin
    btFecharConta.click;
  end;

  if (Key = VK_F5) then
  begin
    B20002003.Click;
  end;

  if (Key = VK_F6) then
  begin
    btOperacoesCaixa.Click;
  end;

  if (Key = VK_F8) then
  begin
//      btCalculadora.Click;
  end;

  if (Key = VK_F9) then
  begin
//      btGaveta.Click;
  end;

  if (Key = VK_F10) then
  begin
//      btMenuFiscal.Click;
  end;

  if (Key = vk_f12) then
  begin
    if dm.verificaPermissaoAcao('I20001016', true, true) = true then
    begin
      dm.qryMovimentoMesa.FetchAll;

      if dm.qryMovimentoMesa.IsEmpty then
      begin
        Application.CreateForm(TfrmSelecionaTabelaPrecos, frmSelecionaTabelaPrecos);
        frmSelecionaTabelaPrecos.ShowModal;
        frmSelecionaTabelaPrecos.free;
        AtualizaNomeTabelaPreco;
        Key := 0;
      end
      else
        ShowRealDialog(Self, tmErro, 'Ação não permitida!', 'Não é possível mudar a tabela de preço com uma venda já iniciada. Exclua os ítens já registrados antes de mudar a tabela de preços');
    end;

  end;

end;

procedure TfrmFrenteCaixa.efetuar_lancamento;
begin
  if dm.transacao.Active = false then
    dm.transacao.Active := true;
  dm.transacao.Commit;
  adicionar_produto_conta(numeroMesaPdv, true, 0, false);

end;

procedure TfrmFrenteCaixa.gravarEstornoMesa(mesa: string);
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
      frm_principal.memo_avisos.Lines := q.SQL;
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
      frm_principal.memo_avisos.Lines := q.SQL;
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

procedure TfrmFrenteCaixa.ed_numero_mesaChange(Sender: TObject);
begin
  inherited;
  if (((trim(numeroMesaPdv) = 'b')) or ((trim(numeroMesaPdv) = 'B'))) then
  begin
//    B20001002.Click;
  end;

end;

procedure TfrmFrenteCaixa.ed_cod_produtoChange(Sender: TObject);
var
  LCodigo: string;
begin
  inherited;

  LCodigo := trim(ed_cod_produto.Text);

  if ((LCodigo = '010101') and (StrToInt(dm.LeIni(1, 'CAIXA', 'licenciado')) = 1)) then
  begin
    if tipo_cupom = 1 then
      muda_acao(2)
    else
      muda_acao(1);

  end
  else
  begin
    if IndexStr(LCodigo, ['Q', '*']) <> -1 then
    begin
      ed_cod_produto.clear;
      Application.CreateForm(TfrmDigitaPesoManualmente, frmDigitaPesoManualmente);
      frmDigitaPesoManualmente.setTituloMensagem('Digite a quantidade');
      frmDigitaPesoManualmente.PermitirQuantidadeFracionaria(true);
      frmDigitaPesoManualmente.ShowModal;
      ed_quantidade.Value := StrToFloat(pesoLidoBalanca);
      frmDigitaPesoManualmente.Free;
    end;
  end;
end;

procedure TfrmFrenteCaixa.ed_cod_produtoDblClick(Sender: TObject);
begin
  inherited;
  codGrupoComboAtual := 1;
  pgCombos.Show;
end;

procedure TfrmFrenteCaixa.ed_cod_produtoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  posicaoAsterisco: SmallInt;
  valorTotalInStore: string;
  LCodProduto: string;
  unidadeMedida: string;
  qtde: string;
  LIDCombo: LongInt;
  LProdutoTemAdicionaisFixos: Boolean;
  LProduto: Produto.TProduto;
  LIsProdutoInstore: boolean;
  LProdutoImprimeNaProducao: boolean;
  LIDMovimentoLancamento: LongInt;
begin

  LProduto := Produto.TProduto.Create;
  LIsProdutoInstore := false;
  LProdutoImprimeNaProducao := false;

  try
    try

      LCodProduto := ed_cod_produto.Text;
      quantidadeLancamento := ed_quantidade.value;

      if Key = vk_return then
      begin
        LCodProduto := ed_cod_produto.Text;
        if ((Length(LCodProduto) >= 6) and (Length(LCodProduto) <= 13)) then
        begin

      // Verifica se é um produto IN store. Todos que começam com o número 2
      // são produtos etiquetados na casa.
          if (trim(Copy(LCodProduto, 0, 1)) = '2') then
          begin
           // Produto in store
            LIsProdutoInstore := true;
            dm.ACBrInStore1.Codificacao := dm.LeIni(2, 'BALANCA', 'codificacao');
            dm.ACBrInStore1.Desmembrar(LCodProduto);
            valorTotalInStore := FloatToStr(dm.ACBrInStore1.Total);
            LCodProduto := dm.ACBrInStore1.Codigo;

            try
              LCodProduto := FormatFloat('00000', StrToFloat(LCodProduto));
            except
              begin
                dm.exibe_painel_erro('Código de produto in store inválido!', 'Ok');
                Exit;
              end;
            end;

            try
              StrToFloat(valorTotalInStore);
            except
              begin
                dm.exibe_painel_erro('Valor total de produto in store lido na etiqueta é inválido! ' + valorTotalInStore, 'Ok');
                ed_cod_produto.clear;
                exit;
              end;
            end;
          end;
        end
        else
        begin
          LCodProduto := FormatFloat('00000', StrToFloat(LCodProduto));
          ed_cod_produto.text := LCodProduto;
        end;

        dm.getDadosProduto(TeCodBarras, LCodProduto, LProduto);
        if LProduto.Vende = false then
          raise Exception.Create('O produto selecionado está desabilitado para venda!');



        lb_cod_produto.Caption := LProduto.Codigo;
        ed_descricao_produto.Text := LProduto.Descricao;
        edValorUnitario.Value := LProduto.Preco;

        unidadeMedida := LProduto.UnidadeNFE;
        if LProduto.CodImpressoraProducao <> '001' then
          LProdutoImprimeNaProducao := true;

        if LIsProdutoInstore then
        begin
          quantidadeLancamento := StrToFloat(valorTotalInStore) / LProduto.Preco;
          quantidadeLancamento := RoundTo(quantidadeLancamento, -3);
        end;

        ed_quantidade.Value := quantidadeLancamento;
        edTotalProduto.Value := edValorUnitario.Value * ed_quantidade.Value;

        if dm.criaGruposCombo(lb_cod_produto.Caption, pnGruposAdicionais, 0, ClickSelecaoGrupoCombo) then
        begin
          pgCombos.Show;
        end
        else
        begin
          if verifica_validade_lancamento then
          begin
            LIDCombo := 0;
            LProdutoTemAdicionaisFixos := verificaSeProdutoTemAdicionaisFixos(lb_cod_produto.Caption);
            if LProdutoTemAdicionaisFixos = true then
            begin
              LIDCombo := StrtoInt(dm.geraCodigo('G_ID_COMBOS_VENDIDOS', 10));
              LIDMovimentoLancamento := adicionar_produto_conta(numeroMesaPdv, LProdutoImprimeNaProducao, LIDCombo, true);
              LancarAdicionaisFixos(lb_cod_produto.Caption, LIDCombo);
              recriaMemo;
            end
            else
            begin
              LIDMovimentoLancamento := adicionar_produto_conta(numeroMesaPdv, LProdutoImprimeNaProducao, LIDCombo, false);
              edTotalProduto.Value := edValorUnitario.Value * ed_quantidade.Value;
              dm.qryMovimentoMesa.Last;
              qtde := FormatFloat('###,###,##0.000 ', ed_quantidade.Value);
              adicionaProdutoLista(LIDMovimentoLancamento);
            end;

            ed_cod_produto.Clear;
            ed_cod_produto.SetFocus;
          end
          else
          begin
            exit;
          end;
        end;

      end;

    except
      on E: Exception do
      begin
        ShowRealDialog(Self, tmErro, 'Erro', E.Message);
      end;

    end;

  finally
    FreeAndNil(LProduto);
  end;

end;

procedure TfrmFrenteCaixa.ed_quantidadeChange(Sender: TObject);
var
  qtde: integer;
  codProduto: string;
  valorTotal: string;
  valor: double;
  quantidade: double;
  LProduto: Produto.TProduto;
  LCodProduto: string;
begin

  LProduto := Produto.TProduto.create;
  LCodProduto := ed_cod_produto.text;
  try
    try
      dm.getDadosProduto(TeCodBarras, LCodProduto, LProduto);
      if (Length(trim(ed_quantidade.text)) = 13) then
      begin
        codProduto := copy(ed_quantidade.Text, 2, 4);
        valorTotal := copy(ed_quantidade.Text, 8, 5);
        valorTotal := copy(valorTotal, 0, 3) + ',' + copy(valorTotal, 4, 4);
        valorTotal := FloatTostr(strToFloat(valorTotal));
        valor := StrToFLoat(valorTotal);
        codProduto := FormatFloat('00000', StrTOFloat(codProduto));
        ed_cod_produto.Text := codProduto;
        quantidade := (valor / LProduto.Preco);
        ed_cod_produto.Text := codProduto;
        ed_quantidade.Text := FormatFloat('###,###,##0.000 ', quantidade);
        ed_quantidade.SetFocus;
      end;
    except
      on E: Exception do
      begin
        ShowRealDialog(Self, tmErro, 'Erro', E.Message);
      end;
    end;

  finally
    FreeAndNIl(LProduto);
  end;

end;

procedure TfrmFrenteCaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

//  timerAtualizaTelaMesas .Enabled:=false;
//  timerAtualizaTelaMesas .Enabled:=true;


end;

procedure TfrmFrenteCaixa.timerAtualizaTelaMesasTimer(Sender: TObject);
begin
  inherited;
//  AtualizarListaMesas();
end;

procedure TfrmFrenteCaixa.timerRecriaMemoTimer(Sender: TObject);
begin
  inherited;
  recriaMemo;
  timerRecriaMemo.Enabled := false;
end;

procedure TfrmFrenteCaixa.enter_botao(Sender: TObject);
begin
  numeroMesaPdv := (Sender as TBitBtn).Caption;
end;

procedure TfrmFrenteCaixa.Timer1Timer(Sender: TObject);
begin
  inherited;
  //lbHora.Caption := FormatDateTime('HH:MM:SS', now);
end;

procedure TfrmFrenteCaixa.btAcessoDeliveryClick(Sender: TObject);
begin
  inherited;

  if verifica_movimento = false then
  begin
    if dm.verificaPermissaoAcao('I20001003', true, true) = true then
    begin
      Application.createForm(TfrmExpedicaoDelivery, frmExpedicaoDelivery);
      frmExpedicaoDelivery.showmodal();
      frmExpedicaoDelivery.free;
      dm.setTabelaPrecoAtual(0);
      AtualizaNomeTabelaPreco;

    end;
  end
  else
  begin
    dm.exibe_painel_erro('ENCERRE A VENDA EM ANDAMENTO ANTES DE MUDAR DE MÓDULO!', 'OK');
    frm_principal.TrocarOperador := false;
    frmFrenteCaixa.permiteFecharForm := false;
    exit;
  end;

end;

procedure TfrmFrenteCaixa.btCalculadoraClick(Sender: TObject);
begin
  inherited;
  ACBrCalculadora1.Execute;
end;

procedure TfrmFrenteCaixa.B20001003Click(Sender: TObject);
begin
  inherited;
  if (dm.verificaPermissaoAcao((Sender as TBitBtn).Name, true, true) = true) then
  begin
    Application.CreateForm(TfrmPrincipalDelivery, frmPrincipalDelivery);
    frmPrincipalDelivery.showmodal;
    frmPrincipalDelivery.free;

  end;

end;

procedure TfrmFrenteCaixa.CancelamentodeProduto1Click(Sender: TObject);
begin
  inherited;
//  B20002003.Click;
end;

procedure TfrmFrenteCaixa.muda_acao(tipo: integer);
begin
  case tipo of
    1:
      begin
        tipo_cupom := 1;
//         dxstatusbar1.Panels[0].text:=nome_fantasia;
        edTotalProduto.Font.Color := clWhite;
      end;
    2:
      begin
        tipo_cupom := 2;
//         dxstatusbar1.Panels[0].text:=razao_social;
        edTotalProduto.Font.Color := clRed;
      end;

  end;
  ed_cod_produto.Clear;
end;

procedure TfrmFrenteCaixa.Panel17Click(Sender: TObject);
begin
  inherited;
  selecionaItemcombo;
end;

procedure TfrmFrenteCaixa.pisca1Timer(Sender: TObject);
begin
  inherited;
//    pisca1.Enabled:=false;
//    pisca2.Enabled:=true;

end;

procedure TfrmFrenteCaixa.pisca2Timer(Sender: TObject);
begin
  inherited;
//    pisca2.Enabled:=false;
//    pisca1.Enabled:=true;

end;

procedure TfrmFrenteCaixa.pnExpedicaoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmExpedicaoDelivery, frmExpedicaoDelivery);
  frmExpedicaoDelivery.ShowModal;
  frmExpedicaoDelivery.Free;
end;

procedure TfrmFrenteCaixa.imgAtencaoClick(Sender: TObject);
begin
  inherited;
  pnExpedicaoClick(Sender);
end;

procedure TfrmFrenteCaixa.Image1Click(Sender: TObject);
begin
  inherited;
  //ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position + 480;
end;

procedure TfrmFrenteCaixa.Image2Click(Sender: TObject);
begin
  inherited;
//  ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position - 480;
end;

procedure TfrmFrenteCaixa.lbPedidosClick(Sender: TObject);
begin
  inherited;
  pnExpedicaoClick(Sender);
end;

procedure TfrmFrenteCaixa.Label12Click(Sender: TObject);
begin
  inherited;
  pnExpedicaoClick(Sender);
end;

procedure TfrmFrenteCaixa.btMapaMesasClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmMapaMesas, frmMapaMesas);
  frmMapaMesas.showmodal;
  frmMapaMesas.Free;
  numeroMesaPdv := string_auxiliar;
  busca_movimento_da_mesa;

end;

procedure TfrmFrenteCaixa.btObsProdutoClick(Sender: TObject);
var
  idProduto: integer;
begin
  inherited;
  dm.qryMovimentoMesa.Active := true;
  dm.qryMovimentoMesa.Locate('id', VarArrayOf([TImage(Sender).Tag]), [loCaseInsensitive]);
  idProduto := TImage(Sender).Tag;
  strObsProduto := '';
  Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
  frm_obs_lancamento_caixa.memo_obs_complementar.Clear;
  frm_obs_lancamento_caixa.memo_obs_complementar.Lines.Add(dm.qryMovimentoMesa.FieldByName('observacoes').Value);
  frm_obs_lancamento_caixa.ShowModal;
  frm_obs_lancamento_caixa.free;
  dm.atualizaObservacoesProduto(idProduto, strObsProduto);
  dm.qryMovimentoMesa.Active := true;

  strObsProduto := '';
end;

procedure TfrmFrenteCaixa.btOpCaixaClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmOperacoesDeCaixa, frmOperacoesDeCaixa);
  frmOperacoesDeCaixa.ShowModal;
  frmOperacoesDeCaixa.free;

  if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) then
  begin
//    close;
  end;

end;

procedure TfrmFrenteCaixa.SpeedButton1Click(Sender: TObject);
begin
  inherited;

  if dm.qryMapaMesasSalao.Active then
  begin
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
    dm.qryMapaMesasSalao.Prior;
  end;

end;

procedure TfrmFrenteCaixa.JvGradient1Click(Sender: TObject);
begin
  inherited;
  dm.qryMovimentoMesa.Next;
end;

procedure TfrmFrenteCaixa.MakeRounded(Control: TWinControl);
var
  R: TRect;
  Rgn: HRGN;
begin
  with Control do
  begin
    R := ClientRect;
    Rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 20, 20);
    Perform(EM_GETRECT, 0, lParam(@R));
    InflateRect(R, -5, -5);
    Perform(EM_SETRECTNP, 0, lParam(@R));
    SetWindowRgn(Handle, Rgn, True);
    Invalidate;
  end;
end;

procedure TfrmFrenteCaixa.FormCreate(Sender: TObject);
var
  btn: TJvImgBtn;
  topBtn: integer;
  x, x2: integer;
  nm: string;
  pagina: TComponent;
begin
  inherited;
  dm.setTabelaPrecoAtual(0);
  AtualizaNomeTabelaPreco;
  dmFrenteCaixa := TdmFrenteCaixa.Create(self);
  dmFrenteCaixa.qryGruposTouch.Active := true;
  //lf.top := 0;
//self.left := 0;
  numeroMesaPdv := mesaBalcao;
  codigoGarconPdv := '000';
//  criaBotoesTouch();


end;

procedure TfrmFrenteCaixa.FormDestroy(Sender: TObject);
begin
  inherited;
  dm.setTabelaPrecoAtual(0);
  AtualizaNomeTabelaPreco;
  dmFrenteCaixa.qryGruposTouch.Active := false;
  dmFrenteCaixa.qryProdutosTouch.Active := false;
  FreeAndNil(dmFrenteCaixa);
end;

procedure TfrmFrenteCaixa.btpd011Click(Sender: TObject);
var
  x: integer;
  k: word;
  sf: TShiftState;
begin
  inherited;
  k := VK_RETURN;

  x := 0;
  while ((x < ComponentCount - 1)) do
  begin
    if (Components[x] is TEdit) and ((Components[x] as TEdit).Name = 'ed_cod_produto') then
    begin
      (Components[x] as TEdit).Text := Trim(copy((Sender as TJvImgBtn).Name, 4, 10));
             {

             if ( verificaSeProdutoEhPizza(ed_cod_produto.Text,2) = false) then
             begin
              if dm.painelDePergunta(#13#10+'  INFORMAR OBSERVAÇÕES ?'+#13#10+#13#10,25) then
               begin
                  Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
                  frm_obs_lancamento_caixa.ShowModal;
                  frm_obs_lancamento_caixa.free;
               end;
             end;
              }


      if (verificaSeProdutoLeQuantidadeDaBalanca(ed_cod_produto.Text, 2) = false) then
      begin
        ed_numero_mesaExit(ed_cod_produto);
        ed_cod_produtoKeyDown(ed_cod_produto, k, sf);
               // ed_numero_mesaExit(ed_quantidade );
      end
      else
      begin
        if (lerPesoDaBalanca(ed_cod_produto.Text) = true) then
        begin
          ed_numero_mesaExit(ed_cod_produto);
          ed_cod_produtoKeyDown(ed_cod_produto, k, sf);
        end
        else
        begin
          string_auxiliar := 'N';

          pesoLidoBalanca := '0';
          if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Deseja digitar o peso manualmente ?') = teSim) then
          begin
            if dm.verificaPermissaoAcao('I20001012', true, true) = true then
            begin
              Application.CreateForm(TfrmDigitaPesoManualmente, frmDigitaPesoManualmente);
              frmDigitaPesoManualmente.ShowModal;
              frmDigitaPesoManualmente.Free;

              if (StrToFloat(pesoLidoBalanca) <= 0) then
              begin
                exibe_painel_erro('Peso digitado é inválido', 'Ok');
                exit;
              end
              else
              begin
                ed_quantidade.Value := StrToFloat(pesoLidoBalanca);
                ed_cod_produto.SetFocus;
                ed_numero_mesaExit(ed_cod_produto);
                ed_cod_produtoKeyDown(ed_cod_produto, k, sf);
              end;
            end;
          end
          else
          begin
            pesoLidoBalanca := '0';
            Exit;
          end;
        end;

      end;
      ed_quantidade.Value := 1;

    end;
    x := x + 1;
  end;

end;

function TfrmFrenteCaixa.lerPesoDaBalanca(codProduto: string): boolean;
begin
  result := false;
  sucessoLeituraPeso := false;

  case getBalancaLeitura(codProduto, 2) of
    1:
      begin
        try
          begin
            dm.balanca.Ativar;

          end;
        except
          begin
            dm.exibe_painel_erro('Erro ao conectar à balança 01 . Verifique a porta ou cabo de conexão!', 'Continuar');
            result := false;
          end;
        end;

        try
          begin
            dm.balanca.LePeso(200);
            ed_quantidade.Value := StrToFloat(pesoLidoBalanca);
            dm.balanca.Desativar;
          end;
        except
          on E: Exception do
          begin
            exibe_painel_erro(E.Message, '');
            result := false;
            exit;
          end;
        end;
      end;

    2:
      begin
        try
//          dm.balanca2.Ativar;
        except
          begin
            dm.exibe_painel_erro('Erro ao conectar à balança 02 . Verifique a porta ou cabo de conexão!', 'Continuar');
            result := false;
          end;
        end;

        try
          begin
//            dm.balanca2.LePeso(200);

            ed_quantidade.value := StrToFloat(pesoLidoBalanca);
  //          dm.balanca2.Desativar;
          end;
        except
          on E: Exception do
          begin
            exibe_painel_erro(E.Message, '');
            result := false;
            exit;
          end;
        end;
      end;

  end;

  if ed_quantidade.Value <= 0 then
  begin
    exibe_painel_erro('Peso negativo na balança!', 'Ok');
  end;

  if sucessoLeituraPeso then
    result := true
  else
    result := false;
end;

procedure TfrmFrenteCaixa.btgp1Click(Sender: TObject);
var
  indice: integer;
begin
  inherited;
  indice := StrToInt(Trim(copy((Sender as TJvImgBtn).Name, 5, 5)));
//  pgProdutos.ActivePageIndex:=indice-1;
end;

procedure TfrmFrenteCaixa.SpeedButton6Click(Sender: TObject);
begin
  inherited;

  dm.qryMovimentoMesa.First;
{
  dm.qryMovimentoMesa.Prior;
  dm.qryMovimentoMesa.Prior;
  dm.qryMovimentoMesa.Prior;
  dm.qryMovimentoMesa.Prior;
  dm.qryMovimentoMesa.Prior;
  dm.qryMovimentoMesa.Prior;
  dm.qryMovimentoMesa.Prior;
  dm.qryMovimentoMesa.Prior;
  dm.qryMovimentoMesa.Prior;
  dm.qryMovimentoMesa.Prior;
  dm.qryMovimentoMesa.Prior;
  dm.qryMovimentoMesa.Prior;
 }

end;

procedure TfrmFrenteCaixa.SpeedButton7Click(Sender: TObject);
begin
  inherited;

  dm.qryMovimentoMesa.Last;
     {
  dm.qryMovimentoMesa.next;
  dm.qryMovimentoMesa.next;
  dm.qryMovimentoMesa.next;
  dm.qryMovimentoMesa.next;
  dm.qryMovimentoMesa.next;
  dm.qryMovimentoMesa.next;
  dm.qryMovimentoMesa.next;
  dm.qryMovimentoMesa.next;
  dm.qryMovimentoMesa.next;
  dm.qryMovimentoMesa.next;
  dm.qryMovimentoMesa.next;}


end;

procedure TfrmFrenteCaixa.SpeedButton10Click(Sender: TObject);
begin
  inherited;

  dm.qryMovimentoMesa.Prior;

end;

procedure TfrmFrenteCaixa.SpeedButton9Click(Sender: TObject);
begin
  inherited;

  dm.qryMovimentoMesa.next;

end;

procedure TfrmFrenteCaixa.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if dm.qryMapaMesasSalao.Active then
  begin
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;
    dm.qryMapaMesasSalao.Next;

  end;

end;

procedure TfrmFrenteCaixa.btsairClick(Sender: TObject);
begin
  inherited;
  if MessageDlg(' Deseja mesmo sair do sistema ?', mtConfirmation, [MbYes, mbNo], 0) = Mryes then
  begin
    application.Terminate;
  end;

end;

procedure TfrmFrenteCaixa.btSomClick(Sender: TObject);
begin
  inherited;

  pgMovimentoCaixa.Show;
end;

function TfrmFrenteCaixa.verifica_movimento: boolean;
begin
  busca_movimento_da_mesa();
  if dm.qryMovimentoMesa.IsEmpty then
  begin
    result := false;
    exit;
  end;

  result := true;
end;

function TfrmFrenteCaixa.VerificaProblemaNegativo: boolean;
begin

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add(' select * from movimento_mesa mv where mv.cod_mesa=' + Quotedstr(numeroMesaPdv) + ' and  mv.quantidade < 0');
  dm.qryauxiliar.Active := true;
  dm.qryauxiliar.FetchAll;

  if dm.qryauxiliar.IsEmpty = false then
  begin
    dm.exibe_painel_erro('Ocorreu um erro. Existe um ou mais produtos em quantidade negativa. Verifique o problema e entre em contato com a Real Softwares', 'Continuar');
    ////dm.adicionalog('Ocorreu o problema do número negativo');
    result := true;
  end
  else
  begin
    result := false;
  end;

  dm.qryauxiliar.Active := false;

end;

procedure TfrmFrenteCaixa.adicionaProdutoLista(idProduto: largeInt);
var
  AdvPanel1: Tpanel;
  lbDescricaoProduto1: TLabel;
  lbDescontoItem1: Tlabel;
  lbQuantidadeProduto1: TLabel;
  lbValorUnitarioProduto1: TLabel;
  lbX1: TLabel;
  lbTotalProduto1: TLabel;
  btDeleteProduto1: TPngSpeedButton;
// shapeLinha1: TShape;
  btObsProduto1: TPngSpeedButton;
  posicao: integer;
  x: integer;
  cp: TComponent;
  lbOrdem1: TLabel;
begin
  inherited;

  AdvPanel1 := TPanel.Create(ScrollBox1);
  AdvPanel1.Name := 'MOVTOpanProd' + Inttostr(idProduto);
  AdvPanel1.Align := alTop;
  AdvPanel1.Parent := ScrollBox1;
  AdvPanel1.Left := 0;
  AdvPanel1.Top := 5000;
  AdvPanel1.Width := 315;
  AdvPanel1.Height := 75;
  AdvPanel1.BevelOuter := bvNone;
  AdvPanel1.BorderStyle := bsNone;
  AdvPanel1.Color := clWhite;
  AdvPanel1.ParentFont := False;
  AdvPanel1.TabOrder := 0;
  AdvPanel1.UseDockManager := True;
  AdvPanel1.Caption := '';

  AdvPanel1.DoubleBuffered := True;

  AdvPanel1.Visible := true;
  AdvPanel1.Tag := idProduto;

  lbOrdem1 := TLabel.Create(AdvPanel1);
  lbDescricaoProduto1 := TLabel.Create(AdvPanel1);
  lbQuantidadeProduto1 := TLabel.Create(AdvPanel1);
  lbValorUnitarioProduto1 := TLabel.Create(AdvPanel1);
  lbTotalProduto1 := TLabel.Create(AdvPanel1);
//      shapeLinha1              := TShape.Create(AdvPanel1);
  btObsProduto1 := TPngSpeedButton.Create(AdvPanel1);
  btDeleteProduto1 := TPngSpeedButton.Create(AdvPanel1);
  lbX1 := TLabel.Create(AdvPanel1);
  lbDescontoItem1 := TLabel.Create(AdvPanel1);

  lbOrdem1.Name := 'MOVTOlbOrdem' + Inttostr(idProduto);
  lbOrdem1.Parent := AdvPanel1;
  lbOrdem1.Left := 2;
  lbOrdem1.Top := 0;
  lbOrdem1.Width := 24;
  lbOrdem1.Height := 18;
  lbOrdem1.Caption := formatfloat('000', dm.qryMovimentoMesa.recno);
  lbOrdem1.Color := clBtnFace;
  lbOrdem1.ParentColor := False;
  lbOrdem1.ParentFont := False;
  lbOrdem1.Transparent := True;
  lbOrdem1.Font := lbOrdem.Font;
  lbOrdem1.tag := idProduto;

  lbDescricaoProduto1.Name := 'MOVTOlbDescricaoProduto' + Inttostr(idProduto);
  lbDescricaoProduto1.Parent := AdvPanel1;
  lbDescricaoProduto1.Left := 30;
  lbDescricaoProduto1.Top := 0;
  lbDescricaoProduto1.Width := 233;
  lbDescricaoProduto1.Height := 18;
  lbDescricaoProduto1.Caption := dm.qryMovimentoMesa.fieldbyname('descricao').Value;
  lbDescricaoProduto1.Color := clBtnFace;
  lbDescricaoProduto1.ParentColor := False;
  lbDescricaoProduto1.ParentFont := False;
  lbDescricaoProduto1.Transparent := True;
  lbDescricaoProduto1.Font := lbDescricaoProduto.Font;
  lbDescricaoProduto1.Tag := idProduto;

  lbQuantidadeProduto1.Name := 'MOVTOlbQuantidadeProduto' + Inttostr(idProduto);
  lbQuantidadeProduto1.Parent := AdvPanel1;
  lbQuantidadeProduto1.Left := lbQuantidadeProduto.Left;
  lbQuantidadeProduto1.Top := lbQuantidadeProduto.Top;
  lbQuantidadeProduto1.Width := lbQuantidadeProduto.Width;
  lbQuantidadeProduto1.Height := lbQuantidadeProduto.Height;
  lbQuantidadeProduto1.Caption := FormatFloat('###,###,##0.000 ', dm.qryMovimentoMesa.fieldbyname('quantidade').Value);
  lbQuantidadeProduto1.Color := clBtnFace;
  lbQuantidadeProduto1.ParentColor := False;
  lbQuantidadeProduto1.ParentFont := False;
  lbQuantidadeProduto1.Transparent := True;
  lbQuantidadeProduto1.Font := lbQuantidadeProduto.Font;
  lbQuantidadeProduto1.Tag := idProduto;

  lbValorUnitarioProduto1.Name := 'MOVTOlbValorUnitarioProduto' + Inttostr(idProduto);
  lbValorUnitarioProduto1.Parent := AdvPanel1;
  lbValorUnitarioProduto1.Left := lbValorUnitarioProduto.Left;
  lbValorUnitarioProduto1.Top := lbValorUnitarioProduto.Top;
  lbValorUnitarioProduto1.Width := lbValorUnitarioProduto.Width;
  lbValorUnitarioProduto1.Height := lbValorUnitarioProduto.Height;
  lbValorUnitarioProduto1.Caption := FormatFloat('R$ ###,###,##0.00 ', dm.qryMovimentoMesa.fieldbyname('valor_unitario').Value);
  lbValorUnitarioProduto1.Color := clBtnFace;
  lbValorUnitarioProduto1.ParentColor := False;
  lbValorUnitarioProduto1.ParentFont := False;
  lbValorUnitarioProduto1.Transparent := True;
  lbValorUnitarioProduto1.Font := lbValorUnitarioProduto.Font;
  lbValorUnitarioProduto1.Tag := idProduto;

  lbX1.Name := 'MOVTOlbX' + Inttostr(idProduto);
  lbX1.Parent := AdvPanel1;
  lbX1.Left := lbX.Left;
  lbX1.Top := lbX.Top;
  lbX1.Width := lbX.Width;
  lbX1.Height := lbx.Height;
  lbX1.Caption := 'X';
  lbX1.Color := clBtnFace;
  lbX1.ParentColor := False;
  lbX1.ParentFont := False;
  lbX1.Transparent := True;
  lbX1.Font := lbX.Font;
  lbX1.Tag := idProduto;

  lbDescontoItem1.Name := 'MOVTOlbDesconto' + Inttostr(idProduto);
  lbDescontoItem1.Parent := AdvPanel1;
  lbDescontoItem1.Left := lbDescontoItem.Left;
  lbDescontoItem1.Top := lbDescontoItem.Top;
  lbDescontoItem1.Width := lbDescontoItem.Width;
  lbDescontoItem1.Height := lbDescontoItem.Height;

  if dm.qryMovimentoMesa.fieldbyname('desconto').Value > 0 then
    lbDescontoItem1.Caption := '(-' + FormatFloat('R$ ###,###,##0.00 ', dm.qryMovimentoMesa.fieldbyname('desconto').Value) + ')'
  else
    lbDescontoItem1.Caption := '';

  lbDescontoItem1.Color := clBtnFace;
  lbDescontoItem1.Font.Charset := ANSI_CHARSET;
  lbDescontoItem1.Font.Color := clRed;
  lbDescontoItem1.Font.Height := -16;
  lbDescontoItem1.Font.Name := 'Arial';
  lbDescontoItem1.Font.Style := [];
  lbDescontoItem1.ParentColor := False;
  lbDescontoItem1.ParentFont := False;
  lbDescontoItem1.Transparent := True;

  lbTotalProduto1.Name := 'MOVTOlbTotalProduto' + Inttostr(idProduto);
  lbTotalProduto1.Parent := AdvPanel1;
  lbTotalProduto1.Left := lbTotalProduto.Left;
  lbTotalProduto1.Top := lbTotalProduto.Top;
  lbTotalProduto1.Width := lbTotalProduto.Width;
  lbTotalProduto1.Height := lbTotalProduto.Height;
  lbTotalProduto1.Caption := FormatFloat('R$ ###,###,##0.00 ', dm.qryMovimentoMesa.fieldbyname('total').Value);
  lbTotalProduto1.Color := 4099549;
  lbTotalProduto1.ParentColor := False;
  lbTotalProduto1.ParentFont := False;
  lbTotalProduto1.Transparent := True;
  lbTotalProduto1.Font := lbTotalProduto.Font;
  lbTotalProduto1.Tag := idProduto;
  lbTotalProduto1.Alignment := taRightJustify;

  btDeleteProduto1.Name := 'MOVTObtDeleteProduto' + Inttostr(idProduto);
  btDeleteProduto1.Parent := AdvPanel1;
  btDeleteProduto1.Left := 60;
  btDeleteProduto1.Top := 17;
  btDeleteProduto1.Width := 48;
  btDeleteProduto1.Height := 48;
//      btDeleteProduto1.Stretch := True;
  btDeleteProduto1.PngImage := btDeleteProduto.PngImage;
  btDeleteProduto1.Tag := idProduto;
  btDeleteProduto1.OnClick := btDeleteProduto.OnClick;
  btDeleteProduto1.Flat := true;
  btDeleteProduto1.Transparent := true;
  btDeleteProduto1.OnMouseUp := nil;

  btObsProduto1.Name := 'MOVTObtObsProduto' + Inttostr(idProduto);
  btObsProduto1.Parent := AdvPanel1;
  btObsProduto1.Left := 3;
  btObsProduto1.Top := 17;
  btObsProduto1.Width := 48;
  btObsProduto1.Height := 48;
  btObsProduto1.PngImage := btObsProduto.PngImage;
  btObsProduto1.Flat := true;
  btObsProduto1.Transparent := true;

//      btObsProduto1.Stretch := True;
  btObsProduto1.Tag := idProduto;
  btObsProduto1.OnClick := btObsProduto.OnClick;

{
      shapeLinha1.Name := 'MOVTOshapeLinha'+ Inttostr(idProduto);
      shapeLinha1.Parent := AdvPanel1;
      shapeLinha1.Left := 0;
      shapeLinha1.Top := 55;
      shapeLinha1.Width := 316;
      shapeLinha1.Height := 1;
      shapeLinha1.Align := alBottom;
      shapeLinha1.Tag :=idProduto;
      ScrollBox1.VertScrollBar.Position := 5000;
      }

  ScrollBox1.VertScrollBar.Position := 5000;
end;

procedure TfrmFrenteCaixa.fecharConta();
begin
  if verifica_movimento then

  else
  begin
    dm.exibe_painel_erro('Não há produtos registrados!', 'Ok');
    exit;
  end;

  if VerificaProblemaNegativo then
  begin
    exit;
  end;

  Application.CreateForm(Tfrm_encerramento, frm_encerramento);
  frm_encerramento.setTipoVenda(2);
  frm_encerramento.lb_mesa.Caption := numeroMesaPdv;
  frm_encerramento.ShowModal;
  frm_encerramento.free;
  voltar_mesa;
  busca_movimento_da_mesa;
  recriaMemo;
  muda_acao(1);

end;

procedure TfrmFrenteCaixa.btFecharContaClick(Sender: TObject);
begin
  inherited;
  fecharConta();
//  dm.CancelaNotasPendentes();
//  dm.CancelaNotasPendentesPorSubstituicao();
end;

procedure TfrmFrenteCaixa.JvTransparentButton2Click(Sender: TObject);
begin
  inherited;

  if verifica_movimento = false then
  begin
    voltarParaCaixa := 2;
    Application.CreateForm(Tfrm_caixa_restaurante, frm_caixa_restaurante);
    frm_caixa_restaurante.ShowModal;
    frm_caixa_restaurante.Free;
    dm.setTabelaPrecoAtual(0);
    AtualizaNomeTabelaPreco;
  end
  else
  begin
    dm.exibe_painel_erro('ENCERRE A VENDA EM ANDAMENTO ANTES DE MUDAR DE MÓDULO!', 'OK');
    frm_principal.sairDoSistema := false;
    frm_principal.TrocarOperador := false;
  end;

end;

procedure TfrmFrenteCaixa.JvTransparentButton3Click(Sender: TObject);
begin
  inherited;
  dmFrenteCaixa.qryGruposTouch.DisableControls;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.Next;
  dmFrenteCaixa.qryGruposTouch.EnableControls;
end;

procedure TfrmFrenteCaixa.B20002003Click(Sender: TObject);
var
  idProduto: integer;
begin
  inherited;
  permiteFecharForm := true;
  close;

end;

procedure TfrmFrenteCaixa.btOperacoesCaixaClick(Sender: TObject);
begin
  inherited;
  permiteFecharForm := false;
  if verifica_movimento = false then
  begin
    Application.CreateForm(TfrmOperacoesDeCaixa, frmOperacoesDeCaixa);
    frmOperacoesDeCaixa.ShowModal;
    frmOperacoesDeCaixa.free;
    dm.setTabelaPrecoAtual(0);
    AtualizaNomeTabelaPreco;
  end
  else
  begin
    dm.exibe_painel_erro('ENCERRE A VENDA EM ANDAMENTO ANTES DE MUDAR DE MÓDULO!', 'OK');
    frm_principal.TrocarOperador := false;
    frmFrenteCaixa.permiteFecharForm := false;
    exit;
  end;

  if ((verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) or (frm_principal.TrocarOperador = true) or (frm_principal.sairDoSistema = true)) then
  begin
    if verifica_movimento = false then
    begin
      frmFrenteCaixa.permiteFecharForm := true;
      Close;
    end
    else
    begin
      dm.exibe_painel_erro('ENCERRE A VENDA EM ANDAMENTO ANTES DE MUDAR DE MÓDULO!', 'OK');
      frm_principal.TrocarOperador := false;
    end;

    close;
  end;
end;

procedure TfrmFrenteCaixa.btConsultarProdutosClick(Sender: TObject);
begin
  inherited;
  pesquisa_produto;
end;

procedure TfrmFrenteCaixa.btDeleteProdutoClick(Sender: TObject);
var
  idProduto: integer;
begin
  inherited;
  permiteFecharForm := false;
  if (dm.verificaPermissaoAcao('B20002003', true, true) = true) then
  begin
    idProduto := TImage(Sender).Tag;
    dm.qryMovimentoMesa.Active := true;
    dm.qryMovimentoMesa.Locate('id', VarArrayOf([idProduto]), [loCaseInsensitive]);
    apagaItemMovimento(dm.qryMovimentoMesa.FieldByName('quantidade').Value, '0', '0', '');
    timerRecriaMemo.Enabled := true;

  end;

end;

procedure TfrmFrenteCaixa.JvTransparentButton1Click(Sender: TObject);
begin
  inherited;
  dmFrenteCaixa.qryGruposTouch.DisableControls;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;
  dmFrenteCaixa.qryGruposTouch.Prior;

  dmFrenteCaixa.qryGruposTouch.EnableControls;

  {
   if verifica_movimento = false then
     begin
      Application.CreateForm(TfrmMenuFiscal,frmMenuFiscal);
      frmMenuFiscal.ShowModal;
      frmMenuFiscal.free;

     end
   else
    begin
      dm.exibe_painel_erro('ENCERRE A VENDA EM ANDAMENTO ANTES DE MUDAR DE MÓDULO!','OK');
      frm_principal.sairDoSistema  := false;
      frm_principal.TrocarOperador := false;
      exit;

    end;
   }

end;

procedure TfrmFrenteCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
var
  OldValue: LongBool;
begin
  inherited;
  if permiteFecharForm = false then
  begin
    dm.exibe_painel_erro('Não é possível fechar este módulo desta forma. Acesse o menu de operações para sair', 'Ok');
    Action := CaNone;
  end
  else
  begin
//     dm.desabilitaCltrAltDel();

  end;
end;

procedure TfrmFrenteCaixa.ClickSelecaoGrupoCombo(Sender: TObject);
var
  posicaoCodigo: Integer;
  codGrupo: string;
begin
  posicaoCodigo := Pos('_', ((Sender) as TComponent).Name);
  posicaoCodigo := posicaoCodigo + 1;
  codGrupo := trim(copy(((Sender) as TComponent).Name, posicaoCodigo, 5));
  dm.criaGruposCombo(lb_cod_produto.Caption, pnGruposAdicionais, StrToInt(codGrupo), ClickSelecaoGrupoCombo);

end;

procedure TfrmFrenteCaixa.ApplicationMessage(var Msg: TMsg; var Handled: Boolean);
begin

end;

end.

