
 unit uu_caixa_restaurante;
interface
uses
  Windows,  ACBrUtil,
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
  uu_cs_produtos,
  uu_frm_principal,

   uu_transferir_item,
  uu_transferir_mesa,
  uu_cs_garcons,
  uu_encerramento,
  uu_extrato,
  uu_recebimentos_parciais,



  uu_cancela_item_restaurante,
  uu_confirma_extrato, uu_obs_lancamento_caixa,

  uuPrincipalDelivery, uuSelecaoCouvert, uuSelecaoSaboresPizza,
  uuExpedicaoDelivery, uuMapaMesas, uuMenuFiscal,uuOperacoesCaixa,
  uu_modelo_Vazio, Data.DB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, ACBrBase, ACBrCalculadora, Vcl.DBCGrids,
  dxStatusBar, Vcl.Mask, RxToolEdit, RxCurrEdit,





  Math,
  acbrDevice,
  acbrBal,

  RXCtrls,
   ibquery,

   Shader, RxGIF,
   dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter,
  Vcl.DBCtrls, dxGDIPlusClasses,  System.ImageList, Vcl.ImgList,
  JvImageList;
  

type

  Tfrm_caixa_restaurante = class(Tfrm_modelo_vazio)

    pn_mesa: TPanel;
    Label21: TLabel;
    ed_numero_mesa: Tedit;
    pn_garcon: TPanel;
    Label1: TLabel;
    ed_cod_garcon: Tedit;
    pn_produto: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ed_cod_produto: Tedit;
    ed_quantidade: Tedit;
    memo_codigos_formas: TMemo;
    Panel2: TPanel;
    lb_hora: TLabel;
    pn_controle: TPanel;
    pnMovimentoMesa: TPanel;
    D30001011: TDBGrid;
    G30001013: TGroupBox;
    rdg_modo_visualizacao: TRadioGroup;
    Panel4: TPanel;
    dxStatusBar1: TdxStatusBar;
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
    Label8: TLabel;
    Label9: TLabel;
    PopupMenu1: TPopupMenu;
    CancelamentodeProduto1: TMenuItem;
    RANSFERNCIA1: TMenuItem;
    pisca1: TTimer;
    pisca2: TTimer;
    Panel5: TPanel;
    ed_descricao_produto: Tedit;
    Label11: TLabel;
    B20002001: TBitBtn;
    B20002002: TBitBtn;
    B20002003: TBitBtn;
    B20002006: TBitBtn;
    B20002004: TBitBtn;
    B20002007: TBitBtn;
    B20001002: TBitBtn;
    B20001003: TBitBtn;
    btOpCaixa: TBitBtn;
    btMenuFiscal: TBitBtn;
    btCalculadora: TBitBtn;
    pnMapaMesas: TPanel;
    Label13: TLabel;
    imgMapa: TImage;
    pnInfoMesas: TPanel;
    edQtdMesas: TEdit;
    edMesasPagto: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    timerAtualizaMesas: TTimer;
    pnPrecoProd: TPanel;
    ed_valor_produto: TEdit;
    B20002005: TBitBtn;
    B20002020: TBitBtn;
    DBCtrlGrid1: TDBCtrlGrid;
    imgMesa: TImage;
    Label7: TLabel;
    procedure mudaCaptionsBotoes();
    procedure alternarTipoCaixa(tipo : integer);
    procedure ed_numero_mesaExit(Sender: TObject);
    function busca_movimento_da_mesa: boolean;
    function informacoes_garcon: boolean;
    function pesquisar_produto: boolean;
    function verifica_validade_lancamento: boolean;
    function adicionar_produto_conta(mesa : string; enviar_impressao
     : boolean ): boolean;
    function pesquisa_produto: boolean;
    function gravar_tx_serv: boolean;
    procedure ed_numero_mesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure ed_numero_mesaEnter(Sender: TObject);
    procedure B20002002Click(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure timerInativacaoPedidosTimer(Sender: TObject);
    procedure bt_pesq_produtoClick(Sender: TObject);
    procedure B20002001KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pesquisaGarcons();

    procedure B20002001Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure B20002006Click(Sender: TObject);
    procedure B20002004Click(Sender: TObject);
    procedure B20002007Click(Sender: TObject);
    function verifica_movimento: boolean;
    procedure B300010040Click(Sender: TObject);
    procedure verificar_permissoes;
    procedure voltar_mesa;
    procedure B20002014Click(Sender: TObject);
    procedure D30001011Exit(Sender: TObject);
    procedure D30001011MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure D30001011DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

    procedure transferirMesa();
    procedure transferirItem();
    procedure apagaItemMovimento(qtde: double; codMotivo : string; descricaoMotivo: string; obs : string);
    procedure B20002003Click(Sender: TObject);
    procedure B30001007Click(Sender: TObject);
    procedure B30001001KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure emitirExtrato(variasMesas : boolean);
    procedure fecharConta();
    procedure B20001002Click(Sender: TObject);

    procedure rdg_modo_visualizacaoClick(Sender: TObject);
    procedure efetuar_lancamento;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
      procedure ed_numero_mesaChange(Sender: TObject);
    procedure ed_cod_produtoChange(Sender: TObject);
    procedure ed_quantidadeChange(Sender: TObject);
    procedure lancarCouvertAutomatico(mesa : string);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure timerAtualizaTelaMesasTimer(Sender: TObject);
    procedure enter_botao(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btCalculadoraClick(Sender: TObject);
    procedure B20001003Click(Sender: TObject);
    procedure CancelamentodeProduto1Click(Sender: TObject);
    procedure RANSFERNCIA1Click(Sender: TObject);
    procedure gravarEstornoMesa(mesa : string);
    procedure muda_acao(tipo : integer);
    procedure pisca1Timer(Sender: TObject);
    procedure pisca2Timer(Sender: TObject);
    procedure pnExpedicaoClick(Sender: TObject);
    procedure imgAtencaoClick(Sender: TObject);



    procedure btMenuFiscalClick(Sender: TObject);
    procedure btOpCaixaClick(Sender: TObject);
    procedure mostraMapaMesas();
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure timerAtualizaMesasTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure B20002005Click(Sender: TObject);
    procedure B20002020Click(Sender: TObject);
    procedure ed_cod_garconChange(Sender: TObject);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure imgMesaMouseEnter(Sender: TObject);
    procedure DBText2Click(Sender: TObject);
    procedure imgMesaClick(Sender: TObject);
    procedure DBCtrlGrid1Click(Sender: TObject);


  private
    { Private declarations }
    modo_exibicao: integer;
    podeAtualizar : Boolean;
    guidSeqImpressao : string;

    //0 normal
    //1 resumido

  public
    { Public declarations }
   tipo_caixa_atual : integer;
  end;





var
  frm_caixa_restaurante: Tfrm_caixa_restaurante;
  tx_serv: double;
  pagina :TScrollbox;
  tipo_botao : integer;
  selecionado : string;
  total_mesas : integer;
  quantidadeLancamento : Double ;


implementation


{$R *.dfm}

uses uu_data_module;

procedure Tfrm_caixa_restaurante.ed_numero_mesaExit(Sender: TObject);
var
 qtdeCalculada : double;
begin

  if sender is TDBGrid then
  begin
    (sender as TDBGrid).Color := clWhite;
  end;

  if ((sender is Tedit and ((sender as Tedit).Name = 'ed_numero_mesa')) and (Trim(ed_numero_mesa.text) <> '')) then
  begin
   guidSeqImpressao := RandomName(8);
   pnMapaMesas.Visible := false;
   pnMovimentoMesa .Visible := true;
   pnInfoMesas.Visible := false;
   podeAtualizar := false;


   ed_numero_mesa.Text:= dm.removeCaracteres(ed_numero_mesa.Text);
   dm.transacao.Active:=false;
   dm.transacao.Active:=true;
   ed_quantidade.text:='1';

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

          if( (trim(ed_numero_mesa.Text) <> dm.getCodMesaBalcao()) )   then
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

    if (trim (ed_numero_mesa.Text) = '0000') then
     begin
        showmessage('Número de mesa inválido!');
        ed_numero_mesa.Clear;
        ed_numero_mesa.SetFocus;
        exit;
     end;


    if (StrToInt(ed_numero_mesa.Text) > 4999 ) then
     begin
        showmessage('Número de mesa inválido!');
        ed_numero_mesa.Clear;
        ed_numero_mesa.SetFocus;
        exit;
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
      string_auxiliar2 := ed_numero_mesa.Text;
      frm_confirma_extrato.setTitulo('Confirmação');
      frm_confirma_extrato.setMensagem('A mesa informada encontra-se aguardando pagamento!! '+#13#10+#13#10+' Deseja continuar ?',12);
      frm_confirma_extrato.ShowModal;
      frm_confirma_extrato.free;

      ed_numero_mesa.Text := string_auxiliar2;

      if string_auxiliar = 'S' then
       begin

         if (ed_cod_garcon.Visible = True ) then
            ed_cod_garcon.SetFocus
         else
           ed_cod_produto.SetFocus;

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
    if triM( (sender as Tedit).Text) = '' then exit;


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


  if ((sender is Tedit and ((sender as Tedit).Name = 'ed_cod_produto'))  ) then
  begin
   if (trim(ed_cod_produto.Text) = '') then exit;

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

    lb_preco.Visible := true;
    descricao_prod.Visible := true;
    descricao_prod.Caption := dm.qryauxiliar.fieldbyname('descricao').value;
    lb_preco.Caption := FormatFloat('R$ #0.00,', dm.qryauxiliar.fieldbyname('valor_unitario').value);


    if ( verificaProdutoDigitaPreco(ed_cod_produto.Text) = true) then
     begin
      pnPrecoProd.Enabled := True;
      ed_valor_produto.Clear;
      ed_valor_produto.Font.Color := clBlack;
      ed_valor_produto.Enabled:=true;
      ed_valor_produto.ReadOnly:=false;
      ed_valor_produto.SetFocus;
     end

    else
     begin
      pnPrecoProd.Enabled := false;
      ed_valor_produto.ReadOnly:=true;
      ed_quantidade.ReadOnly := false;
      ed_valor_produto.Color := clBlack;
      ed_valor_produto.Font.Color := clYellow;

      if (verificaSeProdutoLeQuantidadeDaBalanca(ed_cod_produto.Text,2) = true) then
        begin
          sucessoLeituraPeso := true;


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
       ed_quantidade.text := FormatFloat('#0.00000',qtdeCalculada);
       efetuar_lancamento;
     end;


    if (  ((sender as Tedit).Name = 'ed_quantidade'))  then
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
      pn_produto.Left:=80;
      pn_produto.Width:=929;
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

      efetuar_lancamento();


  end;


end;

function Tfrm_caixa_restaurante.busca_movimento_da_mesa: boolean;
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



 if (verificaSeCobraServico = false ) then
  begin
    percentualTaxaServico:=0;
  end
 else
  begin
    // Verifica se o atual caixa aberto cobra taxa de serviço.
    if (verificaSeCaixaCobraServico(ultimoCaixaAberto) = false) then  // Se não cobrar, zera o valor do percentual
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



  if (rdg_modo_visualizacao.ItemIndex = 0) then
  begin
    dm.qry_movimento_mesa.Active := false;
    dm.qry_movimento_mesa.sql.clear;
    dm.qry_movimento_mesa.SQL.Add('select mv.cod_mesa,pr.cod_barras,');
    dm.qry_movimento_mesa.sql.Add(' mv.cod_produto,pr.cod_produto,');
    dm.qry_movimento_mesa.sql.Add('pr.descricao,mv.quantidade as quantidade,');
    dm.qry_movimento_mesa.sql.Add('mv.valor_unitario,');
    dm.qry_movimento_mesa.sql.add('udf_roundabnt((mv.valor_unitario * mv.quantidade),2)   as total');


    dm.qry_movimento_mesa.sql.Add(',mv.comanda, mv.cod_garcon, g.apelido,u.login,mv.hora_lancamento, mv.estado,mv.cod_movimento, mv.desconto,id,impresso,observacoes,sabores,obs_paf,cancelado, mv.id');
    dm.qry_movimento_mesa.SQL.Add('  from movimento_mesa mv ');
    dm.qry_movimento_mesa.sql.Add('  inner join produtos pr on (pr.cod_produto=mv.cod_produto)');
    dm.qry_movimento_mesa.sql.add('  inner join garcons g on (g.cod_garcon=mv.cod_garcon) ');
    dm.qry_movimento_mesa.SQL.add('  inner join usuarios u on (u.cod_usuario=mv.cod_usuario)');
    dm.qry_movimento_mesa.SQL.add('  where mv.cod_mesa=' + Quotedstr(ed_numero_mesa.Text) + ' order by mv.cod_movimento');
    dm.adicionaLog(dm.qry_movimento_mesa.SQL.Text);
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
    D30001011.Columns[4].Width := 180;
    D30001011.Columns[5].Title.Caption := 'Qtde';
    D30001011.Columns[5].Width := 70;
    D30001011.Columns[6].Title.Caption := 'Preço';
    D30001011.Columns[6].Width := 60;

    D30001011.Columns[7].Title.Caption := 'Total';
    D30001011.Columns[7].Width := 90;
    D30001011.Columns[7].Visible  := true;
    D30001011.Columns[8].Visible  := false;
    D30001011.Columns[9].Visible  := false;
    D30001011.Columns[10].Visible := false;
    D30001011.Columns[10].Visible := false;
    D30001011.Columns[11].Visible := false;
    D30001011.Columns[12].Visible := false;
    D30001011.Columns[13].Visible := false;
    D30001011.Columns[14].Visible := false;
    D30001011.Columns[15].Visible := false;
    D30001011.Columns[16].Visible := false;
    D30001011.Columns[17].Visible := false;
    D30001011.Columns[18].Visible := false;
    D30001011.Columns[19].Visible := false;
    D30001011.Columns[20].Title.Caption := 'Observação';
    D30001011.Columns[20].Width := 155;

    D30001011.Columns[21].Visible := false;
     D30001011.Columns[22].Visible := false;

  end
  else
  begin
    dm.qry_movimento_mesa.Active := false;
    dm.qry_movimento_mesa.sql.clear;
    dm.qry_movimento_mesa.sql.add('select mv.cod_produto,p.cod_barras,p.descricao,sum(mv.quantidade)as quantidade,MV.valor_unitario as valor_unitario, sum(mv.desconto) as desconto  from movimento_mesa mv');
    dm.qry_movimento_mesa.sql.add('inner join produtos p on (p.cod_produto = mv.cod_produto)');
    dm.qry_movimento_mesa.sql.add(' where mv.cod_mesa=' + Quotedstr(ed_numero_mesa.Text)+' and mv.cancelado <> 1');
    dm.qry_movimento_mesa.sql.add('group by mv.cod_produto,p.cod_barras,p.descricao,mv.valor_unitario');
    dm.qry_movimento_mesa.sql.add('order by mv.cod_produto');

    dm.adicionaLog(dm.qry_movimento_mesa.SQL.Text);
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
  ed_total_tx_serv.Value := 0;
  ed_valor_bruto.Value :=   0;
  edTotalDescontos.Value := 0;//valorDescontos;



  dm.qry_movimento_mesa.First;



  if ( dm.qry_movimento_mesa.IsEmpty  = false) then
   begin
      dm.qryauxiliar.Active:=FALSE;
      dm.qryauxiliar.sql.clear;
      dm.qryauxiliar.SQL.add('select * from rodapeextrato2('+Quotedstr(ed_numero_mesa.text)+','+dm.TrocaVirgPPto(Floattostr(percentualTaxaServico))+')');
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








end;

function Tfrm_caixa_restaurante.informacoes_garcon: boolean;
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

procedure Tfrm_caixa_restaurante.ed_numero_mesaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
   var
   posicaoAsterisco : SmallInt ;
   multiplicador : string;
   valorTotalInStore : string;
   codProduto : string;
   unidadeMedida : string;
   qtde : string;
begin

  if key = vk_return then
  begin
    if not ((sender is TMemo) or (sender is Tdbgrid)) then
     begin
       if (sender is Tedit) and (((sender as Tedit).Name = 'ed_cod_produto') ) then
        begin
          if (trim(ed_cod_produto.Text) = '') then
           ed_numero_mesa.SetFocus
          else
            begin


                posicaoAsterisco:=  Pos('*',ed_cod_produto.Text);
                if (posicaoAsterisco <> 0)  then
                 begin
                  // se achou o asterísco, existe multiplicação.
                   multiplicador := copy(ed_cod_produto.Text,0,posicaoAsterisco - 1);


                   try
                    StrToFloat(multiplicador);
                   except
                      begin
                       dm.exibe_painel_erro('Multiplicador é inválido!','Ok');

                       Exit;
                      end;
                   end;


                   if (StrToFloat(multiplicador) <= 0) then
                    begin
                       dm.exibe_painel_erro('Multiplicador é inválido!','Ok');
                       Exit;
                    end;

                   codProduto :=trim(copy(ed_cod_produto.Text,posicaoAsterisco+1,20 ));
                   ed_cod_produto.Text := codProduto;
                   quantidadeLancamento := StrToFloat(multiplicador);

                 end
                else
                 begin
                  quantidadeLancamento := 1;
                  codProduto :=ed_cod_produto.Text;
                 end;

                 if ( Length(codProduto) = 13 ) then
                  begin

                  // Verifica se é um produto IN store. Todos que começam com o número 2
                  // são produtos etiquetados na casa.

                   if ( trim(Copy(codProduto,0,1) ) ='2') then
                    begin
                       // Produto in store
                       valorTotalInStore :=trim(Copy(codProduto,7,6)); // Pega o valor total na etiqueta
                       Insert(',',valorTotalInStore,5);
                       codProduto := trim(Copy(codProduto,2,4));      // Pega o código do produto3

                       try
                         codProduto := FormatFloat('00000',StrToFloat(codProduto));
                       except
                          begin
                            dm.exibe_painel_erro('Código de produto in store inválido!','Ok');
                            Exit;
                          end;
                       end;

                       try
                          StrToFloat(valorTotalInStore);
                        except
                           begin
                             dm.exibe_painel_erro('Valor total de produto in store lido na etiqueta é inválido! '+valorTotalInStore,'Ok');

                             ed_cod_produto.clear;
                             exit;
                           end;
                       end;

                       if (verificaExistenciaProduto(codProduto,2) = False) then
                        begin
                          dm.exibe_painel_erro('Produto não cadastrado!','Ok');
                          ed_cod_produto.clear;
                          exit;
                        end
                       else
                        begin
                           // se o produtoe está cadastrado, faz o cálculo da quantidade.
                            quantidadeLancamento :=  StrToFloat(valorTotalInStore) /  getValorProduto(codProduto,2);
                            quantidadeLancamento :=  RoundTo(quantidadeLancamento,-3);
                        end;

                    end
                   else
                    begin
                      // Produto de terceiros

                    end;



                    if (verificaExistenciaProduto(codProduto,2) = False) then
                     begin
                       dm.exibe_painel_erro('Produto não cadastrado no sistema!','Ok');
                       ed_cod_produto.clear;
                       exit;
                     end;

                    if (verificaSeProdutoPodeSerVendido(codProduto,2) = false) then
                      begin
                        ShowMessage('O produto informado está desabilitado para venda!');
                        ed_cod_produto.clear;
                        exit;
                      end;





                      lb_cod_produto.Caption     := getCodProduto(codProduto);
                      ed_descricao_produto.Text  := dm.centralizar(getDescricaoProduto(codProduto,2)  ,30);
                      ed_quantidade.Text         := FormatFloat('#0.000', quantidadeLancamento);
                      ed_valor_produto.Text := FormatFloat('#0.00,', getValorProduto(lb_cod_produto.caption,1));







                      adicionar_produto_conta(ed_numero_mesa.Text,    ( (dm.verificaProdutoImprimeLocalProducao(lb_cod_produto.Caption))  and (dm.verificaProdutoImprimeMesas(lb_cod_produto.Caption ) ) ) );
                      dm.qry_movimento_mesa.Last;



                  end
                 else
                  begin
                    Perform(WM_NEXTDLGCTL, 0, 0)
                  end;





//here
            end;
        end
       else
        begin
          Perform(WM_NEXTDLGCTL, 0, 0)
        end;
     end;


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

      end;
  end;



  if key = vk_escape then
  begin
    if (sender is Tedit) and (((sender as Tedit).Name = 'ed_cod_produto') or ((sender as Tedit).Name = 'ed_numero_comanda') or ((sender as Tedit).Name = 'ed_quantidade')) then
    begin
      ed_cod_produto.clear;
      ed_descricao_produto.Clear;
      ed_valor_produto.Clear;
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
      if ( StrToInt(dm.LeIni(2,'CAIXA','estacaoLancamentoSalao') ) =1 ) then
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
    podeAtualizar := false;

    if sender is Tedit and ((sender as Tedit).Name = 'ed_cod_produto') then
      pesquisa_produto;

    if sender is Tedit and ((sender as Tedit).Name = 'ed_cod_garcon') then
      pesquisaGarcons;
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

    B20002002.Click;

  end;

  if ((key = vk_delete) or (key = VK_F5)) then
  begin

    B20002003.Click;
  end;

  if ((key = vk_f6)) then
  begin
//    B20002014.Click;
  end;


  if ((key = vk_f8)) then
  begin
//    B30001007.Click;
  end;



  if ((key = vk_f9)) then
  begin
    B20002006.click;
  end;

  if ((key = vk_f10)) then
  begin
    B20002004.Click;
  end;

  if ((key = vk_f11)) then
  begin
    B20002007.click;
  end;

end;

function Tfrm_caixa_restaurante.pesquisar_produto: boolean;
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

function Tfrm_caixa_restaurante.verifica_validade_lancamento: boolean;
begin
  result:=true;

  if ( (dm.verificaExtratosEmitidos(ed_numero_mesa.text) = true) and (dm.verificaseExisteMovimentoMesa(ed_numero_mesa.Text)) and (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false))   then
  begin
    if MessageDlg('Mesa esperando fechamento de conta. Deseja reabrir para movimento ?', mtConfirmation, [mbYes, mbNo], 0) = MrYes then
    begin
      dm.apagaExtratosEmitidos(ed_numero_mesa.Text);
    end
    else
    begin
      result:=false;
      ed_numero_mesa.SetFocus;
      exit;
    end;
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



  if ( StrToFloat(ed_quantidade.Text) >= 5 ) then
   begin
     if dm.painelDePergunta(#13#10+'  A quantidade informada é considerada alta!'+#13#10+#13#10+'    Tem certeza que deseja lançar '+FormatFloat('#0.000',StrToFloat(ed_quantidade.Text))+'  '+ed_descricao_produto.Text+' nesta conta ?',20) then
       begin
         Result :=true;
       end
     else
       begin
         Result:=false;
         ed_quantidade.SetFocus;
         exit;
       end;
   end;









  Result := true;
end;

function Tfrm_caixa_restaurante.adicionar_produto_conta(mesa : string; enviar_impressao : boolean ): boolean;
var
  codigo_lancamento: string;
  observacoesProducao, saboresProducao : string;
  idMovimentoMesa : Largeint;
  codProdutoPizza : string;
  ct,qtdeProduto : integer;
  totalProporcaoPizza : Double;
  seqImpressao : string;
  impresso : smallint;
begin


 if ( verificaSeProdutoEhPizza(ed_cod_produto.Text,2) = true) then
  begin
   frm_principal.obsSaborPizza:='';
   dm.tbSaboresPizzaTemp.Active:=false;
   dm.tbSaboresPizzaTemp.EmptyTable;
   Application.CreateForm(TfrmSelecaoSaboresPizza,frmSelecaoSaboresPizza);
   frmSelecaoSaboresPizza.ShowModal;
   frmSelecaoSaboresPizza.Free;
   //Seleciona o valor proporcional aos sabores da pizza
   ed_valor_produto.Text  :=   FormatFloat('###,###,##0.00',getValorPizza(ed_cod_produto.Text,2,1));

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
  begin
   observacoesProducao := '';


    if (StrToInt(dm.LeIni(1,'CAIXA','observacaoLancamento')) = 1) then
     begin

       if ( verificaSeProdutoRequerObservacao(ed_cod_produto.Text,2) = true) then
        begin

           if dm.painelDePergunta(#13#10+'  INFORMAR OBSERVAÇÕES ?'+#13#10+#13#10,25) then
             begin
              Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
              frm_obs_lancamento_caixa.ShowModal;
              frm_obs_lancamento_caixa.free;
             end;
        end;
     end;

     observacoesProducao := strObsProduto + frm_principal.tipoMassaPizza;

  end;




  idMovimentoMesa:=  strToInt(dm.geraCodigo('G_MOVIMENTO_MESA',15));
  dm.qryauxiliar.active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('select max(cod_movimento)as novo_cod from movimento_mesa where cod_mesa=' + QuotedStr(mesa));
  dm.qryauxiliar.Active := true;
  codigo_lancamento := FormatFloat('000000000000',idMovimentoMesa  );



  if enviar_impressao then
   begin

    if ed_numero_mesa.Text <> dm.getCodMesaBalcao then
     begin
       seqImpressao :=guidSeqImpressao;
       impresso :=0;
     end
    else
     begin
       seqImpressao := '';
       impresso :=0;
     end;

   end
  else
    begin
       seqImpressao := '';
       impresso :=1;
    end;




 if (verificaSeUsaCodGarcon = False) then
  begin
    ed_cod_garcon.text:=dm.getCodGarconMesaBalcao();
  end;

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('insert into movimento_mesa (cod_mesa,cod_garcon,cod_produto,quantidade,comanda,cod_movimento,');
  dm.qryauxiliar.sql.add('numero_caixa,cod_usuario,valor_unitario,id,observacoes,sabores,seq_impressao,impresso ) values (');
  dm.qryauxiliar.sql.add('' + QuotedStr(mesa) + ',');
  dm.qryauxiliar.sql.add('' + QuotedStr(ed_cod_garcon.Text) + ',');

  dm.qryauxiliar.sql.add('' + QuotedStr(lb_cod_produto.Caption) + ',');

  dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(ed_quantidade.text) + ',');
  dm.qryauxiliar.sql.add('' +QuotedStr('') + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_lancamento) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(numero_caixa) + ',');
  dm.qryauxiliar.sql.add('' + Quotedstr(codigo_usuario) + ',');

   if (verificaSeProdutoCalculaQtde(ed_cod_produto.text,2) ) then
     begin
       ed_valor_produto.Text :=  FormatFloat('#0.00',getValorProduto(ed_cod_produto.Text,2));
       dm.qryauxiliar.SQL.Add('' + dm.TrocaVirgPPto(ed_valor_produto.Text)+',');
     end
   else
    dm.qryauxiliar.SQL.Add('' +dm.removeVirgula( dm.TrocaVirgPPto(ed_valor_produto.Text))+',');
    dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa)+ ',');
    dm.qryauxiliar.sql.add('' + Quotedstr(observacoesProducao) + ',');
    dm.qryauxiliar.sql.add('' + Quotedstr(saboresProducao) + ',');
    dm.qryauxiliar.sql.add('' + Quotedstr(seqImpressao) + ',');
    dm.qryauxiliar.sql.add('' +Inttostr(impresso) + ')');


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

  if (dm.tbSaboresPizzaTemp.IsEmpty = False ) then
   begin
     dm.qryauxiliar.Active := False;
     dm.qryauxiliar.sql.Clear;
     dm.tbSaboresPizzaTemp.First;
     totalProporcaoPizza :=0;
     while not dm.tbSaboresPizzaTemp.Eof do
      begin
       totalProporcaoPizza := StrToFloat(ed_quantidade.Text) *  dm.tbSaboresPizzaTempproporcao.Value;
       dm.qryauxiliar.Active := false;
       dm.qryauxiliar.SQL.clear;
       dm.qryauxiliar.SQL.Add('insert into SABORES_PIZZA_MOVIMENTO_MESA (COD_MESA,ID_MOV_MESA,COD_PRODUTO,COD_SABOR,QUANTIDADE,VALOR_UNITARIO_SABOR,PROPORCAO,DESCRICAO) values (');
       dm.qryauxiliar.sql.add('' + QuotedStr(mesa) + ',');
       dm.qryauxiliar.SQL.add(IntToStr(idMovimentoMesa)+ ',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempcodProduto.Value)+',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempcodigo.Value)+',');
       dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto(Floattostr(totalProporcaoPizza) ) + ',');
       dm.qryauxiliar.sql.add('' + DM.TrocaVirgPPto( ed_valor_produto.Text ) + ',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTemptamanho.Value)+',');
       dm.qryauxiliar.SQL.add(Quotedstr(dm.tbSaboresPizzaTempdescricao.Value)+')');
       dm.qryauxiliar.ExecSQL;
       dm.tbSaboresPizzaTemp.Next;
      end;

   end;


  dm.tbSaboresPizzaTemp.Active:=false;
  dm.tbSaboresPizzaTemp.EmptyTable;







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

observacoesProducao :='';
strObsProduto := '';
frm_principal.tipoMassaPizza := '';
  //  foto.Picture.LoadFromFile(dm.LeIni(2,'IMAGENS','caixa_aguardando'));
end;

procedure Tfrm_caixa_restaurante.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var Bitmap:
TBitmap;


begin


end;

procedure Tfrm_caixa_restaurante.FormActivate(Sender: TObject);
var
pn1 : TPanel;
begin
dm.habilitaCltrAltDel;
Self.Width:=1024;
Self.Height:=737;
Self.Top:=1;
self.Left:=1;
  muda_acao(1);


  dxStatusBar1.Panels[1].Text:='Data do Sistema: '+FormatDateTime('DD/MM/YY',data_do_sistema);
  dxStatusBar1.Panels[2].Text:=nome_usuario;
  mudaCaptionsBotoes();
  setCaption('Caixa');
  frm_caixa_restaurante.Top := 0;
  if (StrToInt(dm.LeIni(2, 'CAIXA', 'comanda_numerada')) = 0) then
  begin
//    ed_numero_mesa.Text:='';
  end;



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
      pn_produto.Left:=80;
      pn_produto.Width:=934;

      ed_quantidade.Left := 851;
      Label6.Left := 851;

      pnPrecoProd.Left := 720;
      Label5.Left := 720;
      
      Panel5.Left := 168;
      Label3.Left := 168;

      ed_cod_produto.Width :=160;


    end;


    timerAtualizaMesas.Enabled := true;


end;

procedure Tfrm_caixa_restaurante.ed_numero_mesaEnter(Sender: TObject);
begin
  if sender is Tedit and (((sender as Tedit).Name = 'ed_numero_mesa')) then
  begin
   dm.qryauxiliar.Active := false;


    if (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false ) then
    begin
      if guidSeqImpressao <> '' then
       begin
         dm.imprimePedidoProducao(guidSeqImpressao);
         guidSeqImpressao:='';
       end;

    end;
//    voltar_mesa;

    ed_numero_mesa.Clear;
    ed_cod_garcon.Clear;
//    pnProdutosTouch.Visible := false;
//    pnTeclado.Visible := true;
//    pnFuncoesMesa.Visible := true;
//    pnTeclado.Top := 193;
//    pnTeclado.Left := 442;
    voltar_mesa;
    podeAtualizar := true;

    mostraMapaMesas();
    pnInfoMesas.Visible := true;


  end;


  if sender is Tedit and (((sender as Tedit).Name = 'ed_cod_garcon')) then
  begin
       podeAtualizar := false;
  end;


  if sender is Tedit and (((sender as Tedit).Name = 'ed_cod_produto')) then
  begin
    podeAtualizar := false;
    ed_valor_produto.Color := clBlack;
    ed_valor_produto.Font.Color := clYellow;

  end;


  if sender is Tedit and (((sender as Tedit).Name = 'ed_valor_produto')) then
  begin
    ed_valor_produto.Color := clMoneyGreen;
    ed_valor_produto.Font.Color := clBlack;
  end;



  if sender is TDBGrid then
  begin
    (sender as TDBGrid).Color := cor_foco_edit;
  end;

end;

procedure Tfrm_caixa_restaurante.B20002002Click(Sender: TObject);
var
  linha: integer;
  valor_total: double;
begin
  podeAtualizar := false;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
    fecharConta();

//  dm.CancelaNotasPendentes();
//  dm.CancelaNotasPendentesPorSubstituicao();

end;



procedure Tfrm_caixa_restaurante.fecharConta();
var
 temExtratoEmitido : boolean;
begin
  if verifica_movimento then
  else
    exit;

  temExtratoEmitido := false;

  temExtratoEmitido := verificaMesaTemExtrato(ed_numero_mesa.text);



  if ( StrToInt(  dm.leini(2,'ENCERRAMENTO','verificar_extrato_antes') ) = 1 ) then
   begin
      if  temExtratoEmitido =  false then
       begin
          dm.exibe_painel_erro('Ainda não foi emitido nenhuma pré-conta para a mesa selecionada!','');
          exit;
       end;
   end
  else
   begin
     if temExtratoEmitido  = false  then
       bloqueiaMesa(ed_numero_mesa.Text);

   end;


  Application.CreateForm(Tfrm_encerramento, frm_encerramento);
  frm_encerramento.lb_mesa.Caption := ed_numero_mesa.Text;
  frm_encerramento.ShowModal;
  frm_encerramento.free;

  voltar_mesa;
  busca_movimento_da_mesa;
  muda_acao(1);

  if ( dm.verificaMesaBalcao(ed_numero_mesa.Text) = false ) then
   begin
    ed_cod_garcon.Clear;
    ed_numero_mesa.clear;
    ed_numero_mesa.SetFocus;
   end;


end;

procedure Tfrm_caixa_restaurante.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
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

procedure Tfrm_caixa_restaurante.DBText2Click(Sender: TObject);
begin
  inherited;
  ShowScrollBar(DBCtrlGrid1.Handle,SB_VERT,False); //Remove barra Vertical
end;

procedure Tfrm_caixa_restaurante.timerInativacaoPedidosTimer(Sender: TObject);
begin
 if (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false ) then
 begin
   dm.ImprimeFilaDeImpressao(false,'',1); 
 end;

end;

function Tfrm_caixa_restaurante.pesquisa_produto: boolean;
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

procedure Tfrm_caixa_restaurante.bt_pesq_produtoClick(Sender: TObject);
begin
  pesquisa_produto;
end;

function Tfrm_caixa_restaurante.gravar_tx_serv: boolean;
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

procedure Tfrm_caixa_restaurante.B20002001KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (( key = vk_escape) and (dm.verificaMesaBalcao(ed_numero_mesa.Text) = false)) then
  begin
    dm.qry_movimento_mesa.Active := false;
    ed_cod_produto.clear;
    ed_descricao_produto.Clear;
    ed_valor_produto.Clear;
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

procedure Tfrm_caixa_restaurante.pesquisaGarcons();
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

procedure Tfrm_caixa_restaurante.B20002001Click(Sender: TObject);
begin
//  if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;
  podeAtualizar := false;

  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
   begin
    if ( trim(ed_numero_mesa.Text) = '' ) then
     begin
       emitirExtrato(true);
     end
    else
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
          emitirExtrato(false);

        string_auxiliar := '';
       end
      else
       emitirExtrato(false);
    end;

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

procedure Tfrm_caixa_restaurante.emitirExtrato(variasMesas : boolean);
begin

  if (variasMesas = true) then
   begin
    Application.CreateForm(Tfrm_extrato, frm_extrato);
    frm_extrato.pn_fiscal.Visible := false;
    //frm_extrato.lb_mesa.Caption := ed_numero_mesa.Text;
    frm_extrato.showmodal;
    frm_extrato.free;
   end
  else
   begin
    if verifica_movimento then
     begin
       Application.CreateForm(Tfrm_extrato, frm_extrato);
       frm_extrato.pn_fiscal.Visible := true;
       frm_extrato.lb_mesa.Caption := ed_numero_mesa.Text;
       frm_extrato.showmodal;
       frm_extrato.free;
     end;
   end;




  busca_movimento_da_mesa;
  voltar_mesa;

end;

procedure Tfrm_caixa_restaurante.DBCtrlGrid1Click(Sender: TObject);
var
 mesa : string;
begin
  inherited;
  mesa:= dm.qryMapaMesasSalao.FieldByName('mesa_saida').Value;
  ed_numero_mesa.SetFocus;
  ed_numero_mesa.Text := mesa;


   if (ed_cod_garcon.Visible = True ) then
      ed_cod_garcon.SetFocus
   else
     ed_cod_produto.SetFocus;

end;

procedure Tfrm_caixa_restaurante.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  inherited;
  if ( dm.qryMapaMesasSalao.IsEmpty = false ) then
   begin
    imgMesa.Tag := strToInt(dm.qryMapaMesasSalao.FieldByName('mesa_saida').Value);
    imgMesa.Picture := nil;
    case dm.qryMapaMesasSalao.FieldByName('extratos_emitidos').Value  of
     -1: begin
           imgMesa.picture.LoadFromFile(patchAplicacao+'imagens\mesaSemConsumir.png');
         end;
     0: begin
          imgMesa.picture.LoadFromFile(patchAplicacao+'imagens\mesaConsumindo.png');

        end;
     else
      begin
        imgMesa.picture.LoadFromFile(patchAplicacao+'imagens\mesaAguardandoPagamento.png');

      end;

    end;



    DBCtrlGrid1.Canvas.Draw(10,0,imgMesa.Picture.Graphic);
    DBCtrlGrid1.Canvas.Pen.Color := clBlack;
    DBCtrlGrid1.Canvas.Font.Size := 14;
    DBCtrlGrid1.Canvas.TextOut(22,66,dm.qryMapaMesasSalao.FieldByName('mesa_saida').Value);
    imgMapa.Repaint;

   end;

end;

procedure Tfrm_caixa_restaurante.DBGrid1CellClick(Column: TColumn);
begin

  D30001011.SetFocus;

end;

procedure Tfrm_caixa_restaurante.B20002006Click(Sender: TObject);
var
 emiteExtratoAntes : integer;
begin
  podeAtualizar := false;




   if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
        transferirMesa;

   ed_numero_mesa.OnEnter(ed_numero_mesa);
end;

procedure Tfrm_caixa_restaurante.transferirMesa();
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
  ed_quantidade.clear;
  ed_cod_garcon.clear;
  //      ed_nome_garcon.Clear;
  //ed_total_taxa.Text:='0,00';
  ed_numero_mesa.Clear;
  ed_numero_mesa.SetFocus;
  voltar_mesa;

end;

procedure Tfrm_caixa_restaurante.B20002004Click(Sender: TObject);
begin
  podeAtualizar := false;
  if( trim(ed_numero_mesa.Text) = dm.getCodMesaBalcao ) then exit;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
    if (rdg_modo_visualizacao.ItemIndex = 0) then
     begin
      if (dm.qry_movimento_mesa.FieldByName('cancelado').Value = 0) then
       begin
         transferirItem()
       end
      else
        begin
          MessageDlg('Não é possível transferir um produto que já foi cancelado!', mtError, [mbOK], 0);
        end;
     end
    else
    begin
      showmessage('Selecione o modo de visualização analítico e marque o lançamento a ser trasnferido!');
    end;

end;

procedure Tfrm_caixa_restaurante.transferirItem();
begin

  if verifica_movimento then
  else
    exit;

  Application.Createform(Tfrm_transferir_item, frm_transferir_item);
  frm_transferir_item.lbDescricaoProduto.Caption:=dm.qry_movimento_mesa.FieldByName('descricao').Value;
  frm_transferir_item.lbQtde.Caption := FormatFloat('#0.000',dm.qry_movimento_mesa.FieldByName('quantidade').Value);

  frm_transferir_item.ShowModal;
  frm_transferir_item.free;
  busca_movimento_da_mesa;
  voltar_mesa;
  busca_movimento_da_mesa();
  ed_numero_mesa.SetFocus();
//  D30001011.SetFocus;
end;

procedure Tfrm_caixa_restaurante.B20002007Click(Sender: TObject);
begin
  podeAtualizar := false;
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

function Tfrm_caixa_restaurante.verifica_movimento: boolean;
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

procedure Tfrm_caixa_restaurante.B300010040Click(Sender: TObject);
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

procedure Tfrm_caixa_restaurante.verificar_permissoes;
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

procedure Tfrm_caixa_restaurante.voltar_mesa;
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

procedure Tfrm_caixa_restaurante.B20002014Click(Sender: TObject);
begin
  podeAtualizar := false;
  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
  end;

  // voltar_mesa;
end;

procedure Tfrm_caixa_restaurante.D30001011Exit(Sender: TObject);
begin
  if sender is TDBGrid then
  begin
    (sender as TDBGrid).Color := clWhite;
  end;

end;

procedure Tfrm_caixa_restaurante.apagaItemMovimento(qtde: double; codMotivo : string; descricaoMotivo: string; obs : string);
var
  result: string;
  qtd_restante: double;
  total_registros: integer;
  q : TIBQuery;
  impCancelamentoLocalProducao : boolean;
begin

  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;




  if verifica_movimento then
  begin
    if MessageDlg('Confirma cancelamento do ítem selecionado ?', mtconfirmation, [MbYes, mbNo], 0) = Mryes then
    begin

      if rdg_modo_visualizacao.ItemIndex = 0 then
       begin
          if dm.qry_movimento_mesa.FieldByName('impresso').Value = 0 then
            begin
             impCancelamentoLocalProducao:=false
            end
          else
            begin
             impCancelamentoLocalProducao:=true;
             dm.gravarEstornoDeItem(ed_numero_mesa.Text,codMotivo,descricaoMotivo,
                                    dm.qry_movimento_mesa.fieldbyname('cod_barras').value,
                                    dm.qry_movimento_mesa.fieldbyname('descricao').value,qtde,
                                   (dm.qry_movimento_mesa.fieldbyname('valor_unitario').value),obs,
                                    impCancelamentoLocalProducao,'','',
                                    dm.qry_movimento_mesa.fieldbyname('id').value
                                     );
            end;
       end;

   if (rdg_modo_visualizacao.ItemIndex = 0) then // Faz a deleção/atualização de quantidade do ítem no modo analítico
       begin
          dm.qrymax.Active := false;
          dm.qrymax.SQL.Clear;
          if ((dm.qry_movimento_mesa.fieldbyname('quantidade').value = 1) or ((dm.qry_movimento_mesa.fieldbyname('quantidade').value - qtde) = 0)) then
           begin
             if (dm.qry_movimento_mesa.fieldbyname('impresso').value = 1) then
              begin
                dm.qrymax.sql.add('delete from movimento_mesa where cod_mesa=' + quotedstr(ed_numero_mesa.Text) + ' and cod_movimento=' + Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));
                q.Active:=false;
                q.sql.clear;
              end
             else
              begin
                dm.qrymax.sql.add('delete from movimento_mesa where cod_mesa=' + quotedstr(ed_numero_mesa.Text) + ' and cod_movimento=' + Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));
                q.Active:=false;
                q.sql.clear;

              end;

             q.SQL.add('delete from fila_de_impressao where id_movimento_mesa='+IntTostr(dm.qry_movimento_mesa.fieldbyname('id').value) );
             q.ExecSQL;
           end
          else
            begin
             // comecei a alteração por aqui
             qtd_restante := dm.qry_movimento_mesa.fieldbyname('quantidade').value - qtde;
             if (qtd_restante = 0) then
              begin
                dm.qrymax.Active := false;
                dm.qrymax.sql.Clear;
                dm.qrymax.sql.add('delete from movimento_mesa  where cod_mesa=' + quotedstr(ed_numero_mesa.Text) + ' and cod_movimento=' + Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));
                dm.qrymax.ExecSQL;
                q.Active:=false;
                q.sql.clear;
                q.SQL.add('delete from fila_de_impressao where id_movimento_mesa='+IntTostr(dm.qry_movimento_mesa.fieldbyname('id').value) );
                q.ExecSQL;
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
                 lb_cod_produto.Caption := dm.qrymax.fieldbyname('cod_produto').value;
                 dm.qrymax.Active := false;
                 dm.qrymax.sql.Clear;
                 dm.qrymax.sql.add('delete from movimento_mesa  where cod_mesa=' + quotedstr(ed_numero_mesa.Text) + ' and cod_movimento=' + Quotedstr(dm.qry_movimento_mesa.fieldbyname('cod_movimento').value));
                 dm.qrymax.ExecSQL;
                 adicionar_produto_conta(ed_numero_mesa.Text, false);
               end;
            end;
             // terminei por aqui

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

           q.Active:=false;
           q.sql.clear;
           q.SQL.add('delete from fila_de_impressao where id_movimento_mesa='+IntTostr(dm.qry_movimento_mesa.fieldbyname('id').value) );
           q.ExecSQL;
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

  q.Active:=false;
  FreeAndNil(q);
end;

procedure Tfrm_caixa_restaurante.D30001011MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ((dm.qry_movimento_mesa.Active) and (dm.qry_movimento_mesa.IsEmpty = false) and (rdg_modo_visualizacao.ItemIndex = 0)) then
  begin
    try
      begin
        D30001011.Hint := 'Garçon: ' + dm.qry_movimento_mesa.fieldbyname('apelido').Value +
          #13 + 'ID: ' + dm.qry_movimento_mesa.fieldbyname('ID').AsString +
          #13 + 'Produto: ' + dm.qry_movimento_mesa.fieldbyname('descricao').AsString +
          #13 + 'Quantidade: ' + FormatFloat('###,###,##0.000',dm.qry_movimento_mesa.fieldbyname('quantidade').Value) +
          #13 + 'Lançado por: ' + dm.qry_movimento_mesa.fieldbyname('login').AsString + ' às ' + FormatDateTime('HH:MM:SS', dm.qry_movimento_mesa.fieldbyname('hora_lancamento').value)+
          #13+#13 + 'Sabores :'+#13+ dm.qry_movimento_mesa.fieldbyname('sabores').AsString+
          #13+#13+ 'Obs :'+#13+ dm.qry_movimento_mesa.fieldbyname('observacoes').AsString;

      end;
    except
    end;           end;
end;


procedure Tfrm_caixa_restaurante.D30001011DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);


var
holdColor: TColor;
ss : string;
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

  if Column.FieldName = 'OBS_PAF' then
   begin
     if ( trim(copy(trim(Column.Field.AsString),0,7)) = 'TRANSF.' ) then
      begin
        D30001011.Canvas.Brush.Color := clGreen;
        D30001011.Canvas.Font.Color := clWhite;
        D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end
     else
       begin
         if ( trim(copy(trim(Column.Field.AsString),0,7)) = 'CANCELA' ) then
          begin
            D30001011.Canvas.Brush.Color := clRed;
            D30001011.Canvas.Font.Color := clWhite;
            D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end
      end;
   end;



  if Column.FieldName = 'DESCRICAO' then
   begin
     if rdg_modo_visualizacao.ItemIndex = 0 then
      begin
         if (dm.qry_movimento_mesa.FieldByName('impresso').Value = 0) then
          begin
            D30001011.Canvas.Brush.Color := clRed;
            D30001011.Canvas.Font.Color := clWhite;
            D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end
      end
     else
       begin

      end;
   end;




  if Column.FieldName = 'COD_BARRAS' then
   begin
     if rdg_modo_visualizacao.ItemIndex = 0 then
      begin
        if (dm.qry_movimento_mesa.FieldByName('impresso').Value = 0) then
         begin
           D30001011.Canvas.Brush.Color := clRed;
           D30001011.Canvas.Font.Color := clWhite;
           D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
         end
      end
     else
       begin

      end;
   end;

  if Column.FieldName = 'QUANTIDADE' then
   begin
     if rdg_modo_visualizacao.ItemIndex = 0 then
      begin
         if (dm.qry_movimento_mesa.FieldByName('impresso').Value = 0) then
          begin
            D30001011.Canvas.Brush.Color := clRed;
            D30001011.Canvas.Font.Color := clWhite;
            D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end
      end


     else
       begin

      end;
   end;

  if Column.FieldName = 'VALOR_UNITARIO' then
   begin
     if rdg_modo_visualizacao.ItemIndex = 0 then
      begin
         if (dm.qry_movimento_mesa.FieldByName('impresso').Value = 0) then
          begin
            D30001011.Canvas.Brush.Color := clRed;
            D30001011.Canvas.Font.Color := clWhite;
            D30001011.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          end
      end
     else
       begin

      end;
   end;



if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin
  Brush.Color:=clYellow; //aqui é definida a cor do fundo
  TDbGrid(Sender).Canvas.font.Color:= clBlack;
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

procedure Tfrm_caixa_restaurante.B20002003Click(Sender: TObject);
var
  result: string;
  permite: boolean;
  qtde : real;
  id   : integer;
begin
  podeAtualizar := false;


  id   := dm.qry_movimento_mesa.FieldByName('id').Value;
  qtde := dm.qry_movimento_mesa.FieldByName('quantidade').Value;


  if (dm.qry_movimento_mesa.FieldByName('impresso').Value = 1) then
  begin
   if   (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
    begin
      if rdg_modo_visualizacao.ItemIndex = 0 then
       begin
            application.CreateForm(Tfrm_cancela_item_restaurante, frm_cancela_item_restaurante);
            frm_cancela_item_restaurante.lbDescricaoProduto.Caption:=dm.qry_movimento_mesa.FieldByName('descricao').Value;
             if( ( qtde  = 1) or (Frac(qtde) >0)  )    then
                begin
                  frm_cancela_item_restaurante.edQuantidade.Value:=qtde;
                  frm_cancela_item_restaurante.edQuantidade.Enabled:=false;
                end
              else
                 begin

                 end;

            frm_cancela_item_restaurante.ShowModal;
            frm_cancela_item_restaurante.Free;
          end
      else
        begin
          Showmessage('Não é possível realizar cancelamentos no modo de visualização resumida '+#13+' A legislação do PAF-ECF ICMS 06/08 não permite tal operação.');
          exit;
        end;
    end;
  end
 else
   begin
    apagaItemMovimento(dm.qry_movimento_mesa.FieldByName('quantidade').Value,'0','0','');
   end;


   busca_movimento_da_mesa();
end;

procedure Tfrm_caixa_restaurante.B30001007Click(Sender: TObject);
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


procedure Tfrm_caixa_restaurante.B30001001KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then
    ed_numero_mesa.SetFocus;
end;


procedure Tfrm_caixa_restaurante.B20001002Click(Sender: TObject);
begin
  podeAtualizar := false;
 if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
 begin
  if tipo_caixa_atual = 1 then
    alternarTipoCaixa(2)
  else
   alternarTipoCaixa(1)

 end;
{  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
    Application.CreateForm(Tfrm_abertura_dia, frm_abertura_dia);
    frm_abertura_dia.tipo_suprimento := 1;
    frm_abertura_dia.ShowModal;
    frm_abertura_dia.free;
  end;
 }
end;


procedure Tfrm_caixa_restaurante.rdg_modo_visualizacaoClick(
  Sender: TObject);
begin
  busca_movimento_da_mesa();
end;

procedure Tfrm_caixa_restaurante.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin


  if (Shift = [ssCtrl]) and (Key = 65) then
  begin
    if rdg_modo_visualizacao.ItemIndex = 0 then
      rdg_modo_visualizacao.ItemIndex := 1
    else
      rdg_modo_visualizacao.ItemIndex := 0;
  end;

  if (Shift = [ssCtrl]) and (Key =  454 ) then
  begin
    dm.apagaExtratosEmitidos(ed_numero_mesa.text);
    showmessage('Mesa Reaberta!');
  end;


  if (Shift = [ssCtrl]) and (Key = 80) then
  begin
  END;

  {
  if (Shift = [ssCtrl]) and (Key = 71) then
  begin
    dm.AbreGaveta(1,1);

  end;
   }

  if (Shift = [ssCtrl]) and (Key = 77) then
  begin
//    btMapaMesas.Click;
  end;


 if (Shift = [ssCtrl]) and (Key = 83) then
  begin
     btOpCaixa.Click;
  END;


  
  if (Shift = [ssCtrl]) and (Key = 79) then
  begin

      Application.CreateForm(Tfrm_obs_lancamento_caixa, frm_obs_lancamento_caixa);
           frm_obs_lancamento_caixa.ShowModal;
           frm_obs_lancamento_caixa.free;
//    AtualizarListaMesas();
//    timerAtualizaTelaMesas.Enabled:=false;
//    timerAtualizaTelaMesas.Enabled:=true;
  END;


if (Shift = [ssCtrl]) and (Key = 67) then
  begin
    btCalculadora.Click;
  END;


if (Shift = [ssCtrl]) and (Key = 68) then
  begin
    B20001003.Click;
  END;




if (Key = 118) then
  begin
    B20002005.Click;
  END;




end;

procedure Tfrm_caixa_restaurante.efetuar_lancamento;
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




procedure  Tfrm_caixa_restaurante.gravarEstornoMesa(mesa : string);
var
 q : TIBQuery;
 totalMesa : double;
 codEstorno : string;
begin

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  codEstorno := dm.geraCodigo('G_ESTORNOS_MESA',5);
  totalMesa :=  getValorProdutosMesa(mesa);
  q.SQL.Add('insert into estornos_mesa (codigo,mesa,total_mesa,cod_caixa,hora,COD_USUARIO_AUTORIZOU,NOME_USUARIO_AUTORIZOU) values(');
  q.SQL.Add(''+Quotedstr(codEstorno)+',');
  q.SQL.add(''+Quotedstr(mesa)+',');
        q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(totalMesa))+',');
        q.SQL.add(''+Quotedstr(ultimoCaixaAberto)+',');
        q.SQL.Add(''+Quotedstr(FormatDateTime('hh:mm:ss',Time))+',');
        q.sql.add(QuotedStr(codigo_usuario_responsavel)+',');
        q.sql.add(QuotedStr(nome_usuario_responsavel)+')');



  try
   begin
    q.ExecSQL;
   end
  except
   begin
     ShowMessage('Erro ao logar o estorno de mesa!');

   end;
  end;

  q.Active:=false;
  q.SQL.clear;
  q.sql.add('insert into produtos_estornos_mesa(COD_ESTORNO,COD_PRODUTO,COD_BARRAS,');
  q.sql.add('       DESCRICAO, QUANTIDADE,VALOR_UNITARIO,TOTAL)');
  q.sql.add('       select '+QuotedStr(codEstorno)+',mv.cod_produto,cod_barras,p.descricao,mv.quantidade,mv.valor_unitario,(mv.valor_unitario * mv.quantidade)');
  q.sql.add('       from movimento_mesa mv');
  q.sql.add('       inner join produtos p on (p.cod_produto = mv.cod_produto)');
  q.sql.add('       where mv.cod_mesa='+Quotedstr(mesa));
  try
   begin
    q.ExecSQL;
   end
  except
   begin
     ShowMessage('Erro gravar os produtos estornados da mesa');

   end;
  end;

  {
  if ( StrToInt(dm.LeIni(1,'TRANSFERENCIA_DE_MESA','imprime_comprovante')) = 1)   then
   begin
     dm.imprimeComprovanteTransferenciaMesa(origem,destino,codTransferencia,totalMesaOrigem,totalMesaDestino);
   end;
   }

  if dm.transacao.Active = false then dm.transacao.Active:=true;
  dm.transacao.Commit;

  q.Active:=false;
  FreeAndNil(q);
end;





procedure Tfrm_caixa_restaurante.alternarTipoCaixa(tipo : integer);
begin

  if (tipo = 1) then
   begin

    ed_numero_mesa.Text:= dm.getCodMesaBalcao();
    ed_cod_garcon.Text:=  dm.getCodGarconMesaBalcao();
    pnMapaMesas.Visible := false;
    pnMovimentoMesa .Visible := true;
    pnInfoMesas.Visible := false;
    podeAtualizar := false;       
    pn_mesa.Visible:=false;
    pn_garcon.Visible:=false;
     pn_produto.Left := 165;
    B20001002.Caption:='Venda'+#10+'em Mesa'+#10+'(B)';
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
//       B30001002.enabled:=false;
//       B30001016.enabled:=false;
//       B30001007.enabled:=false;
//       B30001008.enabled:=false;
//       B30001009.enabled:=false;
//       B30001010.enabled:=false;

       pn_mesa.Visible:=false;
       pn_garcon.Visible:=false;

       B20001002.Caption:='Venda'+#10+'em Mesa'+#10+'(B)';
       B20001002.Enabled:=false;
       ed_cod_produto.SetFocus;
       tipo_caixa_atual:=tipo;
        busca_movimento_da_mesa();
       Exit;
     end
    else
     begin
      B20001002.Caption:='Venda'+#10+'Balcão'+#10+'(B)';
      ed_numero_mesa.Text:='';
      ed_cod_garcon.Text:= '';
      pn_mesa.Visible:=true;
      pn_garcon.Visible:=true;

     if (verificaSeUsaCodGarcon = False) then 
      begin
        ed_cod_garcon.text:=dm.getCodGarconMesaBalcao();
        ed_cod_garcon.Visible:=false;
        pn_garcon.Visible:=FALSE;
        pn_produto.Left:=80;
        pn_produto.Width:=929;
      end
     else
      begin
        ed_cod_garcon.text:='';
        ed_cod_garcon.Visible:=true;
        pn_garcon.Visible:=true;
        pn_produto.Left:=160;
        pn_produto.Width:=853;
      end;




//      B30001002.enabled:=true;
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
procedure Tfrm_caixa_restaurante.ed_numero_mesaChange(Sender: TObject);
begin
  inherited;
  if (    ((trim(ed_numero_mesa.Text) ='b') ) or  ((trim(ed_numero_mesa.Text) ='B') ) )  then
  begin
    B20001002.Click;
  end;

end;

procedure Tfrm_caixa_restaurante.ed_cod_produtoChange(Sender: TObject);
var
 qtde : integer;
 codProduto : string;
 valorTotal : string;
 valor  : double;
 quantidade   : double;
 precoUnitario : double;
//
 tipoCodBarras : integer;
 strPreco : string;
 qtdeCalculada : double;
 codProdutoLido : string;

begin
  inherited;

if ( (trim(ed_cod_produto.Text) ='010101') ) then
  begin
   if tipo_cupom = 1 then
    muda_acao(2)
   else
    muda_acao(1);
    ed_cod_produto.Clear;

  end;

  if (    ((trim(ed_cod_produto.Text) ='b') ) or  ((trim(ed_cod_produto.Text) ='B') ) )  then
  begin
    ed_cod_produto.Clear;
    B20001002.Click;
  end;

end;

procedure Tfrm_caixa_restaurante.ed_quantidadeChange(Sender: TObject);
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



procedure Tfrm_caixa_restaurante.lancarCouvertAutomatico(mesa : string);
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


procedure Tfrm_caixa_restaurante.mudaCaptionsBotoes();
begin
B20002001.Caption := 'Imprimir'+#10+'Pré-Conta'+#10+'(F3)';
B20002002.Caption := 'Receber'+#10+'Conta'+#10+'(F4)';
B20002003.Caption := 'Cancelar'+#10+'ítem'+#10+'(F5)';
//B20002014.Caption := 'Liberar'+#10+'Veículo'+#10+'(F6)';
B20002005.Caption := 'Estornar '+#10+'Mesa'+#10+'(F7)';
B20002020.Caption := 'Reabrir '+#10+'Mesa'+#10+'';


B20002006.Caption := 'Transferir'#10+'Mesa'+#10+'(F9)';
B20002004.Caption := 'Transferir'#10+'ítem'+#10+'(F10)';
B20002007.Caption  := 'Receb.'#10+'Parciais'+#10+'(F11)';
B20001002.Caption := 'Venda'+#10+'Balcão'+#10+'(B)';
B20001003.Caption :=  'Delivery'+#10+''+'(ctrl+D)';
btOpCaixa.Caption :=  'Funções do'+#10+'caixa'+#10+''+'(ctrl+S)';
btMenuFiscal.Caption := 'Menu '+#10+'Fiscal'+'';


btCalculadora.caption := 'Calculadora'+#10+''+'(ctrl+C)';


end;













procedure Tfrm_caixa_restaurante.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  timerAtualizaTelaMesas .Enabled:=false;
//  timerAtualizaTelaMesas .Enabled:=true;
end;

procedure Tfrm_caixa_restaurante.timerAtualizaTelaMesasTimer(Sender: TObject);
begin
  inherited;
//  AtualizarListaMesas();
end;






procedure Tfrm_caixa_restaurante.enter_botao(Sender: TObject);
begin
   ed_numero_mesa.text:=(sender as TBitBtn).Caption;
end;






procedure Tfrm_caixa_restaurante.Timer1Timer(Sender: TObject);
begin
  inherited;
  dxStatusBar1.Panels[3].Text:= FormatDateTime('HH:MM:SS',time);
end;

procedure Tfrm_caixa_restaurante.btCalculadoraClick(Sender: TObject);
begin
  inherited;
  ACBrCalculadora1.Execute;
end;

procedure Tfrm_caixa_restaurante.B20001003Click(Sender: TObject);
begin       
  inherited;
  podeAtualizar := false;
 if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
 begin
  Application.createForm(TfrmExpedicaoDelivery, frmExpedicaoDelivery);
  frmExpedicaoDelivery.showmodal();
  frmExpedicaoDelivery.free;
 end;

end;

procedure Tfrm_caixa_restaurante.CancelamentodeProduto1Click(
  Sender: TObject);
begin
  inherited;
  B20002003.Click;
end;

procedure Tfrm_caixa_restaurante.RANSFERNCIA1Click(Sender: TObject);
begin
  inherited;
  B20002004.Click;
end;

procedure Tfrm_caixa_restaurante.muda_acao(tipo : integer);
begin
  case tipo of
    1: begin
         tipo_cupom:=1;
         dxstatusbar1.Panels[0].text:=nome_fantasia;

       end;
    2: begin
         tipo_cupom:=2;
         dxstatusbar1.Panels[0].text:=razao_social;
       end;
  end;
  ed_cod_produto.Clear;
end;


procedure Tfrm_caixa_restaurante.pisca1Timer(Sender: TObject);
begin
  inherited;
    pisca1.Enabled:=false;
    pisca2.Enabled:=true;

end;

procedure Tfrm_caixa_restaurante.pisca2Timer(Sender: TObject);
begin
  inherited;

    pisca2.Enabled:=false;
    pisca1.Enabled:=true;

end;

procedure Tfrm_caixa_restaurante.pnExpedicaoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmExpedicaoDelivery,frmExpedicaoDelivery);
  frmExpedicaoDelivery.ShowModal;
  frmExpedicaoDelivery.Free;
end;

procedure Tfrm_caixa_restaurante.imgAtencaoClick(Sender: TObject);
begin
  inherited;
  pnExpedicaoClick(sender); 
end;

procedure Tfrm_caixa_restaurante.imgMesaClick(Sender: TObject);
begin
  inherited;

   if  ( dm.qryMapaMesasSalao.IsEmpty = false ) then
    begin
        {
     case dm.qryMapaMesasSalao.FieldByName('extratos_emitidos').Value  of
       -1: begin
             imgMesa.picture.LoadFromFile(patchAplicacao+'imagens\mesaSemConsumir.png');
           end;
       0: begin
            imgMesa.picture.LoadFromFile(patchAplicacao+'imagens\mesaConsumindo.png');
          end;
       else
        begin
          imgMesa.picture.LoadFromFile(patchAplicacao+'imagens\mesaAguardandoPagamento.png');
        end;

      end;
      }
      ed_numero_mesa.SetFocus;
      ed_numero_mesa.Text := FormatFloat('0000',imgMesa.Tag);
       if (ed_cod_garcon.Visible = True ) then
          ed_cod_garcon.SetFocus
       else
         ed_cod_produto.SetFocus;

    end;
  ShowScrollBar(DBCtrlGrid1.Handle,SB_VERT,False); //Remove barra Vertical
end;

procedure Tfrm_caixa_restaurante.imgMesaMouseEnter(Sender: TObject);
begin
  inherited;

    imgMesa.Picture := nil;
    case dm.qryMapaMesasSalao.FieldByName('extratos_emitidos').Value  of
     -1: begin
           imgMesa.picture.LoadFromFile(patchAplicacao+'imagens\mesaSemConsumir.png');
//           imgMesa.Picture := imgListMesa.Items[2];

         end;
     0: begin
          imgMesa.picture.LoadFromFile(patchAplicacao+'imagens\mesaConsumindo.png');
          // imgMesa.Picture := imgListMesa.Items[0];
        end;
     else
      begin
        imgMesa.picture.LoadFromFile(patchAplicacao+'imagens\mesaAguardandoPagamento.png');
          // imgMesa.Picture := imgListMesa.Items[1];
      end;

    end;

    imgMapa.Repaint;



end;





procedure Tfrm_caixa_restaurante.btMenuFiscalClick(Sender: TObject);
begin
  inherited;
  podeAtualizar := false;
  Application.CreateForm(TfrmMenuFiscal,frmMenuFiscal);
  frmMenuFiscal.ShowModal;
  frmMenuFiscal.free; 
end;

procedure Tfrm_caixa_restaurante.btOpCaixaClick(Sender: TObject);
begin
  inherited;
  podeAtualizar := false;
  Application.CreateForm(TfrmOperacoesDeCaixa,frmOperacoesDeCaixa);
  frmOperacoesDeCaixa.ShowModal;
  frmOperacoesDeCaixa.free;

  if (verificaSeCaixaEstaAberto(ultimoCaixaAberto) = false) then
   begin
    close;
   end;

end;

procedure Tfrm_caixa_restaurante.mostraMapaMesas();
begin
  pnMapaMesas.Visible := true;
  pnMovimentoMesa.Visible := false;
  dm.transacao.Active :=false;
  dm.transacao.Active := true;
  dm.qryMapaMesasSalao.Active := false;
  dm.qryMapaMesasSalao.SQL.Clear;
  DBCtrlGrid1.Visible := false;
  dm.qryMapaMesasSalao.SQL.Add('select * from rodapeextrato2('+Quotedstr('')+',10)');
  dm.qryMapaMesasSalao.Active := true;
  edQtdMesas.Text   := '0 MESAS';
  edMesasPagto.Text :=  '';


  if (dm.qryMapaMesasSalao.IsEmpty = false) then
   begin
      DBCtrlGrid1.Visible := true;
      dm.qryMapaMesasSalao.last;
      edQtdMesas.Text   := Inttostr(dm.qryMapaMesasSalao.fieldbyname('qtdMesas').AsInteger) + ' MESAS';
      edMesasPagto.Text :=   Inttostr(dm.qryMapaMesasSalao.fieldbyname('qtdMesasPagamento').AsInteger)+' EM PAGAMENTO';
      dm.qryMapaMesasSalao.first;
      ShowScrollBar(DBCtrlGrid1.Handle,SB_VERT,False); //Remove barra Vertical
   end;
end;






procedure Tfrm_caixa_restaurante.SpeedButton2Click(Sender: TObject);
begin
  inherited;

     SendMessage(DBCtrlGrid1 .Handle, WM_VSCROLL, SB_PAGEUP  , 0);
        ShowScrollBar(DBCtrlGrid1.Handle,SB_VERT,False);

end;

procedure Tfrm_caixa_restaurante.SpeedButton1Click(Sender: TObject);

begin
  inherited;

    SendMessage(DBCtrlGrid1 .Handle, WM_VSCROLL, SB_PAGEDOWN , 0);
    ShowScrollBar(DBCtrlGrid1.Handle,SB_VERT,False);

end;


procedure Tfrm_caixa_restaurante.timerAtualizaMesasTimer(Sender: TObject);
begin
  inherited;
//  if podeAtualizar then
 //   mostraMapaMesas();
end;

procedure Tfrm_caixa_restaurante.FormCreate(Sender: TObject);
begin
  inherited;
  if (StrToInt(dm.LeIni(2,'SALAO','mostrarCodigoGarcon')) =0) then
   begin
     ed_cod_garcon.PasswordChar :='*';

   end;

end;

procedure Tfrm_caixa_restaurante.B20002005Click(Sender: TObject);
begin
  inherited;
  podeAtualizar := false;


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
        gravarEstornoMesa(ed_numero_mesa.Text);
        dm.estornarMesaInteira(marca_impressora_nao_fiscal_01, modelo_impressora_nao_fiscal_01, ed_numero_mesa.Text,ed_valor_bruto.Value);
      end;
  end;

end;

procedure Tfrm_caixa_restaurante.B20002020Click(Sender: TObject);
begin
  inherited;

  if (dm.verificaPermissaoAcao((sender as TBitBtn).Name) = true) then
  begin
    dm.apagaExtratosEmitidos(ed_numero_mesa.text);
      showmessage('Mesa Reaberta!');
  end;

end;

procedure Tfrm_caixa_restaurante.ed_cod_garconChange(Sender: TObject);
begin
  inherited;

if ( (trim(ed_cod_garcon.Text) ='010101') ) then
  begin
   if tipo_cupom = 1 then
    muda_acao(2)
   else
    muda_acao(1);
    ed_cod_garcon.Clear;

  end;
end;

end.





