unit uuPedidoDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants,IBX.IBDatabase , ACBrUtil,  Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, pcnConversao,
  cxLookAndFeelPainters, cxLabel, cxButtons, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxColorComboBox,
  
  DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid,
  cxGridBandedTableView, cxGridDBBandedTableView, 
  Mask,   Grids, DBGrids,  Ibquery,
  ComCtrls, ImgList, RxMemDS, Menus, cxGraphics, cxLookAndFeels, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, System.ImageList, RxToolEdit, RxCurrEdit, AdvPanel,
  dxGDIPlusClasses, JvgPage, JvExStdCtrls, JvButton, JvCtrls, CurvyControls,
  AdvEdit, AdvEdBtn, PlannerDatePicker, System.Actions, Vcl.ActnList, JvTabBar,
  JvPageList, JvExControls, cxCheckBox, AdvObj, BaseGrid, AdvGrid, JvExDBGrids,
  JvDBGrid, uuDMPedidoDelivery, JvMenus, IBX.IBScript, Vcl.AppEvnts,
  JvShapedButton, JvBitmapButton, JvNavigationPane, AdvGlassButton,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;


type
  TfrmPedidosDelivery = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    Panel5: TPanel;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    pnMovimento: TCurvyPanel;
    Image4: TImage;
    pnProduto: TCurvyPanel;
    Label2: TLabel;
    btPesqProdutoCodBarras: TSpeedButton;
    Label3: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    edQuantidade: TCurvyEdit;
    edCodBarrasProduto: TCurvyEdit;
    CurvyPanel2: TCurvyPanel;
    Label17: TLabel;
    Image8: TImage;
    Label18: TLabel;
    btUpLista: TImage;
    btDownLista: TImage;
    pnScroll: TPanel;
    ScrollBox1: TScrollBox;
    painelProdutos: TAdvPanel;
    lbOrdem: TLabel;
    lbDescricaoProduto: TLabel;
    lbQuantidadeProduto: TLabel;
    lbX: TLabel;
    lbValorUnitarioProduto: TLabel;
    lbTotalProduto: TLabel;
    btDeleteProduto: TImage;
    shapeLinha: TShape;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edCodProduto: TCurvyEdit;
    pnTopo: TPanel;
    pnTelefoneCliente: TCurvyPanel;
    btPesqCliente: TSpeedButton;
    edTelClienteDelivery: TCurvyEdit;
    lbTituloTelefone: TcxLabel;
    pnFormasPagamento: TCurvyPanel;
    pnTotais: TCurvyPanel;
    lbTxServ: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    Panel4: TCurvyPanel;
    descricao_prod: TLabel;
    lb_preco: TLabel;
    lb_cod_produto: TLabel;
    ed_total_tx_serv: TCurrencyEdit;
    edTotalDescontos: TCurrencyEdit;
    ed_valor_bruto: TCurrencyEdit;
    memoObsItem: TMemo;
    Panel6: TPanel;
    edDescricaoProduto: TCurvyEdit;
    edValorUnitarioProduto: TCurvyEdit;
    lblabelTotal: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    JvPopupMenu1: TJvPopupMenu;
    Excluirobservao1: TMenuItem;
    pageList2: TJvPageList;
    pgFormasPagto: TJvStandardPage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Image2: TImage;
    Label16: TLabel;
    edValorDesconto: TCurrencyEdit;
    ckbDesconto: TCheckBox;
    cbkEntrega: TCheckBox;
    cbkRetiraBalcao: TCheckBox;
    Panel1: TPanel;
    edDescricaoForma: TCurvyEdit;
    edCodFormaPagamento: TCurvyEdit;
    edValorForma: TCurvyEdit;
    DBGrid1: TDBGrid;
    pgObsClientes: TJvStandardPage;
    Label15: TLabel;
    Image1: TImage;
    JvDBGrid1: TJvDBGrid;
    edNovaObservacao: TCurvyEdit;
    ckbAlertaPedidos: TcxCheckBox;
    ckbImprimeProducao: TcxCheckBox;
    JvTabBar1: TJvTabBar;
    pgUltimosPedidos: TJvStandardPage;
    JvDBGrid2: TJvDBGrid;
    dbgItensPedido: TJvDBGrid;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    ApplicationEvents1: TApplicationEvents;
    PopupMenu3: TPopupMenu;
    Copiarestepedido1: TMenuItem;
    edTroco: TCurrencyEdit;
    Label19: TLabel;
    CurvyPanel3: TCurvyPanel;
    btSair: TAdvGlassButton;
    btGravar: TAdvGlassButton;
    ed_total_pago: TCurrencyEdit;
    Label9: TLabel;
    CurvyPanel5: TCurvyPanel;
    CurvyPanel6: TCurvyPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label11: TLabel;
    ed_total_conta: TCurrencyEdit;
    Panel3: TPanel;
    CurvyPanel1: TCurvyPanel;
    JvPageList1: TJvPageList;
    pgDadosCliente: TJvStandardPage;
    SpeedButton1: TSpeedButton;
    edNomeCliente: TCurvyEdit;
    cxLabel1: TcxLabel;
    CurvyEdit1: TCurvyEdit;
    cxLabel2: TcxLabel;
    edCelularCliente: TCurvyEdit;
    cxLabel3: TcxLabel;
    edDtNascimento: TPlannerDatePicker;
    cxLabel4: TcxLabel;
    edEnderecoCliente: TCurvyEdit;
    cxLabel5: TcxLabel;
    edCodbairro: TCurvyEdit;
    cxLabel6: TcxLabel;
    edBairroCliente: TCurvyEdit;
    edComplementoCliente: TCurvyEdit;
    cxLabel7: TcxLabel;
    edReferenciaCliente: TCurvyEdit;
    cxLabel8: TcxLabel;
    edReferencia2cliente: TCurvyEdit;
    cxLabel9: TcxLabel;
    edCodClienteDelivery: TCurvyEdit;
    procedure Edit1Exit(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure D30001011DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure btGravarClick(Sender: TObject);
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
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ckbDescontoClick(Sender: TObject);
    procedure cbkEntregaClick(Sender: TObject);
    procedure cbkRetiraBalcaoClick(Sender: TObject);
    procedure btObsProdutoClick(Sender: TObject);
    procedure CurvyPanel1MouseEnter(Sender: TObject);
    procedure CurvyPanel1MouseLeave(Sender: TObject);
    procedure Image3MouseEnter(Sender: TObject);
    procedure Image3MouseLeave(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure btUpListaClick(Sender: TObject);
    procedure btDownListaClick(Sender: TObject);
    procedure memoObsItemExit(Sender: TObject);
    procedure edCodFormaPagamentoControlClick(Sender: TObject; Index: Integer);
    procedure edCodFormaPagamentoExit(Sender: TObject);
    procedure edQuantidadeExit(Sender: TObject);
    procedure edValorFormaExit(Sender: TObject);
    procedure btDeleteProdutoClick(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Excluirobservao1Click(Sender: TObject);
    procedure JvDBGrid2CellClick(Column: TColumn);
    procedure dbgItensPedidoCellClick(Column: TColumn);
    procedure btPesqClienteClick(Sender: TObject);
    procedure ScrollBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ScrollBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure JvDBGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Copiarestepedido1Click(Sender: TObject);

  private
    { Private declarations }
    retornoForma : boolean;
    valorForma : double;
    ObsDiverso  : string;
    codDiverso  : string;
    entradaDoForm : Boolean;
    codPedidoSelecionado : string;
    alterouProdutos : boolean;


    procedure controla_botoes (botao : TbitBtn);
    procedure retornaDadosDoPedido(codPedido : string);
    procedure retornaInformacoes(codigo : string; filtro : integer);
    function  verifica_validade_lancamento: boolean;
    procedure AdicionarProduto();
    procedure limparFilaDeImpressao();
    procedure limpaMesadelivery();
    procedure limpaCampos();
    procedure bloqueiaPaineis();
    procedure desbloqueiaPaineis();

    function  verificaValidadeForma(cod_forma : string) : boolean;
    function  verificaSeFormasPgtoAprovacao() : boolean;

    procedure calcula_valores(Sender: TObject);


    function  getObsDiversa() : string;
    function  getCodDiverso() : string;



    function  getRetornoForma() : boolean;

    procedure gravarInformacoes();
    function  verificaValidadeEncerramento() : boolean;
    function  verificaPossibilidadeDeTroco( troco : double) : boolean;
    procedure gravarPagamentos(codigoPedido : string);
    procedure apagarPedido(codPedido : string);
    procedure imprimePedidoLocalProducao(codPedido : string; operacao : smallint);

    procedure gravarAlteracoesAntes(codAlteracao: string; codigoPedido : string; tipoAlteracao : smallint);
    procedure gravarAlteracoesPos(codAlteracao: string; codigoPedido : string; tipoAlteracao : smallint);

    procedure adicionaProdutoLista(idProduto: largeInt);
    procedure registraFormaPagto(cod_forma, descricao_forma, valor: string);
    procedure adicionar_pagamento(cod_diverso, obs, cod_forma, descricao_forma,
      valor: string);
    procedure apagarItemLista(id: integer);
    procedure apagaItemMovimento(id: integer);
    procedure atualizaMovimento(recriarLista: boolean);
    procedure atualizaListaObservacoesCliente(ACodCliente: string);
    procedure NovoPedido;


  public
    { Public declarations }
     soperadoraCartao,snumeroCartao,svalidadeCartao,scodigoCartao : string;

    procedure setCodDiverso(cod_diverso : string);
    procedure setRetornoForma(ret : boolean);
    procedure setObsDiversa(obs: string);
    function  getValorFormaPagamento() : double;
    procedure setCodPedidoSelecionado(codPedido : string);
    function getCodPedidoSelecionado() : string;
    procedure setEvento(ev : smallint);

  end;

var
  frmPedidosDelivery: TfrmPedidosDelivery;
  limpouPagamentos : boolean;





implementation

uses uu_data_module, uu_obs_lancamento_caixa,
  uu_frm_principal, uu_pagamento_faturado, uu_cad_clientes_delivery,
  UU_DM_RELATORIOS, uuSelecaoSaboresPizza, uuDadosCartaoCredito,
  uuCadObservacaoClienteDelivery, uuPainelAguarde, ObsClienteDeliveryModel;

{$R *.dfm}

procedure TfrmPedidosDelivery.Edit1Enter(Sender: TObject);
begin
  inherited;
    if ((sender is TCurvyEdit ) and ( (Sender as TCurvyEdit).Name='edTelClienteDelivery')) then
      begin
       pageList2.ActivePageIndex  := 0;
       JvTabBar1.Tabs[0].Selected;
      end;
      {

    if ((sender is TCurvyEdit) and ( (Sender as TCurvyEdit).Name='edCodBarrasProduto')) then
      pageList2.ActivePage:= pgFormasPagto;

    if ((sender is TCurvyEdit) and ( (Sender as TCurvyEdit).Name='edQuantidade')) then
      pageList2.ActivePage:=pgFormasPagto;
       }

end;

procedure TfrmPedidosDelivery.Edit1Exit(Sender: TObject);
begin
  inherited;


  if ((sender is TCurvyEdit and ((sender as TCurvyEdit).Name = 'edCodBarrasProduto')) ) then
  begin

  if(trim(edCodBarrasProduto.text) <> '') then
   begin
     edQuantidade.text:='1';
   end
  else
   begin
    edQuantidade.Text := '';
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
      edCodBarrasProduto.text := '';;
      exit;
    end;

    if (verificaSeProdutoPodeSerVendido(edCodBarrasProduto.text,2) = false) then
    begin
      ShowMessage('O produto informado está desabilitado para venda!');
      edCodBarrasProduto.SetFocus;
      edCodBarrasProduto.text := '';;
      exit;
    end;



   exibeInformacoesProduto(edCodBarrasProduto.text,2);
  end;
 {
  if (sender is TCurvyEdit   and ((sender as TCurvyEdit).Name='edTelClienteDelivery') and (evento <> 1)  ) then
    begin
       edTelClienteDelivery.Text := trim(edTelClienteDelivery.Text);
      if Trim(edTelClienteDelivery.text) = '' then exit;
      try
       edTelClienteDelivery.text :=FormatFloat('00000000',StrToFloat(edTelClienteDelivery .Text));
      except
       begin
         ShowMessage('Código incorreto');
         edTelClienteDelivery.text := '';;
         edTelClienteDelivery.SetFocus;

         exit;
       end;
      end;

      if (verificaExistenciaPedidoDelivery(edTelClienteDelivery.text) = false) then
       begin
         dm.exibe_painel_erro('Pedido Inexistente!','Tecle enter para continuar..');
         edTelClienteDelivery.text := '';;
         edTelClienteDelivery.setfocus;
       end
      else
       begin
         // Retorna dados do pedido
         retornaDadosDoPedido(edTelClienteDelivery.Text);
         pnTelefoneCliente.Enabled := false;
       end;

    end;
    }



  if (sender is TCurvyEdit   and ((sender as TCurvyEdit).Name='edTelClienteDelivery') and (evento = 1)  ) then
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
         edTelClienteDelivery.text := '';;
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

             end;
          end;
    end
  else
   begin
     if evento = 4  then
       begin
         try
           edTelClienteDelivery.Text := FormatFloat('00000000',StrToFloat(edTelClienteDelivery.Text));
         except
           exibe_painel_erro('Código de pedido inválido!','Ok');;
           edTelClienteDelivery.SetFocus;
           exit;
         end;

         if verificaExistenciaPedidoDelivery(edTelClienteDelivery.Text) then
          begin
            retornaDadosDoPedido(edTelClienteDelivery.Text);
            btGravar.Visible := false;
            alterouProdutos := false;
          end
         else
          begin
           exibe_painel_erro('Código de pedido inválido!','Ok');;
           edTelClienteDelivery.SetFocus;
           exit;
          end;
       end;


   end;


  if (sender is TCurrencyEdit   and ((sender as TCurrencyEdit).Name='edValorDesconto')) then
    begin  
      if (edValorDesconto.Value < 0)  then 
       begin
         showmessage('Valor do desconto é inválido!');
         edValorDesconto.Value :=0;
       end;


      if edValorDesconto.Value > 0  then
       begin
        if (dm.verificaPermissaoAcao('B20003006') = true) then
         begin

         end
        else
         begin
           edValorDesconto.Value :=0;
           edTotalDescontos.Value :=0;
           calcula_valores(edValorDesconto);         
         end;       
       end;
       
      calcula_valores(ckbDesconto);
    end;
  
  

end;

procedure TfrmPedidosDelivery.retornaInformacoes(codigo : string; filtro : integer);
var
 q : TIBquery;
begin

 q:= TIBQuery.create(self);
 q.Database := dm.dbrestaurante;
 q.Transaction := dm.transacao;
 limpouPagamentos := false;



 if filtro = 1 then
  begin
    q.Active:=false;
    q.sql.text := '';;
    q.sql.add('select c.codigo as cod_cliente, c.*,b.descricao,b.codigo as codBairro from clientes_delivery c inner join bairro b  on (b.codigo = c.cod_bairro) ');
    q.sql.add(' where c.telefone='+Quotedstr(codigo)+' or c.celular='+Quotedstr(codigo));
    q.Active := true;
    ed_total_tx_serv.value:= getValorTxEntregaBairro(q.fieldbyname('codBairro').value);    

  end
 else
  begin
    q.Active:=false;
    q.sql.text := '';;
    q.sql.add(' select  p.*, c.*, b.descricao,b.codigo as codBairro from pedidos_delivery  p ');
    q.sql.add('   inner join clientes_delivery c on (c.codigo = p.cod_cliente)');
    q.sql.add('   inner join bairro b on (b.codigo = c.cod_bairro)');
    q.sql.add(' where p.codigo='+Quotedstr(codigo));
    q.Active := true;

    If( q.fieldbyname('DATA_HORA_ENTREGA').value <> null) then
     begin
      ///edDataEntrega.Date := q.fieldbyname('DATA_HORA_ENTREGA').value;
//      edHoraEntrega.Text := FormatDateTime('HH:MM',q.fieldbyname('DATA_HORA_ENTREGA').value);
     end;




    ed_total_tx_serv.Value := q.FieldByName('valor_entrega').value;
    ckbDesconto.Checked := false;
    edTotalDescontos.Value := q.FieldByName('valor_desconto').value;
    edValorDesconto.Value  := q.FieldByName('valor_desconto').value;



    If( q.fieldbyname('RETIRA_BALCAO').value <> null) then
     begin
           If( q.fieldbyname('RETIRA_BALCAO').value = 1  ) then
            begin
              ed_total_tx_serv.value:= 0;
              cbkEntrega.Checked := true;
              cbkRetiraBalcao.Checked := true;
            end
          else
            begin
             ed_total_tx_serv.value:= q.FieldByName('valor_entrega').value;
             cbkEntrega.Checked := false;
             cbkRetiraBalcao.Checked := false;
            end;
     end;


  end;



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


 edCodbairro.Text := q.fieldbyname('codBairro').value;





 if ((evento=2) or (evento = 3)) then
  begin
     btgravar.Enabled:=true
  end
 else
  begin
    edCodBarrasProduto.SetFocus;
  end;

/// busca pedidos do cliente

  atualizaListaObservacoesCliente(edCodClienteDelivery.Text);
              {

  dmPedidoDelivery.qryObservacoesClientes.First;
  while dmPedidoDelivery.qryObservacoesClientes.Eof do
   begin
     exibe_painel_erro(dmPedidoDelivery.qryObservacoesClientes.FieldByName('observacao').Value,'Ok');
     dmPedidoDelivery.qryObservacoesClientes.Next;
   end;
         }

  dmPedidoDelivery.BuscaUltimosPedidos(edCodClienteDelivery.Text);


         {

  // Query dos pedidos
  dm.qryUltimosPedidosDelivery.Active:=false;
  dm.qryUltimosPedidosDelivery.SQL.text := '';;
  dm.qryUltimosPedidosDelivery.SQL.add(' select first 5 p.codigo as CodigoPedido, p.data,p.hora,p.valor_entrega, p.valor_total,c' );
  dm.qryUltimosPedidosDelivery.SQL.add(    '.nome_usuario  from pedidos_delivery p');
  dm.qryUltimosPedidosDelivery.SQL.add(    ' inner join caixas c on  (c.codigo =  p.cod_caixa)');
  dm.qryUltimosPedidosDelivery.SQL.add(    ' where p.cod_cliente = '+QuotedStr(edCodClienteDelivery.Text));
  dm.qryUltimosPedidosDelivery.SQL.add(    'order by p.data desc');
  dm.qryUltimosPedidosDelivery.Active:=true;

  dm.qryItensUltimosPedidos.Active:=false;
  dm.qryItensUltimosPedidos.sql.text := '';;
  dm.qryItensUltimosPedidos.SQL.add(' select it.cod_pedido,p.cod_barras,it.cod_produto, p.descricao, it.quantidade,it.valor_unitario,');
  dm.qryItensUltimosPedidos.SQL.add('        it.observacoes,it.sabores');
  dm.qryItensUltimosPedidos.SQL.add('        from itens_pedido_delivery it');
  dm.qryItensUltimosPedidos.SQL.add('       inner join  produtos p on (p.cod_produto = it.cod_produto)');
  dm.qryItensUltimosPedidos.SQL.add('        where it.cod_pedido =:codigoPedido');

  dm.qryItensUltimosPedidos.Params[0].Value := dm.QryUltimosPedidosDelivery.fieldbyname('codigoPedido').value;
  dm.qryItensUltimosPedidos.Active:=true;

}









  Q.Active:=FALSE;
  FreeAndNil(Q);
end;


procedure TfrmPedidosDelivery.ScrollBox1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
 codPedido : string;
begin

  codPedido :=dmPedidoDelivery.qryUltimosPedidosCODIGO.AsString;
  dmPedidoDelivery.copiarPedido(codPedido,numero_caixa,codigo_usuario,mesaDelivery);
  atualizaMovimento(true);


end;

procedure TfrmPedidosDelivery.ScrollBox1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  if (Source is TJvDBGrid) then
  Accept := True;
end;

procedure TfrmPedidosDelivery.btSairClick(Sender: TObject);
begin
//  inherited;

  close;
end;



procedure TfrmPedidosDelivery.btUpListaClick(Sender: TObject);
begin
  inherited;
  ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position - 360;
end;

function TfrmPedidosDelivery.verifica_validade_lancamento: boolean;
begin
  result:=true;

  try
    StrToFloat(edQuantidade.Text);
  except
    begin
      ShowMessage('Quantidade Inválida!');
      edQuantidade.text := '';;
      edQuantidade.SetFocus;
      exit;
    end;
  end;


  if (StrToFloat(edQuantidade.text) <=0) then
    begin
      ShowMessage('Quantidade Inválida!');
      edQuantidade.text := '';;
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
       edQuantidade.text := '';;
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
    edCodBarrasProduto.text := '';;
    Result := false;
    exit;
  end;




  if (verificaSeProdutoPodeSerVendido(edCodBarrasProduto.text,2) = false) then
  begin
    ShowMessage('O produto informado está desabilitado para venda!');
    edCodBarrasProduto.SetFocus;
    edCodBarrasProduto.text := '';;
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
  codProdutoPizza : string;
  totalProporcaoPizza : Double;
begin

 alterouProdutos := true;
 idMovimentoMesa:=  strToInt(dm.geraCodigo('G_MOVIMENTO_MESA',15));
 if ( verificaSeProdutoEhPizza(edCodBarrasProduto.Text,2) = true) then
  begin
   frm_principal.obsSaborPizza:='';
   frm_Principal.obsLancamento:='';
   dm.tbSaboresPizzaTemp.Active:=false;
   dm.tbSaboresPizzaTemp.EmptyTable;
   Application.CreateForm(TfrmSelecaoSaboresPizza,frmSelecaoSaboresPizza);
   frmSelecaoSaboresPizza.ShowModal;
   frmSelecaoSaboresPizza.Free;


   //Seleciona o valor  da pizza. Para cobrar proporcional, o último parametro da funcao de ve ser  true;
   edValorUnitarioProduto.Text  :=   FormatFloat('###,###,##0.00',getValorPizza(edCodBarrasProduto.Text,2,2));


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
    observacoesProducao := strObsProduto;
    tipoMassa:='';
  end;





  dm.qryauxiliar.active := false;
  dm.qryauxiliar.SQL.text := '';;
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
  dm.qryauxiliar.SQL.text := '';;
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

  if (dm.tbSaboresPizzaTemp.IsEmpty = False ) then
   begin
     dm.qryauxiliar.Active := False;
     dm.qryauxiliar.sql.text := '';;
     dm.tbSaboresPizzaTemp.First;

      totalProporcaoPizza :=0;

     while not dm.tbSaboresPizzaTemp.Eof do
      begin
       totalProporcaoPizza := StrToFloat(edQuantidade.Text) *  dm.tbSaboresPizzaTempproporcao.Value;
       dm.qryauxiliar.Active := false;
       dm.qryauxiliar.SQL.text := '';;
       dm.qryauxiliar.SQL.Add('insert into SABORES_PIZZA_MOVIMENTO_MESA (COD_MESA,ID_MOV_MESA,COD_PRODUTO,COD_SABOR,QUANTIDADE,VALOR_UNITARIO_SABOR,PROPORCAO,DESCRICAO) values (');
       dm.qryauxiliar.sql.add('' + QuotedStr(mesaDelivery ) + ',');
       dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa)+ ',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempcodProduto.Value)+',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempcodigo.Value)+',');
       dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(Floattostr(totalProporcaoPizza) ) + ',');
       dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(Floattostr(dm.tbSaboresPizzaTempvalorSabor.Value) ) + ',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTemptamanho.Value)+',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempdescricao.Value)+')');
       dm.qryauxiliar.ExecSQL;
       dm.tbSaboresPizzaTemp.Next;
      end;

   end;

  dm.tbSaboresPizzaTemp.Active:=false;
  dm.tbSaboresPizzaTemp.EmptyTable;


{
    if dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption) then
     begin
        dm.enviaProdutoParaFilaImpressao(garcomDelivery,edCodBarrasProduto.Text,mesaDelivery,  StrToFloat(edQuantidade.Text),observacoesProducao,saboresProducao,'1',-1,IntToStr(idMovimentoMesa));
     end;
     }


  strObsProduto:='';




  if dm.transacao.Active = false then dm.transacao.Active := true;
  dm.transacao.Commit;

  atualizaMovimento(true);
  edCodBarrasProduto.text := '';;
  edValorUnitarioProduto.text := '';;
  edDescricaoProduto.text := '';;
  edQuantidade.text := '';;
  edCodBarrasProduto.SetFocus;
  edQuantidade.text:='1';
end;



procedure TfrmPedidosDelivery.atualizaMovimento(recriarLista : boolean);
 var qtde : string;
 x: integer;
 cp : TComponent;


begin
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm.qry_movimento_mesa.Active := false;
  dm.qry_movimento_mesa.sql.text := '';;
  dm.qry_movimento_mesa.SQL.Add('select mv.cod_mesa,pr.cod_barras,pr.un_ecf,');
  dm.qry_movimento_mesa.sql.Add(' mv.cod_produto,pr.cod_produto,');
  dm.qry_movimento_mesa.sql.Add('pr.descricao,mv.quantidade as quantidade,');
  dm.qry_movimento_mesa.sql.Add('mv.valor_unitario,');
  if (arredondamento = 1 ) then
    dm.qry_movimento_mesa.sql.add('udf_truncdec((mv.valor_unitario * mv.quantidade),3) as total')
  else
    dm.qry_movimento_mesa.sql.add('udf_rounddec((mv.valor_unitario * mv.quantidade),3) as total ');

  dm.qry_movimento_mesa.sql.Add(',mv.comanda, mv.cod_garcon, g.apelido,u.login,mv.hora_lancamento, mv.estado,mv.cod_movimento, mv.desconto,id, impresso,observacoes,sabores,tipo_massa');
  dm.qry_movimento_mesa.SQL.Add('  from movimento_mesa mv ');
  dm.qry_movimento_mesa.sql.Add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
  dm.qry_movimento_mesa.sql.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
  dm.qry_movimento_mesa.SQL.add('  inner join usuarios u on (u.cod_usuario=mv.cod_usuario)');
  dm.qry_movimento_mesa.SQL.add('  where mv.cod_mesa=' + Quotedstr(mesaDelivery) + ' order by mv.cod_movimento');
  dm.adicionaLog(dm.qry_movimento_mesa.SQL.Text  );
  dm.qry_movimento_mesa.Active := true;


  dm.qry_movimento_mesa.FetchAll;

  if dm.qry_movimento_mesa.RecordCount > 6 then
   begin
     btUpLista.Visible := true;
     btDownLista.Visible := true;
   end
  else
   begin
     btUpLista.Visible := false;
     btDownLista.Visible := false;

   end;


  if (recriarLista) then
   begin
      ScrollBox1 := TScrollBox( pnScroll.FindComponent('ScrollBox1'));
      if ScrollBox1 <> nil then
       begin
         FreeAndNil(ScrollBox1);
       end;

      ScrollBox1 := TScrollBox.Create(pnScroll  );
      ScrollBox1.Name := 'ScrollBox1';
      ScrollBox1.Parent := pnScroll;
       ScrollBox1.Left := 0;
      ScrollBox1.Top := 0;
      ScrollBox1.Width := 600;
      ScrollBox1.Height := 360;
      ;
      ScrollBox1.TabOrder := 0;
      ScrollBox1.HorzScrollBar.Visible := false;
      ScrollBox1.VertScrollBar.Visible := true;
      ScrollBox1.VertScrollBar.ParentColor := false;
      ScrollBox1.VertScrollBar.Color := clWhite;
      ScrollBox1.BevelEdges := [];
      ScrollBox1.BevelInner := bvNone;
      ScrollBox1.BevelOuter := bvNone;
//      ScrollBox1.BorderStyle := bsNone;


     dm.qry_movimento_mesa.First;
     dm.qry_movimento_mesa.FetchAll;

      while not dm.qry_movimento_mesa.Eof do
      begin
         qtde := FormatFloat('###,###,##0.000 ',dm.qry_movimento_mesa.fieldbyname('quantidade').Value);
         qtde := qtde + dm.qry_movimento_mesa.fieldbyname('un_ecf').Value +' X ';
         adicionaProdutoLista(dm.qry_movimento_mesa.fieldbyname('id').Value);
         dm.qry_movimento_mesa.Next;
      end;

   end;




  dm.qryauxiliar.Active:=FALSE;
  dm.qryauxiliar.sql.text := '';;
  dm.qryauxiliar.SQL.add('select * from rodapeextrato2('+Quotedstr(mesaDelivery)+',0)');
  dm.qryauxiliar.Active:=true;
  dm.qryauxiliar.FetchAll;

  if (dm.qryauxiliar.IsEmpty = false) then
   begin
    ed_valor_bruto.Value :=   dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
    edTotalDescontos.Value := edTotalDescontos.Value;
    ed_total_conta.Value :=   dm.qryauxiliar.fieldbyname('VALORBRUTO').Value+ed_total_tx_serv.value;
   end;
end;




procedure TfrmPedidosDelivery.adicionaProdutoLista(idProduto : largeInt);
var
 AdvPanel1: Tpanel;
 lbDescricaoProduto1 : TLabel;
 lbQuantidadeProduto1: TLabel;
 lbValorUnitarioProduto1: TLabel;
 lbX1: TLabel;
 lbTotalProduto1: TLabel;
 btDeleteProduto1: TImage;
 lblabelTotal1: TLabel;
 shapeLinha1: TShape;
 btObsProduto1: TImage;
 posicao : integer;
 x: integer;
 cp : TComponent;
 lbOrdem1: TLabel;
 memoObsItem1: TMemo;
 obs : string;




begin
  inherited;


      AdvPanel1                := TPanel.Create(ScrollBox1);



      AdvPanel1.Name := 'MOVTOpanProd'+ Inttostr(idProduto);
      AdvPanel1.Align := alTop;
      AdvPanel1.Parent := ScrollBox1;
      AdvPanel1.Left := 0;
      AdvPanel1.Top := 5000;
      AdvPanel1.Width := 470;
      AdvPanel1.Height := 60;
      AdvPanel1.BevelOuter := bvNone;
//      AdvPanel1.BorderStyle := bsNone;
      AdvPanel1.Color := clWhite;
      AdvPanel1.ParentFont := False;
      AdvPanel1.TabOrder := 0;
      AdvPanel1.UseDockManager := True;
      AdvPanel1.Caption :='';


      AdvPanel1.DoubleBuffered := True;

      AdvPanel1.Visible := true;
      AdvPanel1.Tag := idProduto;


      lbOrdem1                 := TLabel.Create(AdvPanel1);
      lbDescricaoProduto1      := TLabel.Create(AdvPanel1);
      lbQuantidadeProduto1     := TLabel.Create(AdvPanel1);
      lbValorUnitarioProduto1  := TLabel.Create(AdvPanel1);
      lblabelTotal1              := TLabel.Create(Self);
      lbTotalProduto1          := TLabel.Create(AdvPanel1);
      shapeLinha1              := TShape.Create(AdvPanel1);
      btObsProduto1            := TImage.Create(AdvPanel1);
      btDeleteProduto1         := TImage.Create(AdvPanel1);
      lbX1                     := TLabel.Create(AdvPanel1);





      lbOrdem1.Name := 'MOVTOlbOrdem'+ Inttostr(idProduto);
      lbOrdem1.Parent := AdvPanel1;
      lbOrdem1.Left := 2;
      lbOrdem1.Top := 0;
      lbOrdem1.Width := 24;
      lbOrdem1.Height := 18;
      lbOrdem1.Caption := formatfloat('000', dm.qry_movimento_mesa.recno);
      lbOrdem1.Color := clBtnFace;
      lbOrdem1.ParentColor := False;
      lbOrdem1.ParentFont := False;
      lbOrdem1.Transparent := True;
      lbOrdem1.Font := lbOrdem.Font;
      lbOrdem1.tag := idProduto;


      lbDescricaoProduto1.Name := 'MOVTOlbDescricaoProduto'+ Inttostr(idProduto);
      lbDescricaoProduto1.Parent := AdvPanel1;
      lbDescricaoProduto1.Left := 30;
      lbDescricaoProduto1.Top := 0;
      lbDescricaoProduto1.Width := 233;
      lbDescricaoProduto1.Height := 18;
      lbDescricaoProduto1.Caption :=  dm.qry_movimento_mesa.fieldbyname('descricao').Value;
      lbDescricaoProduto1.Hint := 'Sabores: '+ dm.qry_movimento_mesa.fieldbyname('sabores').Value;
      lbDescricaoProduto1.Color := clBtnFace;
      lbDescricaoProduto1.ParentColor := False;
      lbDescricaoProduto1.ParentFont := False;
      lbDescricaoProduto1.Transparent := True;
      lbDescricaoProduto1.Font := lbDescricaoProduto.Font;
      lbDescricaoProduto1.Tag := idProduto;
      lbDescricaoProduto1.ShowHint := true;



      lbQuantidadeProduto1.Name := 'MOVTOlbQuantidadeProduto'+ Inttostr(idProduto);
      lbQuantidadeProduto1.Parent := AdvPanel1;
      lbQuantidadeProduto1.Left := lbQuantidadeProduto.Left;
      lbQuantidadeProduto1.Top := lbQuantidadeProduto.top;
      lbQuantidadeProduto1.Width := 40;
      lbQuantidadeProduto1.Height := 18;
      lbQuantidadeProduto1.Caption := FormatFloat('###,###,##0.000 ',dm.qry_movimento_mesa.fieldbyname('quantidade').Value);
      lbQuantidadeProduto1.Color := clBtnFace;
      lbQuantidadeProduto1.ParentColor := False;
      lbQuantidadeProduto1.ParentFont := False;
      lbQuantidadeProduto1.Transparent := True;
      lbQuantidadeProduto1.Font := lbQuantidadeProduto.Font;
      lbQuantidadeProduto1.Tag := idProduto;
      lbQuantidadeProduto1.Hint := dm.qry_movimento_mesa.fieldbyname('sabores').Value;
      lbQuantidadeProduto1.ShowHint := true;

      lbValorUnitarioProduto1.Name := 'MOVTOlbValorUnitarioProduto'+ Inttostr(idProduto);
      lbValorUnitarioProduto1.Parent := AdvPanel1;
      lbValorUnitarioProduto1.Left := lbValorUnitarioProduto.Left;
      lbValorUnitarioProduto1.Top := lbValorUnitarioProduto.Top;
      lbValorUnitarioProduto1.Width := 86;
      lbValorUnitarioProduto1.Height := 18;
      lbValorUnitarioProduto1.Caption := FormatFloat('R$ ###,###,##0.00 ',dm.qry_movimento_mesa.fieldbyname('valor_unitario').Value);
      lbValorUnitarioProduto1.Color := clBtnFace;
      lbValorUnitarioProduto1.ParentColor := False;
      lbValorUnitarioProduto1.ParentFont := False;
      lbValorUnitarioProduto1.Transparent := True;
      lbValorUnitarioProduto1.Font := lbValorUnitarioProduto.Font;
      lbValorUnitarioProduto1.Tag := idProduto;
      lbValorUnitarioProduto1.Hint := 'Sabores: '+dm.qry_movimento_mesa.fieldbyname('sabores').Value;
      lbValorUnitarioProduto1.ShowHint := true;

      lbX1.Name := 'MOVTOlbX'+ Inttostr(idProduto);
      lbX1.Parent := AdvPanel1;
      lbX1.Left := lbX.Left;
      lbX1.Top := lbx.Top;
      lbX1.Width := 11;
      lbX1.Height := 18;
      lbX1.Caption := 'X';
      lbX1.Color := clBtnFace;
      lbX1.ParentColor := False;
      lbX1.ParentFont := False;
      lbX1.Transparent := True;
      lbX1.Font := lbX.Font;
      lbX1.Tag := idProduto;
      lbX1.Hint := 'Sabores: '+dm.qry_movimento_mesa.fieldbyname('sabores').Value;
      lbX1.ShowHint := true;



      lbTotalProduto1.Name := 'MOVTOlbTotalProduto'+ Inttostr(idProduto);
      lbTotalProduto1.Parent :=  AdvPanel1;
      lbTotalProduto1.Left := lbTotalProduto.left;
      lbTotalProduto1.Top := lbTotalProduto.Top;
      lbTotalProduto1.Alignment := taRightJustify;
      lbTotalProduto1.Width := 118;
      lbTotalProduto1.Height := 24;
      lbTotalProduto1.Caption := FormatFloat('R$ ###,###,##0.00 ',dm.qry_movimento_mesa.fieldbyname('total').Value);
      lbTotalProduto1.Color := 4099549;
      lbTotalProduto1.ParentColor := False;
      lbTotalProduto1.ParentFont := False;
      lbTotalProduto1.Transparent := True;
      lbTotalProduto1.Font :=  lbTotalProduto.Font;
      lbTotalProduto1.Tag := idProduto;
      lbTotalProduto1.Hint := 'Sabores: '+dm.qry_movimento_mesa.fieldbyname('sabores').Value;
      lbTotalProduto1.ShowHint := True;


      lblabelTotal1.Name := 'lblabelTotal'+ Inttostr(idProduto);
      lblabelTotal1.Parent :=AdvPanel1;
      lblabelTotal1.Left := lblabelTotal.Left;
      lblabelTotal1.Top :=lblabelTotal.Top;
      lblabelTotal1.Width := 45;
      lblabelTotal1.Height := 18;
      lblabelTotal1.Caption := 'Total:';
      lblabelTotal1.Color := 4099549;
      lblabelTotal1.ParentColor := False;
      lblabelTotal1.ParentFont := False;
      lblabelTotal1.Font := lblabelTotal.Font;
      lblabelTotal1.Transparent := True;
      lblabelTotal1.Tag := idProduto;
      lblabelTotal1.Hint := 'Sabores: '+dm.qry_movimento_mesa.fieldbyname('sabores').Value;
      lblabelTotal1.ShowHint := True;

      memoObsItem1 := TMemo.Create(Self);
      memoObsItem1.Name := 'memoObsItem'+ Inttostr(idProduto);
      memoObsItem1.Parent := AdvPanel1;
      memoObsItem1.Left := memoObsItem.Left;
      memoObsItem1.Top := memoObsItem.top;
      memoObsItem1.Width := 237;
      memoObsItem1.Height := 37;
      memoObsItem1.BevelEdges := [];
      memoObsItem1.BevelInner := bvNone;
      memoObsItem1.BevelOuter := bvLowered;
      memoObsItem1.BorderStyle := bsSingle;
      memoObsItem1.Lines.Clear;
      obs :=dm.BuscaTroca(trim(dm.qry_movimento_mesa.FieldByName('observacoes').Value),LineBreak,'');
      memoObsItem1.Lines.Add(obs);
      memoObsItem1.ParentFont := False;
      memoObsItem1.Font := memoObsItem.Font;
      memoObsItem1.TabOrder := 0;
      memoObsItem1.Tag := idProduto;
      memoObsItem1.OnExit := memoObsItem.OnExit;
      memoObsItem1.SelStart := 0;
      memoObsItem1.Perform(EM_SCROLLCARET,0,0);
      memoObsItem1.Hint := 'Sabores: '+dm.qry_movimento_mesa.fieldbyname('sabores').Value;
      memoObsItem1.ShowHint := True;



      btDeleteProduto1.Name := 'MOVTObtDeleteProduto'+ Inttostr(idProduto);
      btDeleteProduto1.Parent :=  AdvPanel1;
      btDeleteProduto1.Left := btDeleteProduto.Left;
      btDeleteProduto1.Top :=  btDeleteProduto.Top;
      btDeleteProduto1.Width := 38;
      btDeleteProduto1.Height := 38;
      btDeleteProduto1.Stretch := True;
      btDeleteProduto1.Picture := btDeleteProduto.Picture;
      btDeleteProduto1.Tag := idProduto;
      btDeleteProduto1.OnClick := btDeleteProduto.OnClick;



{

      btObsProduto1.Name := 'MOVTObtObsProduto'+ Inttostr(idProduto);
      btObsProduto1.Parent := AdvPanel1;
      btObsProduto1.Left := 3;
      btObsProduto1.Top := 17;
      btObsProduto1.Width := 38;
      btObsProduto1.Height := 38;
      btObsProduto1.Picture := btObsProduto.Picture;
      btObsProduto1.Stretch := True;
      btObsProduto1.Tag := idProduto;
      btObsProduto1.OnClick := btObsProduto.OnClick;
 }

      shapeLinha1.Name := 'MOVTOshapeLinha'+ Inttostr(idProduto);
      shapeLinha1.Parent := AdvPanel1;
      shapeLinha1.Left := 0;
      shapeLinha1.Top := 55;
      shapeLinha1.Width := 280;
      shapeLinha1.Height := 1;
      shapeLinha1.Align := alBottom;
      shapeLinha1.Tag :=idProduto;
      ScrollBox1.VertScrollBar.Position := 5000;
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
 q.sql.text := '';;
 q.sql.add('delete from movimento_mesa where cod_mesa='+Quotedstr(mesaDelivery));
 q.ExecSQL;

 Q.active:=false;
 q.sql.text := '';;
 q.sql.add('delete from recebimento_parcial where mesa='+Quotedstr(mesaDelivery));
 q.ExecSQL;



 dm.transacao.Commit;
 dm.transacao.Active:=false;
 dm.transacao.Active:=true;

 Q.Active:=false;
 FreeAndNil(q); 

end;




procedure TfrmPedidosDelivery .controla_botoes (botao : TbitBtn);
begin

  if ((evento = 1) or (evento=2) or (evento=3)) then
  begin

//    btSair.Enabled:=false;
    pnTopo.Enabled:=true;
    pnTelefoneCliente.Enabled := false;
    pnTelefoneCliente.Enabled:= true;
    edTelClienteDelivery.SetFocus;
       pageList2.ActivePageIndex  := 0;
       JvTabBar1.Tabs[0].Selected;

    if ( (evento =2 ) or (evento = 2))  then
      begin
        lbTituloTelefone.Caption := 'Nº do pedido';
      end
    else
    lbTituloTelefone.Caption := 'Telefone:';

  end;



{  if botao=btGravar then
  begin
     btGravar.Enabled:=false;
     btSair.Enabled:=true;
  end;
 }

end;

procedure TfrmPedidosDelivery.Copiarestepedido1Click(Sender: TObject);
var
 codPedido : string;
begin

  codPedido :=dmPedidoDelivery.qryUltimosPedidosCODIGO.AsString;
  dmPedidoDelivery.copiarPedido(codPedido,numero_caixa,codigo_usuario,mesaDelivery);
  atualizaMovimento(true);


end;

procedure TfrmPedidosDelivery.CurvyPanel1MouseEnter(Sender: TObject);
begin
  inherited;
  (Sender as TCurvyPanel).Color := clSkyBlue;


end;

procedure TfrmPedidosDelivery.CurvyPanel1MouseLeave(Sender: TObject);
begin
  inherited;
  (Sender as TCurvyPanel).Color := clWhite;
end;

procedure TfrmPedidosDelivery.NovoPedido();
begin

  frm_principal.obsLancamento :='';
  evento:=1;
  limpouPagamentos := false;

  limparFilaDeImpressao();
  dm.tbSaboresPizzaTemp.Active:=false;
  dm.tbSaboresPizzaTemp.EmptyTable;
  frm_principal.obsSaborPizza:='';
  frm_principal.obsLancamento:='';
  cbkEntrega.Checked := false;
  cbkRetiraBalcao.Checked := false;
  dm.QryUltimosPedidosDelivery.Active:=false;
  dm.qryItensUltimosPedidos.Active:=false;
  dmPedidoDelivery.tbFormasPagamentoTemp.Active := false;
  dmPedidoDelivery.tbFormasPagamentoTemp.Active := true;


end;

procedure TfrmPedidosDelivery.btGravarClick(Sender: TObject);
begin
  if verificaValidadeEncerramento  then
  begin
    if (MessageDlg('Confirma ?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
     begin
      btGravar.Enabled := false;
      gravarInformacoes();
      close();
      inherited;
     end;
  end;
end;

procedure TfrmPedidosDelivery.btDeleteProdutoClick(Sender: TObject);
var
 idProduto : integer;
begin
  inherited;
   idProduto := TImage(Sender).Tag;
   dm.qry_movimento_mesa.Active := true;
   apagaItemMovimento(idProduto);
   alterouProdutos := true;
end;


procedure TfrmPedidosDelivery.apagaItemMovimento(id : integer);
var
 q : TIBQuery;
 ts : Tibtransaction;
begin


 ts      :=   TIBTransaction.Create(Self);
 ts.Name := RandomName(8);
 ts.DefaultDatabase   :=  dm.dbrestaurante;
 ts.Active := false;
 ts.Active := true;

 q := TIBQuery.Create(self);
 q.Database := dm.dbrestaurante;
 q.Transaction := ts;
 q.Active:=false;



  q.SQL.clear;
  dm.transacao.Active := true;

   if dm.painelDePergunta(#13#10+'  Confirma cancelamento do produto ?'+#13#10+#13#10,22) then
    begin

      q.Active:=false;
      q.sql.clear;
      q.SQL.add('delete from movimento_mesa where id='+IntTostr(id ) );
      q.ExecSQL;
      ts.commit;
    end;


  apagarItemLista(id);
  atualizaMovimento(false);

  FreeAndNil(ts);
  FreeAndNil(q);

end;


procedure TfrmPedidosDelivery.apagarItemLista(id : integer);
var
x: integer;
cp : TWinControl;
begin

     for x:= 0 to ScrollBox1.ComponentCount -1  do
       begin
        cp := TWinControl(  ScrollBox1.Components[x]);
        if ( (cp.Tag = id) and (cp.ClassName ='TPanel')) then
         begin
          cp.Visible := false;
//          FreeAndNil(cp);
          exit;
         end;
       end;

  //     ScrollBox1.Refresh;
//       ScrollBox1.Repaint;

end;


procedure TfrmPedidosDelivery.btDownListaClick(Sender: TObject);
begin
  inherited;
  ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position + 360;
end;

procedure TfrmPedidosDelivery.limpaCampos();
begin
 edTelClienteDelivery.text := '';;
 edNomeCliente.text := '';;
 edEnderecoCliente.text := '';;
 edBairroCliente.text := '';;
 edComplementoCliente.text := '';;
 edReferenciaCliente.text := '';;
 edReferencia2cliente.text := '';;
 edCodBarrasProduto.text := '';;
 edCodProduto.text := '';;
 edQuantidade.text := '';;
 edCodClienteDelivery.text := '';;
// edCodFormaPagamento.text := '';;
// edDescFormaPagto.text := '';;
 edValorForma.text := '';;

 ed_valor_bruto.Value:=0;
 ed_total_tx_serv.value:=0;
 ed_total_pago.value:=0;
 edTroco.Value := 0;
 ed_total_conta.Value:=0;
 edValorDesconto.Value := 0;
 edTotalDescontos.Value :=0;



// edDataEntrega.text := '';;
// edHoraEntrega.text := '';;
 cbkEntrega.Checked := false;


 limpaMesadelivery;
 limparFilaDeImpressao();
 dmPedidoDelivery.tbFormasPagamentoTemp.EmptyTable;
 dmPedidoDelivery.tbFormasPagamentoTemp.Active:=false;
 dmPedidoDelivery.tbFormasPagamentoTemp.Active:=true;

 dm.ImprimeFilaDeImpressao(false,'',0);
 dm.tbSaboresPizzaTemp.Active:=false;
 dm.tbSaboresPizzaTemp.EmptyTable;
 frm_principal.obsSaborPizza:='';
 frm_principal.obsLancamento:='';

 dm.QryUltimosPedidosDelivery.Active:=false;
 dm.qryItensUltimosPedidos.Active:=false;
 dm.qryObsClientesDelivery.Active:=false;

 ScrollBox1 := TScrollBox( pnScroll.FindComponent('ScrollBox1'));
  if ScrollBox1 <> nil then
   begin
     FreeAndNil(ScrollBox1);
   end;

 btUpLista.Visible := false;
 btDownLista.Visible := false;



end;



procedure TfrmPedidosDelivery.desbloqueiaPaineis();
begin
 pnTopo.Enabled:=true;
// pnMovimentoMesa.Enabled:=true;
 pnProduto.Enabled:=true;
// pnUltimosPedidos.Enabled:=true;
 pnFormasPagamento.Enabled:=true;

end;


procedure TfrmPedidosDelivery.edCodFormaPagamentoControlClick(Sender: TObject;
  Index: Integer);
begin
  inherited;
  clickControlCurvyExecute(Sender);
end;

procedure TfrmPedidosDelivery.edCodFormaPagamentoExit(Sender: TObject);
begin
  inherited;
  actExitFormaPagamentoExecute(Sender);
end;

procedure TfrmPedidosDelivery.bloqueiaPaineis();
begin
 pnTopo.Enabled:=false;
// pnMovimentoMesa.Enabled:=false;
 pnProduto.Enabled:=false;
// pnUltimosPedidos.Enabled:=false;
 pnFormasPagamento.Enabled:=false;
end;



function TfrmPedidosDelivery.verificaValidadeForma(cod_forma : string) : boolean;
begin
     try
       cod_forma:=FormatFloat('00',StrToFloat(cod_forma))
     except
       begin
         ShowMessage('Código de forma de pagamento inválido!');
//         edCodFormaPagamento.text := '';;
//         edCodFormaPagamento.SetFocus;
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




procedure TfrmPedidosDelivery.registraFormaPagto(cod_forma : string ; descricao_forma : string; valor : string);
var
 tipoForma : integer;
begin
 if (verificaValidadeForma(cod_forma) = true) then
  begin

    setRetornoForma(false);


    tipoForma:=dm.verificaTipoFormaPagamento(cod_forma);
    if (tipoForma <> 1) then
     begin
       case tipoForma of
        2: begin


        
            // Registra Fatura  - Abre tela de consulta de clientes para informar o cliente


             if ((evento = 1) or (limpouPagamentos = True ) ) then
              begin
                 setCodDiverso('');
                 setObsDiversa('');
                 Application.CreateForm(Tfrm_pagamento_faturado,frm_pagamento_faturado);
                 frm_pagamento_faturado.localOrigem := 2;
                 frm_pagamento_faturado.ShowModal;
                 frm_pagamento_faturado.Free;


                 if (getRetornoForma() = true ) then
                  begin
                   adicionar_pagamento(getCodDiverso,getObsDiversa,cod_forma,descricao_forma, valor);
                  end
                 else
                  begin
                    setCodDiverso('');
                    setObsDiversa('');
                  end;
              end
             else
              begin

                adicionar_pagamento(getCodDiverso,getObsDiversa,cod_forma,descricao_forma, valor);
              end;

           end;



       end;


     end
    else
     begin
       adicionar_pagamento('','',cod_forma,descricao_forma,valor);
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
  valorForma:=StrToFloat(edValorForma.Text);
  result:=valorForma;
end;

procedure TfrmPedidosDelivery.setCodDiverso(cod_diverso : string);
begin
  self.codDiverso := cod_diverso;
end;

procedure TfrmPedidosDelivery.setCodPedidoSelecionado(codPedido: string);
begin
  codPedidoSelecionado := codPedido;
end;

procedure TfrmPedidosDelivery.setEvento(ev: smallint);
begin
  self.evento := ev;
end;

function TfrmPedidosDelivery.getCodDiverso() : string;
begin
  result:= self.codDiverso;
end;

function TfrmPedidosDelivery.getCodPedidoSelecionado: string;
begin
  Result := codPedidoSelecionado;
end;

procedure TfrmPedidosDelivery.setObsDiversa(obs: string);
begin
  self.ObsDiverso := obs;
end;

function TfrmPedidosDelivery.getObsDiversa() : string;
begin
 Result:= Self.ObsDiverso;
end;













procedure TfrmPedidosDelivery.adicionar_pagamento(cod_diverso : string; obs: string; cod_forma : string; descricao_forma: string; valor : string);
var
 q : TIBQuery;
 rp : string;
begin
  q :=  TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.sql.text := '';;
  q.sql.add('select rp from formas_pagamento where cod_forma='+Quotedstr(cod_forma));
  q.Active:=true;
  rp:= q.fieldbyname('rp').value;
  q.Active :=false;
  FreeAndNil(q);

  if not dmPedidoDelivery.tbFormasPagamentoTemp.Locate('codForma',cod_forma,[]) then
   begin
    dmPedidoDelivery.tbFormasPagamentoTemp.Append;
    dmPedidoDelivery.tbFormasPagamentoTempcodForma.Value:=cod_forma;
    dmPedidoDelivery.tbFormasPagamentoTempdescricaoForma.value:= descricao_forma;
    dmPedidoDelivery.tbFormasPagamentoTempvalorForma.value := StrToFloat(valor);
    dmPedidoDelivery.tbFormasPagamentoTemprp.Value :=rp;
    dmPedidoDelivery.tbFormasPagamentoTempcodCliFaturamento.Value := cod_diverso;
    dmPedidoDelivery.tbFormasPagamentoTempobsFaturamento.Value  := obs;

    dmPedidoDelivery.tbFormasPagamentoTemp.Post;

   end
  else
    begin
      dmPedidoDelivery.tbFormasPagamentoTemp.Edit;
      dmPedidoDelivery.tbFormasPagamentoTempvalorForma.value := dmPedidoDelivery.tbFormasPagamentoTempvalorForma.Value + StrToFloat(valor);
      dmPedidoDelivery.tbFormasPagamentoTemp.Post;
    end;

//  memo_cod_diversos_formas_pgto.Lines.Add(getCodDiverso);
//  memo_obs_diversas.Lines.Add(getObsDiversa);
//  setObsDiversa('');
//  setCodDiverso('');

  ed_total_pago.Value:=StrToFloat(valor)+ed_total_pago.Value;
//  ed_valor_troco.Value:=ed_total_pago.Value-ed_total_conta.value;
//  edCodFormaPagamento .text := '';;
//  edDescFormaPagto.text := '';;
//  edCodFormaPagamento.SetFocus;
  edValorForma .Text := Formatfloat('#0.00',ed_total_conta.value-ed_total_pago.Value);

end;










procedure TfrmPedidosDelivery.calcula_valores(Sender: TObject);
begin


  if ckbDesconto.Checked  then
   begin
     edTotalDescontos.Value  := (ed_valor_bruto.Value * edValorDesconto.Value) / 100;     
   end
  else
   begin
     edTotalDescontos.Value  := edValorDesconto.Value;
   end;


   ed_total_conta.Value:=(ed_valor_bruto.value+ed_total_tx_serv.value) - edTotalDescontos.Value;

   if (ed_total_pago.Value - ed_total_conta.Value) > 0  then
   edTroco.Value := ed_total_pago.Value - ed_total_conta.Value;

   if ed_total_pago.value < ed_total_conta.value then
    edValorForma.text:= FormatFloat('#0.00', ed_total_conta.Value - ed_total_pago.Value)
   else
    begin
      edValorForma.text :='0,00';
    end;

    
   
   
end;






procedure TfrmPedidosDelivery.cbkEntregaClick(Sender: TObject);
begin
  inherited;

   if cbkEntrega.Checked = false then
    ed_total_tx_serv.value:= getValorTxEntregaBairro(edCodbairro.Text)
  else
    begin
      if (dm.verificaPermissaoAcao('B20003007') = true) then
       begin
        ed_total_tx_serv.Value := 0;
       end
      else
       begin
         cbkEntrega.Checked := false;
         ed_total_tx_serv.value:= getValorTxEntregaBairro(edCodbairro.Text);
       end;
    end;



  calcula_valores(Sender);
end;

procedure TfrmPedidosDelivery.cbkRetiraBalcaoClick(Sender: TObject);
begin
  inherited;

  if cbkRetiraBalcao.Checked  then
    begin
     cbkEntrega.Enabled := false;
     cbkEntrega.Checked := true;
     ed_total_tx_serv.value:= 0;
    end
  else
   begin
     cbkEntrega.Enabled  := true;
     cbkEntrega.Checked := false;
     ed_total_tx_serv.value:= getValorTxEntregaBairro(edCodbairro.Text);
   end;

   calcula_valores(Sender);

end;

procedure TfrmPedidosDelivery.gravarAlteracoesAntes(codAlteracao: string; codigoPedido : string; tipoAlteracao : smallint);
var
 Q : TIBQuery;
 pagamentos : string;
begin


  dmPedidoDelivery.tbFormasPagamentoTemp.First;
  while not (dmPedidoDelivery.tbFormasPagamentoTemp.Eof  ) do
   begin
     pagamentos := pagamentos +  dmPedidoDelivery.tbFormasPagamentoTempdescricaoForma.Value + ': '+FormatFloat('R$ ###,###,##0.00 ',dmPedidoDelivery.tbFormasPagamentoTempvalorForma.Value)+' ';

     dmPedidoDelivery.tbFormasPagamentoTemp.Next;
   end;



  q := TIBQuery.create(self);
  Q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  Q.Active  :=false;

  q.sql.text := '';;
  q.SQL.add(' insert into PEDIDOS_DELIVERY_ALTERACAO (codigo, cod_pedido,cod_cliente,cod_caixa, ');
  q.SQL.add('  cod_usuario, cod_usuario_autorizou, valor_total,numero_caixa,tipo_alteracao,usuario_operador,usuario_autorizador,pagamentos ) values (');
  q.SQL.Add(''+quotedstr(codAlteracao) +',');
  q.SQL.Add(''+Quotedstr(codigoPedido)+',');
  q.sql.add(''+Quotedstr(edCodClienteDelivery.text)+',');
  q.SQL.Add(''+Quotedstr(ultimoCaixaAberto)+',');
  q.SQL.Add(''+Quotedstr(codigo_usuario)+',');
  q.SQL.Add(''+Quotedstr(codigo_usuario_responsavel)+',');
  q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(ed_total_conta.value))+',');
  q.sql.add(''+Quotedstr(numero_caixa)+',');
  q.sql.add(''+IntToStr(tipoAlteracao)  +',');
  q.sql.add(''+Quotedstr(nome_usuario)  +',');
  q.sql.add(''+Quotedstr(nome_usuario_responsavel)  +',');
  q.sql.add(''+Quotedstr(pagamentos )  +')');
  q.ExecSQL;

  if (tipoAlteracao = 1 ) then
   begin
    Q.Active  :=false;
    q.sql.text := '';;
    q.SQL.add('  insert into it_ped_del_antes_alt (cod_alteracao,cod_produto,quantidade,valor_unitario) ');
    q.sql.add('            select '+Quotedstr(codAlteracao)+','+' mv.cod_produto,mv.quantidade,mv.valor_unitario  ');
    q.sql.add('                                       from movimento_mesa mv where mv.cod_mesa='+Quotedstr(mesaDelivery));
    q.ExecSQL;
   end
  else
   begin
    q.SQL.text := '';;
    q.SQL.add('  insert into it_ped_del_antes_alt (cod_alteracao,cod_produto,quantidade,valor_unitario) ');
    q.SQL.add('   select '+Quotedstr(codAlteracao) +','+' it.cod_produto, it.quantidade,it.valor_unitario ');
    q.sql.add(' from itens_pedido_delivery  it where it.cod_pedido='+Quotedstr(codigoPedido));
    q.ExecSQL;
   end;


end;

procedure TfrmPedidosDelivery.gravarAlteracoesPos(codAlteracao: string; codigoPedido : string; tipoAlteracao : smallint);
var
 Q : TIBQuery;
begin

  q := TIBQuery.create(self);
  Q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  Q.Active  :=false;

  q.SQL.text := '';;
  q.SQL.add('  insert into it_ped_del_pos_alt (cod_alteracao,cod_produto,quantidade,valor_unitario) ');
  q.SQL.add('   select '+Quotedstr(codAlteracao) +','+' it.cod_produto, it.quantidade,it.valor_unitario ');
  q.sql.add(' from itens_pedido_delivery  it where it.cod_pedido='+Quotedstr(codigoPedido));
  q.ExecSQL;
end;




procedure TfrmPedidosDelivery.gravarInformacoes();
var
 codigoPedido : string;
 Q : TIBQuery;
 aprovarPedido : boolean;
 statusPedido : smallint;
 alterado : smallint;
 retiraBalcao : smallint;
 via : smallint;
 codAlteracaoPedido : string;
begin
  q := TIBQuery.create(self);
  Q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  Q.Active  :=false;


 if cbkRetiraBalcao.Checked then
  retiraBalcao := 1
 else
  retiraBalcao := 0;




 if (evento = 1 ) then
  begin
    codigoPedido := dm.geraCodigo('G_PEDIDOS_DELIVERY',8 );
    alterado:=0;
  end
 else
  begin
    codigoPedido := edTelClienteDelivery.Text;
    alterado:=1;
  end;

  codAlteracaoPedido := dm.geraCodigo('G_ALT_PEDIDOS_DELIVERY',10 );
  gravarAlteracoesAntes(codAlteracaoPedido,codigoPedido,evento);

  if evento = 3 then
    gravarAlteracoesPos(codAlteracaoPedido,codigoPedido,evento);




 if evento = 3  then
  begin
   imprimePedidoLocalProducao(codigoPedido,evento);
   dm.imprimeComprovanteDelivery(codigoPedido, evento);
   apagarPedido(codigoPedido);
   limpaMesadelivery();
   dm.transacao.Commit;

  end
 else
  begin
    apagarPedido(codigoPedido);
    statusPedido := 1;
    Q.SQL.text := '';;
    q.sql.add('insert into pedidos_delivery (  CODIGO,COD_CLIENTE,DATA,DATA_HORA_ENTREGA,VALOR_BRUTO,VALOR_DESCONTO,VALOR_ENTREGA,');
    q.sql.add('VALOR_TOTAL,TOTAL_PAGO,VALOR_TROCO,COD_USUARIO,NUMERO_CAIXA,COD_CAIXA,status,alterado,retira_balcao)  values (');
    q.sql.add(''+Quotedstr(codigoPedido)+',');
    q.sql.add(''+Quotedstr(edCodClienteDelivery.text)+',');
    q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
    q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema  )+' '+FormatDateTime('HH:MM',Time  ))+',');
    q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(ed_valor_bruto.Value))+',');
    q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(edTotalDescontos.Value ))+',');
    q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(ed_total_tx_serv.value))+',');
    q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(ed_total_conta.value))+',');
    q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(ed_total_pago.value))+',');
    q.sql.add(''+dm.TrocaVirgPPto(Floattostr( ed_total_pago.Value - ed_total_conta.Value))+',');
    q.sql.add(''+Quotedstr(getCodOperadorCaixa(ultimoCaixaAberto)  )+',');
    q.sql.add(''+Quotedstr(numero_caixa)+',');
    q.sql.add(''+Quotedstr(ultimoCaixaAberto)+','
    +IntToStr(statusPedido)+','
    +IntToStr(alterado)+','
    +IntToStr(retiraBalcao)+')');
    dm.adicionaLog('Inserir pedido :'+Q.SQL.Text);
     q.ExecSQL;

    q.Active:=false;
    q.sql.text := '';;
    q.sql.add(' insert into itens_pedido_delivery  (cod_pedido,cod_produto,cod_garcon,cod_movimento,numero_caixa,');
    q.sql.add('                                       quantidade, total, cod_usuario, hora_lancamento,');
    q.sql.add('                                       hora_entrega, estado, desconto, valor_unitario, obs, id,impresso,observacoes,sabores,tipo_massa)');
    q.sql.add('            select '+Quotedstr(codigoPedido)+',mv.cod_produto,mv.cod_garcon,mv.cod_movimento,mv.numero_caixa,');
    q.sql.add('                                      mv.quantidade, mv.total, mv.cod_usuario, mv.hora_lancamento,');
    q.sql.add('                                       mv.hora_entrega, mv.estado, mv.desconto, mv.valor_unitario, mv.obs,mv.id,mv.impresso,mv.observacoes,mv.sabores,tipo_massa ');
    q.sql.add('                                       from movimento_mesa mv where mv.cod_mesa='+Quotedstr(mesaDelivery));

    dm.adicionaLog('Insere ítens do pedido :'+Q.SQL.Text);
     q.ExecSQL;




    q.Active := false;
    Q.SQL.text := '';;
    q.SQL.Add('       insert into sabores_pizza_pedido_delivery  (cod_pedido, cod_mesa,cod_produto, cod_sabor, valor_unitario_sabor,  ');
    q.SQL.Add('          quantidade,id_mov_mesa,proporcao,descricao)');
    q.SQL.Add('           select '+Quotedstr(codigoPedido)+',sb.cod_mesa, sb.cod_produto, sb.cod_sabor, sb.valor_unitario_sabor, sb.quantidade,sb.id_mov_mesa,');
    q.SQL.Add('                          sb.proporcao,sb.descricao');
    q.SQL.Add('             from sabores_pizza_movimento_mesa  sb');
    q.SQL.Add('                    where  sb.cod_mesa='+Quotedstr(mesaDelivery)+' ');

    dm.adicionaLog('Insere sabores de pizza :'+Q.SQL.Text);
    q.ExecSQL;


    gravarPagamentos(codigoPedido);
    gravarAlteracoesPos(codAlteracaoPedido,codigoPedido,evento);

    if  (evento = 1)  then
      imprimePedidoLocalProducao(codigoPedido,evento)
    else
     begin
      if alterouProdutos = true  then
        imprimePedidoLocalProducao(codigoPedido,evento);
     end;




    limpaMesadelivery();
    dm.transacao.Commit;
    dm.imprimeComprovanteDelivery(codigoPedido,evento);

  end;

  if( evento =1)  or ( evento=2 )then
   begin

      {

        if( troco > 0) then
          begin
           frm_principal.escreveExtenso.Valor:= troco;
           dm.exibe_painel_troco('TROCO A REPASSAR '+#13#10+#13#10+StrUpper(pchar(frm_principal.escreveExtenso.Texto)),FormatFloat('R$ ###,###,##0.00',troco)  );
          end;
       }
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
end;






function TfrmPedidosDelivery.verificaPossibilidadeDeTroco( troco : double) : boolean;
var
  linhas,linhaAtual : integer;
  totalFormasPermitidas : double;
begin
 totalFormasPermitidas :=0;
  dmPedidoDelivery.tbFormasPagamentoTemp.First;
  while not (dmPedidoDelivery.tbFormasPagamentoTemp.Eof  ) do
   begin
     if ( getPermissaoDeTroco(dmPedidoDelivery.tbFormasPagamentoTempcodForma.value) = true) then
      totalFormasPermitidas:= totalFormasPermitidas + dmPedidoDelivery.tbFormasPagamentoTempvalorForma.Value;
     dmPedidoDelivery.tbFormasPagamentoTemp.Next;
   end;

  if ( (totalFormasPermitidas - troco) >= 0) then
    Result:=true
  else
    Result:=false;
end;

function TfrmPedidosDelivery.verificaValidadeEncerramento() : boolean;

begin


  if evento = 1 then
   begin
    if ( verificaExistenciaClienteDeliveryPorTelefone(edTelClienteDelivery.Text) = false ) then
     begin
      dm.exibe_painel_erro('Cliente inexistente!','Tecle enter para continuar...');
      edTelClienteDelivery.SetFocus;
      result:=false;
      Exit;
     end;
   end;



  dm.qryAuxiliar.Active := false;
  dm.qryAuxiliar.sql.text := '';;
  dm.qryAuxiliar.SQL.Add('select mv.cod_mesa');
  dm.qryAuxiliar.SQL.Add('  from movimento_mesa mv ');
  dm.qryAuxiliar.SQL.add('  where mv.cod_mesa=' + Quotedstr(mesaDelivery));
  dm.qryAuxiliar.Active := true;


  if dm.qryAuxiliar.IsEmpty then
   begin
    dm.exibe_painel_erro('Nenhum produto registrado!','Tecle enter para continuar...');
  //  edCodBarrasProduto.SetFocus;
    result:=false;
    Exit;
   end;




  if evento = 2 then
   begin
    if ( verificaExistenciaPedidoDelivery(edTelClienteDelivery .Text ) = false ) then
     begin
      dm.exibe_painel_erro('Pedido inexistente!','Tecle enter para continuar...');
      edTelClienteDelivery.SetFocus;
      result:=false;
      Exit;
     end;
   end;




  if (ed_total_conta.Value < 0 ) then
   begin
    dm.exibe_painel_erro('Não é possível cadastrar um pedido com preço ZERO!','Tecle enter para continuar...');
    edCodProduto.SetFocus;
    result:=false;
    Exit;
   end;





  if (dmPedidoDelivery.tbFormasPagamentoTemp.IsEmpty ) then
   begin
    dm.exibe_painel_erro('Nenhuma forma de pagamento foi informada!','Tecle enter para continuar...');
//    edCodFormaPagamento.SetFocus;
    result:=false;
    Exit;
   end;



  if ed_total_pago.Value < ed_total_conta.value then
  begin
    dm.exibe_painel_erro('Valor pago é inferior ao total da conta','Tecle enter para continuar...');
    calcula_valores(ed_total_conta );
    edValorForma.SetFocus;
    result:=false;
    Exit;
  end;


   if ( verificaPossibilidadeDeTroco( (ed_total_pago.Value - ed_total_conta.value)  ) = false ) then
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
//       edCodFormaPagamento.SetFocus;
       Result:=false;
       exit;
    end;


  if (edValorDesconto.Value < 0)  then 
   begin
     showmessage('Valor do desconto é inválido!');
     edValorDesconto.Value :=0;
     result := false;
     exit;
   end;


   
  if (ed_valor_bruto.Value - edTotalDescontos.Value) <=0 then
   begin
     showmessage('Valor do desconto não pode ser superior ao valor bruto do pedido!');
     result := false;
   end;


  result:=true;
end;




procedure TfrmPedidosDelivery.gravarPagamentos(codigoPedido : string);
var
 valor_recebido : double;
begin
  dmPedidoDelivery.tbFormasPagamentoTemp.First;
   while not dmPedidoDelivery.tbFormasPagamentoTemp.Eof  do
     begin
       valor_recebido:=0;
       valor_recebido:= dmPedidoDelivery.tbFormasPagamentoTempvalorForma.Value;
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
        dm.qryauxiliar.sql.text := '';;
        dm.qryauxiliar.sql.add('insert into recebimentos_delivery (cod_pedido,cod_forma,valor,data,cod_usuario,numero_caixa,processado, ');
        dm.qryauxiliar.sql.add('cod_caixa,operadoracartao,numerocartao,validadecartao,codigocartao,cod_cli_faturamento, obs_faturamento) values (');
        dm.qryauxiliar.SQL.add(''+QUotedstr(codigoPedido)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(dmPedidoDelivery.tbFormasPagamentoTempcodForma.value)+',');
        dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(Floattostr(valor_recebido))+',');
        dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(getCodOperadorCaixa(ultimoCaixaAberto))+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(numero_caixa)+',0,');
        dm.qryauxiliar.sql.add(''+QuotedStr(ultimoCaixaAberto)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(dmPedidoDelivery.tbFormasPagamentoTempoperadoraCartao.value)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(dmPedidoDelivery.tbFormasPagamentoTempnumeroCartao.value)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(dmPedidoDelivery.tbFormasPagamentoTempvalidadeCartao.value)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(dmPedidoDelivery.tbFormasPagamentoTempcodigoCartao.value)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(dmPedidoDelivery.tbFormasPagamentoTempcodCliFaturamento.value)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(dmPedidoDelivery.tbFormasPagamentoTempobsFaturamento.value)+')');



        try
          begin
            dm.adicionaLog('Grava forma de pagamento do pedido '+codigoPedido);
            dm.adicionaLog(dm.qryauxiliar.SQL.Text);
            dm.qryauxiliar.ExecSQL;
          end;

        except
          begin
            ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
            dm.cria_log_de_erros(dm.qryauxiliar.sql,'Módulo de caixa','Erro ao gravar forma de pagamento',codigo_usuario);
            exit;
          end;
        end;
        dmPedidoDelivery.tbFormasPagamentoTemp.Next;
  end;
end;




procedure TfrmPedidosDelivery.Image3MouseEnter(Sender: TObject);
var
 ct : integer;
 pt : Tcontrol;
begin
  inherited;

 if not (sender is TCurvyPanel) then
  begin
    pt := (sender as Tcontrol).Parent ;
  end
 else
  begin
    pt := (sender as Tcontrol);
  end;


  (pt as TCurvyPanel).Color := clSkyBlue;


end;

procedure TfrmPedidosDelivery.Image3MouseLeave(Sender: TObject);

var
 ct : integer;
 pt : Tcontrol;
 data : TDate;
begin
  inherited;








 if not (sender is TCurvyPanel) then
  begin
    pt := (sender as Tcontrol).Parent;
  end
 else
  begin
    pt := (sender as Tcontrol);
  end;


  (pt as TCurvyPanel).Color := clwhite;



end;


procedure TfrmPedidosDelivery.Image1Click(Sender: TObject);
var
 LObs : TObsClienteDelivery;

begin
  inherited;
  LObs := TObsClienteDelivery.Create;
  LObs.codCliente := edCodClienteDelivery.Text;
  LObs.observacao := edNovaObservacao.Text;
  LObs.alertaPedidos := ckbAlertaPedidos.Checked;
  LObs.imprimirNaProducao  := ckbImprimeProducao.Checked;


  try
   LObs.cadastrar;
   edNovaObservacao.text :='';
   ckbAlertaPedidos.Checked := false;
   ckbImprimeProducao.Checked := false;
   ShowMessage('Observação cadastrada com sucesso!');
  finally
    FreeAndNil(LObs);
  end;

  atualizaListaObservacoesCliente(edCodClienteDelivery.Text);
end;

procedure TfrmPedidosDelivery.Image2Click(Sender: TObject);
begin
  inherited;
  limpouPagamentos:= true;
  dmPedidoDelivery.tbFormasPagamentoTemp.Active:=false;
  dmPedidoDelivery.tbFormasPagamentoTemp.EmptyTable;
  dmPedidoDelivery.tbFormasPagamentoTemp.Active:=true;
  ed_total_pago.value:=0;
  calcula_valores(sender);
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

  q.SQL.text := '';;
  q.sql.add('delete from pedidos_delivery where codigo='+Quotedstr(codPedido));
  q.ExecSQL;

  q.SQL.text := '';;
  q.sql.add('delete from itens_pedido_delivery where cod_pedido='+Quotedstr(codPedido));
  q.ExecSQL;

  q.SQL.text := '';;
  q.sql.add('delete from recebimentos_delivery where cod_pedido='+Quotedstr(codPedido));
  q.ExecSQL;

  Q.Active:=false;

  FreeAndNil(q);
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
  retornaInformacoes(codPedido, 2);
  q.Active:=false;

  q.sql.text := '';;
  q.sql.add('delete from movimento_mesa where cod_mesa='+Quotedstr(mesaDelivery));
  Q.ExecSQL;

  q.sql.text := '';;
  q.sql.add(' delete from movimento_mesa mv where mv.id ');
  q.sql.add('  in (select ip.id from  itens_pedido_delivery ip ');
  q.sql.add('        where ip.cod_pedido='+Quotedstr(codPedido)+')');
  Q.ExecSQL;




  q.sql.text := '';;
  q.sql.add(' insert into movimento_mesa  (cod_mesa,cod_produto,cod_garcon,cod_movimento,numero_caixa,');
  q.sql.add('                                       quantidade, total, cod_usuario, hora_lancamento,');
  q.sql.add('                                       hora_entrega, estado, desconto, valor_unitario, obs, id,impresso,observacoes,sabores,tipo_massa)');
  q.sql.add('            select '+Quotedstr(mesaDelivery)+',mv.cod_produto,mv.cod_garcon,mv.cod_movimento,mv.numero_caixa, ');
  q.sql.add('                                      mv.quantidade, mv.total, mv.cod_usuario, mv.hora_lancamento,');
  q.sql.add('                                       mv.hora_entrega, mv.estado, mv.desconto, mv.valor_unitario, mv.obs,mv.id,mv.impresso,mv.observacoes,mv.sabores,tipo_massa');
  q.sql.add('                                       from itens_pedido_delivery mv where mv.cod_pedido='+Quotedstr(codPedido));

  try
   begin
    dm.adicionaLog(Q.SQL.Text);
    q.ExecSQL;
   end;
  except
      begin
        dm.adicionaLog('Erro ao  gravar itens do pedido do delivery ');
        dm.adicionaLog(Q.SQL.Text);
        dm.exibe_painel_erro('Erro ao  gravar itens do pedido do delivery  ','Ok');
        exit;
      end;
  end;


 q.Active := false;
 Q.SQL.Clear;
 Q.SQL.Add('insert into sabores_pizza_movimento_mesa ');
 Q.SQL.Add('          (cod_mesa, cod_produto, cod_sabor, valor_unitario_sabor, quantidade,id_mov_mesa,');
 Q.SQL.Add('                          proporcao,descricao)');
 Q.SQL.Add('  select '+Quotedstr(mesaDelivery)+',sp.cod_produto, sp.cod_sabor, sp.valor_unitario_sabor, sp.quantidade,sp.id_mov_mesa,');
 Q.SQL.Add('                          sp.proporcao,sp.descricao');
 Q.SQL.Add('             from sabores_pizza_pedido_delivery   sp');
 Q.SQL.Add('                    where  sp.cod_pedido='+Quotedstr(codPedido));
  try
   begin
    q.ExecSQL;
   end;
  except
      begin
        dm.cria_log_de_erros(q.sql, 'Caixa - Restaurante ', 'Erro ao  gravar sabores da pizza do pedido do delivery ', codigo_usuario);
        dm.exibe_painel_erro('Erro ao  gravar sabores da pizza do pedido do delivery ','Ok');
        exit;
      end;
  end;



  dm.transacao.Commit;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  atualizaMovimento(true);
  desbloqueiaPaineis;



  dmPedidoDelivery.tbFormasPagamentoTemp.Active := false;
  dmPedidoDelivery.tbFormasPagamentoTemp.Active := true;

  q.Active:=false;
  q.SQL.text := '';;
  q.sql.Add('select r.*,f.descricao from recebimentos_delivery r ');
  q.sql.add(' inner join formas_pagamento f on (f.cod_forma = r.cod_forma)');
  q.SQL.add('where r.cod_pedido='+Quotedstr(codPedido));
  q.sql.add(' order by r.cod_forma');
  q.Active:=true;
  q.first;

  while not q.eof do
   begin
     setCodDiverso(q.fieldbyname('cod_cli_faturamento').Value);
     setObsDiversa(q.fieldbyname('obs_faturamento').Value);

     valor:= formatfloat('#0.00',q.fieldbyname('valor').value);
     registraFormaPagto(q.fieldbyname('cod_forma').value,q.fieldbyname('descricao').value,valor);
     calcula_valores(ed_total_conta);
     q.Next;
   end;

  if (evento = 2) then
   begin
     desbloqueiaPaineis;
  //   edCodBarrasProduto.setfocus;
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
       end;
    end;




end;

procedure TfrmPedidosDelivery.btNovoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_escape then btSair.Click;
end;

procedure TfrmPedidosDelivery.btObsProdutoClick(Sender: TObject);
var
  idProduto : integer;
begin
  inherited;
  dm.qry_movimento_mesa.Active := true;
  dm.qry_movimento_mesa.Locate('id',VarArrayOf([TImage(Sender).Tag]),[loCaseInsensitive]);
  idProduto := TImage(Sender).Tag;
  strObsProduto :='';
  Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
  frm_obs_lancamento_caixa.memo_obs_complementar.text := '';;
  frm_obs_lancamento_caixa.memo_obs_complementar.Lines.Add( dm.qry_movimento_mesa.FieldByName('observacoes').Value);
  frm_obs_lancamento_caixa.ShowModal;
  frm_obs_lancamento_caixa.free;
  dm.atualizaObservacoesProduto(idProduto,strObsProduto);
//  atualizaMovimento;
  calcula_valores(Sender);

  strObsProduto :='';
end;
procedure TfrmPedidosDelivery.btPesqClienteClick(Sender: TObject);
begin
  inherited;
  if evento = 1  then
  begin
   pesquisaClienteDelivery();

  if ( trim(edTelClienteDelivery.Text) <> '')  then
       Edit1Exit(edTelClienteDelivery);

  end;
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



TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
     {
if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin
Brush.Color := clmoneygreen;
FillRect(Rect);
Font.Style := [fsbold]
end;
      }




end;

procedure TfrmPedidosDelivery.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 {
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
   }
end;

procedure TfrmPedidosDelivery.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {
  if (Shift = [ssCtrl]) and (Key = 79) then
  begin
    frm_principal.obsLancamento:='';

    Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
    frm_obs_lancamento_caixa.ShowModal;
    frm_obs_lancamento_caixa.free;
  END;

  }
end;

procedure TfrmPedidosDelivery.D30001011MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  {
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
   }
end;




procedure TfrmPedidosDelivery.limparFilaDeImpressao();
var
 q : TIBquery;
 ts : Tibtransaction;
begin


 ts      :=   TIBTransaction.Create(Self);
 ts.Name := RandomName(8);
 ts.DefaultDatabase   :=  dm.dbrestaurante;
 ts.Active := false;
 ts.Active := true;



 q:= TIBQuery.create(self);
 q.Database := dm.dbrestaurante;
 q.Transaction := ts;


 q.SQL.text := '';;
 q.SQL.add('delete from fila_de_impressao where mesa='+Quotedstr(mesaDelivery));
 q.ExecSQL;
 ts.Commit;

 FreeAndNil(ts);
 FreeAndNil(q);

end;



procedure TfrmPedidosDelivery.memoObsItemExit(Sender: TObject);
begin
  inherited;
  dm.atualizaObservacoesProduto((sender as TMemo).Tag  ,(sender as TMemo).Lines.Text);
  atualizaMovimento(false);
  calcula_valores(Sender);
  strObsProduto :='';
   alterouProdutos := true;


end;

function TfrmPedidosDelivery.verificaSeFormasPgtoAprovacao() : boolean;
begin
  dmPedidoDelivery.tbFormasPagamentoTemp.First;
  Result:=false;
  while not dmPedidoDelivery.tbFormasPagamentoTemp.Eof do
  begin
    if ( verificaFormaPagamentoSolicitaDados(dmPedidoDelivery.tbFormasPagamentoTempcodForma.Text) = true ) then
     begin
       Result:=true;
       exit;
     end;
     dmPedidoDelivery.tbFormasPagamentoTemp.Next;
  end;

end;


procedure TfrmPedidosDelivery.imprimePedidoLocalProducao(codPedido : string; operacao : smallint);
begin
//  limparFilaDeImpressao();
  dm.qry_movimento_mesa.Active := false;
  dm.qry_movimento_mesa.sql.text := '';;
  dm.qry_movimento_mesa.SQL.Add('select mv.cod_mesa,pr.cod_barras,');
  dm.qry_movimento_mesa.sql.Add(' mv.cod_produto,pr.cod_produto,');
  dm.qry_movimento_mesa.sql.Add('pr.descricao,mv.quantidade as quantidade,');
  dm.qry_movimento_mesa.sql.Add('mv.valor_unitario,');
  if (arredondamento = 1 ) then
    dm.qry_movimento_mesa.sql.add('udf_truncdec((mv.valor_unitario * mv.quantidade),3) as total')
  else
    dm.qry_movimento_mesa.sql.add('udf_rounddec((mv.valor_unitario * mv.quantidade),3) as total ');

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
         dm.qry_movimento_mesa.fieldbyname('tipo_massa').value
         );
    end;


    dm.qry_movimento_mesa.Next;
   end;


   dm.ImprimeFilaDeImpressao(True,codPedido,operacao);
end;


procedure TfrmPedidosDelivery.JvDBGrid2CellClick(Column: TColumn);
begin
  inherited;
  dmPedidoDelivery.buscaItensDoPedidoDelivery();

//  if GetAsyncKeyState(  then


  if KeyIsDown( VK_CONTROL  ) then
    begin
      JvDBGrid2.BeginDrag(false);
    end;






end;

procedure TfrmPedidosDelivery.JvDBGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

  showmessage('');
end;

procedure TfrmPedidosDelivery.dbgItensPedidoCellClick(Column: TColumn);
begin
  inherited;
  if ( (dmPedidoDelivery.qryItensUltimosPedidos.Active)  and (dmPedidoDelivery.qryItensUltimosPedidos.IsEmpty = false)) then
   begin
     dbgItensPedido.Hint  :='Sabores: '+ dmPedidoDelivery.qryItensUltimosPedidosSABORES.Value+sLineBreak+sLineBreak+
                             'Obs: '+dmPedidoDelivery.qryItensUltimosPedidosOBSERVACOES.Value;
   end;
end;

procedure TfrmPedidosDelivery.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  dm.qryItensUltimosPedidos.Active:=false;
  dm.qryItensUltimosPedidos.sql.text := '';;
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
{        DBGrid4.Hint :=
          #13 + 'Produto: ' + dm.qryItensUltimosPedidos.fieldbyname('descricao').AsString +
          #13 + 'Quantidade: ' + FormatFloat('###,###,##0.000',dm.qryItensUltimosPedidos.fieldbyname('quantidade').Value) +
          #13+#13 + 'Sabores :'+#13+ dm.qryItensUltimosPedidos.fieldbyname('sabores').AsString+
          #13+#13+ 'Obs :'+#13+ dm.qryItensUltimosPedidos.fieldbyname('observacoes').AsString;
 }
      end;
    except
    end;           end;

end;

procedure TfrmPedidosDelivery.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if ( (Key = VK_F2)  and (evento=1) and (trim(edTelClienteDelivery.Text) <> '') ) then
    Edit1Exit(edTelClienteDelivery);





  if key = vk_f3 then
   begin
    string_auxiliar := '';
    Application.createForm(TfrmCadClientesDelivery, frmCadClientesDelivery);
    frmCadClientesDelivery.setEvento(2);
    frmCadClientesDelivery.setCodCliente(getcodClienteDeliveryPorTelefone(edTelClienteDelivery.Text));
    frmCadClientesDelivery.ShowModal;
    frmCadClientesDelivery.free;
    edTelClienteDelivery.SetFocus;
    atualizaMovimento(true);
    edCodBarrasProduto.SetFocus;
   end;


end;

procedure TfrmPedidosDelivery.edQuantidadeExit(Sender: TObject);
begin
  inherited;
  pageList2.ActivePageIndex  := 0;
  JvTabBar1.Tabs[0].Selected;

  if ( Trim(edQuantidade.Text) ='') then
   begin
     edValorDesconto.SetFocus;
   end
  else
   begin
    if ( validaQuantidade(Sender) = false ) then
      begin
        showmessage('Quantidade inválida!');
        edQuantidade.Text := '';
        edQuantidade.SetFocus;
        exit;
      end
    else
     begin
       if verifica_validade_lancamento then
         begin
           AdicionarProduto();
           calcula_valores(sender);
         end;
     end;

   end;
end;

procedure TfrmPedidosDelivery.edValorFormaExit(Sender: TObject);
begin
  inherited;
  if (Trim(edValorForma.Text) <> '')  then
    begin
      if validaValorPagamento(Sender)  then
       begin
         registraFormaPagto(edCodFormaPagamento.Text,edDescricaoForma.Text,FormatFloat('#0.00',StrToFloat(edValorForma.Text)));
         if ed_total_pago.Value >= ed_total_conta.Value   then
          begin
            btGravar.SetFocus;
            edCodFormaPagamento.Text := '';
            edDescricaoForma.Text := '';

          end
        else
         begin
           edCodFormaPagamento .Text := '';
           edDescricaoForma.Text := '';
           edCodFormaPagamento.SetFocus;
         end;

       end
      else
        begin
          ShowMessage('Valor da forma de pagamento é inválido!');
          edValorForma.Text := '';
          edValorForma.SetFocus;
        end;
    end;
end;

procedure TfrmPedidosDelivery.Excluirobservao1Click(Sender: TObject);
var
 LObs : TObsClienteDelivery;

begin
  inherited;

  LObs := TObsClienteDelivery.Create;
  LObs.codObs := dmPedidoDelivery.qryObservacoesClientes.FieldByName('codigo').Value;
  try
   LObs.excluir;
   ShowMessage('Observação excluída com sucesso!');
  finally
    FreeAndNil(LObs);
  end;

  atualizaListaObservacoesCliente(edCodClienteDelivery.Text);
end;

procedure TfrmPedidosDelivery.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
{
  if odd(dm_relatorios.qryItensPedidoDelivery.RecNo) then
   DBGrid3.Canvas.Brush.Color:= clwhite
  else
   DBGrid3.Canvas.Brush.Color:= clMoneyGreen;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
 }

end;

procedure TfrmPedidosDelivery.DBGrid2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ((dm.qryObsClientesDelivery.Active) and (dm.qryObsClientesDelivery .IsEmpty = false)) then
  begin
    try
      begin
//        DBGrid3.Hint :=#13+#13+#13+ dm.qryObsClientesDelivery.fieldbyname('observacao').AsString;
      end;
    except
    end;           end;


end;

procedure TfrmPedidosDelivery.FormCreate(Sender: TObject);
begin
  inherited;
  application.CreateForm(TfrmPainelAguarde,frmPainelAguarde);
  entradaDoForm := false;
  alterouProdutos := false;
  evento :=1;

end;

procedure TfrmPedidosDelivery.FormActivate(Sender: TObject);
begin
  inherited;
  dmPedidoDelivery := TdmPedidoDelivery.Create(Self);


  pnTotais.Enabled := false;

  Label8.Caption := dm.BuscaTroca(Label8.Caption,' ',LineBreak);



  if ( entradaDoForm = false) then
   begin
       entradaDoForm := True;
      limpouPagamentos := false;
      Self.Width:=1027;
      Self.Height:=755;
      Self.Top:=1;
//      self.Left:=1;
      limpaMesadelivery();


   end;


   if evento =1  then
    begin
     limpouPagamentos := false;
     NovoPedido();
     btGravar.Caption:= 'Gravar pedido';
    end
  else
   begin




        entradaDoForm := true;
        limpouPagamentos := false;
        case evento of
          2 : begin
                  controla_botoes(nil);
                  edTelClienteDelivery.Text := getCodPedidoSelecionado();
                  retornaDadosDoPedido(edTelClienteDelivery.Text);
                  btGravar.Caption := 'Confirmar alteração'+#13+'do pedido!';
                  alterouProdutos := false;

              end;

          3 : begin
               controla_botoes(nil);
               edTelClienteDelivery.Text := getCodPedidoSelecionado();
               retornaDadosDoPedido(edTelClienteDelivery.Text);
               btGravar.Caption := 'Confirmar exclusão'+#13+'do pedido!';
               alterouProdutos := true;
              end;

          4 : begin
               lbTituloTelefone.Caption := 'Nº do pedido:';
               controla_botoes(nil);
//               edTelClienteDelivery.Text := getCodPedidoSelecionado();
//               retornaDadosDoPedido(edTelClienteDelivery.Text);
//               btGravar.Enabled  := false;
               alterouProdutos := false;
              end;



        end;



   end;


end;

procedure TfrmPedidosDelivery.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmPedidoDelivery);
  FreeAndNil(frmPainelAguarde);
end;

procedure TfrmPedidosDelivery.ckbDescontoClick(Sender: TObject);
begin
  inherited;


  calcula_valores(ckbDesconto);
end;



procedure TfrmPedidosDelivery.atualizaListaObservacoesCliente(ACodCliente : string);
begin
  dmPedidoDelivery.tsObservacoesClientesDelivery.Active := false;
  dmPedidoDelivery.qryObservacoesClientes.Active := false;
  dmPedidoDelivery.qryObservacoesClientes.SQL.Clear;
  dmPedidoDelivery.qryObservacoesClientes.SQL.Add('  select obs.codigo, obs.data, obs.observacao ');
  dmPedidoDelivery.qryObservacoesClientes.SQL.Add('            from OBS_CLIENTES_DELIVERY obs ');
  dmPedidoDelivery.qryObservacoesClientes.SQL.Add('             where cod_cli='+Quotedstr(ACodCliente));
  dmPedidoDelivery.qryObservacoesClientes.SQL.Add('    order by obs.data desc ');
  dmPedidoDelivery.qryObservacoesClientes.Active := true;
  JvDBGrid1.Refresh;

  if dmPedidoDelivery.qryObservacoesClientes.IsEmpty  then
   begin
     Excluirobservao1.Enabled := false;
   end
  else
   begin
     Excluirobservao1.Enabled := true;
       pageList2.ActivePageIndex  := 1;
       JvTabBar1.Tabs[1].Selected;

      dmPedidoDelivery.qryObservacoesClientes.First;

      while not dmPedidoDelivery.qryObservacoesClientes.Eof  do
       begin
        dm.exibe_painel_erro(dmPedidoDelivery.qryObservacoesClientes.FieldByName('observacao').Value,'Estou ciente');

        dmPedidoDelivery.qryObservacoesClientes.next;
       end;



   end;


end;







end.











