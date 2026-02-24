
unit uu_lancamento_touch;

interface

uses
  Windows,qt,
  Messages,
  SysUtils,
  variants,
  StdCtrls,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  
  Buttons,
  Grids,
  DBGrids,
  
  Mask,
  
  
  
  
  db,
  
  RXCtrls,
  Menus,uu_modelo_vazio, ibx.ibquery, 
  cxControls, dxStatusBar, ACBrBase,
  ACBrCalculadora, Shader, AdvTouchKeyboard, ImgList, cxGraphics;

type

  Tfrm_lancamento_touch = class(Tfrm_modelo_vazio)
    memo_codigos_formas: TMemo;
    Panel2: TPanel;
    lb_hora: TLabel;
    pnMovimentoMesa: TPanel;
    D30001011: TDBGrid;
    rdg_modo_visualizacao: TRadioGroup;
    Panel4: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
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
    Label4: TLabel;
    Timer1: TTimer;
    ACBrCalculadora1: TACBrCalculadora;
    pn_controle: TPanel;
    B20002001: TBitBtn;
    btCalculadora: TBitBtn;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    pn_mesa: TPanel;
    Label21: TLabel;
    ed_numero_mesa: TFocusEdit;
    pn_garcon: TPanel;
    Label1: TLabel;
    bt_pesquisa_garcon: TSpeedButton;
    ed_cod_garcon: TFocusEdit;
    pn_produto: TPanel;
    Label6: TLabel;
    lbNumeroComanda: TLabel;
    ed_numero_comanda: TFocusEdit;
    Label5: TLabel;
    ed_cod_produto: TFocusEdit;
    Label2: TLabel;
    bt_pesq_produto: TSpeedButton;
    ed_valor_produto: TFocusEdit;
    ed_quantidade: TFocusEdit;
    Panel5: TPanel;
    ed_descricao_produto: TFocusEdit;
    Label3: TLabel;
    dxStatusBar1: TdxStatusBar;
    procedure mudaCaptionsBotoes();
    procedure alternarTipoCaixa(tipo : integer);
    procedure ed_numero_mesaExit(Sender: TObject);
    function busca_movimento_da_mesa: boolean;
    function informacoes_garcon: boolean;
    function pesquisar_produto: boolean;
    function verifica_validade_lancamento: boolean;
    function adicionar_produto_conta(mesa : string; enviar_impressao : boolean ): boolean;
    function pesquisa_produto: boolean;
    function gravar_tx_serv: boolean;
    procedure cor_dos_componentes;
    procedure ed_numero_mesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure ed_numero_mesaEnter(Sender: TObject);
    procedure B30001003Click(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure timerInativacaoPedidosTimer(Sender: TObject);
    procedure bt_pesq_produtoClick(Sender: TObject);
    procedure B20002001KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_pesquisa_garconClick(Sender: TObject);

    procedure B20002001Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure B30001008Click(Sender: TObject);
    procedure B30001009Click(Sender: TObject);
    procedure B30001010Click(Sender: TObject);
    function verifica_movimento: boolean;
    procedure B300010040Click(Sender: TObject);
    procedure verificar_permissoes;
    procedure voltar_mesa;
    procedure B30001005Click(Sender: TObject);
    procedure D30001011Exit(Sender: TObject);
    procedure D30001011MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure D30001011DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

    procedure transferirMesa();
    procedure transferirItem();
    procedure apagaItemMovimento(qtde: double; codMotivo : string; descricaoMotivo: string; obs : string);

    procedure B30001007Click(Sender: TObject);
    procedure ransferirtem1Click(Sender: TObject);
    procedure D30001011DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure B30001001KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Cancelartem1Click(Sender: TObject);
    procedure emitirExtrato();
    procedure fecharConta();
    procedure btTrocaModClick(Sender: TObject);

    procedure rdg_modo_visualizacaoClick(Sender: TObject);
    procedure efetuar_lancamento;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure B30001016Click(Sender: TObject);
    procedure ed_numero_mesaChange(Sender: TObject);
    procedure ed_cod_produtoChange(Sender: TObject);
    procedure ed_quantidadeChange(Sender: TObject);
    procedure lancarCouvertAutomatico(mesa : string);

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure timerAtualizaTelaMesasTimer(Sender: TObject);


    procedure enter_botao(Sender: TObject);
    procedure FuncaoBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btCalculadoraClick(Sender: TObject);
    procedure btDeliveryClick(Sender: TObject);
    procedure btLeituraXClick(Sender: TObject);
    procedure btReducaoZClick(Sender: TObject);
    procedure btSangriaClick(Sender: TObject);

  private
    { Private declarations }
    modo_exibicao: integer;

    //0 normal
    //1 resumido

  public
    { Public declarations }
   tipo_caixa_atual : integer;
  end;





var
  frm_lancamento_touch: Tfrm_lancamento_touch;
  tx_serv: double;
  pagina :TScrollbox;
  tipo_botao : integer;
  selecionado : string;
  total_mesas : integer;


implementation

uses uu_data_module,
  uu_cs_produtos,
  uu_frm_principal,
  
  uu_transferir_item,
  uu_transferir_mesa,
  uu_cs_garcons,
  uu_encerramento,
  uu_extrato,
  uu_recebimentos_parciais,
  
  UU_ESTACIONAMENTO,
  
  
  uu_confirma_extrato, uu_obs_lancamento_caixa, 
  
  uuPrincipalDelivery, uuSelecaoCouvert, uuSangria,
  uuSelecaoSaboresPizza;
{$R *.dfm}

procedure Tfrm_lancamento_touch.ed_numero_mesaExit(Sender: TObject);
var
 qtdeCalculada : double;
begin

  if sender is TDBGrid then
  begin
    (sender as TDBGrid).Color := clWhite;
  end;

  if ((sender is Tedit and ((sender as Tedit).Name = 'ed_numero_mesa')) and (Trim(ed_numero_mesa.text) <> '')) then
  begin
    //Ao mexer na parte sobre o edit numero de mesa, alterar também o mesmo trecho no evento dos clicks
    // botões que são criados dinâmicamente no painel de mesas abertas.


   ed_numero_mesa.Text:= dm.removeCaracteres(ed_numero_mesa.Text);
   dm.transacao.Active:=true;
   dm.transacao.Active:=false;
   dm.transacao.Active:=true;

   if trim(ed_quantidade.text) = ''  then     ed_quantidade.text:='1';

    try
      begin
        if trim(ed_numero_mesa.Text) = '' then
        begin
          ed_numero_mesa.Clear;
          ed_numero_mesa.SetFocus;
          exit;
        end
        else
        begin
          ed_numero_mesa.Text := formatfloat('0000', Strtofloat(ed_numero_mesa.Text));
          ed_numero_mesa.Text := formatfloat('0000', Strtofloat(ed_numero_mesa.Text));

          if( trim(ed_numero_mesa.Text) <> dm.getCodMesaBalcao() ) then
          begin
            ed_cod_garcon.Text := dm.getCodGarconAbriuMesa(ed_numero_mesa.Text);
          end;
        end;
      end;
    except
      begin
        showmessage('Número de mesa inválido!');
        ed_numero_mesa.Clear;
        ed_numero_mesa.SetFocus;
        exit;
      end;
    end;
    //    foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'));

    //Ponto de verificacao se usa cartao
    if (  (dm.verificaSeFuncionaComoBoate = true)  and (ed_numero_mesa.Text <> dm.getCodMesaBalcao() ) )   then
     begin
       if (verificaStatusCartao(ed_numero_mesa.Text) = false ) then
         begin
           ed_numero_mesa.clear;
           ed_numero_mesa.SetFocus;
           exit;
         end;
     end;



   if (cobraCouvert = 1) then
     begin
        if  ( (ed_numero_mesa.Text <> dm.getCodMesaBalcao()) and   (lancaCouvertAutomaticamente= 1)) then
          begin
                if ( dm.verificaSeMesaTemMovimento(ed_numero_mesa.Text) =false) then
                  begin
                     if (MessageDlg('Mesa/Cartão sem movimento. Deseja lançar couvert assim mesmo ?',mtConfirmation,[mbYes,mbNo],0) = mrYes )then
                       begin
                          if (verificaSeExisteCouvertNaConta(ed_numero_mesa.Text) = false) then
                           begin
                             dm.lancarCouvertAutomaticamente(0,ed_numero_mesa.Text);
                           end;
                       end;
                  end
                else
                  begin
                    lancarCouvertAutomatico(ed_numero_mesa.Text);
                  end;
          end
        else
          begin
             //   tes
             if (ed_numero_mesa.Text <> dm.getCodMesaBalcao()) then
               begin
                           // Faz a chamada de lançamento por couvert comum, janela
                  if (verificaSeExisteCouvertNaConta(ed_numero_mesa.Text) = false) then
                   begin
                     Application.CreateForm(TfrmSelecaoCouvert,frmSelecaoCouvert);
                     frmSelecaoCouvert.showmodal;
                     frmSelecaoCouvert.free;
                   end;
               end;
          end;
     end;













    if (dm.verificaseExisteMovimentoMesa(ed_numero_mesa.Text) = false) then
     begin
       dm.apagaExtratosEmitidos(ed_numero_mesa.Text);
       dm.ApagaAberturaDaMesa(ed_numero_mesa.text);
       if dm.transacao.Active = false then dm.transacao.Active:=true;
       dm.transacao.Commit;
     end;



    if (   (dm.verificaExtratosEmitidos(ed_numero_mesa.text) = true)  and  (StrToInt(dm.LeIni(2, 'CAIXA', 'checar_mesa_aberta')) = 1) and (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false)   )  then
     begin
      string_auxiliar := 'N';
      Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
      frm_confirma_extrato.setTitulo('Confirmação');
      frm_confirma_extrato.setMensagem('A mesa informada encontra-se aguardando pagamento!! '+#13#10+#13#10+' Deseja continuar ?',12);
      frm_confirma_extrato.ShowModal;
      frm_confirma_extrato.free;
      if string_auxiliar = 'S' then
       begin
         busca_movimento_da_mesa();
       end
      else
       begin
         ed_numero_mesa.Clear;
         ed_numero_mesa.SetFocus();
       end;
     end
    else
     begin
      busca_movimento_da_mesa;
     end;

  end;


  if ((sender is Tedit and ((sender as Tedit).Name = 'ed_cod_garcon')) and (trim(ed_cod_garcon.text) <> '')) then
  begin
    if triM((sender as Tedit).Text) = '' then exit;


    try
      ed_cod_garcon.Text := FormatFloat('000', strtofloat(ed_cod_garcon.Text));
    except
      begin
        ShowMessage('Código de garçon inválido!');
        ed_cod_garcon.clear;
        ed_cod_garcon.SetFocus;
        exit;
      end;
    end;

     if ( dm.getCodMesaBalcao = trim(ed_cod_garcon.Text) )
     then
      begin
        ShowMessage('Código de garçon inválido!');
        ed_cod_garcon.clear;
        ed_cod_garcon.SetFocus;
           exit;
      end;
    informacoes_garcon;
  end;

  if ( (sender is Tedit and ((sender as Tedit).Name = 'ed_cod_garcon')) ) then
  begin
   if  (dm.getCodGarconMesaBalcao = ed_cod_garcon.Text) then
   begin
        ShowMessage('Código de garçon inválido!');
        ed_cod_garcon.clear;
        ed_cod_garcon.SetFocus;
         exit;

   end;

  end;


  if ((sender is Tedit and ((sender as Tedit).Name = 'ed_cod_produto')) and (trim(ed_cod_produto.text) <> '')) then
  begin
   if trim(ed_quantidade.text) = ''  then ed_quantidade.text:='1';

    try
      begin
        StrToInt(ed_cod_produto.Text);
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
      ShowMessage('O código informado não pertence a um produto cadastrado!');
      ed_cod_produto.SetFocus;
      ed_cod_produto.Clear;
      exit;
    end;
    lb_cod_produto.Caption := dm.qryauxiliar.fieldbyname('cod_produto').value;
    ed_descricao_produto.Text := dm.qryauxiliar.fieldbyname('descricao').value;
    ed_valor_produto.Text := FormatFloat('#0.00,', dm.qryauxiliar.fieldbyname('valor_unitario').value);
    try
      //       foto.picture.LoadFromFile(dm.qryauxiliar.fieldbyname('caminho_foto').value);
    except
      begin
        ShowMessage('Caminho de imagem incorreto! Favor alterar a imagem do produto no cadastro de produtos.');
        try
          //           foto.picture.LoadFromFile(dm.LeIni(2,'IMAGENS','sem_foto'));
        except
        end;
      end;
    end;

    if ( verificaProdutoDigitaPreco(ed_cod_produto.Text) = true) then
     begin
      ed_valor_produto.Clear;
      ed_valor_produto.Enabled:=true;
      ed_valor_produto.ReadOnly:=false;
      ed_valor_produto.SetFocus;
     end
    else
     begin
      ed_valor_produto.Enabled:=false;
      ed_valor_produto.ReadOnly:=true;
      ed_quantidade.ReadOnly := false;

      if (verificaSeProdutoLeQuantidadeDaBalanca(ed_cod_produto.Text,2) = true) then
        begin
          sucessoLeituraPeso := true;
          try
           frm_principal.balanca.Ativar;
          except
            begin
              dm.exibe_painel_erro('Erro ao conectar à balança. Verifique a porta ou cabo de conexão!','Continuar');
            end;
          end;

          Try
            begin
              frm_principal.balanca.LePeso(200);

               ed_quantidade.Text := pesoLidoBalanca;
            end;
          except
            begin
             ed_cod_produto.SetFocus;
             exit;
            end;
          end;


          if sucessoLeituraPeso = true then
            begin

            if strToFloat(pesoLidoBalanca) <= 0 then
              begin
               dm.exibe_painel_erro('Erro ao fazer leitura do peso!','Continuar');
               sucessoLeituraPeso :=false;
               ed_descricao_produto.Clear;
               ed_quantidade.Clear;
               ed_cod_produto.Clear;
               ed_cod_produto.SetFocus;
               exit;
             end
            else
             begin
              dm.efetuaAberturaDaMesa(ed_numero_mesa.text);
              adicionar_produto_conta(ed_numero_mesa.Text,    ( (dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption))  and (dm.verificaProdutoImprimeMesas(lb_cod_produto.Caption ) ) ) );
              exit;
             end;
             
            end
          else
            begin
             ed_descricao_produto.Clear;
             ed_cod_produto.Clear;
             ed_cod_produto.SetFocus;
             exit;
            end;
          frm_principal.balanca.Desativar;
        end;

      ed_quantidade.SetFocus;
     end;


    lb_preco.Visible := true;
    descricao_prod.Visible := true;
    descricao_prod.Caption := dm.qryauxiliar.fieldbyname('descricao').value;
    lb_preco.Caption := FormatFloat('R$ #0.00,', dm.qryauxiliar.fieldbyname('valor_unitario').value);
  end;

if ((sender is Tedit and ((sender as Tedit).Name = 'ed_valor_produto'))) then
  begin
    try
      StrToFloat(ed_valor_produto.Text);
    except
      begin
        showmessage('Valor do produto inválido!');
        ed_valor_produto.SetFocus;
        ed_valor_produto.clear;
        exit;
      end;
    end;

    if ( StrToFloat(ed_valor_produto.Text) <= 0 ) then
    begin
        showmessage('Valor do produto inválido!!');
        ed_valor_produto.SetFocus;
        ed_valor_produto.clear;
        exit;
    end;

    if (verificaSeProdutoCalculaQtde(ed_cod_produto.text,2) ) then
     begin
       qtdeCalculada:=0;
       qtdeCalculada:= StrToFloat(ed_valor_produto.Text)   /  getValorProduto(ed_cod_produto.Text,2);
       ed_quantidade.text := FormatFloat('#0.000',qtdeCalculada);
       efetuar_lancamento;
     end;


    if ( (ed_numero_comanda.Enabled = false) and    ((sender as Tedit).Name = 'ed_quantidade'))  then
    begin
      efetuar_lancamento();
    end;

  end;


  if ((sender is Tedit and ((sender as Tedit).Name = 'ed_quantidade'))) then
  begin
     IF  (trim(ed_quantidade.text) = '') THEN exit;


  if (verificaSeUsaCodGarcon = False) then
    begin
      ed_cod_garcon.text:=dm.getCodGarconMesaBalcao();
      ed_cod_garcon.Visible:=false;
      pn_garcon.Visible:=FALSE;
      pn_produto.Left:=89;
      pn_produto.Width:=704;
    end;


    try
      StrToFloat(ed_quantidade.Text);
    except
      begin
        showmessage('Quantidade inválida!');
        ed_quantidade.SetFocus;
        ed_quantidade.clear;
        exit;
      end;
    end;

    if ( StrToFloat(ed_quantidade.Text) <= 0 ) then
    begin
        showmessage('Quantidade inválida!');
        ed_quantidade.SetFocus;
        ed_quantidade.clear;
        exit;

    end;

    if ed_numero_comanda.Enabled = false then
    begin
      efetuar_lancamento();
    end;

  end;

  if ((sender is Tedit and ((sender as Tedit).Name = 'ed_numero_comanda'))) then
  begin
    try
      StrToInt(ed_numero_comanda.Text);
    except
      begin
        showmessage('Comanda inválida!');
        ed_numero_comanda.SetFocus;
        ed_numero_comanda.clear;
        exit;
      end;
    end;

    if ed_numero_comanda.Enabled = true then
    begin
      efetuar_lancamento();
    end;

  end;

end;

function Tfrm_lancamento_touch.busca_movimento_da_mesa: boolean;
var
  valor_bruto: double;
  valor_tx_serv: double;
  valorDescontos : double;
  Marcado : TBooleanField;
begin
        
  if ( trim(ed_numero_mesa.Text) = '' ) then exit;
  ed_numero_mesa.Text := Formatfloat('0000', StrToFloat(ed_numero_mesa.text));
  dm.transacao.Active := false;
  dm.transacao.Active := true;


/// Verificação de cobrança de taxa de serviço.
 if ( StrToint(dm.LeIni(1,'TAXA_SERVICO','cobraTaxaServico'))  = 0) then
  begin
    percentualTaxaServico:=0;
  end
 else
  begin
    // Verifica se o atual caixa aberto cobra taxa de serviço.
    if (verificaSeCobraServico = false ) then  // Se não cobrar, zera o valor do percentual
     begin
      percentualTaxaServico:=0
     end
    else
      begin
      // Se cobrar, verifica se a mesa em questão cobra taxa de servico

        If verificaSeCartaoCobraServico(ed_numero_mesa.Text) then
         begin
            percentualTaxaServico:= StrToFloat(dm.LeIni(2,'TAXA_SERVICO','percentual'));
         end
        else
         begin
           percentualTaxaServico:= 0;
         end;
      end;
  end;

  // Fim da verificação de cobrança de taxa de serviço.
////////////////////////////////////////////////////////






  if (rdg_modo_visualizacao.ItemIndex = 0) then
  begin
    dm.qry_movimento_mesa.Active := false;
    dm.qry_movimento_mesa.sql.clear;
    dm.qry_movimento_mesa.SQL.Add('select mv.cod_mesa,pr.cod_barras,');
    dm.qry_movimento_mesa.sql.Add(' mv.cod_produto,pr.cod_produto,');
    dm.qry_movimento_mesa.sql.Add('pr.descricao,mv.quantidade as quantidade,');
    dm.qry_movimento_mesa.sql.Add('mv.valor_unitario,');
    if (arredondamento = 1 ) then
     dm.qry_movimento_mesa.sql.add('udf_truncdec((mv.valor_unitario * mv.quantidade),3) as total')
    else
     dm.qry_movimento_mesa.sql.add('udf_rounddec((mv.valor_unitario * mv.quantidade),3) as total ');



    dm.qry_movimento_mesa.sql.Add(',mv.comanda, mv.cod_garcon, g.apelido,u.login,mv.hora_lancamento, mv.estado,mv.cod_movimento, mv.desconto');
    dm.qry_movimento_mesa.SQL.Add('  from movimento_mesa mv ');
    dm.qry_movimento_mesa.sql.Add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
    dm.qry_movimento_mesa.sql.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
    dm.qry_movimento_mesa.SQL.add('  inner join usuarios u on (u.cod_usuario=mv.cod_usuario)');
    dm.qry_movimento_mesa.SQL.add('  where mv.cod_mesa=' + Quotedstr(ed_numero_mesa.Text) + ' order by mv.cod_movimento');
    dm.qry_movimento_mesa.Active := true;

    TFloatField(dm.qry_movimento_mesa.Fields[5]).DisplayFormat := '###,###,##0.000';
    TFloatField(dm.qry_movimento_mesa.Fields[6]).DisplayFormat := 'R$ ###,###,##0.00';
    TFloatField(dm.qry_movimento_mesa.Fields[7]).DisplayFormat := 'R$ ###,###,##0.00';

    D30001011.Columns[0].Visible := false;
    D30001011.Columns[1].Title.Caption := 'Cód.';
    D30001011.Columns[1].Width := 40;
    D30001011.Columns[2].Visible := false;
    D30001011.Columns[3].Visible := false;
    D30001011.Columns[4].Title.Caption := 'Descrição';
    D30001011.Columns[4].Width := 210;
    D30001011.Columns[5].Title.Caption := 'Qtde';
    D30001011.Columns[5].Width := 40;
    D30001011.Columns[6].Title.Caption := 'Preço';
    D30001011.Columns[6].Width := 60;
    D30001011.Columns[7].Title.Caption := 'Total';

    D30001011.Columns[7].Width := 60;
    D30001011.Columns[7].Visible := true;
    D30001011.Columns[8].Title.Caption := 'Comanda';
    D30001011.Columns[8].Width := 60;
    D30001011.Columns[8].Visible := true;

    D30001011.Columns[9].Visible := false;
    D30001011.Columns[10].Visible := false;
    D30001011.Columns[10].Visible := false;
    D30001011.Columns[11].Visible := false;
    D30001011.Columns[12].Visible := false;
    D30001011.Columns[13].Visible := false;
    D30001011.Columns[14].Visible := false;
    D30001011.Columns[15].Title.Caption:='Desconto';
    D30001011.Columns[15].Width := 60;


  end
  else
  begin
    dm.qry_movimento_mesa.Active := false;
    dm.qry_movimento_mesa.sql.clear;
    dm.qry_movimento_mesa.sql.add('select mv.cod_produto,p.cod_barras,p.descricao,sum(mv.quantidade)as quantidade,MV.valor_unitario as valor_unitario, sum(mv.desconto) as desconto from movimento_mesa mv');
    dm.qry_movimento_mesa.sql.add('inner join produtos p on (p.cod_produto = mv.cod_produto)');
    dm.qry_movimento_mesa.sql.add(' where mv.cod_mesa=' + Quotedstr(ed_numero_mesa.Text));
    dm.qry_movimento_mesa.sql.add('group by mv.cod_produto,p.cod_barras,p.descricao,mv.valor_unitario');
    dm.qry_movimento_mesa.sql.add('order by mv.cod_produto');
    dm.qry_movimento_mesa.Active := true;

//    TFloatField(dm.qry_movimento_mesa.Fields[3]).DisplayFormat := 'R$ ###,###,##0.00';
    TFloatField(dm.qry_movimento_mesa.Fields[4]).DisplayFormat := 'R$ ###,###,##0.00';

    D30001011.Columns[0].Visible := false;
    D30001011.Columns[1].Title.Caption := 'Código';
    D30001011.Columns[1].Visible := true;
    D30001011.Columns[1].Width := 45;


    D30001011.Columns[2].Title.Caption := 'Descrição';
    D30001011.Columns[2].Width := 200;

    D30001011.Columns[3].Title.Caption := 'Qde';
    D30001011.Columns[3].Visible := true;
    D30001011.Columns[3].Width := 60;


    D30001011.Columns[4].Title.Caption := 'Preço';
    D30001011.Columns[4].Width := 70;

    D30001011.Columns[5].Title.Caption := 'Desconto';
    D30001011.Columns[5].Width := 70;


  end;
  valor_bruto := 0;
  valor_tx_serv := 0;
  valorDescontos :=0;

  dm.qry_movimento_mesa.First;
{
  while not dm.qry_movimento_mesa.Eof do
  begin
    valor_bruto:= dm.TBRound( (dm.qry_movimento_mesa.fieldbyname('quantidade').value *  dm.qry_movimento_mesa.fieldbyname('valor_unitario').value),8)+valor_bruto;
    valorDescontos := valorDescontos + dm.qry_movimento_mesa.fieldbyname('desconto').value;

    dm.qry_movimento_mesa.Next;
  end;
  ed_valor_bruto.Value := valor_bruto;
  dm.qry_movimento_mesa.First;
  if (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false) then
   begin
     valor_tx_serv := ((valor_bruto * dm.getPercentualServicoAtual()) / 100);
   end
  else
   begin
     valor_tx_serv:=0;
   end;
 }

  dm.qryauxiliar.Active:=FALSE;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.SQL.add('select * from rodapeextrato('+Quotedstr(ed_numero_mesa.text)+','+IntToStr(arredondamento)+','+dm.TrocaVirgPPto(Floattostr(percentualTaxaServico))+')');
  dm.qryauxiliar.Active:=true;

  if tipo_caixa_atual = 1 then
   begin
      ed_total_tx_serv.Value := 0;
      ed_valor_bruto.Value :=   dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
      edTotalDescontos.Value := 0;//valorDescontos;
      ed_total_conta.Value := dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
   end
  else
   begin
      ed_total_tx_serv.Value := dm.qryauxiliar.fieldbyname('VALORTXSERV').Value;
      ed_valor_bruto.Value :=   dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
      edTotalDescontos.Value := 0;//valorDescontos;
      ed_total_conta.Value := dm.qryauxiliar.fieldbyname('VALORTOTAL').Value;

   end;

end;

function Tfrm_lancamento_touch.informacoes_garcon: boolean;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select * from garcons where cod_garcon=' + Quotedstr(ed_cod_garcon.text));
  dm.qry_consultas.Active := true;
  if dm.qry_consultas.IsEmpty then
  begin
    ShowMessage('Não existe garçon cadastrado com o código informado!');
    ed_cod_garcon.setfocus;
    ed_cod_garcon.clear;
    exit;
  end
  else
  begin

    //     ed_nome_garcon.Text:=dm.qry_consultas.fieldbyname('apelido').value;

  end;

end;

procedure Tfrm_lancamento_touch.ed_numero_mesaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin   
  if key = vk_return then
  begin
    if not ((sender is TMemo) or (sender is Tdbgrid)) then
      Perform(WM_NEXTDLGCTL, 0, 0)
  end;


    if ( (key = vk_escape) and (dm.verificaMesaBalcao(ed_numero_mesa.Text) = true)  )then
  begin
    if (sender is Tedit) and (((sender as Tedit).Name = 'ed_cod_produto') ) then
     begin
      if ( (dm.verificaseExisteMovimentoMesaBalcao() = true) ) then
       begin
         dm.exibe_painel_erro('A venda balcão ainda não foi encerrada!','Prosseguir...');
         exit;
       end
      else
       begin
         Close;
       end;
     end
    else
      begin
            if (sender is Tedit) and (((sender as Tedit).Name = 'ed_quantidade') ) then
              ed_cod_produto.SetFocus;

            if (sender is Tedit) and (((sender as Tedit).Name = 'ed_numero_comanda') ) then
              ed_quantidade.SetFocus;  
      end;
  end;



  if key = vk_escape then
  begin
    if (sender is Tedit) and (((sender as Tedit).Name = 'ed_cod_produto') or ((sender as Tedit).Name = 'ed_numero_comanda') or ((sender as Tedit).Name = 'ed_quantidade')) then
    begin
      ed_cod_produto.clear;
      ed_descricao_produto.Clear;
      ed_valor_produto.Clear;
      ed_numero_comanda.Clear;
      ed_quantidade.clear;

      if( trim(ed_numero_mesa.Text) <> dm.getCodMesaBalcao() ) then
      begin
       ed_numero_mesa.SetFocus;
       ed_cod_garcon.clear;       
      end;
      //      foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'));
      lb_preco.Visible := false;
      descricao_prod.Visible := false;
      exit;
    end;
  end;

  if key = vk_escape then
  begin
    if (sender is TDBGrid) and (((sender as TDBGrid).Name = 'D30001011')) then
    begin
      if( trim(ed_numero_mesa.Text) <> dm.getCodMesaBalcao() ) then
       begin
        voltar_mesa;
       end
      else
       begin
         ed_cod_produto.SetFocus();
       end;
    end;
  end;

  if key = vk_escape then
  begin
    if ((sender is Tedit and ((sender as Tedit).Name <> 'ed_numero_mesa')) or (sender is TDBGrid and ((sender as TDBGrid).Name = 'DBGrid1'))) then
    begin
     if( trim(ed_numero_mesa.Text) <> dm.getCodMesaBalcao() ) then
       begin
        dm.qry_movimento_mesa.Active := false;
        ed_cod_produto.clear;
        ed_descricao_produto.Clear;
        ed_valor_produto.Clear;
        ed_numero_comanda.Clear;
        ed_quantidade.clear;
        ed_cod_garcon.clear;
        //      ed_nome_garcon.Clear;
        ed_valor_bruto.Text := '0,00';
        //      ed_total_taxa.Text:='0,00';
        ed_total_conta.Text := '0,00';
        ed_numero_mesa.Clear;
        ed_numero_mesa.SetFocus;
        //      foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_livre'));
        lb_preco.Visible := true;
        descricao_prod.Visible := true;
        lb_preco.Visible := false;
        descricao_prod.Visible := false;
       end;
    end;
    if sender is Tedit and ((sender as Tedit).Name = 'ed_numero_mesa') then
    begin
      if ( StrToInt(dm.LeIni(2,'SALAO','estacaoLancamentoSalao') ) =1 ) then
       begin

       end
      else
       begin
        Close
       end;
    end;

  end;

  if key = vk_f2 then
  begin
    if sender is Tedit and ((sender as Tedit).Name = 'ed_cod_produto') then
      bt_pesq_produto.Click;

    if sender is Tedit and ((sender as Tedit).Name = 'ed_cod_garcon') then
      bt_pesquisa_garcon.Click;
  end;

  if key = vk_f3 then
  begin
    if sender is TDBGrid and ((sender as TDBGrid).Name = 'DBGrid1') then
    begin
      Application.CreateForm(Tfrm_transferir_item, frm_transferir_item);
      frm_transferir_item.ShowModal;
      frm_transferir_item.Free;
      busca_movimento_da_mesa;
    end;
  end;

  if key = vk_f12 then
  begin
    D30001011.SetFocus;
    D30001011.Columns[2].Showing;
    D30001011.SelectedIndex := 2;
  end;

  if ((key = vk_f3)) then
  begin
    B20002001.Click;
  end;

  if ((key = vk_f4)) then
  begin

//    B30001003.Click;

  end;

  if ((key = vk_delete) or (key = VK_F5)) then
  begin

//    B30001004.Click;
  end;

  if ((key = vk_f6)) then
  begin
//    B30001005.Click;
  end;

  if ((key = vk_f7)) then
  begin
//    B30001016.Click;
  end;

  if ((key = vk_f8)) then
  begin
//    B30001007.Click;
  end;



  if ((key = vk_f9)) then
  begin
//    B30001008.click;
  end;

  if ((key = vk_f10)) then
  begin
//    B30001009.Click;
  end;

  if ((key = vk_f11)) then
  begin
//    B30001010.click;
  end;

end;

function Tfrm_lancamento_touch.pesquisar_produto: boolean;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select * from produtos ');
  dm.qry_consultas.Active := true;

  if dm.qry_consultas.IsEmpty then
  begin
    ShowMessage('Não existem produtos cadastrados!');
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

function Tfrm_lancamento_touch.verifica_validade_lancamento: boolean;
begin
  result:=true;

  if ( (dm.verificaExtratosEmitidos(ed_numero_mesa.text) = true) and (dm.verificaseExisteMovimentoMesa(ed_numero_mesa.Text)) and (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false))   then
  begin
    //Alterar isto de mesa para reabrir
    dm.exibe_painel_erro('Mesa já foi fechada!!','Ok');
    ed_numero_mesa.SetFocus;
    result:=false;
    exit;

  end;

  try
    begin
      ed_numero_mesa.Text := formatfloat('0000', Strtofloat(ed_numero_mesa.Text));
    end;
  except
    begin
      showmessage('Número de mesa inválido!');
      ed_numero_mesa.Clear;
      ed_numero_mesa.SetFocus;
      Result := false;
      exit;
    end;
  end;

  try
    ed_cod_garcon.Text := FormatFloat('000', strtofloat(ed_cod_garcon.Text));
  except
    begin
      ShowMessage('Código de garçon inválido!');
      ed_cod_garcon.clear;
      ed_cod_garcon.SetFocus;
      Result := false;
      exit;
    end;
  end;

  try
    StrToFloat(ed_quantidade.Text);
  except
    begin
      ShowMessage('Quantidade Inválida!');
      ed_quantidade.Clear;
      ed_quantidade.SetFocus;
      exit;
    end;
  end;

  try
    //  ed_cod_produto.Text:=FormatFloat('00000',strtofloat(ed_cod_produto.Text));
  except
    begin
      showmessage('Código de produto inválido!');
      ed_cod_produto.SetFocus;
      ed_cod_produto.Clear;
      Result := false;
      exit;
    end;
  end;

  if not (verificaSeProdutoVendeFracionado(ed_cod_produto.Text,2) )then
  begin
    try
      strToInt(ed_quantidade.Text);
    except
     begin
       ShowMessage('O produto informado não pode ser vendido francionado!');
       ed_quantidade.clear;
       ed_quantidade.SetFocus;
       Result:=false;
       exit;
     end;
    end;
  end;



  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('select * from produtos where cod_barras=' + Quotedstr(trim(ed_cod_produto.Text)));
  dm.qryauxiliar.Active := true;

  if dm.qryauxiliar.IsEmpty then
  begin
    ShowMessage('O código informado não pertence a um produto cadastrado!');
    ed_cod_produto.SetFocus;
    ed_cod_produto.Clear;
    Result := false;
    exit;
  end;
  Result := true;
end;

function Tfrm_lancamento_touch.adicionar_produto_conta(mesa : string; enviar_impressao : boolean ): boolean;
var
  codigo_lancamento: string;
  observacoesProducao, saboresProducao : string;
  idMovimentoMesa : Largeint;
begin


 if ( verificaSeProdutoEhPizza(ed_cod_produto.Text,2) = true) then
  begin
   frm_principal.obsSaborPizza:='';
   dm.tbSaboresPizzaTemp.Active:=false;
   dm.tbSaboresPizzaTemp.EmptyTable;
   Application.CreateForm(TfrmSelecaoSaboresPizza,frmSelecaoSaboresPizza);
   frmSelecaoSaboresPizza.ShowModal;
   frmSelecaoSaboresPizza.Free;

   // Selecionar o valor da pizza escolhida.
//   ed_valor_produto.Text :=    FormatFloat('###,###,##0.00',getPrecoPizzaMaisCara(ed_cod_produto.Text,2,1));
  end;


  saboresProducao:='';

 if ( verificaSeProdutoEhPizza(ed_cod_produto.Text,2) = true) then
  begin
    dm.tbSaboresPizzaTemp.First;
    while not dm.tbSaboresPizzaTemp.Eof do
     begin
       saboresProducao:= saboresProducao+dm.tbSaboresPizzaTemptamanho.Value+' '+dm.tbSaboresPizzaTempdescricao.value+#10#13;
       dm.tbSaboresPizzaTemp.Next;
     end;
     observacoesProducao:=  frm_principal.obsSaborPizza;
  end
 else
  observacoesProducao := strObsProduto;

  dm.tbSaboresPizzaTemp.Active:=false;
  dm.tbSaboresPizzaTemp.EmptyTable;


  idMovimentoMesa:=  strToInt(dm.geraCodigo('G_MOVIMENTO_MESA',10));
  dm.qryauxiliar.active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('select max(cod_movimento)as novo_cod from movimento_mesa where cod_mesa=' + QuotedStr(mesa));
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

  if (verificaSeUsaCodGarcon = False) then
   begin
     ed_cod_garcon.text:=dm.getCodGarconMesaBalcao();
   end;


  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('insert into movimento_mesa (cod_mesa,cod_garcon,cod_produto,quantidade,comanda,cod_movimento,');
  dm.qryauxiliar.sql.add('numero_caixa,cod_usuario,valor_unitario,id,observacoes,sabores) values (');
  dm.qryauxiliar.sql.add('' + QuotedStr(mesa) + ',');
  dm.qryauxiliar.sql.add('' + QuotedStr(ed_cod_garcon.Text) + ',');
  dm.qryauxiliar.sql.add('' + QuotedStr(lb_cod_produto.Caption) + ',');
  dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(ed_quantidade.text) + ',');
  if (trim(ed_numero_comanda.Text) <> '') then
    dm.qryauxiliar.sql.add('' +QuotedStr(ed_numero_comanda.Text) + ',')
  else
    dm.qryauxiliar.sql.add('' +QuotedStr('') + ',');

  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_lancamento) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(numero_caixa) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_usuario) + ',');

   if (verificaSeProdutoCalculaQtde(ed_cod_produto.text,2) ) then
     begin
       ed_valor_produto.Text :=  FormatFloat('#0.00',getValorProduto(ed_cod_produto.Text,2));
       dm.qryauxiliar.SQL.Add('' + dm.TrocaVirgPPto(ed_valor_produto.Text)+')');
     end
   else
    dm.qryauxiliar.SQL.Add('' + dm.TrocaVirgPPto(ed_valor_produto.Text)+',');
    dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa)+ ',');
    dm.qryauxiliar.sql.add('' + Quotedstr(observacoesProducao) + ',');
    dm.qryauxiliar.sql.add('' + Quotedstr(saboresProducao) + ')');


  try
    begin
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



{
  if enviar_impressao then
   begin
    if dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption) then
     begin
        dm.enviaProdutoParaFilaImpressao(ed_cod_garcon.Text,ed_cod_produto.Text , mesa, StrToFloat(ed_quantidade.Text),observacoesProducao,saboresProducao,'1',-1,IntToStr(idMovimentoMesa),'');
     end;
     strObsProduto:='';
   end;
 }


   if enviar_impressao then
   begin

    if ed_numero_mesa.Text <> dm.getCodMesaBalcao then
     begin
      if ( (dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption))  and (dm.verificaProdutoImprimeMesas(lb_cod_produto.Caption ) ))   then
       begin
          dm.enviaProdutoParaFilaImpressao(ed_cod_garcon.Text,ed_cod_produto.Text , mesa, StrToFloat(ed_quantidade.Text),observacoesProducao,saboresProducao,'1',-1,IntToStr(idMovimentoMesa),'');
       end;
     end
    else
     begin
      if ( (dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption))  and (dm.verificaProdutoImprimeBalcao(lb_cod_produto.Caption ) ))   then
       begin
          dm.enviaProdutoParaFilaImpressao(ed_cod_garcon.Text,ed_cod_produto.Text , mesa, StrToFloat(ed_quantidade.Text),observacoesProducao,saboresProducao,'1',-1,IntToStr(idMovimentoMesa),'');
       end;
     end;
     strObsProduto:='';
   end;





  if dm.transacao.Active = false then dm.transacao.Active := true;
  dm.transacao.Commit;

  rdg_modo_visualizacao.ItemIndex := 0;
  busca_movimento_da_mesa;

  ed_cod_produto.Clear;
  ed_valor_produto.clear;
  ed_descricao_produto.clear;
  ed_quantidade.clear;

  if (StrToInt(dm.LeIni(2, 'CAIXA', 'voltar_cursor')) = 2) then
    ed_numero_mesa.SetFocus
  else
    ed_cod_produto.SetFocus;

  //  foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'));
end;

procedure Tfrm_lancamento_touch.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
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

procedure Tfrm_lancamento_touch.FormActivate(Sender: TObject);
var
pn1 : TPanel;
begin
Self.Width:=800;
Self.Height:=599;
Self.Top:=1;
self.Left:=1;


  dxStatusBar1.Panels[1].Text:='Data do Sistema: '+FormatDateTime('DD/MM/YY',data_do_sistema);
  dxStatusBar1.Panels[2].Text:=nome_usuario;
  dxstatusbar1.Panels[0].text:=nome_fantasia;
  mudaCaptionsBotoes();
  setCaption('Caixa');
  frm_lancamento_touch.Top := 0;

  if (StrToInt(dm.LeIni(2, 'CAIXA', 'comanda_numerada')) = 0) then
  begin
//    ed_numero_mesa.Text:='';
    ed_numero_comanda.Enabled := false;
    ed_numero_comanda.Visible:=false;
    lbNumeroComanda.Visible:=false;
  end;

//  verificar_permissoes;
  cor_dos_componentes;

  if trim(ed_numero_mesa.Text) <> '' then
  begin
    busca_movimento_da_mesa;
    ed_cod_produto.SetFocus;
    if tipo_caixa_atual = 2 then
    ed_numero_mesa.SetFocus;
  end
  else
   BEGIN
    alternarTipoCaixa(voltarParaCaixa);
   end;


   if (verificaSeUsaCodGarcon = False) then
    begin
      ed_cod_garcon.text:=dm.getCodGarconMesaBalcao();
      ed_cod_garcon.Visible:=false;
      pn_garcon.Visible:=FALSE;
      pn_produto.Left:=89;
      pn_produto.Width:=704;
    end;




end;

procedure Tfrm_lancamento_touch.ed_numero_mesaEnter(Sender: TObject);
begin
  if sender is Tedit and (((sender as Tedit).Name = 'ed_numero_mesa')) then
  begin

    ed_numero_mesa.clear;
    if (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false ) then
    begin
     dm.ImprimeFilaDeImpressao(false,'',1)
    end;
    voltar_mesa;
  end;




  if sender is Tedit and (((sender as Tedit).Name = 'ed_cod_garcon')) then
  begin
     ed_cod_garcon.SelectAll;
  end;
  
  if sender is Tedit and (((sender as Tedit).Name = 'ed_cod_garcon')) then
  begin
       ed_cod_produto .SelectAll;
  end;




  if sender is TDBGrid then
  begin
    (sender as TDBGrid).Color := cor_foco_edit;
  end;



end;

procedure Tfrm_lancamento_touch.B30001003Click(Sender: TObject);
var
  linha: integer;
  valor_total: double;
begin

  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
    fecharConta();
end;



procedure Tfrm_lancamento_touch.fecharConta();
begin
  if verifica_movimento then
  else
    exit;
  if ( StrToInt(  dm.leini(2,'ENCERRAMENTO','verificar_extrato_antes') ) = 1 ) then
   begin
      if verificaMesaTemExtrato(ed_numero_mesa.text) = false then
       begin
          dm.exibe_painel_erro('Ainda não foi emitido nenhum extrato parcial para a mesa selecionada!','');
          exit;
       end;
   end;

  Application.CreateForm(Tfrm_encerramento, frm_encerramento);
  frm_encerramento.lb_mesa.Caption := ed_numero_mesa.Text;
  frm_encerramento.ShowModal;
  frm_encerramento.free;
  voltar_mesa;
  busca_movimento_da_mesa;
  if ( dm.verificaMesaBalcao(ed_numero_mesa.Text) = false ) then
   begin
    ed_cod_garcon.Clear;
    ed_numero_mesa.clear;
    ed_numero_mesa.SetFocus;
   end;
end;

procedure Tfrm_lancamento_touch.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
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

procedure Tfrm_lancamento_touch.timerInativacaoPedidosTimer(Sender: TObject);
begin
 if (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false ) then
 begin
   dm.ImprimeFilaDeImpressao(false,'',1); 
 end;

end;

function Tfrm_lancamento_touch.pesquisa_produto: boolean;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select * from produtos ');
  dm.qry_consultas.Active := true;

  if dm.qry_consultas.IsEmpty then
  begin
    ShowMessage('Não existem produtos cadastrados!');
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

procedure Tfrm_lancamento_touch.bt_pesq_produtoClick(Sender: TObject);
begin
  pesquisa_produto;
end;

procedure Tfrm_lancamento_touch.cor_dos_componentes;
var
  X: integer;
begin
  for x := 0 to ComponentCount - 1 do
    if
      Components[x].ClassName = 'TFocusEdit' then TFocusEdit(Components[x]).FocusColor := cor_foco_edit;

end;

function Tfrm_lancamento_touch.gravar_tx_serv: boolean;
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
    dm.qryauxiliar2.sql.add('  produtos.cod_produto=movimento_mesa.cod_produto and movimento_mesa.cod_mesa=' + QuotedStr(ed_numero_mesa.Text) + '  and movimento_mesa.cod_garcon=' + QuotedStr(dm.qryauxiliar3.fieldbyname('cod_garcon').value));
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

procedure Tfrm_lancamento_touch.B20002001KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (( key = vk_escape) and (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false)) then
  begin
    dm.qry_movimento_mesa.Active := false;
    ed_cod_produto.clear;
    ed_descricao_produto.Clear;
    ed_valor_produto.Clear;
    ed_numero_comanda.Clear;
    ed_quantidade.clear;
    ed_cod_garcon.clear;
    ed_total_conta.Text := '0,00';
    ed_numero_mesa.Clear;
    ed_numero_mesa.SetFocus;
    voltar_mesa;
  end
 else
    voltar_mesa;
end;                      

procedure Tfrm_lancamento_touch.bt_pesquisa_garconClick(Sender: TObject);
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.sql.add('select * from garcons order by apelido');
  dm.qry_consultas.Active := true;
  if dm.qry_consultas.IsEmpty then
  begin
    ShowMessage('Não existem garçons cadastrados!');
    exit;
  end
  else
  begin
    Application.CreateForm(Tfrm_cs_garcons, frm_cs_garcons);
    frm_cs_garcons.ShowModal;
    frm_cs_garcons.free;
    ed_cod_garcon.Text := string_auxiliar;

  end;

end;

procedure Tfrm_lancamento_touch.B20002001Click(Sender: TObject);
begin

//  if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;

  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
   begin
    if (dm.verificaExtratosEmitidos(ed_numero_mesa.text) = true) then
    begin
      string_auxiliar := 'N';
      Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
      frm_confirma_extrato.setTitulo('Confirmação de extrato');
      frm_confirma_extrato.setMensagem('Já foi emitido um extrato da mesa informada!! '+#13#10+#13#10+' Deseja continuar ?',12);
      frm_confirma_extrato.ShowModal;
      frm_confirma_extrato.free;
      if string_auxiliar = 'S' then
        emitirExtrato;

      string_auxiliar := '';
    end
    else
      emitirExtrato();
   end;
//  voltar_mesa;
  busca_movimento_da_mesa;
  if ( dm.verificaMesaBalcao(ed_numero_mesa.Text) = false ) then
   begin
    ed_cod_garcon.Clear;
    ed_numero_mesa.clear;
    ed_numero_mesa.SetFocus;
   end; 
end;

procedure Tfrm_lancamento_touch.emitirExtrato();
begin

  if verifica_movimento then
  else
    exit;

    
  Application.CreateForm(Tfrm_extrato, frm_extrato);
  frm_extrato.lb_mesa.Caption := ed_numero_mesa.Text;
  frm_extrato.showmodal;
  frm_extrato.free;
  busca_movimento_da_mesa;
  voltar_mesa;

end;

procedure Tfrm_lancamento_touch.DBGrid1CellClick(Column: TColumn);
begin

  D30001011.SetFocus;

end;

procedure Tfrm_lancamento_touch.B30001008Click(Sender: TObject);
var
 emiteExtratoAntes : integer;
begin

  if trim(ed_numero_mesa.Text) = '' then
   begin
     Showmessage('Número de mesa inválido');
     ed_numero_mesa.SetFocus;
     ed_numero_mesa.clear;
   end;

  try
    ed_numero_mesa.Text := FormatFloat('0000',StrToFloat(ed_numero_mesa.Text));
  except
   begin
     Showmessage('Número de mesa inválido');
     ed_numero_mesa.SetFocus;
     ed_numero_mesa.clear;
     Exit;

   end;
  end;

  If (verificaMesaTemExtrato(ed_numero_mesa.text) = true) then
   begin
     dm.exibe_painel_erro('Mesa encontra-se fechada. Reabra a mesa para prosseguir com a transferência.','tecle enter para continuar...');
     exit;
   end;




   if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
        transferirMesa;


end;

procedure Tfrm_lancamento_touch.transferirMesa();
begin
//  if verifica_movimento then
//  else
//    exit;
  Application.CreateForm(Tfrm_transferir_mesa, frm_transferir_mesa);
  frm_transferir_mesa.ShowModal;
  frm_transferir_mesa.Free;
  busca_movimento_da_mesa;

  dm.qry_movimento_mesa.Active := false;
  ed_cod_produto.clear;
  ed_descricao_produto.Clear;
  ed_valor_produto.Clear;
  ed_numero_comanda.Clear;
  ed_quantidade.clear;
  ed_cod_garcon.clear;
  //      ed_nome_garcon.Clear;
  //ed_total_taxa.Text:='0,00';
  ed_numero_mesa.Clear;
  ed_numero_mesa.SetFocus;
  voltar_mesa;

end;

procedure Tfrm_lancamento_touch.B30001009Click(Sender: TObject);
begin
  if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
    if (rdg_modo_visualizacao.ItemIndex = 0) then
      transferirItem()
    else
    begin
      showmessage('Selecione o modo de visualização analítico e marque o lançamento a ser trasnferido!');
    end;

end;

procedure Tfrm_lancamento_touch.transferirItem();
begin

  if verifica_movimento then
  else
    exit;

  Application.Createform(Tfrm_transferir_item, frm_transferir_item);
  frm_transferir_item.ShowModal;
  frm_transferir_item.free;
  busca_movimento_da_mesa;
  voltar_mesa;
  busca_movimento_da_mesa();
  ed_numero_mesa.SetFocus();
  D30001011.SetFocus;
end;

procedure Tfrm_lancamento_touch.B30001010Click(Sender: TObject);
begin
  if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
    if verifica_movimento then
    else
      exit;
    Application.CreateForm(Tfrm_recebimento_parcial, frm_recebimento_parcial);
    frm_recebimento_parcial.lb_mesa.Caption := ed_numero_mesa.Text;
    frm_recebimento_parcial.showmodal;
    frm_recebimento_parcial.Free;
    busca_movimento_da_mesa;
    voltar_mesa;
  end;

end;

function Tfrm_lancamento_touch.verifica_movimento: boolean;
begin
  try
    begin
      ed_numero_mesa.Text := FormatFloat('0000', StrToFloat(ed_numero_mesa.Text));
    end;
  except
    showmessage('Número de mesa inválido!');
    ed_numero_mesa.Clear;
    ed_numero_mesa.SetFocus;
    result := false;
    exit;
  end;


  // Tenho que alterar esta parte para deixar as versões compatíveis

  if dm.qry_movimento_mesa.IsEmpty then
  begin
    ShowMessage('Mesa sem movimento');
    Result := false;
    exit;
  end;

  Result := true;
end;

procedure Tfrm_lancamento_touch.B300010040Click(Sender: TObject);
begin
  if verifica_movimento then
  begin
    if MessageDlg('Confirma cancelamento do ítem selecionado ?', mtconfirmation, [MbYes, mbNo], 0) = Mryes then
    begin
      dm.qrymax.Active := false;
      dm.qrymax.SQL.Clear;
      dm.qrymax.SQL.Add('delete from movimento_mesa where cod_mesa=' + quotedstr(ed_numero_mesa.Text) + ' and cod_movimento=' + Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));
      dm.qrymax.ExecSQL;
      if dm.transacao.Active = false then dm.transacao.Active := true;
      dm.transacao.Commit;
      busca_movimento_da_mesa;
    end
  end
  else
    exit;

end;

procedure Tfrm_lancamento_touch.verificar_permissoes;
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

        rdg_modo_visualizacao.Visible:=false;
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

procedure Tfrm_lancamento_touch.voltar_mesa;
begin
//  alternarTipoCaixa(tipo ;
  rdg_modo_visualizacao.ItemIndex := 0;
  ed_cod_produto.Clear;
  ed_descricao_produto.clear;
  ed_quantidade.Clear;
//  ed_numero_mesa.Clear;
//ed_cod_garcon.Clear;
  if (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false) then
  begin
    ed_numero_mesa.SetFocus;
  end;
  //  foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'));
  dm.qry_movimento_mesa.Active := false;
  ed_valor_bruto.Value := 0;
  ed_total_tx_serv.Value := 0;
  ed_total_conta.Value := 0;



end;

procedure Tfrm_lancamento_touch.B30001005Click(Sender: TObject);
begin
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
    Application.CreateForm(Tfrm_estacionamento, frm_estacionamento);
    frm_estacionamento.showmodal;
    frm_estacionamento.free;
  end;

  // voltar_mesa;
end;

procedure Tfrm_lancamento_touch.D30001011Exit(Sender: TObject);
begin
  if sender is TDBGrid then
  begin
    (sender as TDBGrid).Color := clWhite;
  end;

end;

procedure Tfrm_lancamento_touch.apagaItemMovimento(qtde: double; codMotivo : string; descricaoMotivo: string; obs : string);
var
  result: string;
  qtd_restante: double;
  total_registros: integer;
begin
  if verifica_movimento then
  begin
    if MessageDlg('Confirma cancelamento do ítem selecionado ?', mtconfirmation, [MbYes, mbNo], 0) = Mryes then
    begin



//      dm.gravarEstornoDeItem(ed_numero_mesa.Text,codMotivo,descricaoMotivo, dm.qry_movimento_mesa.fieldbyname('cod_barras').value,dm.qry_movimento_mesa.fieldbyname('descricao').value,qtde,(dm.qry_movimento_mesa.fieldbyname('valor_unitario').value * qtde),obs);




//      dm.logarOperacao('304', FormatFloat('#0.00', qtde) + ' ' + dm.qry_movimento_mesa.fieldbyname('descricao').value,ed_numero_mesa.Text);


   if (rdg_modo_visualizacao.ItemIndex = 0) then // Faz a deleção/atualização de quantidade do ítem no modo analítico
       begin
          dm.qrymax.Active := false;
          dm.qrymax.SQL.Clear;
          if ((dm.qry_movimento_mesa.fieldbyname('quantidade').value = 1) or ((dm.qry_movimento_mesa.fieldbyname('quantidade').value - qtde) = 0)) then
           begin
            dm.qrymax.SQL.Add('delete from movimento_mesa where cod_mesa=' + quotedstr(ed_numero_mesa.Text) + ' and cod_movimento=' + Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value))
           end
          else
            begin
              dm.qrymax.sql.add('update movimento_mesa set quantidade=quantidade-' + dm.TrocaVirgPPto(FloatToStr(qtde)) + ' where cod_mesa=' + quotedstr(ed_numero_mesa.Text) + ' and cod_movimento=' + Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));
            end;
          dm.qrymax.ExecSQL;
          if dm.transacao.Active = false then dm.transacao.Active := true;
            dm.transacao.Commit;
          busca_movimento_da_mesa;

       end
   else
      begin
        qtd_restante := dm.qry_movimento_mesa.fieldbyname('quantidade').value - qtde;
        if (qtd_restante = 0) then
          begin
           dm.qrymax.Active := false;
           dm.qrymax.sql.Clear;
           dm.qrymax.sql.add('delete from movimento_mesa where cod_mesa=' + QuotedStr(ed_numero_mesa.text) + ' and cod_produto='+Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_produto').value));
           dm.qrymax.ExecSQL;
          end
        else
          begin
           dm.qrymax.Active := false;
           dm.qrymax.SQL.clear;
           dm.qrymax.SQL.Add('select mv.cod_mesa,mv.cod_movimento,');
           dm.qrymax.sql.Add(' mv.cod_produto,pr.cod_produto,pr.cod_barras,');
           dm.qrymax.sql.Add('mv.quantidade as quantidade,mv.valor_unitario,');
           dm.qrymax.sql.Add('mv.comanda,');
           dm.qrymax.sql.Add('mv.cod_garcon ');
           dm.qrymax.SQL.Add('  from movimento_mesa mv ');
           dm.qrymax.sql.Add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
           dm.qrymax.sql.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
           dm.qrymax.sql.add('  where mv.cod_mesa='+Quotedstr(ed_numero_mesa.Text)+' and mv.cod_produto='+Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_produto').value)+' order by mv.hora_lancamento');
           dm.qrymax.Active:=true;


           ed_cod_garcon.Text     := dm.qrymax.fieldbyname('cod_garcon').value;
           ed_cod_produto.Text    := dm.qrymax.fieldbyname('cod_barras').value;
           ed_valor_produto.text  := FormatFloat('#0.00',dm.qrymax.fieldbyname('valor_unitario').value);

           ed_quantidade.Text     := FormatFloat('#0.00',qtd_restante);
           ed_numero_comanda.Text := dm.qrymax.fieldbyname('comanda').value;
           lb_cod_produto.Caption := dm.qrymax.fieldbyname('cod_produto').value;

           dm.qrymax.Active := false;
           dm.qrymax.sql.Clear;
           dm.qrymax.sql.add('delete from movimento_mesa where cod_mesa=' + QuotedStr(ed_numero_mesa.text) + ' and cod_produto=' +Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_produto').value));
           dm.qrymax.ExecSQL;

           adicionar_produto_conta(ed_numero_mesa.Text, false);
          end;

           dm.transacao.Commit;
      end
    end;
  end

  else
    exit;
  busca_movimento_da_mesa();
  D30001011.SetFocus;
end;

procedure Tfrm_lancamento_touch.D30001011MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ((dm.qry_movimento_mesa.Active) and (dm.qry_movimento_mesa.IsEmpty = false) and (rdg_modo_visualizacao.ItemIndex = 0)) then
  begin
    try
      begin
        D30001011.Hint := 'Garçon: ' + dm.qry_movimento_mesa.fieldbyname('apelido').Value +
          #13 + 'Comanda: ' + dm.qry_movimento_mesa.fieldbyname('comanda').AsString +
          #13 + 'Produto: ' + dm.qry_movimento_mesa.fieldbyname('descricao').AsString +
          #13 + 'Quantidade: ' + FormatFloat('###,###,##0.000',dm.qry_movimento_mesa.fieldbyname('quantidade').Value) +
          #13 + 'Lançado por: ' + dm.qry_movimento_mesa.fieldbyname('login').AsString + ' às ' + FormatDateTime('HH:MM:SS', dm.qry_movimento_mesa.fieldbyname('hora_lancamento').value);

      end;
    except
    end;           end;
end;


procedure Tfrm_lancamento_touch.D30001011DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);


var
holdColor: TColor;
begin
holdColor := D30001011.Canvas.Brush.Color;
 if rdg_modo_visualizacao.ItemIndex = 0 then
 begin
  if Column.FieldName = 'DESCONTO' then
   if (Column.Field.AsFloat > 0) then
    begin
     D30001011.Canvas.Brush.Color := clAqua;
     D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

 end;

{ //OPção para dbgrid zebrado
    if State = [] then
     begin
       if dm.qry_movimento_mesa.RecNo mod 2 = 1 then
        D30001011.Canvas.Brush.Color := clBlue
       else
         D30001011.Canvas.Brush.Color := clWhite;
      end;
      D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);

 }

  if Column.FieldName = 'TOTAL' then
   begin
     D30001011.Canvas.Brush.Color := clblue;
     D30001011.Canvas.Font.Color := clWhite;
     D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
   end;


end;



procedure Tfrm_lancamento_touch.B30001007Click(Sender: TObject);
begin
//  Application.CreateForm(TfrmDescontoItem,frmDescontoItem);
//  frmDescontoItem.showmodal;
//  frmDescontoItem.free;
//  busca_movimento_da_mesa();

{
  if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
    if MessageDlg('Confirma cancelamento do último cupom fiscal ?', mtconfirmation, [mbYes, mbNo], 0) = mryes then
    begin
      dm.cancela_cupom_fiscal(marca_impressora_fiscal, modelo_impressora_fiscal);
    end;
  end;
  }

end;

procedure Tfrm_lancamento_touch.ransferirtem1Click(Sender: TObject);
begin
//  B30001009.Click;
end;

procedure Tfrm_lancamento_touch.D30001011DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin

  if gdFocused in State then
    with (Sender as TDBGrid).Canvas do
    begin

      Brush.Color := clRed;
      FillRect(Rect);
      TextOut(Rect.Left, Rect.Top, Field.AsString);
    end;

end;

procedure Tfrm_lancamento_touch.B30001001KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then
    ed_numero_mesa.SetFocus;
end;

procedure Tfrm_lancamento_touch.Cancelartem1Click(Sender: TObject);
begin
//  B30001004.Click;
end;

procedure Tfrm_lancamento_touch.btTrocaModClick(Sender: TObject);
begin
  if tipo_caixa_atual = 1 then
    alternarTipoCaixa(2)
  else
   alternarTipoCaixa(1)
{  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
    Application.CreateForm(Tfrm_abertura_dia, frm_abertura_dia);
    frm_abertura_dia.tipo_suprimento := 1;
    frm_abertura_dia.ShowModal;
    frm_abertura_dia.free;
  end;
 }
end;


procedure Tfrm_lancamento_touch.rdg_modo_visualizacaoClick(
  Sender: TObject);
begin
  busca_movimento_da_mesa();
end;

procedure Tfrm_lancamento_touch.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin


  if (Key = 145) then
  begin
      Perform(Wm_NextDlgCtl,1,0)
  end;

  if (key = 123) then
   begin
     Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
     frm_obs_lancamento_caixa.ShowModal;
     frm_obs_lancamento_caixa.free;
   end;

  if (key = 122) then
   begin
     Application.Terminate;

   end;


  if (Shift = [ssCtrl]) and (Key = 65) then
  begin
    if rdg_modo_visualizacao.ItemIndex = 0 then
      rdg_modo_visualizacao.ItemIndex := 1
    else
      rdg_modo_visualizacao.ItemIndex := 0;
  end;

  if (Shift = [ssCtrl]) and (Key =  key_r ) then
  begin
    dm.apagaExtratosEmitidos(ed_numero_mesa.text);
    showmessage('Mesa Reaberta!');
  end;


  if (Shift = [ssCtrl]) and (Key = 80) then
  begin

//    timerAtualizaTelaMesas.Enabled:=false;
//    timerAtualizaTelaMesas.Enabled:=true;
  END;


 if (Shift = [ssCtrl]) and (Key = 83) then
  begin
//     btSangria.Click;
  END;



  if (Shift = [ssCtrl]) and (Key = 79) then
  begin

      Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
           frm_obs_lancamento_caixa.ShowModal;
           frm_obs_lancamento_caixa.free;
  END;


if (Shift = [ssCtrl]) and (Key = 67) then
  begin
    btCalculadora.Click;
  END;

if (Shift = [ssCtrl]) and (Key = 88) then
  begin
//    btLeituraX.Click;
  END;

if (Shift = [ssCtrl]) and (Key = 68) then
  begin
//    btDelivery.Click;
  END;



  if (Shift = [ssCtrl]) and (Key = 90) then
  begin
//    btReducaoZ.Click;
  END;



end;

procedure Tfrm_lancamento_touch.efetuar_lancamento;
begin
  if dm.transacao.Active = false then dm.transacao.Active := true;
  dm.transacao.Commit;



   if verifica_validade_lancamento then
  begin
    if ( (dm.verificaseExisteMovimentoMesa(ed_numero_mesa.Text) = false) and (dm.verificaSeAMesaFoiAberta(ed_numero_mesa.text)=false) )
      then
       begin
         dm.efetuaAberturaDaMesa(ed_numero_mesa.text);
       end;

    adicionar_produto_conta(ed_numero_mesa.Text,true);
    lb_preco.Visible := false;
    descricao_prod.Visible := false;   
  end;



end;

procedure Tfrm_lancamento_touch.B30001016Click(Sender: TObject);
begin
  if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
    if (dm.verificaExtratosEmitidos(ed_numero_mesa.text) = false) then
     begin
      dm.exibe_painel_erro('É necessária a emissão de extrato para esta operação ','');
      exit;
     end
    else
      begin
        dm.estornarMesaInteira(marca_impressora_nao_fiscal_01, modelo_impressora_nao_fiscal_01, ed_numero_mesa.Text,ed_valor_bruto.Value);
      end;
  end;

end;


procedure Tfrm_lancamento_touch.alternarTipoCaixa(tipo : integer);
begin

  if (tipo = 1) then
   begin

    ed_numero_mesa.Text:= dm.getCodMesaBalcao();
    ed_cod_garcon.Text:=  dm.getCodGarconMesaBalcao();
    B20002001.enabled:=true;
//    B30001016.enabled:=false;
//    B30001007.enabled:=false;
//    B30001008.enabled:=false;
//    B30001009.enabled:=false;
//    B30001010.enabled:=false;
    pn_mesa.Visible:=false;
    pn_garcon.Visible:=false;
//    btTrocaMod.Caption:='Venda'+#10+'em Mesa'+#10+'(B)';
    ed_cod_produto.SetFocus;
    tipo_caixa_atual:=tipo;
    busca_movimento_da_mesa();    
   end
  else
   begin
    if ( (dm.verificaseExisteMovimentoMesaBalcao() = true) and (dm.verificaMesaBalcao(ed_numero_mesa.Text)) ) then
     begin

       dm.exibe_painel_erro('A venda balcão ainda não foi encerrada!','Prosseguir...');
       ed_numero_mesa.Text:= dm.getCodMesaBalcao();
       ed_cod_garcon.Text:=  dm.getCodGarconMesaBalcao();
         B20002001.enabled:=false;
//       B30001016.enabled:=false;
//       B30001007.enabled:=false;
//       B30001008.enabled:=false;
//       B30001009.enabled:=false;
//       B30001010.enabled:=false;

       pn_mesa.Visible:=false;
       pn_garcon.Visible:=false;
//       btTrocaMod.Caption:='Venda'+#10+'em Mesa'+#10+'(B)';
//       btTrocaMod.Enabled:=false;
       ed_cod_produto.SetFocus;
       tipo_caixa_atual:=tipo;
        busca_movimento_da_mesa();
       Exit;
     end
    else
     begin
//      btTrocaMod.Caption:='Venda'+#10+'Balcão'+#10+'(B)';
      ed_numero_mesa.Text:='';
      ed_cod_garcon.Text:= '';
      pn_mesa.Visible:=true;
      pn_garcon.Visible:=true;
      B20002001.enabled:=true;
//      B30001016.enabled:=true;
//      B30001007.enabled:=true;
//      B30001008.enabled:=true;
//      B30001009.enabled:=true;
//      B30001010.enabled:=true;

       ed_numero_mesa.SetFocus;
      tipo_caixa_atual:=tipo;
     end;
   end;
end;
procedure Tfrm_lancamento_touch.ed_numero_mesaChange(Sender: TObject);
begin
  inherited;
  if (    ((trim(ed_numero_mesa.Text) ='b') ) or  ((trim(ed_numero_mesa.Text) ='B') ) )  then
  begin
//    btTrocaMod.Click;
  end;

end;

procedure Tfrm_lancamento_touch.ed_cod_produtoChange(Sender: TObject);
var
 qtde : integer;
 codProduto : string;
 valorTotal : string;
 valor  : double;
 quantidade   : double;
 precoUnitario : double;

begin
  inherited;

  if (    ((trim(ed_cod_produto.Text) ='b') ) or  ((trim(ed_cod_produto.Text) ='B') ) )  then
  begin
    ed_cod_produto.Clear;
//    btTrocaMod.Click;
  end;

  if( Length(trim(ed_cod_produto.text)) = 13) then
   begin
    codProduto:=copy(ed_cod_produto.Text,2,4);
    valorTotal:=copy(ed_cod_produto.Text,8,5);
    valorTotal:=copy(valorTotal,0,3)+','+copy(valorTotal,4,4);
    valorTotal:=FloatTostr(strToFloat(valorTotal));
    valor := StrToFLoat(valorTotal);
    codProduto   := FormatFloat('00000',StrTOFloat(codProduto));
    ed_cod_produto.Text := codProduto;
    precoUnitario :=  getValorProduto(codProduto,2);
    quantidade    :=  (valor / precoUnitario);
    ed_cod_produto.Text:= codProduto;
    ed_quantidade.Text:= FormatFloat('###,###,##0.000 ',quantidade);
    ed_quantidade.SetFocus;
   end;


end;

procedure Tfrm_lancamento_touch.ed_quantidadeChange(Sender: TObject);
var
 qtde : integer;
 codProduto : string;
 valorTotal : string;
 valor  : double;
 quantidade   : double;
 precoUnitario : double;

begin
  if( Length(trim(ed_quantidade.text)) = 13) then
   begin
    codProduto:=copy(ed_quantidade.Text,2,4);
    valorTotal:=copy(ed_quantidade.Text,8,5);
    valorTotal:=copy(valorTotal,0,3)+','+copy(valorTotal,4,4);
    valorTotal:=FloatTostr(strToFloat(valorTotal));
    valor := StrToFLoat(valorTotal);
    codProduto   := FormatFloat('00000',StrTOFloat(codProduto));
    ed_cod_produto.Text := codProduto;
    precoUnitario :=  getValorProduto(codProduto,2);
    quantidade    :=  (valor / precoUnitario);
    ed_cod_produto.Text:= codProduto;
    ed_quantidade.Text:= FormatFloat('###,###,##0.000 ',quantidade);
    ed_quantidade.SetFocus;
   end; 
end;



procedure Tfrm_lancamento_touch.lancarCouvertAutomatico(mesa : string);
var
 codCouvert : string;
begin
   codCouvert := dm.getCodCouvertAutomatico(0,mesa);
   lb_cod_produto.Caption:= getCodProduto(codCouvert);
   if ( dm.verificaSeProdutoEstaNaConta(lb_cod_produto.Caption,mesa) = false) then
    begin
      ed_cod_produto.Text:= codCouvert;
      ed_cod_garcon.Text:= dm.getCodGarconMesaBalcao;
      ed_quantidade.Text:='1';
      ed_valor_produto.Text:= Floattostr(getValorProduto(ed_cod_produto.Text,2));
      adicionar_produto_conta(mesa,false);
    end;
end;


procedure Tfrm_lancamento_touch.mudaCaptionsBotoes();
begin
B20002001.Caption := 'Imprimir'+#10+'Pré-Conta'+#10+'(F3)';
//B30001003.Caption := 'Receber'+#10+'Conta'+#10+'(F4)';
//B30001004.Caption := 'Cancelar'+#10+'ítem'+#10+'(F5)';
//B30001005.Caption := 'Liberar'+#10+'Veículo'+#10+'(F6)';
//B30001016.Caption := 'Estornar'+#10+'Mesa'+#10+'(F7)';
//B30001008.Caption := 'Transferir'#10+'Mesa'+#10+'(F9)';
//B30001009.Caption := 'Transferir'#10+'ítem'+#10+'(F10)';
//B30001010.Caption  := 'Receb.'#10+'Parciais'+#10+'(F11)';
//btTrocaMod.Caption := 'Venda'+#10+'Balcão'+#10+'(B)';
//btDelivery.Caption :=  'Delivery'+#10+''+'(ctrl+D)';
//btSangria.Caption :=  'Sangria'+#10+''+'(ctrl+S)';

btCalculadora.caption := 'Calculadora'+#10+''+'(ctrl+C)';
//btLeituraMF.Caption  := 'Leitura da'+#10+'M. Fiscal'#10+'(ctrl+M)';
//btLeituraX.Caption   := '(ctrl+X)';
//btReducaoZ.Caption   := '(ctrl+Z)';


end;












procedure Tfrm_lancamento_touch.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  timerAtualizaTelaMesas .Enabled:=false;
//  timerAtualizaTelaMesas .Enabled:=true;
end;

procedure Tfrm_lancamento_touch.timerAtualizaTelaMesasTimer(Sender: TObject);
begin
  inherited;
//  AtualizarListaMesas();
end;






procedure Tfrm_lancamento_touch.enter_botao(Sender: TObject);
begin
   ed_numero_mesa.text:=(sender as TBitBtn).Caption;
end;


procedure Tfrm_lancamento_touch.FuncaoBtnClick(Sender: TObject);
var
 pt : Tpoint;
begin
   ed_numero_mesa.Text:= (Sender as TBitBtn).Caption;
   ed_numero_mesa.Text:= dm.removeCaracteres(ed_numero_mesa.Text);
   dm.transacao.Active:=true;
   dm.transacao.Active:=false;
   dm.transacao.Active:=true;

   if trim(ed_quantidade.text) = ''  then     ed_quantidade.text:='1';
    try
      begin
        if trim(ed_numero_mesa.Text) = '' then
        begin
          ed_numero_mesa.Clear;
          ed_numero_mesa.SetFocus;
          exit;
        end
        else
        begin
          ed_numero_mesa.Text := formatfloat('0000', Strtofloat(ed_numero_mesa.Text));
          ed_numero_mesa.Text := formatfloat('0000', Strtofloat(ed_numero_mesa.Text));

          if( trim(ed_numero_mesa.Text) <> dm.getCodMesaBalcao() ) then
          begin
            ed_cod_garcon.Text := dm.getCodGarconAbriuMesa(ed_numero_mesa.Text);
            ed_cod_garcon.SetFocus;
          end;
        end;
      end;
    except
      begin
        showmessage('Número de mesa inválido!');
        ed_numero_mesa.Clear;
        ed_numero_mesa.SetFocus;
        exit;
      end;
    end;
    //    foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'));

    //Ponto de verificacao se usa cartao

     if (dm.verificaSeFuncionaComoBoate = true ) then
     begin
       if (verificaStatusCartao(ed_numero_mesa.Text) = false ) then
         begin
           ed_numero_mesa.clear;
           ed_numero_mesa.SetFocus;
           exit;
         end;
     end;


    if ( dm.verificaSeMesaTemMovimento(ed_numero_mesa.Text) =false) then
     begin
      if (StrToInt(dm.LeIni(1, 'COUVERT', 'lancarAutomaticamente')) = 1) then
       begin
          if (MessageDlg('Mesa sem movimento. Deseja lançar couvert assim mesmo ?',mtConfirmation,[mbYes,mbNo],0) = mrYes )then
            begin
              lancarCouvertAutomatico(ed_numero_mesa.Text);
              dm.efetuaAberturaDaMesa(ed_numero_mesa.text);
            end
       end
      else
        begin
//          showmessage('Mesa sem movimento');
        end
     end
    else
     begin
     if (StrToInt(dm.LeIni(1, 'COUVERT', 'lancarAutomaticamente')) = 1) then
       begin
        lancarCouvertAutomatico(ed_numero_mesa.Text);
        dm.efetuaAberturaDaMesa(ed_numero_mesa.text);
       end;
     end;


    if (dm.verificaseExisteMovimentoMesa(ed_numero_mesa.Text) = false) then
     begin
       dm.apagaExtratosEmitidos(ed_numero_mesa.Text);
       dm.ApagaAberturaDaMesa(ed_numero_mesa.text);
       if dm.transacao.Active = false then dm.transacao.Active:=true;
       dm.transacao.Commit;
     end;



    if (   (dm.verificaExtratosEmitidos(ed_numero_mesa.text) = true)  and  (StrToInt(dm.LeIni(2, 'CAIXA', 'checar_mesa_aberta')) = 1) and (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false)   )  then
     begin
      string_auxiliar := 'N';
      Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
      frm_confirma_extrato.setTitulo('Confirmação');
      frm_confirma_extrato.setMensagem('A mesa informada encontra-se aguardando pagamento!! '+#13#10+#13#10+' Deseja continuar ?',12);
      frm_confirma_extrato.ShowModal;
      frm_confirma_extrato.free;
      if string_auxiliar = 'S' then
       begin
         busca_movimento_da_mesa();
       end
      else
       begin
         ed_numero_mesa.Clear;
         ed_numero_mesa.SetFocus();
       end;
     end
    else
     begin
      busca_movimento_da_mesa;
     end;


end;




procedure Tfrm_lancamento_touch.Timer1Timer(Sender: TObject);
begin
  inherited;
  dxStatusBar1.Panels[3].Text:= FormatDateTime('HH:MM:SS',time);
end;

procedure Tfrm_lancamento_touch.btCalculadoraClick(Sender: TObject);
begin
  inherited;
  ACBrCalculadora1.Execute;
end;

procedure Tfrm_lancamento_touch.btDeliveryClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmPrincipalDelivery,frmPrincipalDelivery);
  frmPrincipalDelivery.showmodal;
  frmPrincipalDelivery.free;

end;

procedure Tfrm_lancamento_touch.btLeituraXClick(Sender: TObject);
begin
  inherited;
  frm_principal.leituraX;
end;

procedure Tfrm_lancamento_touch.btReducaoZClick(Sender: TObject);
begin
  inherited;
  frm_principal.ReducaoZ;
end;

procedure Tfrm_lancamento_touch.btSangriaClick(Sender: TObject);
begin
  inherited;

  if (dm.verificaPermissaoAcao('B30001015') = true) then
  begin
    Application.CreateForm(TfrmSangria,frmSangria);
    frmSangria.Showmodal;
    frmSangria.free;
  end;

end;

end.

