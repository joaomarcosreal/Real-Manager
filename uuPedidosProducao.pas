
unit uuPedidoDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons,
  cxLookAndFeelPainters, cxLabel, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxColorComboBox,
  cxDBColorComboBox, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxGridBandedTableView, cxGridDBBandedTableView, cxPC, dxfColorButton,
  Mask,   Grids, DBGrids,  cxDBEdit, ibx.ibquery,
  ComCtrls, ImgList, RxMemDS;

type
  TfrmPedidosDelivery = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    pnMovimentoMesa: TPanel;
    Label4: TLabel;
    D30001011: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    descricao_prod: TLabel;
    lb_preco: TLabel;
    lb_cod_produto: TLabel;
    G30001012: TGroupBox;
    Label10: TLabel;
    lbTxServ: TLabel;
    Label19: TLabel;
    ed_valor_bruto: TCurrencyEdit;
    ed_total_tx_serv: TCurrencyEdit;
    ed_total_conta: TCurrencyEdit;
    edTotalDescontos: TCurrencyEdit;
    Panel5: TPanel;
    Panel9: TPanel;
    Label16: TLabel;
    lb_troco: TLabel;
    ed_total_pago: TCurrencyEdit;
    ed_valor_troco: TCurrencyEdit;
    Panel8: TPanel;
    pnUltimosPedidos: TPanel;
    Label8: TLabel;
    pnTopo: TPanel;
    gbProject: TGroupBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    gpTelefone: TGroupBox;
    btPesqCliente: TSpeedButton;
    edTelClienteDelivery: TcxTextEdit;
    cxLabel1: TcxLabel;
    pnProduto: TPanel;
    Label2: TLabel;
    btPesqProdutoCodBarras: TSpeedButton;
    Label3: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Panel12: TPanel;
    edDescricaoProduto: TEdit;
    edCodBarrasProduto: TEdit;
    pnFormasPagamento: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    btPesqFormaPagto: TSpeedButton;
    Label6: TLabel;
    edCodFormaPagamento: TFocusEdit;
    edValorForma: TCurrencyEdit;
    Panel7: TPanel;
    DBGrid1: TDBGrid;
    pnBotoes: TPanel;
    btNovo: TBitBtn;
    btAlterar: TBitBtn;
    btExcluir: TBitBtn;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    btSair: TBitBtn;
    edCodProduto: TEdit;
    edQuantidade: TEdit;
    edValorUnitarioProduto: TEdit;
    edReferenciaCliente: TcxTextEdit;
    edBairroCliente: TcxTextEdit;
    edNomeCliente: TcxTextEdit;
    edReferencia2cliente: TcxTextEdit;
    edComplementoCliente: TcxTextEdit;
    edEnderecoCliente: TcxTextEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid2: TDBGrid;
    ImageList1: TImageList;
    tbFormasPagamentoTemp: TRxMemoryData;
    tbFormasPagamentoTempcodForma: TStringField;
    tbFormasPagamentoTempdescricaoForma: TStringField;
    tbFormasPagamentoTempvalorForma: TCurrencyField;
    tbFormasPagamentoTemprp: TStringField;
    dsFormasPagtoTemp: TDataSource;
    DBGrid4: TDBGrid;
    Panel1: TPanel;
    edDescFormaPagto: TFocusEdit;
    edCodClienteDelivery: TcxTextEdit;
    SpeedButton2: TSpeedButton;
    gpCodPedido: TGroupBox;
    edCodPedido: TcxTextEdit;
    cxLabel2: TcxLabel;
    SpeedButton3: TSpeedButton;
    tbFormasPagamentoTempoperadoraCartao: TStringField;
    tbFormasPagamentoTempnumeroCartao: TStringField;
    tbFormasPagamentoTempvalidadeCartao: TStringField;
    tbFormasPagamentoTempcodigoCartao: TStringField;
    edCelularCliente: TcxTextEdit;
    cxLabel9: TcxLabel;
    edDtNascimento: TcxTextEdit;
    cxLabel10: TcxLabel;
    TabSheet2: TTabSheet;
    DBGrid3: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Edit1Exit(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure D30001011DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure D30001011DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure D30001011KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btNovoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure D30001011MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    evento :  integer;
    retornoForma : boolean;
    valorForma : double;
    ObsDiverso  : string;
    codDiverso  : string;

    procedure controla_botoes (botao : Tbutton);
    procedure retornaDadosDoPedido(codPedido : string);
    procedure retornaInformacoes(codigo : string; filtro : integer);
    function  verifica_validade_lancamento: boolean;
    procedure AdicionarProduto();
    procedure atualizaMovimento();
    procedure limparFilaDeImpressao();
    procedure limpaMesadelivery();
    procedure limpaCampos();
    procedure bloqueiaPaineis();
    procedure desbloqueiaPaineis();
    procedure registraFormaPagto(cod_forma : string ; descricao_forma : string; valor : string; operadoraCartao : string; numeroCartao : string; validadeCartao : string; CodigoCartao : string);
    function  verificaValidadeForma(cod_forma : string) : boolean;
    function  verificaSeFormasPgtoAprovacao() : boolean;
    procedure adicionar_pagamento(cod_diverso : string; obs: string; cod_forma : string; descricao_forma: string; valor : string; operadoraCartao : string; numeroCartao : string; validadeCartao : string; CodigoCartao : string);
    procedure calcula_valores(Sender: TObject);

    procedure setObsDiversa(obs: string);
    function  getObsDiversa() : string;
    function  getCodDiverso() : string;
    procedure setCodDiverso(cod_diverso : string);
    function  getValorFormaPagamento() : double;

    function  getRetornoForma() : boolean;
    procedure setRetornoForma(ret : boolean);
    procedure gravarInformacoes();
    function  verificaValidadeEncerramento() : boolean;
    function  verificaPossibilidadeDeTroco( troco : double) : boolean;
    procedure gravarPagamentos(codigoPedido : string);
    procedure apagarPedido(codPedido : string);
    procedure imprimePedidoLocalProducao(codPedido : string; operacao : smallint);

  public
    { Public declarations }
     soperadoraCartao,snumeroCartao,svalidadeCartao,scodigoCartao : string;
  end;

var
  frmPedidosDelivery: TfrmPedidosDelivery;



implementation

uses uu_data_module, uuSelecaoSabores, uu_obs_lancamento_caixa,
  uu_frm_principal, Math, uu_pagamento_faturado, uu_cad_clientes_delivery,
  UU_DM_RELATORIOS, uuSelecaoSaboresPizza, uuDadosCartaoCredito,
  uuCadObservacaoClienteDelivery;

{$R *.dfm}

procedure TfrmPedidosDelivery.Edit1Exit(Sender: TObject);
begin
  inherited;


  if ((sender is Tedit and ((sender as Tedit).Name = 'edCodBarrasProduto')) ) then
  begin

  if(trim(edCodBarrasProduto.text) <> '') then
   begin
     edQuantidade.text:='1';
   end
  else
   begin
    edQuantidade.Clear;
    exit;
   end;


     try
      begin
        StrToInt(edCodBarrasProduto.text);
        edCodBarrasProduto.Text := FormatFloat('00000', strtofloat(edCodBarrasProduto .Text));
      end;
    except
      begin
      end;
    end;


    if (verificaExistenciaProduto(edCodBarrasProduto.text,2) = false) then
    begin
      ShowMessage('O código informado não pertence a um produto cadastrado!');
      edCodBarrasProduto.SetFocus;
      edCodBarrasProduto.Clear;
      exit;
    end
   else
     begin
       exibeInformacoesProduto(edCodBarrasProduto.text,2);
     end;

  end;

  if (sender is TcxCustomEdit   and ((sender as TcxCustomEdit).Name='edCodPedido')) then
    begin
      if Trim(edCodPedido.text) = '' then exit;
      try
       edCodPedido.text :=FormatFloat('00000000',StrToFloat(edCodPedido.Text));
      except
       begin
         ShowMessage('Código incorreto');
         edCodPedido.clear;
         edCodPedido.SetFocus;

         exit;
       end;
      end;

      if (verificaExistenciaPedidoDelivery(edCodPedido.text) = false) then
       begin
         dm.exibe_painel_erro('Pedido Inexistente!','Tecle enter para continuar..');
         edCodPedido.clear;
         edCodPedido.setfocus;
       end
      else
       begin
         // Retorna dados do pedido
         retornaDadosDoPedido(edCodPedido.Text); 
       end;

    end;




  if (sender is TcxCustomEdit   and ((sender as TcxCustomEdit).Name='edTelClienteDelivery')) then
    begin
      if Trim(edTelClienteDelivery.text) = '' then
       begin
         exit;
       end;
      try
        FormatFloat('00000',StrToFloat(edTelClienteDelivery.text));
      except
       begin
         ShowMessage('Telefone inválido!');
         edTelClienteDelivery.clear;
         edTelClienteDelivery.SetFocus;
         exit;
       end;
      end;

      if ( verificaExistenciaClienteDeliveryPorTelefone(trim(edTelClienteDelivery.Text)) = true)
       then
         begin
           desbloqueiaPaineis();
           retornaInformacoes(edTelClienteDelivery.Text,1);
         end
        else
          begin
            if (MessageDlg('Cliente não cadastrado, deseja cadastrar agora ?',mtConfirmation,[mbYes,mbNo],0) = MrYes) then
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
               btCancelar.Click;
             end;
          end;
    end;


if ((sender is Tedit and ((sender as Tedit).Name = 'edQuantidade'))) then
  begin
     IF  (trim(edQuantidade.text) = '') THEN exit;

    try
      StrToFloat(edQuantidade.Text);
    except
      begin
        showmessage('Quantidade inválida!');
        edQuantidade.SetFocus;
        edQuantidade.clear;
        exit;
      end;
    end;

    if ( StrToFloat(edQuantidade.Text) <= 0 ) then
    begin
        showmessage('Quantidade inválida!');
        edQuantidade.SetFocus;
        edQuantidade.clear;
        exit;
    end;

    If (verifica_validade_lancamento) then
    begin
      AdicionarProduto();
      calcula_valores(self);
    end;

  end;


   if  ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='edValorForma')) and (edValorForma.Value >0 )) then
   begin
     if verificaFormaPagamentoSolicitaDados(edCodFormaPagamento.Text) = false then
        registraFormaPagto(edCodFormaPagamento.Text,edDescFormaPagto.Text,FormatFloat('#0.00',edValorForma.Value),'','','','')
     else
       begin
         soperadoraCartao:=''; snumeroCartao:=''; svalidadeCartao :=''; scodigoCartao :='';
         Application.CreateForm(TfrmDadosCartaoDeCredito,frmDadosCartaoDeCredito);
         frmDadosCartaoDeCredito.showmodal;
         frmDadosCartaoDeCredito.free;
         registraFormaPagto(edCodFormaPagamento.Text,edDescFormaPagto.Text,FormatFloat('#0.00',edValorForma.Value),soperadoraCartao,snumeroCartao,svalidadeCartao,scodigoCartao);
         soperadoraCartao:=''; snumeroCartao:=''; svalidadeCartao :=''; scodigoCartao :='';
       end;
   end;


end;

procedure TfrmPedidosDelivery.retornaInformacoes(codigo : string; filtro : integer);
var
 q : TIBquery;
begin

 q:= TIBQuery.create(self);
 q.Database := dm.dbrestaurante;
 q.Transaction := dm.transacao;




 if filtro = 1 then
  begin
    q.Active:=false;
    q.sql.clear;
    q.sql.add('select c.codigo as cod_cliente, c.*,b.descricao,b.codigo as codBairro from clientes_delivery c inner join bairro b  on (b.codigo = c.cod_bairro) ');
    q.sql.add(' where c.telefone='+Quotedstr(codigo)+' or c.celular='+Quotedstr(codigo));
  end
 else
  begin
    q.Active:=false;
    q.sql.clear;
    q.sql.add(' select  p.codigo,p.cod_cliente, p.hora,  c.*, b.descricao,b.codigo as codBairro from pedidos_delivery  p ');
    q.sql.add('   inner join clientes_delivery c on (c.codigo = p.cod_cliente)');
    q.sql.add('   inner join bairro b on (b.codigo = c.cod_bairro)');
    q.sql.add(' where p.codigo='+Quotedstr(codigo))
  end;

 q.Active:=true;

 edCodClienteDelivery.text := q.fieldbyname('cod_cliente').value;
 edNomeCliente.Text        := q.fieldbyname('nome').value;



 If( q.fieldbyname('descricao').value <> null) then
     edBairroCliente.text      := q.fieldbyname('descricao').value;

 If( q.fieldbyname('endereco').value <> null) then
    edEnderecoCliente.text    := q.fieldbyname('endereco').value;

 If( q.fieldbyname('complemento').value <> null) then
   edComplementoCliente.Text := q.fieldbyname('complemento').value;

 If( q.fieldbyname('referencia1').value <> null) then
  edReferenciaCliente.text  := q.fieldbyname('referencia1').value;

 If( q.fieldbyname('referencia2').value <> null) then
  edReferencia2Cliente.text  := q.fieldbyname('referencia2').value;


 If( q.fieldbyname('celular').value <> null) then
  edCelularCliente.text  := q.fieldbyname('celular').value;

 If( q.fieldbyname('dt_nascimento').value <> null) then
  edDtNascimento.text  := FormatDateTime('DD/MM/YYY', q.fieldbyname('dt_nascimento').value);


 ed_total_tx_serv.value:= getValorTxEntregaBairro(q.fieldbyname('codBairro').value);


 if ((evento=2) or (evento = 3)) then
  begin
     btgravar.Enabled:=true;
  end
 else
  begin
    edCodBarrasProduto.SetFocus;
  end;

/// busca pedidos do cliente

  dm.transacaoAuxiliar.Active:=false;
  dm.transacaoAuxiliar.Active:=true;



  // Query dos pedidos
  dm.qryUltimosPedidosDelivery.Active:=false;
  dm.qryUltimosPedidosDelivery.SQL.clear;
  dm.qryUltimosPedidosDelivery.SQL.add(' select first 5 p.codigo as CodigoPedido, p.data,p.hora,p.valor_entrega, p.valor_total,c' );
  dm.qryUltimosPedidosDelivery.SQL.add(    '.nome_usuario  from pedidos_delivery p');
  dm.qryUltimosPedidosDelivery.SQL.add(    ' inner join caixas c on  (c.codigo =  p.cod_caixa)');
  dm.qryUltimosPedidosDelivery.SQL.add(    ' where p.cod_cliente = '+QuotedStr(edCodClienteDelivery.Text));
  dm.qryUltimosPedidosDelivery.SQL.add(    'order by p.data desc');
  dm.qryUltimosPedidosDelivery.Active:=true;

  dm.qryItensUltimosPedidos.Active:=false;
  dm.qryItensUltimosPedidos.sql.clear;
  dm.qryItensUltimosPedidos.SQL.add(' select it.cod_pedido,p.cod_barras,it.cod_produto, p.descricao, it.quantidade,it.valor_unitario,');
  dm.qryItensUltimosPedidos.SQL.add('        it.observacoes,it.sabores');
  dm.qryItensUltimosPedidos.SQL.add('        from itens_pedido_delivery it');
  dm.qryItensUltimosPedidos.SQL.add('       inner join  produtos p on (p.cod_produto = it.cod_produto)');
  dm.qryItensUltimosPedidos.SQL.add('        where it.cod_pedido =:codigoPedido');

  dm.qryItensUltimosPedidos.Params[0].Value := dm.QryUltimosPedidosDelivery.fieldbyname('codigoPedido').value;
  dm.qryItensUltimosPedidos.Active:=true;



  dm.qryObsClientesDelivery.Active:=false;
  dm.qryObsClientesDelivery.SQL.clear;
  dm.qryObsClientesDelivery.SQL.add('select * from obs_clientes_delivery where cod_cli='+QuotedStr(edCodClienteDelivery.Text)+' and alerta=1 order by data desc');
  dm.qryObsClientesDelivery.Active:=true;
  dm.qryObsClientesDelivery.First;

  while not dm.qryObsClientesDelivery.Eof do
   begin
     dm.exibe_painel_erro(dm.qryObsClientesDelivery.fieldbyname('observacao').value,' Observacão');
     dm.qryObsClientesDelivery.Next;
   end;



  dm.qryObsClientesDelivery.Active:=false;
  dm.qryObsClientesDelivery.SQL.clear;
  dm.qryObsClientesDelivery.SQL.add('select * from obs_clientes_delivery where cod_cli='+QuotedStr(edCodClienteDelivery.Text)+' order by data desc');
  dm.qryObsClientesDelivery.Active:=true;
  dm.qryObsClientesDelivery.First;







////////////////


  Q.Active:=FALSE;
  FreeAndNil(Q);
end;


procedure TfrmPedidosDelivery.btSairClick(Sender: TObject);
begin
  inherited;
  controla_botoes(btSair);
  close;
end;



function TfrmPedidosDelivery.verifica_validade_lancamento: boolean;
begin
  result:=true;

  try
    StrToFloat(edQuantidade.Text);
  except
    begin
      ShowMessage('Quantidade Inválida!');
      edQuantidade.Clear;
      edQuantidade.SetFocus;
      exit;
    end;
  end;


  if (StrToFloat(edQuantidade.text) <=0) then
    begin
      ShowMessage('Quantidade Inválida!');
      edQuantidade.Clear;
      edQuantidade.SetFocus;
      exit;
    end;



  if not (verificaSeProdutoVendeFracionado(edCodBarrasProduto.Text,2) )then
  begin
    try

     StrToInt(edQuantidade.text);
    except
     begin
       ShowMessage('O produto informado não pode ser vendido francionado!');
       edQuantidade.clear;
       edQuantidade.SetFocus;
       Result:=false;
       exit;
     end;
    end;
  end;




  if (verificaExistenciaProduto(edCodBarrasProduto.text,2) = false) then
  begin
    ShowMessage('O código informado não pertence a um produto cadastrado!');
    edCodBarrasProduto.SetFocus;
    edCodBarrasProduto.Clear;
    Result := false;
    exit;
  end;
  Result := true;
end;






procedure TfrmPedidosDelivery.AdicionarProduto();
var
  codigo_lancamento: string;
  observacoesProducao, saboresProducao : string;
  tipoMassa : string;
  idMovimentoMesa : Largeint;
begin


 idMovimentoMesa:=  strToInt(dm.geraCodigo('G_MOVIMENTO_MESA',10));
 if ( verificaSeProdutoEhPizza(edCodBarrasProduto.Text,2) = true) then
  begin
   frm_principal.obsSaborPizza:='';
   frm_Principal.obsLancamento:='';
   dm.tbSaboresPizzaTemp.Active:=false;
   dm.tbSaboresPizzaTemp.EmptyTable;
   Application.CreateForm(TfrmSelecaoSaboresPizza,frmSelecaoSaboresPizza);
   frmSelecaoSaboresPizza.ShowModal;
   frmSelecaoSaboresPizza.Free;

   // Selecionar o valor da pizza escolhida.
   edValorUnitarioProduto.Text :=    FormatFloat('###,###,##0.00',getPrecoPizzaMaisCara(edCodBarrasProduto.Text,2,2));
  end;


  saboresProducao:='';
  tipoMassa:='';

 if ( verificaSeProdutoEhPizza(edCodBarrasProduto.Text,2) = true) then
  begin
    dm.tbSaboresPizzaTemp.First;
    while not dm.tbSaboresPizzaTemp.Eof do
     begin
       saboresProducao:= saboresProducao+dm.tbSaboresPizzaTemptamanho.Value+' '+dm.tbSaboresPizzaTempdescricao.value+#10#13;
       dm.tbSaboresPizzaTemp.Next;
     end;
     observacoesProducao:=  frm_principal.obsSaborPizza;
     tipoMassa := frm_principal.tipoMassaPizza;
  end
 else
  begin
    observacoesProducao := strObsProduto + frm_principal.obsLancamento;
    tipoMassa:='';
  end;

  dm.tbSaboresPizzaTemp.Active:=false;
  dm.tbSaboresPizzaTemp.EmptyTable;




  dm.qryauxiliar.active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('select max(cod_movimento)as novo_cod from movimento_mesa where cod_mesa=' + QuotedStr(mesaDelivery));
  dm.qryauxiliar.Active := true;
  if ((dm.qryauxiliar.IsEmpty) or (dm.qryauxiliar.fieldbyname('novo_cod').IsNull)) then
  begin
    codigo_lancamento := '1';
    codigo_lancamento := FormatFloat('0000', Strtofloat(codigo_lancamento));
  end
  else
  begin
    codigo_lancamento := VarToStr(dm.qryauxiliar.fieldbyname('novo_cod').value);
    codigo_lancamento := IntToStr(StrToInt(codigo_lancamento) + 1);
    codigo_lancamento := FormatFloat('0000', Strtofloat(codigo_lancamento));
  end;

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('insert into movimento_mesa (cod_mesa,cod_garcon,cod_produto,quantidade,cod_movimento,');
  dm.qryauxiliar.sql.add('numero_caixa,cod_usuario,valor_unitario,id,observacoes,sabores,tipo_massa) values (');
  dm.qryauxiliar.sql.add('' + QuotedStr(mesaDelivery ) + ',');
  dm.qryauxiliar.sql.add('' + QuotedStr(garcomDelivery) + ',');
  dm.qryauxiliar.sql.add('' + QuotedStr(edCodProduto.text) + ',');
  dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(edQuantidade.text) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_lancamento) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(numero_caixa) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_usuario) + ',');
  dm.qryauxiliar.SQL.Add('' + dm.TrocaVirgPPto(edValorUnitarioProduto.text)+',');
  dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa)+ ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(observacoesProducao) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(saboresProducao) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(tipoMassa) + ')');


  try
    begin
      dm.qryauxiliar.ExecSQL;
    end;
  except
    begin
      dm.cria_log_de_erros(dm.qryauxiliar.sql, 'Caixa - Restaurante ', 'Erro ao lançar produto no movimento da mesa ', codigo_usuario);
      exit;
    end;
  end;


{
    if dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption) then
     begin
        dm.enviaProdutoParaFilaImpressao(garcomDelivery,edCodBarrasProduto.Text,mesaDelivery,  StrToFloat(edQuantidade.Text),observacoesProducao,saboresProducao,'1',-1,IntToStr(idMovimentoMesa));
     end;
     }


  strObsProduto:='';




  if dm.transacao.Active = false then dm.transacao.Active := true;
  dm.transacao.Commit;

  atualizaMovimento;
  edCodBarrasProduto.clear;
  edValorUnitarioProduto.clear;
  edDescricaoProduto.clear;
  edQuantidade.Clear;
  edCodBarrasProduto.SetFocus;
  edQuantidade.text:='1';
end;



procedure TfrmPedidosDelivery.atualizaMovimento;
begin
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm.qry_movimento_mesa.Active := false;
  dm.qry_movimento_mesa.sql.clear;
  dm.qry_movimento_mesa.SQL.Add('select mv.cod_mesa,pr.cod_barras,');
  dm.qry_movimento_mesa.sql.Add(' mv.cod_produto,pr.cod_produto,');
  dm.qry_movimento_mesa.sql.Add('pr.descricao,mv.quantidade as quantidade,');
  dm.qry_movimento_mesa.sql.Add('mv.valor_unitario,');
  if (arredondamento = 1 ) then
    dm.qry_movimento_mesa.sql.add('udf_truncecf((mv.valor_unitario * mv.quantidade),2) as total')
  else
    dm.qry_movimento_mesa.sql.add('udf_rounddec((mv.valor_unitario * mv.quantidade),2) as total ');

  dm.qry_movimento_mesa.sql.Add(',mv.comanda, mv.cod_garcon, g.apelido,u.login,mv.hora_lancamento, mv.estado,mv.cod_movimento, mv.desconto,id, impresso,observacoes,sabores,tipo_massa');
  dm.qry_movimento_mesa.SQL.Add('  from movimento_mesa mv ');
  dm.qry_movimento_mesa.sql.Add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
  dm.qry_movimento_mesa.sql.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
  dm.qry_movimento_mesa.SQL.add('  inner join usuarios u on (u.cod_usuario=mv.cod_usuario)');
  dm.qry_movimento_mesa.SQL.add('  where mv.cod_mesa=' + Quotedstr(mesaDelivery) + ' order by mv.cod_movimento');
  dm.qry_movimento_mesa.Active := true;

  TFloatField(dm.qry_movimento_mesa.Fields[5]).DisplayFormat := '###,###,##0.000';
  TFloatField(dm.qry_movimento_mesa.Fields[6]).DisplayFormat := 'R$ ###,###,##0.00';
  TFloatField(dm.qry_movimento_mesa.Fields[7]).DisplayFormat := 'R$ ###,###,##0.00';
  D30001011.Columns[0].Visible := false;
  D30001011.Columns[1].Title.Caption := 'Cód.';
  D30001011.Columns[1].Width := 60;
  D30001011.Columns[2].Visible := false;
  D30001011.Columns[3].Visible := false;
  D30001011.Columns[4].Title.Caption := 'Descrição';
  D30001011.Columns[4].Width := 220;
  D30001011.Columns[5].Title.Caption := 'Qtde';
  D30001011.Columns[5].Width := 60;
  D30001011.Columns[6].Title.Caption := 'Preço';
  D30001011.Columns[6].Width := 90;
  D30001011.Columns[7].Title.Caption := 'Total';

  D30001011.Columns[7].Width := 110;
  D30001011.Columns[7].Visible := true;
  D30001011.Columns[8].Title.Caption := 'Comanda';
  D30001011.Columns[8].Width := 60;
  D30001011.Columns[8].Visible := false;

  D30001011.Columns[9].Visible := false;
  D30001011.Columns[10].Visible := false;
  D30001011.Columns[10].Visible := false;
  D30001011.Columns[11].Visible := false;
  D30001011.Columns[12].Visible := false;
  D30001011.Columns[13].Visible := false;
  D30001011.Columns[14].Visible := false;
  D30001011.Columns[15].Title.Caption:='Desconto';
  D30001011.Columns[15].Width := 60;
  D30001011.Columns[15].Visible := false;
  dm.qry_movimento_mesa.First;

  dm.qryauxiliar.Active:=FALSE;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.SQL.add('select * from rodapeextrato('+Quotedstr(mesaDelivery)+','+IntToStr(arredondamento)+',0)');
  dm.qryauxiliar.Active:=true;

//  ed_total_tx_serv.Value := dm.qryauxiliar.fieldbyname('VALORTXSERV').Value;
//  ed_total_tx_serv.Value := 0;
  ed_valor_bruto.Value :=   dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
  edTotalDescontos.Value := 0;//valorDescontos;
  ed_total_conta.Value :=   dm.qryauxiliar.fieldbyname('VALORBRUTO').Value+ed_total_tx_serv.value; 
end;





















procedure TfrmPedidosDelivery.D30001011DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Column.FieldName = 'TOTAL' then
   begin
     D30001011.Canvas.Brush.Color := clblue;
     D30001011.Canvas.Font.Color := clWhite;
     D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;


end;

procedure TfrmPedidosDelivery.D30001011DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
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


procedure TfrmPedidosDelivery.limpaMesadelivery();
var
 q : TIBquery;
begin

 q:= TIBQuery.create(self);
 q.Database := dm.dbrestaurante;
 q.Transaction := dm.transacao;
 q.sql.clear;
 q.sql.add('delete from movimento_mesa where cod_mesa='+Quotedstr(mesaDelivery));
 q.ExecSQL;

 Q.active:=false;
 q.sql.clear;
 q.sql.add('delete from recebimento_parcial where mesa='+Quotedstr(mesaDelivery));
 q.ExecSQL;



 dm.transacao.Commit;
 dm.transacao.Active:=false;
 dm.transacao.Active:=true;

 Q.Active:=false;
 FreeAndNil(q); 

end;




procedure TfrmPedidosDelivery.FormActivate(Sender: TObject);
begin

  inherited;
  Self.Width:=1024;
  Self.Height:=737;
  Self.Top:=1;
  self.Left:=1;
  evento:=1;
  limpaMesadelivery();
  btCancelar.Click;
  btNovo.SetFocus;
end;


procedure TfrmPedidosDelivery .controla_botoes (botao : Tbutton);
begin

  if ((botao = btNovo) or (botao=btAlterar) or (botao=btExcluir)) then
  begin
    btNovo.Enabled:=false;
    btAlterar.Enabled:=false;
    btExcluir.Enabled:=false;
    btCancelar.Enabled:=true;
    if botao = btNovo then
    btGravar.Enabled:=true;
    btSair.Enabled:=false;
    pnTopo.Enabled:=true;

    if evento=1 then
     begin
      gpTelefone.Visible:=true;
      gpTelefone.Top :=9;
      edTelClienteDelivery.SetFocus;
      gpCodPedido.Visible:=false;

     end
    else
     begin
      gpCodPedido.Visible:=true;
      gpCodPedido.Top :=9;
      gpTelefone.Visible:=false;
      edCodPedido.SetFocus;
     end;
  end;

  if botao=btGravar then
  begin

     btNovo.Enabled:=true;
     if btAlterar.Tag = 0 then
     btAlterar.Enabled:=true;

     if btExcluir.Tag = 0 then
       btExcluir.Enabled:=true;

     btGravar.Enabled:=false;
     btCancelar.Enabled:=false;
     btSair.Enabled:=true;
  end;


  if botao= btCancelar then
  begin

     limpaCampos();
     bloqueiaPaineis();
     gpTelefone.Visible:=true;
     gpTelefone.Top :=9;
     gpCodPedido.Visible:=false;


     btNovo.Enabled:=true;
     if btAlterar.Tag = 0 then
       btAlterar.Enabled:=true;


    if btExcluir.Tag = 0 then
       btExcluir.Enabled:=true;

     btCancelar.Enabled:=false;

     btSair.Enabled:=true;
     btGravar.Enabled:=false;

     if btNovo.Visible = true then
     btNovo.SetFocus;
  end;
end;

procedure TfrmPedidosDelivery.btNovoClick(Sender: TObject);
begin
  inherited;
  evento:=1;
  controla_botoes(btNovo);
  limparFilaDeImpressao();
  dm.tbSaboresPizzaTemp.Active:=false;
  dm.tbSaboresPizzaTemp.EmptyTable;
  frm_principal.obsSaborPizza:='';
  frm_principal.obsLancamento:='';

  dm.QryUltimosPedidosDelivery.Active:=false;
  dm.qryItensUltimosPedidos.Active:=false;


end;

procedure TfrmPedidosDelivery.btAlterarClick(Sender: TObject);
begin
 if (dm.verificaPermissaoAcao('B20003001') = true) then
  begin
    inherited;
    evento:=2;
    controla_botoes(btAlterar);
  end;
end;

procedure TfrmPedidosDelivery.btExcluirClick(Sender: TObject);
begin

 if (dm.verificaPermissaoAcao('B20003002') = true) then
  begin
    inherited;
    evento:=3;
    controla_botoes(btExcluir);
  end;
end;

procedure TfrmPedidosDelivery.btGravarClick(Sender: TObject);
var
 acao : string;
begin

   case evento of
    1: acao:='inclusão';
    2: acao:='alteração';
    3: acao:='exclusão';
   end;


  if verificaValidadeEncerramento  then
  begin


    if (MessageDlg('Confirma '+acao+' do Pedido',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
     begin
      gravarInformacoes();
      controla_botoes(btGravar);
      btCancelar.Click;
     inherited;


     end;
  end;
end;

procedure TfrmPedidosDelivery.btCancelarClick(Sender: TObject);
begin
  inherited;
  controla_botoes(btCancelar);
end;

procedure TfrmPedidosDelivery.limpaCampos();
begin
 edTelClienteDelivery.clear;
 edNomeCliente.clear;
 edEnderecoCliente.clear;
 edBairroCliente.clear;
 edComplementoCliente.clear;
 edReferenciaCliente.clear;
 edReferencia2cliente.clear;
 edCodBarrasProduto.clear;
 edCodProduto.clear;
 edQuantidade.clear;
 edCodClienteDelivery.Clear;
 edCodFormaPagamento.clear;
 edDescFormaPagto.clear;
 edValorForma.clear;
 edCodPedido.clear;
 ed_valor_bruto.Value:=0;
 ed_total_tx_serv.value:=0;
 ed_total_pago.value:=0;
 ed_valor_troco.value:=0;
 ed_total_conta.Value:=0;


 limpaMesadelivery;
 limparFilaDeImpressao();
 tbFormasPagamentoTemp.EmptyTable;
 tbFormasPagamentoTemp.Active:=false;
 tbFormasPagamentoTemp.Active:=true;

 dm.ImprimeFilaDeImpressao(false,'',0);
 dm.tbSaboresPizzaTemp.Active:=false;
 dm.tbSaboresPizzaTemp.EmptyTable;
 frm_principal.obsSaborPizza:='';
 frm_principal.obsLancamento:='';

 dm.QryUltimosPedidosDelivery.Active:=false;
 dm.qryItensUltimosPedidos.Active:=false;
 dm.qryObsClientesDelivery.Active:=false;




end;



procedure TfrmPedidosDelivery.desbloqueiaPaineis();
begin
 pnTopo.Enabled:=true;
 pnMovimentoMesa.Enabled:=true;
 pnProduto.Enabled:=true;
 pnUltimosPedidos.Enabled:=true;
 pnFormasPagamento.Enabled:=true;

end;


procedure TfrmPedidosDelivery.bloqueiaPaineis();
begin
 pnTopo.Enabled:=false;
 pnMovimentoMesa.Enabled:=false;
 pnProduto.Enabled:=false;
 pnUltimosPedidos.Enabled:=false;
 pnFormasPagamento.Enabled:=false;
end;



function TfrmPedidosDelivery.verificaValidadeForma(cod_forma : string) : boolean;
begin
     try
       cod_forma:=FormatFloat('00',StrToFloat(cod_forma))
     except
       begin
         ShowMessage('Código de forma de pagamento inválido!');
         edCodFormaPagamento.Clear;
         edCodFormaPagamento.SetFocus;
         result:=false;
         exit;
       end;
     end;

    if((ed_total_pago.value) >= (ed_total_conta.value)) then
     begin
       dm.exibe_painel_erro('Valor pago já excedeu o total da conta!','Tecle enter para continuar');
       result:=false;
       exit;
     end;
  result:=true;
end;




procedure TfrmPedidosDelivery.registraFormaPagto(cod_forma : string ; descricao_forma : string; valor : string; operadoraCartao : string; numeroCartao : string; validadeCartao : string; CodigoCartao : string);
var
 tipoForma : integer;
begin
 if (verificaValidadeForma(cod_forma) = true) then
  begin

    setRetornoForma(false);

    setCodDiverso('');
    setObsDiversa('');

    tipoForma:=dm.verificaTipoFormaPagamento(cod_forma);
    if (tipoForma <> 1) then
     begin
       case tipoForma of
        2: begin    // Registra Fatura  - Abre tela de consulta de clientes para informar o cliente
             Application.CreateForm(Tfrm_pagamento_faturado,frm_pagamento_faturado);
             frm_pagamento_faturado.ShowModal;
             frm_pagamento_faturado.Free;

             if (getRetornoForma() = true ) then
              begin
               adicionar_pagamento(getCodDiverso,'',cod_forma,descricao_forma, valor,operadoraCartao,numeroCartao ,validadeCartao,CodigoCartao );
              end
             else
              begin
                setCodDiverso('');
                setObsDiversa('');
                edCodFormaPagamento.SetFocus;
                edCodFormaPagamento.clear;
              end;
           end;
       end;


     end
    else
     begin
       adicionar_pagamento('','',cod_forma,descricao_forma,valor,operadoraCartao,numeroCartao ,validadeCartao,CodigoCartao );
     end;
     calcula_valores(edValorForma);
  end;

end;



procedure TfrmPedidosDelivery .setRetornoForma(ret : boolean);
begin
  self.retornoForma :=ret;
end;



function  TfrmPedidosDelivery.getRetornoForma() : boolean;
begin
  result := self.retornoForma;

  end;



function TfrmPedidosDelivery.getValorFormaPagamento() : double;
begin
  valorForma:=edValorForma.Value;
  result:=valorForma;
end;

procedure TfrmPedidosDelivery.setCodDiverso(cod_diverso : string);
begin
  self.codDiverso := cod_diverso;
end;

function TfrmPedidosDelivery.getCodDiverso() : string;
begin
  result:= self.codDiverso;
end;

procedure TfrmPedidosDelivery.setObsDiversa(obs: string);
begin
  self.ObsDiverso := obs;
end;

function TfrmPedidosDelivery.getObsDiversa() : string;
begin
 Result:= Self.ObsDiverso;
end;













procedure TfrmPedidosDelivery.adicionar_pagamento(cod_diverso : string; obs: string; cod_forma : string; descricao_forma: string; valor : string ;operadoraCartao : string; numeroCartao : string; validadeCartao : string; CodigoCartao : string);
var
 q : TIBQuery;
 rp : string;
begin
  q :=  TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.sql.clear;
  q.sql.add('select rp from formas_pagamento where cod_forma='+Quotedstr(cod_forma));
  q.Active:=true;
  rp:= q.fieldbyname('rp').value;
  q.Active :=false;
  FreeAndNil(q);

  if not tbFormasPagamentoTemp.Locate('codForma',cod_forma,[]) then
   begin
    tbFormasPagamentoTemp.Append;
    tbFormasPagamentoTempcodForma.Value:=cod_forma;
    tbFormasPagamentoTempdescricaoForma.value:= descricao_forma;
    tbFormasPagamentoTempvalorForma.value := StrToFloat(valor);
    tbFormasPagamentoTemprp.Value :=rp;
    tbFormasPagamentoTempoperadoraCartao.Value := operadoraCartao;
    tbFormasPagamentoTempnumeroCartao.Value :=  numeroCartao;
    tbFormasPagamentoTempvalidadeCartao.Value := validadeCartao;
    tbFormasPagamentoTempcodigoCartao.value := CodigoCartao; 

    tbFormasPagamentoTemp.Post;

   end
  else
    begin
      tbFormasPagamentoTemp.Edit;
      tbFormasPagamentoTempvalorForma.value := tbFormasPagamentoTempvalorForma.Value + StrToFloat(valor);
      tbFormasPagamentoTemp.Post;
    end;

//  memo_cod_diversos_formas_pgto.Lines.Add(getCodDiverso);
//  memo_obs_diversas.Lines.Add(getObsDiversa);
//  setObsDiversa('');
//  setCodDiverso('');

  ed_total_pago.Value:=StrToFloat(valor)+ed_total_pago.Value;
  ed_valor_troco.Value:=ed_total_pago.Value-ed_total_conta.value;
  edCodFormaPagamento .clear;
  edDescFormaPagto.Clear;
  edCodFormaPagamento.SetFocus;
  edValorForma .value:= ed_total_conta.value-ed_total_pago.Value;

end;








procedure TfrmPedidosDelivery.calcula_valores(Sender: TObject);
begin

   if ed_total_pago.value < ed_total_conta.value then
    edValorForma.value := ed_total_conta.Value - ed_total_pago.Value
   else
    begin
      edValorForma.value :=0;
    end;


   ed_total_conta.Value:=(ed_valor_bruto.value+ed_total_tx_serv.value);
   ed_valor_troco.Value := ed_total_pago.Value - ed_total_conta.Value;
end;




procedure TfrmPedidosDelivery.gravarInformacoes();
var
 codigoPedido : string;
 Q : TIBQuery;
 aprovarPedido : boolean;
 statusPedido : smallint;
 alterado : smallint;
begin
  q := TIBQuery.create(self);
  Q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  Q.Active  :=false;

 if (evento = 1 ) then
  begin
    codigoPedido := dm.geraCodigo('G_PEDIDOS_DELIVERY',8 );
    alterado:=0;
  end
 else
  begin
    codigoPedido := edCodPedido.text;  // Pegar o código do pedido;
    alterado:=1;
  end;


 apagarPedido(codigoPedido);
 if ( (evento =1) or (evento =2 ) ) then
  begin

    if ( verificaSeFormasPgtoAprovacao = true) then
      begin
        statusPedido := 0; // Estado de aguardando liberção de pagamento
      end
    else
     begin
      statusPedido := 1; // Estado de preparo
     end;

    Q.SQL.clear;
    q.sql.add('insert into pedidos_delivery (  CODIGO,COD_CLIENTE,DATA,VALOR_BRUTO,VALOR_DESCONTO,VALOR_ENTREGA,');
    q.sql.add('VALOR_TOTAL,TOTAL_PAGO,VALOR_TROCO,COD_USUARIO,NUMERO_CAIXA,COD_CAIXA,status,alterado)  values (');
    q.sql.add(''+Quotedstr(codigoPedido)+',');
    q.sql.add(''+Quotedstr(edCodClienteDelivery.text)+',');
    q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
    q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(ed_valor_bruto.Value))+',');
    q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(0))+',');
    q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(ed_total_tx_serv.value))+',');
    q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(ed_total_conta.value))+',');
    q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(ed_total_pago.value))+',');
    q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(ed_valor_troco.value))+',');
    q.sql.add(''+Quotedstr(getCodOperadorCaixa(ultimoCaixaAberto)  )+',');
    q.sql.add(''+Quotedstr(numero_caixa)+',');
    q.sql.add(''+Quotedstr(ultimoCaixaAberto)+','
    +IntToStr(statusPedido)+','
    +IntToStr(alterado)+')');
    try
      begin
        q.ExecSQL;
      end;
    except
      begin
        dm.cria_log_de_erros(q.sql, 'Caixa - Restaurante ', 'Erro ao  gravar pedido do delivery ', codigo_usuario);
        exit;
      end;
    end;

    q.Active:=false;
    q.sql.Clear;
    q.sql.add(' insert into itens_pedido_delivery  (cod_pedido,cod_produto,cod_garcon,cod_movimento,numero_caixa,');
    q.sql.add('                                       quantidade, total, cod_usuario, hora_lancamento,');
    q.sql.add('                                       hora_entrega, estado, desconto, valor_unitario, obs, id,impresso,observacoes,sabores,tipo_massa)');
    q.sql.add('            select '+Quotedstr(codigoPedido)+',mv.cod_produto,mv.cod_garcon,mv.cod_movimento,mv.numero_caixa,');
    q.sql.add('                                      mv.quantidade, mv.total, mv.cod_usuario, mv.hora_lancamento,');
    q.sql.add('                                       mv.hora_entrega, mv.estado, mv.desconto, mv.valor_unitario, mv.obs,mv.id,mv.impresso,mv.observacoes,mv.sabores,tipo_massa ');
    q.sql.add('                                       from movimento_mesa mv where mv.cod_mesa='+Quotedstr(mesaDelivery));
    try
      begin
        q.ExecSQL;
      end;
    except
      begin
        dm.cria_log_de_erros(q.sql, 'Caixa - Restaurante ', 'Erro ao  gravar itens do pedido do delivery ', codigo_usuario);
        exit;
      end;
    end;
    gravarPagamentos(codigoPedido);
//    dm.imprimePreContaECF(mesaDelivery,marca_impressora_fiscal,0,1,ed_valor_bruto.value,0,0,0,0,ed_total_conta.value, ed_total_pago.value, ed_valor_troco.Value,codigoPedido,ed_total_tx_serv.Value);


   if (statusPedido = 1  ) then
   begin
    imprimePedidoLocalProducao(codigoPedido,evento);
    try
     begin
       dm.imprimePreConta(mesaDelivery, marca_impressora_fiscal,1,1,
       ed_valor_bruto.Value,0,0,0, 0,ed_total_conta.Value,0,ed_valor_troco.value,codigoPedido,ed_total_tx_serv.value,codigoPedido,'','' );
     end;
    except
      begin
       dm.exibe_painel_erro('Erro ao imprimir o comprovante no ECF. Efetue a reimpressão do comprovante, clicando em alterar o pedido e confirmar novamente.','Tecle enter para continuar..');
      end;
    end;
   end;
  end

  else // Exclusão do pedido.
   begin
     imprimePedidoLocalProducao(codigoPedido,evento);
   end;

    case evento of
     1: begin
         dm.exibe_painel_erro('Pedido foi incluído com sucesso!','Tecle enter...');
        end;

     2: begin
         dm.exibe_painel_erro('Pedido foi alterado com sucesso!','Tecle enter...');
        end;

     3: begin
         dm.exibe_painel_erro('Pedido excluído com sucesso!','Tecle enter...');
        end;
    end;



  if dm.transacao.Active = false then   dm.transacao.Active:=true;
  dm.transacao.Commit;
  dm.transacao.Active:=false;

end;






function TfrmPedidosDelivery.verificaPossibilidadeDeTroco( troco : double) : boolean;
var
  linhas,linhaAtual : integer;
  totalFormasPermitidas : double;
begin
 totalFormasPermitidas :=0;
  tbFormasPagamentoTemp.First;
  while not (tbFormasPagamentoTemp.Eof  ) do
   begin
     if ( getPermissaoDeTroco(tbFormasPagamentoTempcodForma.value) = true) then
      totalFormasPermitidas:= totalFormasPermitidas + tbFormasPagamentoTempvalorForma.Value;
     tbFormasPagamentoTemp.Next;
   end;

  if ( (totalFormasPermitidas - troco) >= 0) then
    Result:=true
  else
    Result:=false;
end;

function TfrmPedidosDelivery.verificaValidadeEncerramento() : boolean;
begin
  if ed_total_pago.Value < ed_total_conta.value then
  begin
    dm.exibe_painel_erro('Valor pago é inferior ao total da conta','Tecle enter para continuar...'); 
    calcula_valores(ed_total_conta );
    edValorForma.SetFocus;
    result:=false;
    Exit;
  end;


   if ( verificaPossibilidadeDeTroco(ed_valor_troco.Value) = false ) then
    begin
   {   Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
        frm_confirma_extrato.setTitulo('Confirmação');
      frm_confirma_extrato.setMensagem('Não há total disponível para troco nas formas de pagamento informadas! '+#13#10+#13#10+' O valor excedente é repique ?');
      frm_confirma_extrato.ShowModal;
      frm_confirma_extrato.free;
      if string_auxiliar = 'S' then
       begin
         edTotalRepique.Value:= ed_valor_troco.Value;
         calcula_valores(edTotalRepique);
         Result:=true;
       end
      else
       begin
         dm.exibe_painel_erro('O encerramento não pode ser efetuado pois não há valor suficiente para o troco da venda!','OK');
         Result:=false;
         exit;
       end;
       }
       dm.exibe_painel_erro('O encerramento não pode ser efetuado pois não há valor suficiente para o troco da venda nas formas de pagamento especificadas (O REPIQUE NÃO É PERMITIDO)!','OK');
       edCodFormaPagamento.SetFocus;
       Result:=false;
       exit;
    end;
  result:=true;
end;




procedure TfrmPedidosDelivery.gravarPagamentos(codigoPedido : string);
var
 valor_recebido : double;
begin
  tbFormasPagamentoTemp.First;
   while not tbFormasPagamentoTemp.Eof  do
     begin
       valor_recebido:=0;
       valor_recebido:= tbFormasPagamentoTempvalorForma.Value;
//       if  tbFormasPagamentoTempcodForma.value = '001' then
//          valor_recebido:=valor_recebido-ed_valor_troco.Value;
  {
        case   dm.verificaTipoFormaPagamento(tbFormasPagamentoTempcodForma.value  ) of
          1: begin
             end;
          2: begin
//               dm.gerarFatura(trim(memo_cod_diversos_formas_pgto.lines[linha_atual]),codigo_venda,valor_recebido,Trim(memo_obs_diversas.Lines[linha_atual]));
             end;
        end;
   }

        dm.qryauxiliar.active:=false;
        dm.qryauxiliar.sql.clear;
        dm.qryauxiliar.sql.add('insert into recebimentos_delivery (cod_pedido,cod_forma,valor,data,cod_usuario,numero_caixa,processado,cod_caixa,operadoracartao,numerocartao,validadecartao,codigocartao) values (');
        dm.qryauxiliar.SQL.add(''+QUotedstr(codigoPedido)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(tbFormasPagamentoTempcodForma.value)+',');
        dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(Floattostr(valor_recebido))+',');
        dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(getCodOperadorCaixa(ultimoCaixaAberto))+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(numero_caixa)+',0,');
        dm.qryauxiliar.sql.add(''+QuotedStr(ultimoCaixaAberto)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(tbFormasPagamentoTempoperadoraCartao.value)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(tbFormasPagamentoTempnumeroCartao.value)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(tbFormasPagamentoTempvalidadeCartao.value)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(tbFormasPagamentoTempcodigoCartao.value)+')');

        try
          begin
            dm.qryauxiliar.ExecSQL;
          end;

        except
          begin
            ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
            dm.cria_log_de_erros(dm.qryauxiliar.sql,'Módulo de caixa','Erro ao gravar forma de pagamento',codigo_usuario);
            exit;
          end;
        end;
        tbFormasPagamentoTemp.Next;
  end;
end;




procedure TfrmPedidosDelivery.apagarPedido(codPedido : string);
var
 codigoPedido : string;
 Q : TIBQuery;
begin
  q := TIBQuery.create(self);
  Q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  Q.Active  :=false;

  q.SQL.clear;
  q.sql.add('delete from pedidos_delivery where codigo='+Quotedstr(codPedido));
  q.ExecSQL;

  q.SQL.clear;
  q.sql.add('delete from itens_pedido_delivery where cod_pedido='+Quotedstr(codPedido));
  q.ExecSQL;

  q.SQL.clear;
  q.sql.add('delete from recebimentos_delivery where cod_pedido='+Quotedstr(codPedido));
  q.ExecSQL;

  Q.Active:=false;
  FreeAndNil(q);
end;
procedure TfrmPedidosDelivery.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  tbFormasPagamentoTemp.Active:=false;
  tbFormasPagamentoTemp.EmptyTable;
  tbFormasPagamentoTemp.Active:=true;
  ed_total_pago.value:=0;
  calcula_valores(sender);
end;




procedure TfrmPedidosDelivery.retornaDadosDoPedido(codPedido : string);
var
 codigoPedido : string;
 Q : TIBQuery;
 valor : string;
begin

  q := TIBQuery.create(self);
  Q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  Q.Active  :=false;
  retornaInformacoes(edCodPedido.text, 2);
  q.Active:=false;

  q.sql.clear;
  q.sql.add('delete from movimento_mesa where cod_mesa='+Quotedstr(mesaDelivery));
  Q.ExecSQL;


  q.sql.Clear;
  q.sql.add(' insert into movimento_mesa  (cod_mesa,cod_produto,cod_garcon,cod_movimento,numero_caixa,');
  q.sql.add('                                       quantidade, total, cod_usuario, hora_lancamento,');
  q.sql.add('                                       hora_entrega, estado, desconto, valor_unitario, obs, id,impresso,observacoes,sabores,tipo_massa)');
  q.sql.add('            select '+Quotedstr(mesaDelivery)+',mv.cod_produto,mv.cod_garcon,mv.cod_movimento,mv.numero_caixa, ');
  q.sql.add('                                      mv.quantidade, mv.total, mv.cod_usuario, mv.hora_lancamento,');
  q.sql.add('                                       mv.hora_entrega, mv.estado, mv.desconto, mv.valor_unitario, mv.obs,mv.id,mv.impresso,mv.observacoes,mv.sabores,tipo_massa');
  q.sql.add('                                       from itens_pedido_delivery mv where mv.cod_pedido='+Quotedstr(codPedido));
  try
   begin
    q.ExecSQL;
   end;
  except
      begin
        dm.cria_log_de_erros(q.sql, 'Caixa - Restaurante ', 'Erro ao  gravar itens do pedido do delivery ', codigo_usuario);
        exit;
      end;
  end;

  dm.transacao.Commit;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  atualizaMovimento;
  desbloqueiaPaineis;


  q.Active:=false;
  q.SQL.clear;
  q.sql.Add('select r.*,f.descricao from recebimentos_delivery r ');
  q.sql.add(' inner join formas_pagamento f on (f.cod_forma = r.cod_forma)');
  q.SQL.add('where r.cod_pedido='+Quotedstr(codPedido));
  q.sql.add(' order by r.cod_forma');
  q.Active:=true;
  q.first;

  while not q.eof do
   begin
     valor:= formatfloat('#0.00',q.fieldbyname('valor').value);
     registraFormaPagto(q.fieldbyname('cod_forma').value,q.fieldbyname('descricao').value,valor,q.fieldbyname('operadoracartao').value  ,q.fieldbyname('numerocartao').value,q.fieldbyname('validadecartao').value,q.fieldbyname('codigocartao').value);
     calcula_valores(ed_total_conta);
     q.Next;
   end;

  if (evento = 2) then
   begin
     desbloqueiaPaineis;
     edCodBarrasProduto.setfocus;
   end
  else
   begin
    bloqueiaPaineis;
    btGravar.SetFocus;
   end;


   if ( (evento=2) or (evento=3) )then
    begin
      if (verificaStatusPedidoDelivery(codPedido) = 3) then
       begin
          dm.exibe_painel_erro('Este pedido não pode ser alterado e nem excluído, pois já foi recebido!','enter para continuar...');
          bloqueiaPaineis;
          btGravar.Enabled:=false;
          btCancelar.setfocus;
       end;
    end;
end;

procedure TfrmPedidosDelivery.D30001011KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  q : Tibquery;
begin
  inherited;
  q := TIBQuery.Create(Self);
  q.database := dm.dbrestaurante;
  q.Transaction := dm.transacao;

  if key = vk_delete then
   begin
     if (MessageDlg('Confirma a exclusão do produto selecionado ?', mtConfirmation, [mbYes,mbNo],0) = mrYes ) then
      begin
        q.SQL.Add('delete from movimento_mesa where id='+IntTostr(dm.qry_movimento_mesa.fieldbyname('id').value));
        q.ExecSQL;

        q.sql.clear;
        q.sql.add('delete from fila_de_impressao where id_movimento_mesa='+IntTostr(dm.qry_movimento_mesa.fieldbyname('id').value));
        q.execsql;

        dm.transacao.Commit;
        dm.transacao.Active:=false;
        dm.transacao.Active:=true;
        atualizaMovimento;
        calcula_valores(sender);

      end;
   end;
  q.Active:=false;
  FreeAndNil(q);
end;

procedure TfrmPedidosDelivery.btNovoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_escape then btSair.Click;
end;

procedure TfrmPedidosDelivery.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 {
 if qUltimosPedidos.RecNo mod 2 = 1 then
     DBGrid4.Canvas.Brush.Color := clBlue
 else
     DBGrid4.Canvas.Brush.Color := clWhite;

     DBGrid4.DefaultDrawColumnCell(Rect, DataCol, Column, State);}


if odd(dm_relatorios.qryItensPedidoDelivery.RecNo) then
DBGrid4.Canvas.Brush.Color:= clwhite
else
DBGrid4.Canvas.Brush.Color:= clMoneyGreen;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
     {
if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin
Brush.Color := clmoneygreen;
FillRect(Rect);
Font.Style := [fsbold]
end;
      }
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);



end;

procedure TfrmPedidosDelivery.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

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

end;

procedure TfrmPedidosDelivery.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = 79) then
  begin
    frm_principal.obsLancamento:='';
    Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
    frm_obs_lancamento_caixa.ShowModal;
    frm_obs_lancamento_caixa.free;
  END;

end;

procedure TfrmPedidosDelivery.D30001011MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ((dm.qry_movimento_mesa.Active) and (dm.qry_movimento_mesa.IsEmpty = false)) then
  begin
    try
      begin
        D30001011.Hint :=
          #13 + 'Produto: ' + dm.qry_movimento_mesa.fieldbyname('descricao').AsString +
          #13 +  dm.qry_movimento_mesa.fieldbyname('tipo_massa').AsString +
          #13 + 'Quantidade: ' + FormatFloat('###,###,##0.000',dm.qry_movimento_mesa.fieldbyname('quantidade').Value) +
          #13+#13 + 'Sabores :'+#13+ dm.qry_movimento_mesa.fieldbyname('sabores').AsString+
          #13+#13+ 'Obs :'+#13+ dm.qry_movimento_mesa.fieldbyname('observacoes').AsString;
      end;
    except
    end;           end;

end;




procedure TfrmPedidosDelivery.limparFilaDeImpressao();
var
 q : TIBquery;
begin
 q:= TIBQuery.create(self);
 q.Database := dm.dbrestaurante;
 q.Transaction := dm.transacao;
 dm.transacao.Active:=false;
// dm.transacao.Active:=true;
 dm.transacao.StartTransaction;
 q.SQL.Clear;
 q.SQL.add('delete from fila_de_impressao where mesa='+Quotedstr(mesaDelivery));
 q.ExecSQL;
 dm.transacao.Commit;
end;



function TfrmPedidosDelivery.verificaSeFormasPgtoAprovacao() : boolean;
begin
  tbFormasPagamentoTemp.First;
  Result:=false;
  while not tbFormasPagamentoTemp.Eof do
  begin
    if ( verificaFormaPagamentoSolicitaDados(tbFormasPagamentoTempcodForma.Text) = true ) then
     begin
       Result:=true;
       exit;
     end;
     tbFormasPagamentoTemp.Next;
  end;

end;


procedure TfrmPedidosDelivery.imprimePedidoLocalProducao(codPedido : string; operacao : smallint);
begin
//  limparFilaDeImpressao();
  dm.qry_movimento_mesa.Active := false;
  dm.qry_movimento_mesa.sql.clear;
  dm.qry_movimento_mesa.SQL.Add('select mv.cod_mesa,pr.cod_barras,');
  dm.qry_movimento_mesa.sql.Add(' mv.cod_produto,pr.cod_produto,');
  dm.qry_movimento_mesa.sql.Add('pr.descricao,mv.quantidade as quantidade,');
  dm.qry_movimento_mesa.sql.Add('mv.valor_unitario,');
  if (arredondamento = 1 ) then
    dm.qry_movimento_mesa.sql.add('udf_truncecf((mv.valor_unitario * mv.quantidade),2) as total')
  else
    dm.qry_movimento_mesa.sql.add('udf_rounddec((mv.valor_unitario * mv.quantidade),2) as total ');

  dm.qry_movimento_mesa.sql.Add(',mv.comanda, mv.cod_garcon, g.apelido,u.login,mv.hora_lancamento, mv.estado,mv.cod_movimento, mv.desconto,id, impresso,observacoes,sabores,tipo_massa');
  dm.qry_movimento_mesa.SQL.Add('  from movimento_mesa mv ');
  dm.qry_movimento_mesa.sql.Add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
  dm.qry_movimento_mesa.sql.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
  dm.qry_movimento_mesa.SQL.add('  inner join usuarios u on (u.cod_usuario=mv.cod_usuario)');
  dm.qry_movimento_mesa.SQL.add('  where mv.cod_mesa=' + Quotedstr(mesaDelivery) + ' order by mv.cod_movimento');
  dm.qry_movimento_mesa.Active := true;

  dm.qry_movimento_mesa.First;
  while not dm.qry_movimento_mesa.Eof do
   begin
    if dm.verificaProdutoImprimeLocalProducao(dm.qry_movimento_mesa.fieldbyname('cod_produto').value) then
    begin
         dm.enviaProdutoParaFilaImpressao(garcomDelivery,
         dm.qry_movimento_mesa.fieldbyname('cod_barras').value,
         mesaDelivery,
         dm.qry_movimento_mesa.fieldbyname('quantidade').value,
         dm.qry_movimento_mesa.fieldbyname('observacoes').value,
         dm.qry_movimento_mesa.fieldbyname('sabores').value,
         '1',-1,
         IntToStr(dm.qry_movimento_mesa.fieldbyname('id').value),
         dm.qry_movimento_mesa.fieldbyname('tipo_massa').value,
         );
    end;


    dm.qry_movimento_mesa.Next;
   end;
   dm.ImprimeFilaDeImpressao(True,codPedido,operacao);
end;


procedure TfrmPedidosDelivery.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  dm.qryItensUltimosPedidos.Active:=false;
  dm.qryItensUltimosPedidos.sql.clear;
  dm.qryItensUltimosPedidos.SQL.add(' select it.cod_pedido,p.cod_barras,it.cod_produto, p.descricao, it.quantidade,it.valor_unitario,');
  dm.qryItensUltimosPedidos.SQL.add('        it.observacoes,it.sabores');
  dm.qryItensUltimosPedidos.SQL.add('        from itens_pedido_delivery it');
  dm.qryItensUltimosPedidos.SQL.add('       inner join  produtos p on (p.cod_produto = it.cod_produto)');
  dm.qryItensUltimosPedidos.SQL.add('        where it.cod_pedido =:codigoPedido');

  dm.qryItensUltimosPedidos.Params[0].Value := dm.QryUltimosPedidosDelivery.fieldbyname('codigoPedido').value;
  dm.qryItensUltimosPedidos.Active:=true;


end;

procedure TfrmPedidosDelivery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 dm.QryUltimosPedidosDelivery.Active:=false;
 dm.qryItensUltimosPedidos.Active:=false;

end;

procedure TfrmPedidosDelivery.DBGrid4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ((dm.qryItensUltimosPedidos.Active) and (dm.qryItensUltimosPedidos.IsEmpty = false)) then
  begin
    try
      begin
        DBGrid4.Hint :=
          #13 + 'Produto: ' + dm.qryItensUltimosPedidos.fieldbyname('descricao').AsString +
          #13 + 'Quantidade: ' + FormatFloat('###,###,##0.000',dm.qryItensUltimosPedidos.fieldbyname('quantidade').Value) +
          #13+#13 + 'Sabores :'+#13+ dm.qryItensUltimosPedidos.fieldbyname('sabores').AsString+
          #13+#13+ 'Obs :'+#13+ dm.qryItensUltimosPedidos.fieldbyname('observacoes').AsString;
      end;
    except
    end;           end;

end;

procedure TfrmPedidosDelivery.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_f3 then
   begin
    Application.createForm(TfrmCadClientesDelivery, frmCadClientesDelivery);
    frmCadClientesDelivery.setEvento(2);
    frmCadClientesDelivery.setCodCliente(getcodClienteDeliveryPorTelefone(edTelClienteDelivery.Text));
    frmCadClientesDelivery.ShowModal;
    frmCadClientesDelivery.free;
    edTelClienteDelivery.SetFocus;
    atualizaMovimento;
    edCodBarrasProduto.SetFocus;



   end;
end;

procedure TfrmPedidosDelivery.BitBtn1Click(Sender: TObject);
begin
  inherited;
 if (dm.verificaPermissaoAcao('B20003003') = true) then
  begin
    inherited;
     Application.CreateForm(TfrmCadObsClienteDelivery,frmCadObsClienteDelivery);
     frmCadObsClienteDelivery.setCodCLi(edCodClienteDelivery.Text);
     frmCadObsClienteDelivery.ShowModal;
     frmCadObsClienteDelivery.Free;
     dm.transacaoAuxiliar.active:=false;
     dm.transacaoAuxiliar.Active:=true;
     dm.transacao.Active:=false;
     dm.transacao.Active:=true;
     dm.qryObsClientesDelivery.Active:=true;
     dm.QryUltimosPedidosDelivery.Active:=true;
     dm.qryItensUltimosPedidos.Active:=true;
     atualizaMovimento();
     dbgrid3.Refresh;
  end;

end;

procedure TfrmPedidosDelivery.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  if odd(dm_relatorios.qryItensPedidoDelivery.RecNo) then
   DBGrid3.Canvas.Brush.Color:= clwhite
  else
   DBGrid3.Canvas.Brush.Color:= clMoneyGreen;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


end;

procedure TfrmPedidosDelivery.DBGrid3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ((dm.qryObsClientesDelivery.Active) and (dm.qryObsClientesDelivery .IsEmpty = false)) then
  begin
    try
      begin
        DBGrid3.Hint :=#13+#13+#13+ dm.qryObsClientesDelivery.fieldbyname('observacao').AsString;
      end;
    except
    end;           end;


end;

procedure TfrmPedidosDelivery.BitBtn2Click(Sender: TObject);
var
q : TIbquery;
begin

  inherited;

  if (dm.verificaPermissaoAcao('B20003004') = true) then
   begin
    if (MessageDlg('Confirma exclusão da observação selecionada ?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
     begin
      q := TIBquery.create(self);
      q.Database := dm.dbrestaurante;
      q.Transaction := dm.transacao;
      dm.transacao.Active:=true;

      q.SQL.Clear;
      q.SQL.Add('delete from obs_clientes_delivery where codigo='+Inttostr(dm.qryObsClientesDelivery.fieldbyname('codigo').Value));
      q.ExecSQL;

      dm.transacao.Commit;

      dm.transacaoAuxiliar.active:=false;
      dm.transacaoAuxiliar.Active:=true;
      dm.transacao.Active:=false;
      dm.transacao.Active:=true;

      dm.qryObsClientesDelivery.Active:=true;
      dm.QryUltimosPedidosDelivery.Active:=true;
      dm.qryItensUltimosPedidos.Active:=true;
      atualizaMovimento();
      dbgrid3.Refresh;
     end;

   end;


end;

end.







