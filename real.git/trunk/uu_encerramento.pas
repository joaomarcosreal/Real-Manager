unit  uu_encerramento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,pcnConversaoNFE, pcnConversao,ACBrPosPrinter, SHDocVw,ACBrUtil,
  Dialogs, Mask,   StdCtrls,  Buttons,   pcnNFE,
   ExtCtrls,DB, IBCustomDataSet, IBQuery, RxMemDS,uu_modelo_vazio,  ACBrNFe,
  Grids, DBGrids,  ACBrECF, ACBrBase, ACBrDevice,ACBrNFeDANFEClass, uu_manutencao_grupos,
  StrUtils, DateUtils, Types, ACBrCalculadora,
   ImgList,  ACBrSATClass,
  AdvTouchKeyboard, JvXPButtons, AdvGlassButton, JvExStdCtrls, JvEdit,
  JvExControls, JvButton, JvTransparentButton, jpeg, JvCtrls, System.ImageList,
 RxCurrEdit, RxToolEdit, uuDmVendas, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxActivityIndicator, dxGDIPlusClasses ;



type
    Tfrm_encerramento = class(Tfrm_modelo_vazio)
    Panel9: TPanel;
    Label11: TLabel;
    Label19: TLabel;
    Label1: TLabel;
    ed_total_conta: TCurrencyEdit;
    ed_total_desconto: TCurrencyEdit;
    ed_valor_bruto: TCurrencyEdit;
    pn_faturamento: TPanel;
    Label6: TLabel;
    Panel4: TPanel;
    bt_confirma_fatura: TBitBtn;
    bt_cancelar: TBitBtn;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    Label10: TLabel;
    Panel5: TPanel;
    Label7: TLabel;
    ed_cod_cliente: TEdit;
    ed_desc_cliente: TEdit;
    Panel2: TPanel;
    tbFormasPagamentoTemp: TRxMemoryData;
    tbFormasPagamentoTempcodForma: TStringField;
    tbFormasPagamentoTempdescricaoForma: TStringField;
    tbFormasPagamentoTempvalorForma: TCurrencyField;
    dsFormasPagtoTemp: TDataSource;
    tbFormasPagamentoTemprp: TStringField;
    Label9: TLabel;
    Label17: TLabel;
    ed_total_entrega: TCurrencyEdit;
    ACBrCalculadora1: TACBrCalculadora;
    ImageList1: TImageList;
    gp_desconto: TGroupBox;
    ed_valor_desconto: Tedit;
    ckb_desconto: TCheckBox;
    pnTeclado: TPanel;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    ed_total_tx_serv: TCurrencyEdit;
    Label12: TLabel;
    ed_valor_troco: TCurrencyEdit;
    Label2: TLabel;
    pnFormasPagamento: TPanel;
    pn_fiscal: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Memo1: TMemo;
    ed_codigo_forma: Tedit;
    Panel7: TPanel;
    Label4: TLabel;
    ed_total_pago: TCurrencyEdit;
    DBGrid1: TDBGrid;
    Panel8: TPanel;
    pnOpcoes: TPanel;
    ed_valor_forma: TJvEdit;
    tbFormasPagamentoTempCodCliFaturado: TStringField;
    tbFormasPagamentoTempobservacoesFaturado: TStringField;
    btDesconto: TSpeedButton;
    btIdCliente: TSpeedButton;
    btIniciaEmissaoCupom: TSpeedButton;
    Panel10: TPanel;
    Timer2: TTimer;
    Timer1: TTimer;
    memoMensagens: TMemo;
    btMenuFiscal: TSpeedButton;
    btCancelar: TSpeedButton;
    timerTempoMensagem: TTimer;
    btEncerrarVenda: TJvTransparentButton;
    SpeedButton5: TJvTransparentButton;
    Panel11: TPanel;
    img_estado_cartao: TImage;
    pnConsultaFormas: TPanel;
    pnTxServico: TPanel;
    Panel12: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Panel6: TPanel;
    ed_valor_tx_serv: TCurrencyEdit;
    Panel13: TPanel;
    Label24: TLabel;
    Panel14: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Memo5: TMemo;
    Memo6: TMemo;
    Edit2: TEdit;
    Memo7: TMemo;
    LBTIPO: TLabel;
    bt_pesquisa_forma: TSpeedButton;
    botaoClickForma: TSpeedButton;
    btForma001: TJvImgBtn;
    btForma002: TJvImgBtn;
    btForma003: TJvImgBtn;
    btForma004: TJvImgBtn;
    btForma005: TJvImgBtn;
    btForma006: TJvImgBtn;
    btForma007: TJvImgBtn;
    btForma008: TJvImgBtn;
    btForma009: TJvImgBtn;
    btForma010: TJvImgBtn;
    btForma011: TJvImgBtn;
    btForma012: TJvImgBtn;
    btForma013: TJvImgBtn;
    btForma014: TJvImgBtn;
    btForma015: TJvImgBtn;
    btForma016: TJvImgBtn;
    btForma017: TJvImgBtn;
    btForma018: TJvImgBtn;
    btForma019: TJvImgBtn;
    btForma020: TJvImgBtn;
    btCalculadora: TSpeedButton;
    Panel1: TPanel;
    lbTitMesa: TLabel;
    lb_mesa: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    lbTituloMensagem: TPanel;
    Memo9: TMemo;
    pnMensagensErro: TPanel;
    ActivityIndicator: TdxActivityIndicator;
    imgPainelErro: TImage;
    Label16: TLabel;
    lbTempoMensagem: TLabel;
    lbMensagemErro: TMemo;
    tbFormasPagamentoTempNSU: TStringField;
    tbFormasPagamentoTemprede: TStringField;
    tbFormasPagamentoTemptipoOperacao: TStringField;
    tbFormasPagamentoTempAutorizacaoTEF: TStringField;
    procedure adicionar_pagamento(codCliente : string; obs: string; cod_forma : string; descricao_forma: string; valor : string);
    procedure calcula_valores(Sender: TObject; recalculaServico : boolean);

    function  gravar_venda : boolean;
    function terminaEncerramentoDaMesa() : boolean;

    procedure MakeRounded(Control: TWinControl);

    procedure  on_exit(Sender: TObject);
    procedure FinalizarVenda;

    procedure busca_movimento_da_mesa;
    procedure FormActivate(Sender: TObject);
    procedure ed_valor_tx_servEnter(Sender: TObject);
    procedure bt_adicionarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function emitir_comprovante(codVenda : string) : boolean;
    function verificaValidade(): boolean;

    procedure busca_recebimentos_parciais;
    procedure bt_pesquisa_formaClick(Sender: TObject);
    procedure verifica_tipo_caixa;
    procedure cbk_taxaClick(Sender: TObject);
    procedure ckb_descontoClick(Sender: TObject);
    procedure ckb_couvertClick(Sender: TObject);
    function verificaImpressoraFiscal () : boolean;
    procedure bt_imprimir_cupomKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    function  imp_FormasPagtoComprovante(marca : integer; modelo : integer) : boolean;
    function verificaSeTemMovimento() : boolean;
    function verificaValidadeFaturamento() : boolean;


    procedure bt_confirma_faturaClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);

    function  verificaValidadeForma(cod_forma : string) : boolean;

    procedure registraFormaPagto(cod_forma : string ; descricao_forma : string; valor : string);

    function verificaPossibilidadeDeTroco( troco : double) : Double;
    procedure ed_valor_formaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

   function  registraItensCupomFiscal() : boolean;

   function   emitirCupomSATCFE() : boolean;

   function  emitirNFCE(NumNFe: String ) : boolean;
   function  emitirNFE() : boolean;
   function  registraItensNFCE(mesa : string) : boolean;
   function  terminaEmissaoDoCupomFiscal() : boolean;
   function  verificaPossibilidadeCancelarVenda () : Boolean;



   function registraPagamentoCupomFiscal(codigoForma : string; valorForma : double ; observacao : string) : Boolean;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure btCalculadoraClick(Sender: TObject);
    procedure btDescontoClick(Sender: TObject);
    procedure btIdClienteClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure iniciarEncerramentoDaConta();
    procedure ed_valor_tx_servChange(Sender: TObject);
    procedure ed_valor_tx_servExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btMenuFiscalClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure timerTempoMensagemTimer(Sender: TObject);
    procedure btIniciaEmissaoCupomClick(Sender: TObject);
    procedure btEncerrarVendaClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure botaoClickFormaClick(Sender: TObject);


  private
    { Private declarations }
    retornoForma : boolean;
    valorForma : double;
    obsRodapeCupomFiscal  : string;
    codDiverso  : string;
    codigo_venda : string;
    codigoPedidoDelivery : string;
    podeFecharFormulario : boolean;
    transacaoTEFIniciada : boolean;
    codClienteNFE55 : string;
    nomeClienteNFE55 : string;
    tempoEmissaoNota : smallint;
    modeloComprovanteFiscal : integer;

    procedure registraFormaPagtoTEF(cod_forma, descricao_forma, valor, NSU,
      rede, tipoOperacao, autorizacaoTEF: string);







  public

    veioDoCheckin : boolean;
    codClienteFaturado : string;
    observacaoFaturamento : string;

    { Public declarations }
    procedure setMensagemOperador(mensagem: string);
    procedure exibirMensagemPainelInformacoes(titulo: string; mensagem : string ; tempo : smallint; tipoMensagem : smallint; progresso : boolean);
    procedure SetMensagemPainelInformacoes(titulo: string; mensagem : string ; tempo : smallint; tipoMensagem : smallint; progresso : boolean);
    procedure fecharPainelInformacoes;


    function  getMensagemOperador: string;
    function  gettotalVenda: double;
    function  getTotalPago: double;


    procedure exibirMensagemInformacao(mensagem : string; tempo : Integer; fonte : Integer; urgencia : Boolean);
    procedure limpaMesadelivery();
    procedure setRetornoForma(ret : boolean);
    function  getRetornoForma() : boolean;
    function  getValorFormaPagamento() : double;
    procedure setCodPedidoDelivery(codPedido : string);
    function  getCodPedidoDelivery() : string;


  end;


const
  Estados : array[TACBrECFEstado] of string =
    ('Não Inicializada', 'Desconhecido', 'Livre', 'Venda',
    'Pagamento', 'Relatório', 'Bloqueada', 'Requer Z', 'Requer X', 'Nao Fiscal' );

var
  frm_encerramento: Tfrm_encerramento;
  tx_serv : double;
  valor_tx_serv : double;
  valor_desconto : double;
  total_couvert : double;
  impressora_fiscal : integer;
  total_descontos : double;
  jaChamouActivate : Boolean;
  dataMovimentoEcf : string;
  HoraEcf          : string;
  codPedidoBalcao : string;





implementation

uses uu_data_module, uu_frm_principal, 
  uu_cs_formas_pagto, uu_pagamento_faturado, 
  uuIdentificaClienteECF, uuDesconto, uuPainelAguarde, uu_confirma_extrato,
  uuMenuFiscal, Math, ACBrNFeWebServices, uuEmissaoNFEEncerramento;

{$R *.dfm}

procedure Tfrm_encerramento.on_exit(Sender: TObject);
var
 trocoNecessario : double;
 trocopossivel : double;

 statusTransacaoTEF : boolean;
 numeroTransacao : smallint;
 operacaoTEF : string;

begin

 statusTransacaoTEF := false;


 if sender is TCustomEdit then
   begin

      (sender as TCustomEdit).Brush.Color := clWhite;
      (sender as TCustomEdit).Repaint;
   end;

   if sender is TCheckBox then
   begin
     (sender as TCheckBox).Color:=clBtnFace;
   end;



   if  ( (sender is Tedit and ((sender as Tedit).Name='ed_valor_desconto')) and (trim(ed_valor_desconto.text)<>'')) then
   begin
     IF trim(ed_valor_desconto.Text ) = '' then
        ed_valor_desconto.Text:='0,00';

     try
       ed_valor_desconto.Text:=FormatFloat('#0.00',StrToFloat(ed_valor_desconto.Text));
     except
      begin
        ShowMessage('Valor de desconto inválido!');
        ed_valor_desconto.Text:='0,00';
        ed_valor_desconto.SetFocus;
        exit;
      end;
     end;
     calcula_valores(sender,true);
   end;


   if  ( (sender is Tedit and ((sender as Tedit).Name='ed_codigo_forma')) and (trim(ed_codigo_forma.text)<>'')) then
   begin
      if trim(ed_codigo_forma.Text) = '' then exit;

     try
       ed_codigo_forma.Text:=FormatFloat('000',StrToFloat(ed_codigo_forma.text))
     except
       begin
         ShowMessage('Código de forma de pagamento inválido!');
         ed_codigo_forma.Clear;
         ed_codigo_forma.SetFocus;
         exit;
       end;
     end;

     dm.qryauxiliar.Active:=false;
     dm.qryauxiliar.sql.clear;
     dm.qryauxiliar.sql.add('select * from formas_pagamento where cod_forma='+quotedstr(ed_codigo_forma.Text));
     dm.qryauxiliar.Active:=true;

     if dm.qryauxiliar.IsEmpty then
     begin
       ShowMessage('Forma de Pagamento não cadastrada!');
//       ed_descricao_forma.clear;
       ed_codigo_forma.clear;
       ed_codigo_forma.SetFocus;
       Exit;
     end;

//     ed_descricao_forma.Text:=dm.qryauxiliar.fieldbyname('descricao').value;

   end;







   if  ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_valor_forma')) ) then
    begin
     if (trim(ed_valor_forma.Text) = '') then Exit;
     if (ed_codigo_forma.Text = '') then exit;

     try
      StrToFloat(ed_valor_forma.text)
     except
      begin
        exibe_painel_erro('Valor de pagamento inválido!','OK');
        ed_valor_forma.Clear;
        ed_valor_forma.SetFocus;
        exit;
      end;
     end;

     if (StrToFloat(ed_valor_forma.text) <= 0) then
      begin
        exibe_painel_erro('Valor de pagamento inválido!','OK');
        ed_valor_forma.Clear;
        ed_valor_forma.SetFocus;
        exit;

      end;
    trocoNecessario :=0;
     trocopossivel := 0;
     
     valorForma := StrToFloat(ed_valor_forma.text);

    if ( getPermissaoDeTroco(ed_codigo_forma.Text  ) = true) then
       trocopossivel := valorForma;


     trocopossivel := verificaPossibilidadeDeTroco(0) + trocopossivel;
     trocoNecessario := trunc( (ed_total_pago.value + StrToCurr(ed_valor_forma.text)) - ed_total_conta.Value);

     if ( trocopossivel < trocoNecessario  ) then
      begin
        exibe_painel_erro('Não há troco disponível em dinheiro informado para concluir esta operação.'+#13+
                            'O sistema não pode aceitar soma de  valores em cartões ou formas que não são possíveis de troco que ultrapassem o total da conta!'+#13#10+
                             'Excedente: R$'+FormatFloat('#0.00',trocoNecessario),'');

        ed_codigo_forma.Clear;
        ed_valor_forma.Clear;
        ed_codigo_forma.SetFocus;
        Exit;



      end;


     dm.setTipoOperacaoTEF( getTipoTEFFormaPagato(ed_codigo_forma.Text));
     if ( dm.getTipoOperacaoTEF  > 0 )  then // Se for operação de TEF
       begin

             if (dm.TEFautenticou = true) then
              begin
                statusTransacaoTEF := dm.ACBrTEFD1.CRT( StringToFloatDef(ed_valor_forma.text, 0) ,
                                      Inttostr(tbFormasPagamentoTemp.RecordCount+1) ,
                                      '');


                if statusTransacaoTEF  then
                  begin
                    transacaoTEFIniciada :=true;
//                    podeFecharFormulario := false;

                    numeroTransacao := dm.getNumeroTransacaoTef;
                    inc(numeroTransacao);
                    dm.setNumeroTransacaoTef(numeroTransacao);

                    if dm.ACBrTEFD1.RespostasPendentes[numeroTransacao].Credito then
                      operacaoTEF := 'CREDITO'
                    ELSE
                      IF dm.ACBrTEFD1.RespostasPendentes[numeroTransacao].Debito then
                        operacaoTEF := 'DEBITO'
                      ELSE
                         operacaoTEF := 'OUTROS';


                    dm.adicionaLog(
                                  'Pagamento [Cartao:' + ed_valor_forma.text +sLineBreak+
                                  'NSU:'+dm.ACBrTEFD1.RespostasPendentes[numeroTransacao ].NSU +sLineBreak+
                                  'Rede:'+dm.ACBrTEFD1.RespostasPendentes[numeroTransacao].Rede+sLineBreak+
                                  'Autorização:'+dm.ACBrTEFD1.RespostasPendentes[numeroTransacao].CodigoAutorizacaoTransacao
                                  );



                   //dm.exibe_painel_erro('TRANSAÇÃO APROVADA!','Ok');


                   registraFormaPagtoTEF(ed_codigo_forma.Text,
                                      getDescricaoFormaPagamento(ed_codigo_forma.Text)  ,
                                      FormatFloat('#0.00',StrToFloat(ed_valor_forma.text)),
                                      dm.ACBrTEFD1.RespostasPendentes[numeroTransacao ].NSU,
                                      dm.ACBrTEFD1.RespostasPendentes[numeroTransacao].Rede,
                                      operacaoTEF,
                                      dm.ACBrTEFD1.RespostasPendentes[numeroTransacao].CodigoAutorizacaoTransacao
                                      );

                  end
                ELSE
                 BEGIN
                   // dm.exibe_painel_erro('TRANSAÇÃO RECUSADA!','Ok');
                 END;

              end
             else
               begin
                 EXIT;
               end;


       end

      else
       begin
        registraFormaPagto(ed_codigo_forma.Text,getDescricaoFormaPagamento(ed_codigo_forma.Text)  ,FormatFloat('#0.00',StrToFloat(ed_valor_forma.text) ));
       end;
    end






end;


function Tfrm_encerramento.verificaValidadeForma(cod_forma : string) : boolean;
begin
     try
       cod_forma:=FormatFloat('00',StrToFloat(cod_forma))
     except
       begin
         ShowMessage('Código de forma de pagamento inválido!');
         ed_codigo_forma.Clear;
         ed_codigo_forma.SetFocus;
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


function Tfrm_encerramento.gettotalVenda() : double;
begin
  result := ed_total_conta.Value;
end;


function Tfrm_encerramento.getTotalPago() : double;
begin
  Result := ed_total_pago.Value;
end;


procedure Tfrm_encerramento.adicionar_pagamento(codCliente : string; obs: string; cod_forma : string; descricao_forma: string; valor : string);
var
 q : TIBQuery;
 rp : string;
 obsPagamento : string;
begin


 rp := getCodigoRegistradorFormaPagamento(cod_forma);
 if codCliente <> '' then
   obsPagamento := 'Faturado para o cliente: '+codCliente;



  if ( (tipo_comprovante = 1)  ) then
   begin
     case modeloComprovanteFiscal of   //StrToInt(dm.LeIni(2,'ENCERRAMENTO','modeloComprovantefiscal')) of
      1:
        begin
          if   registraPagamentoCupomFiscal(rp,StrToFloat(valor),obsPagamento) = false then
           begin
            Exit;
           end;
        end;

      2: begin

         end;
     end;
   end;


  if (  (trim(cod_forma) ='001')  and   (tbFormasPagamentoTemp.Locate('codForma','001',[loPartialKey]) ) ) then
   begin
    tbFormasPagamentoTemp.Edit;
    tbFormasPagamentoTempvalorForma.Value := tbFormasPagamentoTempvalorForma.Value + StrToFloat(valor);
    tbFormasPagamentoTemp.Post;
   end
  else
   begin
    tbFormasPagamentoTemp.Append;
    tbFormasPagamentoTempcodForma.Value:=cod_forma;
    tbFormasPagamentoTempdescricaoForma.value:= descricao_forma;
    tbFormasPagamentoTempvalorForma.value := StrToFloat(valor);
    tbFormasPagamentoTempCodCliFaturado.Value := codCliente;
    tbFormasPagamentoTempobservacoesFaturado.Value  := obs;
    tbFormasPagamentoTemprp.Value :=rp;
    tbFormasPagamentoTempNSU.Value  :='';
    tbFormasPagamentoTemprede.Value := '';
    tbFormasPagamentoTempAutorizacaoTEF.Value := '';
    tbFormasPagamentoTemptipoOperacao.Value := '';
    tbFormasPagamentoTemp.Post;
   end;

   codClienteFaturado := '';
   observacaoFaturamento := '';

  ed_total_pago.Value:=StrToFloat(valor)+ed_total_pago.Value;
  ed_valor_troco.Value:=ed_total_pago.Value-ed_total_conta.value;


end;




procedure Tfrm_encerramento.registraFormaPagto(cod_forma : string ; descricao_forma : string; valor : string);
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
              if ( trim(lb_mesa.caption) <> trim(mesaDelivery) ) then
               begin
                 codClienteFaturado := '';
                 observacaoFaturamento := '';

                   // Registra Fatura  - Abre tela de consulta de clientes para informar o cliente
                 Application.CreateForm(Tfrm_pagamento_faturado,frm_pagamento_faturado);
                 frm_pagamento_faturado.localOrigem := 1;
                 frm_pagamento_faturado.ShowModal;
                 frm_pagamento_faturado.Free;

                 if (getRetornoForma() = true ) then
                  begin
                   adicionar_pagamento(codClienteFaturado,observacaoFaturamento ,cod_forma,descricao_forma, valor);

                  end
                 else
                  begin
                    codClienteFaturado := '';
                    observacaoFaturamento := '';
                    ed_codigo_forma.SetFocus;
                    ed_codigo_forma.clear;
                  end;
               end
              else
               begin

                adicionar_pagamento(codClienteFaturado,observacaoFaturamento,cod_forma,descricao_forma, valor);

               end;
           end;
       end;



     end
    else
     begin
       adicionar_pagamento('','',cod_forma,descricao_forma,valor);
     end;

    if ( (ed_total_pago.Value >= ed_total_conta.value)) then
     begin

          btEncerrarVenda.Click;
     end
    else
     begin
      ed_codigo_forma.clear;

      ed_codigo_forma.SetFocus;
      ed_valor_forma.text:= FormatFloat('#0.00',ed_total_conta.value-ed_total_pago.Value);
     end;


  end;
end;


procedure Tfrm_encerramento.registraFormaPagtoTEF(cod_forma : string ; descricao_forma : string; valor : string; NSU :string; rede : string; tipoOperacao : string; autorizacaoTEF : string );
begin
    tbFormasPagamentoTemp.Append;
    tbFormasPagamentoTempcodForma.Value:=cod_forma;
    tbFormasPagamentoTempdescricaoForma.value:= descricao_forma;
    tbFormasPagamentoTempvalorForma.value := StrToFloat(valor);
    tbFormasPagamentoTempCodCliFaturado.Value := '';
    tbFormasPagamentoTempobservacoesFaturado.Value  := '';
    tbFormasPagamentoTemprp.Value :='';
    tbFormasPagamentoTempNSU.Value := NSU;
    tbFormasPagamentoTemprede.Value := rede;
    tbFormasPagamentoTemptipoOperacao.Value := tipoOperacao;
    tbFormasPagamentoTempAutorizacaoTEF.Value := autorizacaoTEF ;
    tbFormasPagamentoTemp.Post;


   codClienteFaturado := '';
   observacaoFaturamento := '';

   ed_total_pago.Value:=StrToFloat(valor)+ed_total_pago.Value;
   ed_valor_troco.Value:=ed_total_pago.Value-ed_total_conta.value;


    if ( (ed_total_pago.Value >= ed_total_conta.value)) then
     begin

          if verificaValidade  then
            FinalizarVenda();
     end
    else
     begin
      ed_codigo_forma.clear;

      ed_codigo_forma.SetFocus;
      ed_valor_forma.text:= FormatFloat('#0.00',ed_total_conta.value-ed_total_pago.Value);
     end;



end;


procedure Tfrm_encerramento.calcula_valores(Sender: TObject; recalculaServico : boolean);
begin

  valor_desconto:=total_descontos;
  valor_tx_serv:=0;
  valor_tx_serv:=ed_valor_tx_serv.Value;

  ed_total_tx_serv.Value:=valor_tx_serv;

   valor_desconto:=StrToFloat(ed_valor_desconto.Text) ;

   if ckb_desconto.Checked= true then
         ed_total_desconto.Value:= (valor_desconto * ed_valor_bruto.value) / 100
   else
         ed_total_desconto.value:=valor_desconto;


   ed_total_desconto.value := ed_total_desconto.value +total_descontos;


   if ed_total_pago.value < ed_total_conta.value then
    ed_valor_forma.text := FormatFloat('#0.00', ed_total_conta.Value - ed_total_pago.Value)
   else
    begin
      ed_valor_forma.text :=FormatFloat('#0.00',0);
    end;




  if  ( (sender is TCustomEdit and ((sender as TCustomEdit).Name = 'ed_valor_tx_serv'))  ) then
   begin
     if (    (mesaBalcao= trim(lb_mesa.Caption))  or (mesaDelivery = trim(lb_mesa.caption)))  then // Se for balcão ou delivery, zera taxa de serviço
       begin
           ed_total_tx_serv.value:=0;
       end

     else   // Se for consumo regular...
       begin

        if (ed_valor_tx_serv.Value  <= 0 ) then
          begin
            ed_total_tx_serv.Value := 0;
          end
        else
         begin

         end;
         end;



   end;





   ed_total_conta.Value:=(ed_valor_bruto.value+ed_total_tx_serv.value+0+0+ed_total_entrega.value)  - ed_total_desconto.Value;
   ed_valor_troco.Value := ed_total_pago.Value - ed_total_conta.Value;
end;


function Tfrm_encerramento.terminaEmissaoDoCupomFiscal() : boolean;
var
 q                : TIBQuery;
 valorImpostosIBPT : double;
begin
 Result := false;
 q := TIBQuery.Create(self);
 q.Database := dm.dbrestaurante;
 q.Transaction := dm.transacao;
 q.Active:=false;
 q.sql.clear;
 obsRodapeCupomFiscal :='';
 frm_principal.ecf.InfoRodapeCupom.Restaurante.Imprimir := false;


  if ( (lb_mesa.Caption <> mesaDelivery) and (lb_mesa.Caption <> mesaBalcao) )   then
    begin
      q.Active :=false;
      q.SQL.clear;
      q.sql.add('select hora_emissao,cooextrato,cerextrato,ecf_extrato from extratos_emitidos where mesa='+Quotedstr(lb_mesa.Caption));
      q.Active:=true;

      if (q.IsEmpty = false) then
       begin

         if ( trim (q.fieldbyname('ecf_extrato').Value) = '') then
          begin

           obsRodapeCupomFiscal := 'Consumo da mesa: '+lb_mesa.Caption+'  - SEM EMISSÃO DE CONFERÊNCIA DE MESA'+#10;

          end
         else
          begin
            frm_principal.ecf.InfoRodapeCupom.Restaurante.Imprimir := True;
            frm_principal.ecf.InfoRodapeCupom.Restaurante.ECF      := StrToInt(q.fieldbyname('ecf_extrato').Value);
            frm_principal.ecf.InfoRodapeCupom.Restaurante.COO      := StrToInt(q.fieldbyname('COOEXTRATO').Value);
            frm_principal.ecf.InfoRodapeCupom.Restaurante.CER      := StrToInt(q.fieldbyname('CEREXTRATO').Value);
            frm_principal.ecf.InfoRodapeCupom.Restaurante.Mesa     := lb_mesa.Caption;


          end;
       end
      else
       begin

           obsRodapeCupomFiscal := 'Consumo da mesa: '+lb_mesa.Caption+'  - SEM EMISSÃO DE CONFERÊNCIA DE MESA'+#10;
       end
    end


  else
    begin
      if (lb_mesa.Caption  = mesaBalcao) then
        begin
          codPedidoBalcao := dm.geraCodigo('G_PEDIDOS_BALCAO',4);
          obsRodapeCupomFiscal:= 'PEDIDO BALCAO Nº: '+codPedidoBalcao  +#13#10;
        end;
    end;

    valorImpostosIBPT := (ed_total_conta.value * aliquotaIBPT  ) / 100;
    obsRodapeCupomFiscal := 'Valor aprox. dos tributos ('+FormatFloat('#0.00',aliquotaIBPT)+') = '+FormatFloat('R$ #0.00',valorImpostosIBPT)+' fonte: IBPT'+#13#10 +obsRodapeCupomFiscal;



    try
      frm_principal.ECF.FechaCupom(obsRodapeCupomFiscal);
    except
     on E : Exception do
       begin
//        frmPainelAguarde.Close;
        exibe_painel_erro(E.Message,'Ok');
        Result := false;
        exit;
      end;
   end;



   Result := true;

   
end;


procedure Tfrm_encerramento.FinalizarVenda;
var
 emitido : boolean;
 total_linhas_memo,linha_atual : integer;
 TentaimprimirDanfeNovamente : boolean;
 segundosEnvioNFCE : smallint;

begin

  TentaimprimirDanfeNovamente := false;
  podeFecharFormulario := false;
  tipo_comprovante:=StrtoInt(dm.LeIni(1,'ENCERRAMENTO','tipo_comprovante'));


 if tipo_comprovante = 1 then
 begin
    If tipo_cupom = 2 then
     tipo_comprovante := 2
    else
     tipo_comprovante := 1;
 end;

  codPedidoBalcao:='';

  if ( (tipo_comprovante = 1) ) then
     begin



        case  modeloComprovanteFiscal of //StrToInt(dm.LeIni(2,'ENCERRAMENTO','modeloComprovantefiscal')) of
         1: begin  // se for cupom fiscal
              if (terminaEmissaoDoCupomFiscal  ) then
                begin
                  codigo_venda:= dm.geraCodigo('G_VENDAS',8);
                  gravar_venda;
                  terminaEncerramentoDaMesa();

                   btEncerrarVenda.Enabled := false;
                  if (StrtoInt(dm.LeIni(1,'ENCERRAMENTO','imprimirEncerramento'))=1) then
                   begin
                    if emitir_comprovante(codigo_venda) = true then
                     emitido:=true
                    else
                     emitido:=false;
                   end;


                  try
                    dm.imprimirPromissorias(marca_impressora_fiscal,codigo_venda);
                  except
                     dm.exibe_painel_erro('Erro ao imprimir promissórias!','Continuar');
                  end;


                  podeFecharFormulario := True;
                  Close;
                end
              else
               begin
                 exibirMensagemInformacao('ERRO AO ENCERRAR A CONTA',6000,15,true);
                 exit;
               end;
            end;

         2: begin  // se for NFCE

             if ( (ed_total_conta.Value > valorMaxNFCESemCPF)and ( trim(cpfClienteCupomFiscal) ='' ) ) then
              begin
               segundosEnvioNFCE := 3;
               exibirMensagemPainelInformacoes('Identifique o cliente!','',segundosEnvioNFCE,5,true);
               frm_encerramento.SetMensagemPainelInformacoes('Identifique o cliente!.',
                                      ' Notas com valores acima de '+Formatfloat('#0.00',valorMaxNFCESemCPF)+
                                      '´devem ter dados do cliente informados (CPF/ CNPJ).'
                                        ,segundosEnvioNFCE,5,true);


               while (segundosEnvioNFCE >=0 ) do
                begin

                   frm_encerramento.SetMensagemPainelInformacoes('Identifique o cliente!.',
                                      ' Notas com valores acima de '+Formatfloat('#0.00',valorMaxNFCESemCPF)+
                                      '´devem ter dados do cliente informados (CPF/ CNPJ).'
                                        ,segundosEnvioNFCE,5,true);
                   Sleep(1000);
                   Application.ProcessMessages();
                   segundosEnvioNFCE := segundosEnvioNFCE -1;
                end;
                fecharPainelInformacoes();
                close;
                exit;
              end;


             dm.parametrizaAcbrNFE(moNFCe,false,true);
              if (emitirNFCE('')   ) then
                begin
                  codigo_venda:= dm.geraCodigo('G_VENDAS',8);
                  gravar_venda;
                  terminaEncerramentoDaMesa();
                  btEncerrarVenda.Enabled := false;


                  if (StrtoInt(dm.LeIni(1,'ENCERRAMENTO','imprimirEncerramento'))=1) then
                   begin
                    try
                     begin
                      if emitir_comprovante(codigo_venda) = true then
                       emitido:=true
                      else
                       emitido:=false
                     end;
                    except
                      begin
                        emitido := true;
                      end;

                    end;
                   end;



                  //Imprime o Danfe



                  if ( StrToInt(dm.LeIni(2,'ENCERRAMENTO','perguntaImpressaoDanfe')) = 1 ) then
                   begin


                     if dm.painelDePergunta(#13#10+'DESEJA IMPRIMIR O DANFE ?'+#13#10+#13#10,25) then
                       begin
                        try
                          begin
                            dm.configuraImpressoraNFCE();
                            dm.ACBrPosPrinter1.LinhasEntreCupons := StrToInt(dm.LeIni(1,'IMPRESSORA_NFCE','linhasAposCupom'));
                            dm.ACBrNFe1.NotasFiscais[0].Imprimir;


                            if (StrToInt(dm.LeIni(2,'IMPRESSORA_NFCE','cortaPapel'))=1) then
                             begin
                              dm.ACBrPosPrinter1.CortarPapel(true);
                             end;

                            if (StrToInt(dm.LeIni(2,'GAVETA','instalada'))=1) then
                             begin
                               dm.ACBrPosPrinter1.AbrirGaveta;
                             end;

                            dm.ACBrPosPrinter1.Desativar;

                          end;
                        except
                           begin
                            dm.exibe_painel_erro('Erro ao comunicar com a impressora de NFC-e!','fechar');
                           end;
                        end;

                       end;
                    end
                  else
                   begin
                    try
                      begin                      
                        dm.configuraImpressoraNFCE();
                        dm.ACBrPosPrinter1.LinhasEntreCupons := StrToInt(dm.LeIni(1,'IMPRESSORA_NFCE','linhasAposCupom'));

                        dm.ACBrNFe1.NotasFiscais[0].Imprimir;
                        dm.ACBrPosPrinter1.PularLinhas(StrToInt(dm.LeIni(1,'IMPRESSORA_NFCE','linhasAposCupom')));
                        if (StrToInt(dm.LeIni(2,'IMPRESSORA_NFCE','cortaPapel'))=1) then
                         begin
                          dm.adicionaLog('Entrou na função de cortar o papel');
                          dm.ACBrPosPrinter1.CortarPapel(true);

                         end;

                        if (StrToInt(dm.LeIni(2,'GAVETA','instalada'))=1) then
                         begin
                           dm.ACBrPosPrinter1.AbrirGaveta;
                         end;
                        dm.ACBrPosPrinter1.Desativar;
                        

                      end;
                    except
                       begin
                        dm.exibe_painel_erro('Erro ao comunicar com a impressora de NFC-e!','fechar');

                       end;
                    end;


                   end;


                  if transacaoTEFIniciada   then
                   begin
                       setMensagemOperador('Imprimindo Transações/Comprovante TEF');
                      //dm.ACBrTEFD1.ConfirmarTransacoesPendentes()
                     try
                       dm.ACBrTEFD1.ImprimirTransacoesPendentes;
                       dm.adicionaLog('Imprimiu os comprovantes de TEF');
                     except
                      dm.adicionaLog('Ocorreu erro ao imprimir os comprovantes de TEF');

                     end;
//                      dm.setEstadoSimuladoECF(tpsLivre);
                   end;

                  try                                                       
                   dm.imprimirPromissorias(marca_impressora_fiscal,codigo_venda);
                  except
                    dm.adicionaLog('Erro ao imprimir promissórias');
                  end;

                  podeFecharFormulario := True;
                  Close;
                end
              else
               begin
                 exibirMensagemInformacao('ERRO AO ENCERRAR A CONTA',6000,15,true);
                 dm.transacao.Commit;
                 dm.transacao.Active := false;
                 dm.transacao.Active := true;
                 exit;
               end;
          end;


         3: begin  // se for NF-E MODELO 55
              dm.parametrizaAcbrNFE(moNFe,false,true);
              if (emitirNFE () = true) then
                begin


                  codigo_venda:= dm.geraCodigo('G_VENDAS',8);
                  gravar_venda;
                  terminaEncerramentoDaMesa();
                   btEncerrarVenda.Enabled := false;
                  //Imprime o Danfe
                  try
                   begin


                      if ( StrToInt(dm.LeIni(2,'ENCERRAMENTO','perguntaImpressaoDanfe')) = 1 ) then
                       begin


                         if dm.painelDePergunta(#13#10+'DESEJA IMPRIMIR O DANFE ?'+#13#10+#13#10,25) then
                           begin
//                            dm.configuraImpressoraNFCE();
                            dm.ACBrPosPrinter1.LinhasEntreCupons := StrToInt(dm.LeIni(1,'IMPRESSORA_NFCE','linhasAposCupom'));
                            dm.ACBrNFe1.NotasFiscais[0].Imprimir;
  //                          dm.ACBrPosPrinter1.CortarPapel(true);
                           end;
                        end
                      else
                       begin
                        dm.ACBrNFe1.NotasFiscais[0].Imprimir;
                       end;


//                      dm.ACBrPosPrinter1.AbrirGaveta;
  //                    dm.ACBrPosPrinter1.Desativar;
                    end;

                  except
                    begin
                      dm.exibe_painel_erro('Erro ao Imprimir o DANFE. Verifique os cabos da impressora e tente novamente.','Ok');


                        while ( dm.painelDePergunta(#13#10+'Tentar imprimir novamente',20)  = true) do
                         begin

                          try
                            begin
                              dm.ACBrNFe1.NotasFiscais[0].Imprimir;
                            end;
                           except
                            begin
                              dm.exibe_painel_erro('Erro ao Imprimir o DANFE. Verifique os cabos da impressora e tente novamente.','Ok');
                            end;
                           end;


                         end
                    end;
                  end;

                  if (StrtoInt(dm.LeIni(1,'ENCERRAMENTO','imprimirEncerramento'))=1) then
                   begin
                    if emitir_comprovante(codigo_venda) = true then
                     emitido:=true
                    else
                     emitido:=false;
                   end;


                  dm.imprimirPromissorias(marca_impressora_fiscal,codigo_venda);
                  podeFecharFormulario := True;
                  Close;
                end
              else
               begin
                 exibirMensagemInformacao('ERRO AO ENCERRAR A CONTA',6000,15,true);
                 dm.transacao.Commit;
                 dm.transacao.Active := false;
                 dm.transacao.Active := true;
                 exit;
               end;
          end;


         4: begin  // se for SAT
             dm.parametrizaAcbrNFE(moNFCe,false,true);
             dm.configuraImpressoraNFCE();
              if (emitirCupomSATCFE() = true) then
                begin


                  codigo_venda:= dm.geraCodigo('G_VENDAS',8);
                  gravar_venda;
                  terminaEncerramentoDaMesa();
                  btEncerrarVenda.Enabled := false;
                  //Imprime o Danfe
                  try
                   begin


                      if ( StrToInt(dm.LeIni(2,'ENCERRAMENTO','perguntaImpressaoDanfe')) = 1 ) then
                       begin


                         if dm.painelDePergunta(#13#10+'DESEJA IMPRIMIR O DANFE ?'+#13#10+#13#10,25) then
                           begin
                             dm.sat.ImprimirExtrato();
                           end;
                        end
                      else
                       begin
                        dm.sat.ImprimirExtrato();
                       end;

                      dm.ACBrPosPrinter1.CortarPapel(true);
                      dm.ACBrPosPrinter1.AbrirGaveta;
                      dm.ACBrPosPrinter1.Desativar;
                    end;

                  except
                    begin
                      dm.exibe_painel_erro('Erro ao Imprimir Extrato do SAT. Verifique os cabos da impressora e tente novamente.','Ok');


                        while ( dm.painelDePergunta(#13#10+'Tentar imprimir novamente',20)  = true) do
                         begin

                          try
                            begin
                             dm.ACBrPosPrinter1.CortarPapel(true);
                             dm.ACBrPosPrinter1.AbrirGaveta;
                             dm.ACBrPosPrinter1.Desativar;
                            end;
                           except
                            begin
                              dm.exibe_painel_erro('Erro ao Imprimir o DANFE. Verifique os cabos da impressora e tente novamente.','Ok');
                            end;
                           end;


                         end
                    end;
                  end;

                  if (StrtoInt(dm.LeIni(1,'ENCERRAMENTO','imprimirEncerramento'))=1) then
                   begin
                    if emitir_comprovante(codigo_venda) = true then
                     emitido:=true
                    else
                     emitido:=false;
                   end;


                  dm.imprimirPromissorias(marca_impressora_fiscal,codigo_venda);
                  podeFecharFormulario := True;
                  Close;
                end
              else
               begin
                 exibirMensagemInformacao('ERRO AO ENCERRAR A CONTA',6000,15,true);
                 dm.transacao.Commit;
                 dm.transacao.Active := false;
                 dm.transacao.Active := true;
                 exit;
               end;
          end


        end;

        if transacaoTEFIniciada then
         begin
//          ConfirmaOperacaoTEFCappta();
         end;

     end
  else
   begin

    if (lb_mesa.Caption  = mesaBalcao) then
      begin
        codPedidoBalcao := dm.geraCodigo('G_PEDIDOS_BALCAO',4);
        obsRodapeCupomFiscal:= 'PEDIDO BALCAO Nº: '+codPedidoBalcao  +#13#10;
      end;


      codigo_venda:=dm.geraCodigo('G_VENDAS',8);
      gravar_venda;


      if (StrtoInt(dm.LeIni(1,'ENCERRAMENTO','imprimirEncerramento'))=1) then
       begin
          if emitir_comprovante(codigo_venda) = true then
           emitido:=true
          else
           emitido:=false;
       end
      else
       begin
         emitido :=true;
       end;
       dm.imprimirPromissorias(marca_impressora_nao_fiscal_01 ,codigo_venda);

       terminaEncerramentoDaMesa();
   end;




  if (tipo_comprovante =1) then
   begin
     case modeloComprovanteFiscal of  //StrToInt(dm.LeIni(2,'ENCERRAMENTO','modeloComprovantefiscal')) of
       2: dm.apagaNotaCarregadaACBRdaTabelaDeErros();
       3: dm.apagaNotaCarregadaACBRdaTabelaDeErros();
     end;
   end;






  if (lb_mesa.Caption  = mesaBalcao) then
   begin
    dm.imprimirFichas(codigo_venda);

   end;



  if (ed_valor_troco.Value > 0) then
  begin
   frm_principal.escreveExtenso.Valor:= ed_valor_troco.VALUE;
   dm.exibe_painel_troco('TROCO A REPASSAR '+#13#10+#13#10+StrUpper(pchar(frm_principal.escreveExtenso.Texto)),FormatFloat('R$ ###,###,##0.00',ed_valor_troco.Value)  );
  end;



    if (dm.verificaMesaBalcao(lb_mesa.caption) = true ) then
    begin
       dm.ImprimeFilaDeImpressao(false,codPedidoBalcao, 1);
    end;


 if (StrToInt(dm.LeIni(1,'GAVETA','instalada')) = 1) then
  begin
    try
      dm.AbreGaveta(1,1);
    except
      dm.exibe_painel_erro('Erro ao abrir a gaveta!','Ok');

    end;
 end;
 podeFecharFormulario := true;
 transacaoTEFIniciada := false;


  close;
end;






function Tfrm_encerramento.gravar_venda : boolean;
var
 modeloComprovante : smallint;
 chave_nfce     : string;
 numeroNFCE     : integer;
 serieNFCE      : integer;
 protocoloNFCE  : string;
 sessaoSAT   : integer;
 CnfSAT      : integer;
 ccf_cupom : string;
 coo_cupom : string;
 total_baixa  : double;
 codClienteVenda : string;
 quantidade_atual : double;
 linha_atual,total_linhas_memo : integer;
 iconta : smallint;
 valor_recebido : double;
 percentual_desconto : double;
 tipoVenda : Smallint;
 ctRegistro : integer;
 nPessoas : string;
 acresimoItem : real;
 descontoItem : real;
 numeroReducaoZ : integer;
 codAlteracaoDelivery : string;
 codPedidoDelivery : string;
 pagamentos : string;
 XMLDocumentoFiscal : WideString;
 reciboNFCE : string;
 idRecebimento : Largeint;
 idChaveMovimentoVenda : LargeInt;


begin
     ccf_cupom  := '0';
     coo_cupom  := '0';
     chave_nfce :='0';
     numeroNFCE := 0;
     serieNFCE := 0;
     protocoloNFCE :='00000';
     sessaoSAT :=0;
     CnfSAT :=0;
     codPedidoDelivery := '';




  if ( (tipo_comprovante = 1)) then
   begin
     case modeloComprovanteFiscal of //StrToInt(dm.LeIni(2,'ENCERRAMENTO','modeloComprovantefiscal')) of
      1:
        begin
         ccf_cupom      := frm_principal.ECF.NumCCF;
         coo_cupom      := frm_principal.ECF.NumCOO;
         num_serie_ecf  := frm_principal.ECF.NumSerie;
         numeroECFEmUso := getNumeroECFEmUso(num_serie_ecf);
         numeroReducaoZ := StrToInt(frm_principal.ecf.NumCRZ);
         numeroReducaoZ := numeroReducaoZ + 1;
         chave_nfce :='0';
         reciboNFCE :='0';
         numeroNFCE := 0;
         serieNFCE := 0;
         protocoloNFCE :='00000';
         modeloComprovante := 1;
         codClienteVenda := '';


        end;
      2:
        begin
         ccf_cupom  := '0';
         coo_cupom  := '0';
         num_serie_ecf :='0';
         dataMovimentoEcf := FormatDateTime('DD.MM.YYY',date);
         numeroReducaoZ :=0;
         HoraEcf := FormatDateTime('HH:MM:SS',time);
         chave_nfce := copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60);
         numeroNFCE :=    dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF;
         serieNFCE  :=    dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie;
         protocoloNFCE := dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt ;
         reciboNFCE :='0';
         codClienteVenda := '';

         //         dm.ACBrNFe1.NotasFiscais[0].GravarStream(XMLDocumentoFiscal);

         XMLDocumentoFiscal := dm.ACBrNFe1.NotasFiscais[0].XML;


         modeloComprovante := 2;
        end;

      3:
        begin
         ccf_cupom  := '0';
         coo_cupom  := '0';
         num_serie_ecf :='0';
         dataMovimentoEcf := FormatDateTime('DD.MM.YYY',date);
         numeroReducaoZ :=0;
         HoraEcf := FormatDateTime('HH:MM:SS',time);
         chave_nfce := copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60);
         numeroNFCE :=    dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF;
         serieNFCE  :=    dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie;
         protocoloNFCE := dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt;
         reciboNFCE :='0';
         XMLDocumentoFiscal := dm.ACBrNFe1.NotasFiscais[0].XML;
         modeloComprovante := 3;
         codClienteVenda := codClienteNFE55;
         nomeClienteCupom := nomeClienteNFE55;
        end;

      4:
        begin
         ccf_cupom  := '0';
         coo_cupom  := '0';
         reciboNFCE :='0';
         dataMovimentoEcf := FormatDateTime('DD.MM.YYY',date);
         num_serie_ecf  := Inttostr(dm.sat.CFe.ide.nserieSAT);
         numeroReducaoZ :=0;
         HoraEcf := FormatDateTime('HH:MM:SS',time);
         chave_nfce := dm.sat.CFe.infCFe.ID;
         numeroNFCE :=   dm.sat.CFe.ide.nCFe;
         serieNFCE  := dm.getSerieNFCE();
         sessaoSAT := dm.sat.numeroSessao;
         CnfSAT   := dm.sat.cfe.ide.cNF;
         XMLDocumentoFiscal :=dm.sat.CFe.AsXMLString;
         modeloComprovante := 4;
        end;


     end;

   end
  else
    begin
     ccf_cupom  := '0';
     coo_cupom  := '0';
     chave_nfce :='0';
     num_serie_ecf:='0';
     numeroNFCE := 0;
     serieNFCE := 0;
     protocoloNFCE :='00000';
     reciboNFCE :='0';
     dataMovimentoEcf := FormatDateTime('DD.MM.YYY',date);
     HoraEcf := FormatDateTime('HH:MM:SS',time);
     numeroReducaoZ :=0;
     modeloComprovante := 0;
    end;

  if( (lb_mesa.caption = mesaBalcao) or (lb_mesa.Caption = mesaDelivery)) then
   begin
        // Guardando o tipo da venda
     if (lb_mesa.caption = mesaDelivery) then
       tipoVenda:=3   // Venda delivery
     else
       tipoVenda:=2   // Venda Balcão
   end
  else
    begin
     tipoVenda :=1;
    end;

  percentual_desconto:=0;
  nPessoas :='0';


   if  ( (lb_mesa.Caption <> mesaDelivery) and (lb_mesa.Caption <> mesaBalcao ) ) then
    begin
     nPessoas := Inttostr(getQtdePessoasMesa(lb_mesa.Caption));
    end;

   if ( tipoVenda = 3 ) then
      codPedidoDelivery := getCodPedidoDelivery
    else
      codPedidoDelivery := '';

   dmVEndas.qryVendas.Active := true;
   dmVendas.qryVendas.Append;
   dmVendas.qryVendasCOD_EMPRESA.Value          := codEmpresa;
   dmVendas.qryVendasIMP.Value := 0;
   dmVendas.qryVendasCOD_GARCON_ABRIU.Value     := dm.getCodGarconAbriuMesa(lb_mesa.Caption);
   dmVendas.qryVendasCOD_VENDA.Value            := codigo_venda;
   dmVendas.qryVendasDATA.Value                 := data_do_sistema;
   dmVendas.qryVendasDATA_SO.Value              := Date;
   dmVendas.qryVendasHORA.Value                 := Time;
   dmVendas.qryVendasMODELO_COMPROVANTE.Value   := modeloComprovante;

   // Campos Relativos a daodos d ECF (Emissor de cupom fiscal)


   dmVendas.qryVendasDATA_ECF.Value             :=  StrToDate(   dataMovimentoEcf.Replace('.','/'));
   dmVendas.qryVendasHORA_ECF.Value             := StrToTime(HoraEcf);
   dmVendas.qryVendasCCF_CUPOM.Value            := ccf_cupom;
   dmVendas.qryVendasCOO_CUPOM.Value            := coo_cupom;
   dmVendas.qryVendasNUM_SERIE_ECF.Value        := num_serie_ecf;
   dmVendas.qryVendasREDUCAO_Z.Value            := numeroReducaoZ;

   //Campos Relativos a NF-e / NFC-e
   dmVendas.qryVendasNUMERO_NFCE.Value          := numeroNFCE;
   dmVendas.qryVendasSERIE_NFCE.Value           := serieNFCE;
   dmVEndas.qryVendasCHAVE_NFCE.Value           := chave_nfce;
   dmVendas.qryVendasPROTOCOLO_NFCE.Value       := protocoloNFCE;
   dmVendas.qryVendasRECIBO_NFCE.value         := reciboNFCE;

   //Campos Relativos ao SAT
   dmVendas.qryVendasSESSAO_SAT.Value           := sessaoSAT;
   dmVEndas.qryVendasCNF_SAT.Value              := CnfSAT;


   // Campos dos totais de venda
   dmVendas.qryVendasVALOR_BRUTO.Value          := ed_valor_bruto.Value;
   dmVendas.qryVendasVALOR_DESCONTO.Value       := ed_total_desconto.Value;
   dmVendas.qryVendasVALOR_TXSERV.Value         := ed_total_tx_serv.Value;
   dmVendas.qryVendasREPIQUE.Value              :=0;
   dmVendas.qryVendasVALOR_TX_ENTREGA.Value     := ed_total_entrega.Value;
   dmVendas.qryVendasVALOR_TOTAL.Value          := ed_total_conta.Value;
   dmVendas.qryVendasTOTAL_PAGO.Value           := ed_total_pago.Value;
   dmVendas.qryVendasVALOR_TROCO.Value          := ed_valor_troco.Value;
   dmVendas.qryVendasCOD_USUARIO.Value          := getCodOperadorCaixa(ultimoCaixaAberto);
   dmVendas.qryVendasNUMERO_CAIXA.Value         := numero_caixa;
   dmVendas.qryVendasPROCESSADA.Value           := 0;
   dmVendas.qryVendasMESA.Value                 := trim(lb_mesa.Caption);
   dmVendas.qryVendasCOD_CAIXA.Value            := ultimoCaixaAberto;
   dmVendas.qryVendasTIPO_VENDA.Value           := tipoVenda;
   dmVendas.qryVendasQTDE_PESSOAS.Value         := StrToInt(nPessoas);
   dmVendas.qryVendasCOD_PEDIDO_DELIVERY.Value  := codPedidoDelivery;
   dmVendas.qryVendasXML_DOC.Value :=  XMLDocumentoFiscal;
   dmVendas.qryVendasCNPJ_CPF_CLIENTE_NF.Value := cpfClienteCupomFiscal;
   dmVendas.qryVendasNOME_CLIENTE_NF.Value     := nomeClienteCupom;
   dmVendas.qryVendasCOD_FORNECEDOR.Value      := codClienteVenda;
   dmVendas.qryVendasTENTATIVAS_ENVIO_NFCE.Value :=0;
   dmVendas.qryVendasTEMPO_EMISSAO_NFCE.Value  := tempoEmissaoNota;

   dmVendas.qryVendas.Post;


 if (lb_mesa.caption = mesaDelivery) then
  begin
   codPedidoDelivery := getCodPedidoDelivery();
   dm.efetuaBaixaNoPedidoDelivery(codPedidoDelivery,codigo_venda,ultimoCaixaAberto);
   tbFormasPagamentoTemp.First;
   while not (tbFormasPagamentoTemp.Eof  ) do
    begin
       pagamentos := pagamentos +  tbFormasPagamentoTempdescricaoForma.Value + ': '+FormatFloat('R$ ###,###,##0.00 ',tbFormasPagamentoTempvalorForma.Value)+' ';
       tbFormasPagamentoTemp.Next;
    end;

   codAlteracaoDelivery  := dm.geraCodigo('G_ALT_PEDIDOS_DELIVERY',10 );
   dm.qryauxiliar.sql.Clear;
   dm.qryauxiliar.SQL.add(' insert into PEDIDOS_DELIVERY_ALTERACAO (codigo, cod_pedido,cod_cliente,cod_caixa, ');
   dm.qryauxiliar.SQL.add('  cod_usuario, cod_usuario_autorizou, valor_total,numero_caixa,tipo_alteracao,usuario_operador,usuario_autorizador,pagamentos )');
   dm.qryauxiliar.sql.add(' select '+QuotedStr(codAlteracaoDelivery)+',p.codigo,p.cod_cliente,'+QuotedStr(ultimoCaixaAberto)+','+Quotedstr(codigo_usuario));
   dm.qryauxiliar.sql.add(','+QuotedStr(codigo_usuario_responsavel)+',');
   dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(FloatToStr(ed_total_conta.value))+',');
   dm.qryauxiliar.sql.add(''+Quotedstr(numero_caixa)+',');
   dm.qryauxiliar.sql.add(''+IntToStr(4)  +',');
   dm.qryauxiliar.sql.add(''+Quotedstr(nome_usuario)  +',');
   dm.qryauxiliar.sql.add(''+Quotedstr(nome_usuario_responsavel)  +',');
   dm.qryauxiliar.sql.add(''+Quotedstr(pagamentos )  +' from pedidos_delivery p where p.codigo='+Quotedstr(codPedidoDelivery));
   dm.adicionaLog(dm.qryauxiliar.SQL.Text );
   dm.qryauxiliar.ExecSQL;


   dm.qryauxiliar.Active := false;
   dm.qryauxiliar.SQL.Clear;
   dm.qryauxiliar.SQL.add('  insert into it_ped_del_pos_alt (cod_alteracao,cod_produto,quantidade,valor_unitario) ');
   dm.qryauxiliar.SQL.add('   select '+Quotedstr(codAlteracaoDelivery) +','+' it.cod_produto, it.quantidade,it.valor_unitario ');
   dm.qryauxiliar.sql.add(' from itens_pedido_delivery  it where it.cod_pedido='+Quotedstr(codPedidoDelivery));
   dm.qryauxiliar.ExecSQL;



  end;


   dm.qryauxiliar.Active := false;
   dm.qryauxiliar.SQL.Clear;
   dm.qryauxiliar.SQL.Add(' update movimento_mesa mv ');
   dm.qryauxiliar.SQL.Add('   set mv.valor_unitario=0  ');
   dm.qryauxiliar.SQL.Add('   where mv.id in   (select distinct sb.id_mov_mesa from sabores_pizza_movimento_mesa  sb ) ');
   dm.qryauxiliar.SQL.Add('   and mv.cod_mesa='+Quotedstr(lb_mesa.Caption));
   dm.adicionaLog(dm.qryauxiliar.SQL.Text);
   dm.qryauxiliar.ExecSQL;

  //gravar produtos da venda e efetua baixa no estoque;

   dm.qryauxiliar2.Active:=false;
   dm.qryauxiliar2.SQL.clear;

   dm.qryauxiliar2.SQL.add(' select * from (');
   dm.qryauxiliar2.SQL.add(' select p.cod_barras, p.cod_produto, p.descricao,p.cfop_saida,p.ncm,p.cest, p.un_ecf,p.cst_saida, al.percentual_icms,vm.quantidade as quantidade,');
   dm.qryauxiliar2.SQL.add(' vm.valor_unitario, vm.cancelado, vm.cod_garcon, p.cod_aliquota, vm.id,  al.percentagem as aliquota,');
   dm.qryauxiliar2.SQL.add(' p.reducao_base_icms as percentual_red_base_icms, ');
   dm.qryauxiliar2.SQL.add(' udf_roundabnt((vm.valor_unitario * vm.quantidade),2) as total_produto,');
   dm.qryauxiliar2.SQL.add(' udf_roundabnt( (vm.valor_unitario * vm.quantidade) * (p.reducao_base_icms  /100),2) as total_reducao_base_icms, ');
   dm.qryauxiliar2.SQL.add(' udf_roundabnt( (udf_roundabnt((vm.valor_unitario * vm.quantidade),2) -  udf_roundabnt( (vm.valor_unitario * vm.quantidade) * (p.reducao_base_icms  /100),2)),2) AS base_icms_total, ');
   dm.qryauxiliar2.SQL.add(' udf_roundabnt( ((udf_roundabnt((vm.valor_unitario * vm.quantidade),2) -  udf_roundabnt( (vm.valor_unitario * vm.quantidade) * (p.reducao_base_icms  /100),2)) * (al.percentual_icms /100) ),2) as valor_icms ');
   dm.qryauxiliar2.SQL.add(' from movimento_mesa vm');
   dm.qryauxiliar2.SQL.add(' inner join produtos p on (p.cod_produto = vm.cod_produto)');
   dm.qryauxiliar2.SQL.add(' inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)');
   dm.qryauxiliar2.SQL.add(' where vm.cancelado=0 and  vm.cod_mesa='+Quotedstr(lb_mesa.Caption));
//   dm.qryauxiliar2.SQL.add(' and vm.id not in (select distinct sb.id_mov_mesa from sabores_pizza_movimento_mesa  sb ) ');
   dm.qryauxiliar2.SQL.add(' union all ');
   dm.qryauxiliar2.SQL.add(' select p.cod_barras, p.cod_produto, p.descricao,p.cfop_saida,p.ncm,p.cest, p.un_ecf,p.cst_saida, al.percentual_icms,vm.quantidade as quantidade,');
   dm.qryauxiliar2.SQL.add(' vm.valor_unitario_sabor, ms.cancelado, ms.cod_garcon, p.cod_aliquota, ms.id,  al.percentagem as aliquota,');
   dm.qryauxiliar2.SQL.add(' p.reducao_base_icms as percentual_red_base_icms,');
   dm.qryauxiliar2.SQL.add(' udf_roundabnt((vm.valor_unitario_sabor  * vm.quantidade),2) as total_produto,');
   dm.qryauxiliar2.SQL.add(' udf_roundabnt((vm.valor_unitario_sabor * vm.quantidade) * (p.reducao_base_icms / 100),2) as total_reducao_base_icms,');
   dm.qryauxiliar2.SQL.add(' udf_roundabnt( (udf_roundabnt((vm.valor_unitario_sabor * vm.quantidade),2) -  udf_roundabnt( (vm.valor_unitario_sabor * vm.quantidade) * (p.reducao_base_icms  /100),2)),2) AS base_icms_total,');
   dm.qryauxiliar2.SQL.add(' udf_roundabnt( ((udf_roundabnt((vm.valor_unitario_sabor * vm.quantidade),2) -  udf_roundabnt( (vm.valor_unitario_sabor * vm.quantidade) * (p.reducao_base_icms  /100),2)) * (al.percentual_icms /100) ),2) as valor_icms');
   dm.qryauxiliar2.SQL.add(' from sabores_pizza_movimento_mesa  vm');
   dm.qryauxiliar2.SQL.add(' inner join produtos p on (p.cod_produto = vm.cod_produto)');
   dm.qryauxiliar2.SQL.add(' inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)');
   dm.qryauxiliar2.SQL.add(' inner join movimento_mesa ms on (ms.id = vm.id_mov_mesa)');
   dm.qryauxiliar2.SQL.add(' where ms.cancelado=0 and ms.cod_mesa='+Quotedstr(lb_mesa.Caption)+ ')');


  dm.adicionaLog(dm.qryauxiliar2.SQL.Text);
  dm.qryauxiliar2.Active   := true;
  dm.qryauxiliar2.First;


 while not dm.qryauxiliar2.eof do
  begin

    acresimoItem := 0;
    descontoItem := 0;

    {
      acresimoItem := (dm.qryauxiliar2.fieldbyname('valor_unitario').value * dm.qryauxiliar2.fieldbyname('quantidade').value) * 100;
      acresimoItem := (acresimoItem  / ed_valor_bruto.Value) / 100;
      acresimoItem :=  acresimoItem * ed_total_tx_serv.Value;
    }





    idChaveMovimentoVenda := strToInt(dm.geraCodigo('g_id_chave_mov_venda',15));
    dm.qryauxiliar.sql.Clear;
    dm.qryauxiliar.sql.add('insert into movimento_venda (cod_empresa,cod_venda,id_chave, cod_mesa,cod_produto,');
    dm.qryauxiliar.sql.add('quantidade,valor_unitario,cod_garcon,data,cod_usuario,numero_caixa,processada,cod_metre,cod_aliquota,cod_caixa,acresimo,desconto,');
    dm.qryauxiliar.sql.add('data_ecf,hora_ecf,coo_cupom,ccf_cupom,NUM_SERIE_ECF,reducao_z,id,cfop,cst,base_icms_unit) values (');
    dm.qryauxiliar.SQL.add(''+QuotedStr(codEmpresa)+',');
    dm.qryauxiliar.SQL.add(''+QuotedStr(codigo_venda)+',');
    dm.qryauxiliar.SQL.add(IntToStr(idChaveMovimentoVenda)+ ',');
    dm.qryauxiliar.SQL.add(''+QuotedStr(lb_mesa.Caption)+',');
    dm.qryauxiliar.SQL.add(''+Quotedstr(dm.qryauxiliar2.fieldbyname('cod_produto').value)+',');
    dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(dm.qryauxiliar2.fieldbyname('quantidade').value)+',');
    dm.qryauxiliar.sql.add(''+dm.removeVirgula(dm.TrocaVirgPPto(dm.qryauxiliar2.fieldbyname('valor_unitario').value))+',');
    dm.qryauxiliar.sql.add(''+Quotedstr(dm.qryauxiliar2.fieldbyname('cod_garcon').value)+',');
    dm.qryauxiliar.sql.add(''+QuotedStr(FormatDateTime('DD.MM.YY',data_do_sistema))+',');
    dm.qryauxiliar.sql.add(''+QuotedStr(getCodOperadorCaixa(ultimoCaixaAberto))+',');
    dm.qryauxiliar.sql.add(''+QuotedStr(numero_caixa)+',0,'+Quotedstr(dm.getCodMetreResponsavel(dm.qryauxiliar2.fieldbyname('cod_garcon').value))+',');
    dm.qryauxiliar.sql.add(''+QuotedStr(dm.qryauxiliar2.fieldbyname('cod_aliquota').value)+',');
    dm.qryauxiliar.sql.add(''+QuotedStr(ultimoCaixaAberto)+',');
    dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(FloatToStr(0) )+',');
    dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(FloatToStr(descontoItem) )+',');
    dm.qryauxiliar.sql.add(''+QuotedStr(dataMovimentoEcf)+',');
    dm.qryauxiliar.sql.add(''+QuotedStr(HoraEcf)+',');
    dm.qryauxiliar.sql.add(''+QuotedStr(coo_cupom)+',');
    dm.qryauxiliar.sql.add(''+QuotedStr(ccf_cupom)+',');
    dm.qryauxiliar.sql.add(''+QuotedStr(num_serie_ecf)+',');
    dm.qryauxiliar.sql.add(''+inttostr (numeroReducaoZ)+',');
    dm.qryauxiliar.sql.add(''+inttostr (dm.qryauxiliar2.fieldbyname('ID').Value)+',');

    dm.qryauxiliar.sql.add(''+QuotedStr(dm.qryauxiliar2.fieldbyname('cfop_saida').value)+',');
    dm.qryauxiliar.sql.add(''+QuotedStr(dm.qryauxiliar2.fieldbyname('cst_saida').value)+',');
    dm.qryauxiliar.sql.add(''+dm.removeVirgula(dm.TrocaVirgPPto(dm.qryauxiliar2.fieldbyname('base_icms_total').value))+')');

    dm.adicionaLog('SQL DE INSERCAO: '+dm.qryauxiliar.SQL.Text);


    try
      begin
       dm.qryauxiliar.ExecSQL;
      end;

    except
      begin
        ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
        dm.cria_log_de_erros(dm.qryauxiliar.sql,'Módulo de caixa','Erro ao gravar movimento da venda',codigo_usuario);
        Result:=false;
        exit;
      end;
    end;

     /// Execução da procedure de baixa no estoque automática
    dm.transacaoProcedure.Active:=false;
    dm.transacaoProcedure.Active:=true;
    dm.proc_abate_estoque.Active:=false;
    dm.proc_abate_estoque.Params[0].Value:=dm.qryauxiliar2.fieldbyname('cod_produto').value;
    dm.proc_abate_estoque.Params[1].Value:=dm.qryauxiliar2.fieldbyname('quantidade').value;
    dm.proc_abate_estoque.ExecProc;
    dm.transacaoProcedure.commit;

    dm.qryauxiliar2.Next;
  end;

     //gravar pagamentos da venda
     ctRegistro :=0;
     tbFormasPagamentoTemp.First;
     while not tbFormasPagamentoTemp.Eof  do
     begin
        valor_recebido:=0;
        valor_recebido:= tbFormasPagamentoTempvalorForma.Value;
        if  tbFormasPagamentoTempcodForma.value = '001' then
          valor_recebido:=valor_recebido-ed_valor_troco.Value;


        case   dm.verificaTipoFormaPagamento(tbFormasPagamentoTempcodForma.value  ) of
          1: begin
             end;
          2: begin
               dm.gerarFatura(tbFormasPagamentoTempCodCliFaturado.value ,
                              codigo_venda,
                              valor_recebido,
                              tbFormasPagamentoTempobservacoesFaturado.value);
             end;
        end;



        idRecebimento := strToInt(dm.geraCodigo('g_id_recebimentos',15));

        dm.qryauxiliar.active:=false;
        dm.qryauxiliar.sql.clear;
        dm.qryauxiliar.sql.add('insert into recebimentos (cod_empresa,cod_venda,id,cod_forma,valor,data,cod_usuario,numero_caixa,processado,cod_caixa,cod_cliente,nsu,rede, autorizacao_tef,tipo_op_tef) values (');
        dm.qryauxiliar.SQL.add(''+QUotedstr(codEmpresa)+',');
        dm.qryauxiliar.SQL.add(''+QUotedstr(codigo_venda)+',');
        dm.qryauxiliar.SQL.add(IntToStr(idRecebimento)+ ',');
        dm.qryauxiliar.sql.add(''+QuotedStr(tbFormasPagamentoTempcodForma.value)+',');
        dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(Floattostr(valor_recebido))+',');
        dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(getCodOperadorCaixa(ultimoCaixaAberto)     )+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(numero_caixa)+',0,');
        dm.qryauxiliar.sql.add(''+QuotedStr(ultimoCaixaAberto)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(tbFormasPagamentoTempCodCliFaturado.Value   )+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(tbFormasPagamentoTempNSU.Value   )+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(tbFormasPagamentoTemprede.Value  )+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(tbFormasPagamentoTempAutorizacaoTEF.Value)+',');
        dm.qryauxiliar.sql.add(''+QuotedStr(tbFormasPagamentoTemptipoOperacao.Value )+')');


        try
          begin
            dm.qryauxiliar.ExecSQL;
          end;

        except
          begin
            ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
            dm.cria_log_de_erros(dm.qryauxiliar.sql,'Módulo de caixa','Erro ao gravar forma de pagamento',codigo_usuario);
            Result:=false;
            exit;
          end;
        end;
        tbFormasPagamentoTemp.Next;
        ctRegistro := ctRegistro + 1;
     end;

   dm.atualizaDescontosDaVenda(codigo_venda);
   dm.transacao.Commit;
end;

function Tfrm_encerramento.terminaEncerramentoDaMesa() : boolean;
var
 codMovimentacao : string;
begin

  dm.adicionaLog('Chamou a função de apagar itens do movimento');
  dm.qryauxiliar.active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('delete from movimento_mesa where cod_mesa='+Quotedstr(lb_mesa.caption));
  try
    begin
       dm.adicionaLog(dm.qryauxiliar.SQL.Text);
       dm.qryauxiliar.ExecSQL;
    end;
  except
    begin
      ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
      dm.cria_log_de_erros(dm.qryauxiliar.sql,'Módulo de caixa','Erro ao limpar movimento da mesa',getCodOperadorCaixa(ultimoCaixaAberto));
      Result:=false;
      exit;
    end;
  end;

  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('delete from recebimento_parcial where mesa='+Quotedstr(lb_mesa.Caption));
  dm.qryauxiliar.ExecSQL;

  dm.adicionaLog('Vai char a função de limpar mesa do delivery');
  limpaMesadelivery;
  dm.adicionaLog('Chamou a função de limpar a mesa do delivery');

  try
    begin
       dm.qryauxiliar.ExecSQL;
    end;
  except
    begin
      ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
      dm.cria_log_de_erros(dm.qryauxiliar.sql,'Módulo de caixa','Erro ao limpar pagamentos parciais',getCodOperadorCaixa(ultimoCaixaAberto));
      Result:=false;
      exit;
    end;
  end;





 if ( (dm.verificaSeFuncionaComoBoate = true) and (veioDoCheckin = false) ) then
   begin
    dm.qryauxiliar.Active:=false;
    dm.qryauxiliar.SQL.Clear;
    dm.qryauxiliar.SQL.Add('update cartoes set status=1 where cod_cartao='+Quotedstr(lb_mesa.Caption));
    dm.qryauxiliar.ExecSQL;

    // seleciona dados
    dm.qryauxiliar.Active:=false;
    dm.qryauxiliar.SQL.Clear;
    dm.qryauxiliar.sql.Add('select cod_movimentacao from cartoes where cod_cartao='+Quotedstr(lb_mesa.Caption));
    dm.qryauxiliar.Active:=true;
                           

    dm.qryauxiliar.Active:=false;
    dm.qryauxiliar.SQL.Clear;
    dm.qryauxiliar.sql.Add('select cod_movimentacao from cartoes where cod_cartao='+Quotedstr(lb_mesa.Caption));
    dm.qryauxiliar.Active:=true;

    if ( dm.qryauxiliar.FieldByName('cod_movimentacao').value  <> null ) then
     begin
       codMovimentacao  := dm.qryauxiliar.FieldByName('cod_movimentacao').value;
        dm.qryauxiliar.Active:=false;
        dm.qryauxiliar.SQL.Clear;
        dm.qryauxiliar.SQL.Add(' update movimentacao_clientes set hora_pagamento=current_timestamp,consumo='+dm.TrocaVirgPPto(Floattostr(ed_valor_bruto.Value)));
        dm.qryauxiliar.SQL.add(' where cod_movimentacao='+Quotedstr(codMovimentacao));
        dm.qryauxiliar.ExecSQL;
     end;
   end;


  dm.adicionaLog('Vai chamar a função de apagar extratos emitidos');
  dm.apagaExtratosEmitidos(lb_mesa.Caption);
//  dm.logarOperacao('303','Encerramento da mesa '+lb_mesa.caption,lb_mesa.caption);
  dm.adicionaLog('Apagou os extratos emitidos!');
  if dm.transacao.Active = false
  then
   dm.transacao.Active:=true;
   dm.transacao.Commit;
  dm.adicionaLog('Commitou a transação!');
end;



procedure Tfrm_encerramento.FormActivate(Sender: TObject);
var
 mesa : string;
 segundosMensagem : smallint;
begin


  if not (jaChamouActivate ) then
   begin

      if dm.ACBrNFe1.Configuracoes.WebServices.Ambiente  = taHomologacao  then
       begin
         segundosMensagem := 3;
         exibirMensagemPainelInformacoes('Modo de treinamento!','',segundosMensagem,5,true);
         frm_encerramento.SetMensagemPainelInformacoes('Modo de treinamento!.',
                                ' O sistema está operando em modo de treinamento.'+
                                '´Toda a movimentação feita nesse modo, não é tributada'+
                                '´ou contabilizada.'+LineBreak+LineBreak+
                                 '  NÃO UTILIZE EM PRODUÇÃO!'
                                  ,segundosMensagem,5,true);


         while (segundosMensagem >=0 ) do
          begin

            frm_encerramento.SetMensagemPainelInformacoes('Modo de treinamento!.',
                                ' O sistema está operando em modo de treinamento.'+
                                '´Toda a movimentação feita nesse modo, não é tributada'+
                                '´ou contabilizada.'+LineBreak+LineBreak+
                                 '  NÃO UTILIZE EM PRODUÇÃO!'
                                  ,segundosMensagem,5,true);
             Sleep(1000);
             Application.ProcessMessages();
             segundosMensagem := segundosMensagem -1;
          end;
          fecharPainelInformacoes();



       end;



      btIniciaEmissaoCupom.Caption := 'Confirmar'+#13+'(Enter)';
      btDesconto.Caption := 'Desconto'+#13+'(F5)';
      btIdCliente.Caption := 'Cliente no CF'+#13+'(F6)';
      btCalculadora.Caption := 'Calculadora'+#13+'(F7)';
      btCancelar.Caption := 'Cancelar'+#13+'(ESC)';
      btMenuFiscal.Caption := 'Menu Fiscal'+#13+'(F11)';


       podeFecharFormulario := false;


       if veioDoCheckin = true then
        begin
          lbTitMesa.Caption := 'Check-in';
        end;





      nomeClienteCupom :='';
      enderecoClienteCupomFiscal :='';
      cpfClienteCupomFiscal :='';
      tbFormasPagamentoTemp.Active:=false;
      tbFormasPagamentoTemp.EmptyTable;
      tbFormasPagamentoTemp.Active:=true;





      if (percentualTaxaServico   =0 )then
      begin
//        gp_tx_serv.Visible:=false;
      end;

      busca_movimento_da_mesa;
      verifica_tipo_caixa;
      calcula_valores(sender,true);
      jaChamouActivate := True;
             {
      mesa := lb_mesa.Caption;

      if ( mesa  = trim(mesaDelivery) ) then
       begin
          string_auxiliar:= '';
          Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
          frm_confirma_extrato.setTitulo('Confirmação');
          frm_confirma_extrato.setMensagem('Confirma emissão do cupom fiscal   ?',12);
          frm_confirma_extrato.ShowModal;
          frm_confirma_extrato.free;
            if string_auxiliar = 'S' then
             begin
               btIniciaEmissaoCupom.Click;
             end;
       end;

       }
   end;




//emissaoDeCupomFiscal;

end;









procedure Tfrm_encerramento.ed_valor_tx_servEnter(Sender: TObject);
begin
if sender is TCustomEdit then
   begin
      (sender as TCustomEdit).Brush.Color := clMoneyGreen;
      (sender as TCustomEdit).Repaint;

   end;




   

end;

procedure Tfrm_encerramento.busca_movimento_da_mesa;
var
 ultimoExtratoEmitido : TextratoEmitido;

begin
  valor_tx_serv:=0;
  ed_total_entrega  .value:=0;
  total_descontos:=0;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;



   /// Verificação de cobrança de taxa de serviço.
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

        If verificaSeCartaoCobraServico(lb_mesa.Caption) then
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



  ultimoExtratoEmitido := TextratoEmitido.Create();
  ultimoExtratoEmitido:=dm.getUltimoExtratoEmitidoMesa(lb_mesa.Caption);



  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select * from rodapeextrato2('+Quotedstr(lb_mesa.caption)+','+dm.TrocaVirgPPto(Floattostr(percentualTaxaServico))+')');
  dm.qryauxiliar.Active:=true;
  ed_valor_bruto.Value :=   dm.qryauxiliar.fieldbyname('VALORBRUTO').Value;
  lbTitMesa.Visible := True;
  if ( (lb_mesa.caption = mesaBalcao) or (lb_mesa.caption = mesaDelivery) or (verificaSeCaixaCobraServico(ultimoCaixaAberto) = False)     ) then
   begin

     lb_mesa.Visible:=false;
     pnTxServico.Visible := false;
     lbTitMesa.Visible := false;



     if (Trim(lb_mesa.caption) = mesaDelivery ) then
      begin

        ed_total_entrega.Value :=   getValorTxEntregaPedido(codigoPedidoDelivery);
      end;
   end
  else
   begin
      ed_total_entrega.value:=0;
      valor_tx_serv:=dm.qryauxiliar.fieldbyname('VALORTXSERV').Value;
   end;


  ed_valor_tx_serv.text:=FormatFloat('#0.00',valor_tx_serv);
  ed_valor_tx_serv.HideSelection := false;
  ed_valor_tx_serv.SelectAll;

  ed_total_conta.Value:=ed_valor_bruto.Value + valor_tx_serv;
  if (ultimoExtratoEmitido.extratoValido  = 1) then
   begin
     ed_valor_desconto.Text:= FormatFloat('#0.00',ultimoExtratoEmitido.valorDesconto);
     if (ultimoExtratoEmitido.tipoDesconto = 0) then
       ckb_desconto.checked:=true
     else
       ckb_desconto.checked:=false;

     if ultimoExtratoEmitido.valorDesconto > 0 then
       gp_desconto.Enabled:=false;

     ed_valor_tx_serv.Text:=  FormatFloat('#0.00',ultimoExtratoEmitido.valorServico);

   end;

 
   
  calcula_valores(ed_total_conta,true);
end;



procedure Tfrm_encerramento.bt_adicionarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key=vk_escape then
   begin
     close;
   end;
end;



function Tfrm_encerramento.emitir_comprovante(codVenda : string) : boolean;
var
 retorno : string;
 codCliente : string;
 nomeCliente : string;
 segundosMensagem : smallint;


begin


   segundosMensagem := 1;
   exibirMensagemPainelInformacoes('Imprimindo comprovante...','',segundosMensagem,5,true);
   frm_encerramento.SetMensagemPainelInformacoes('Imprimindo comprovante...',
                          '´Aguarde a impressão do comprovante.'
                            ,segundosMensagem,7,true);


   while (segundosMensagem >=0 ) do
    begin

   frm_encerramento.SetMensagemPainelInformacoes('Imprimindo comprovante...',
                          '´Aguarde a impressão do comprovante.'
                            ,segundosMensagem,7,true);
       Sleep(1000);
       Application.ProcessMessages();
       segundosMensagem := segundosMensagem -1;
    end;
    fecharPainelInformacoes();

                        {
  dm.adicionaLog('Imprimindo encerramento da conta');
 frmPainelAguarde.Memo1.Lines.Clear;
 frmPainelAguarde.Memo1.Lines.Add('IMPRIMINDO COMPROVANTE'+#13+#10' POR FAVOR, AGUARDE...');
 frmPainelAguarde.Show;
                       }


 if (dm.verificaSeFuncionaComoBoate = true) then
   begin
    codCliente  := getCodClienteUsandoCartao(lb_mesa.Caption);
    nomeCliente := getNomeClienteUsandoCartao(lb_mesa.Caption);
   end;



  result:=false;
  If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
  If FileExists(caminhoArquivoExtrato) then DeleteFile(caminhoArquivoExtrato);
  if (mesaDelivery = trim(lb_mesa.caption)) then
    dm.imprimeCabecalhoECF(marca_impressora_nao_fiscal_01,2,lb_mesa.Caption,codVenda,getCodPedidoDelivery(),codCliente,nomeCliente,1)
  else
    dm.imprimeCabecalhoECF(marca_impressora_nao_fiscal_01,2,lb_mesa.Caption,codVenda,codPedidoBalcao ,codCliente,nomeCliente,1);


  dm.adicionaLog('Vai Chamou a função de impressão do movimento');


  if StrToInt(dm.LeIni(1,'ENCERRAMENTO','imprime_movimento')) = 1 then
   begin
     dm.adicionaLog('Vai chamar a função impressão de ítens de encerramento');
     dm.imprimeMovimentoContaECF(marca_impressora_nao_fiscal_01,lb_mesa.Caption,codVenda  );
     dm.adicionaLog('Chamou a função de impressão do movimento');
   end;


  imp_FormasPagtoComprovante(marca_impressora_nao_fiscal_01,modelo_impressora_nao_fiscal_01);
  dm.imprimeRodapeExtratoContaECF(lb_mesa.Caption,codVenda,marca_impressora_nao_fiscal_01 ,2,1,ed_valor_bruto.value,0,ed_total_tx_serv.Value,0,ed_total_desconto.Value,ed_total_conta.Value,ed_total_pago.Value,ed_valor_troco.Value,0);
  frm_principal.memo_avisos.Lines.LoadFromFile(caminhoArquivoExtrato);
  dm.adicionaLog(frm_principal.memo_avisos.Lines.Text);




   if (localDeEmissaoEncerramento  = 1 )  then // Imprime o extrato no ECF
    begin

       case  modeloComprovanteFiscal of //StrToInt(dm.LeIni(2,'ENCERRAMENTO','modeloComprovantefiscal')) of
         1: begin  // Imprime na impressora fiscal

              try
                frm_principal.ecf.RelatorioGerencial(frm_principal.memo_avisos.lines ,1,codRelatorioGerencialExtrato);
              except
                 begin
//                   frmPainelAguarde.close;
                   exibe_painel_erro('Ocorreu um erro na impressão do comprovante de encerramento!','Ok');
                 end;
              end;
            end;

         2: begin  // imprime na impressora de NFC-e

             dm.imprimeTexoMiniPrinter();
             dm.aCBrPosPrinter1.CortarPapel(true);
            end;

       end;
    end
   else
    begin

       if (localDeEmissaoEncerramento  = 2 )  then // Imprime o extrato no ECF
        begin

         try
          dm.imprimeTexoMiniPrinter();
          dm.aCBrPosPrinter1.CortarPapel(true);
         except
           dm.exibe_painel_erro('Erro ao imprimir o comprovante de encerramento','Ok');
         end;

        end;

       if (localDeEmissaoEncerramento  = 3 )  then // Imprime o extrato no ECF
        begin

         try
           dm.imprimeTexoImpressoraNFCE();
//           dm.aCBrPosPrinter1.CortarPapel(true);
         except
           dm.exibe_painel_erro('Erro ao imprimir o comprovante de encerramento','Ok');
         end;

        end;

    end;


//  frmPainelAguarde.CLOSE;
  result := true;
end;















function Tfrm_encerramento.imp_FormasPagtoComprovante(marca : integer; modelo : integer) : boolean;
var
 total_formas : integer;
 ct : integer;
 str : Widestring;
 tamStr : integer;
begin
   tbFormasPagamentoTemp.First;
   while not tbFormasPagamentoTemp.Eof do
    begin
      if (tbFormasPagamentoTemp.Bof ) then
       begin
        dm.imprimeLinhaECF(marca,linhaExtrato,true,false,false,false,false,false,false);
        dm.imprimeLinhaECF(marca,dm.centralizar('FORMAS DE PAGAMENTO',qtdColunasNormalECF),true,false,false,false,false,false,false);
       end;
        str:=formatoRodapeExtrato;
        str:=dm.organizarCupom(str,tbFormasPagamentoTempdescricaoForma.value ,'#');
        str:=dm.organizarCupom(str,'','*');
        str:=dm.organizarCupom(str,'','%');
        tamStr :=alinhamentoDireitaTotal- length(trim(str));
        str:= trim(str)+dm.alinha_valor_a_direita(tamStr,FormatFloat('R$ ###,###,##0.00 ', (tbFormasPagamentoTempvalorForma.value) ));
        dm.imprimeLinhaECF(marca,trim(str),false,false,false,false,false,false,false);
       tbFormasPagamentoTemp.Next;
    end;

    
end;






procedure Tfrm_encerramento.bt_pesquisa_formaClick(Sender: TObject);
begin
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('select * from formas_pagamento');
  dm.qryauxiliar.Active:=true;
  if dm.qryauxiliar.IsEmpty then
  begin
    ShowMessage('Não existem formas de pagamento cadastrados!');
    Exit;
  end;
  Application.CreateForm(Tfrm_cs_formas_pagto,frm_cs_formas_pagto);;
  frm_cs_formas_pagto.ShowModal;
  frm_cs_formas_pagto.free;
  ed_codigo_forma.Text:=string_auxiliar;
end;


procedure Tfrm_encerramento.busca_recebimentos_parciais;
var
valor : string;
begin


     dm.qryauxiliar2.Active:=false;
     dm.qryauxiliar2.SQL.clear;
     dm.qryauxiliar2.SQL.Add('select r.*,f.descricao from recebimento_parcial r ');
     dm.qryauxiliar2.sql.add(' inner join formas_pagamento f on (f.cod_forma = r.cod_forma)');
     dm.qryauxiliar2.SQL.add('where mesa='+quotedstr(lb_mesa.Caption));
     dm.qryauxiliar2.sql.add(' order by r.cod_forma');
     dm.qryauxiliar2.Active:=true;
     dm.qryauxiliar2.first;

     if dm.qryauxiliar2.IsEmpty = false then
      begin

        while not dm.qryauxiliar2.Eof do
          begin
            ed_codigo_forma.SetFocus;
            valor:= formatfloat('#0.00',dm.qryauxiliar2.fieldbyname('valor').value);
            codClienteFaturado := dm.qryauxiliar2.fieldbyname('cod_cli_faturamento').Value;
            observacaoFaturamento :=  dm.qryauxiliar2.fieldbyname('obs_faturamento').Value;

            adicionar_pagamento(dm.qryauxiliar2.fieldbyname('cod_cli_faturamento').Value,
                                dm.qryauxiliar2.fieldbyname('obs_faturamento').Value,
                                dm.qryauxiliar2.fieldbyname('cod_forma').Value,
                                dm.qryauxiliar2.fieldbyname('descricao').Value,
                                dm.qryauxiliar2.fieldbyname('valor').Value);



            dm.qryauxiliar2.Next;
          end;


        if ( (ed_total_pago.Value >= ed_total_conta.value)) then
         begin

              btEncerrarVenda.Click;
         end
        else
         begin
          ed_codigo_forma.clear;

          ed_codigo_forma.SetFocus;
          ed_valor_forma.text:= FormatFloat('#0.00',ed_total_conta.value-ed_total_pago.Value);
         end;
        ed_codigo_forma.SetFocus;
      end;


end;

procedure Tfrm_encerramento.verifica_tipo_caixa;
begin
{ if dm.leini(2,'CAIXA','tipo_caixa') = '1' then
  begin
   ed_valor_tx_serv.text:='0';
   valor_tx_serv:=0;
   lb_mesa.Visible:=false;
   pn_restaurante.visible:=false;
   pn_totais_restaurante.Visible:=false;
   ed_valor_troco.Width:=183;
   ed_valor_troco.Font.Size:=16;
   ed_valor_troco.Height:=38;
   ed_valor_troco.Top:=44;

   lb_troco.Font.Size:=16;
   lb_troco.Top:=55;
   lb_troco.Left:=113;

//   ed_codigo_forma.SetFocus;
  end
 else}
//  begin
  //  ed_codigo_forma.SetFocus;

   if ( (lb_mesa.caption = mesaDelivery) or (lb_mesa.Caption = mesaBalcao )) then
    begin
       if (lb_mesa.caption = mesaDelivery) then
         LBTIPO.Caption :='DELIVERY'
       else
         lbTipo .Caption :='BALCÃO';

    end
   else
    begin
     lbTipo.caption := 'MESA';
    end;

    lbTipo.Alignment := taCenter;
      lbTipo.Repaint;



//  end;
end;


procedure Tfrm_encerramento.cbk_taxaClick(Sender: TObject);
begin
  calcula_valores(sender,true);
end;

procedure Tfrm_encerramento.ckb_descontoClick(Sender: TObject);
begin
  calcula_valores(sender,true);
end;

procedure Tfrm_encerramento.ckb_couvertClick(Sender: TObject);
begin
  calcula_valores(sender,true);
end;


procedure Tfrm_encerramento.bt_imprimir_cupomKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_escape then close;

end;


function Tfrm_encerramento.verificaSeTemMovimento() : boolean;
var
 q : TIBQuery;
begin
  q:= TIBQuery.Create(self);
  q.Database:=dm.dbrestaurante;
  q.Transaction:=dm.transacao;
  q.active:=false;
  q.sql.clear;
  q.SQL.Add('select movimento_mesa.cod_mesa,movimento_mesa.cod_movimento,movimento_mesa.cod_produto,produtos.cod_produto,produtos.descricao,movimento_mesa.quantidade,produtos.valor_unitario,movimento_mesa.comanda,movimento_mesa.cod_garcon,movimento_mesa.numero_caixa');
  q.SQL.Add('  from movimento_mesa,produtos where');
  q.sql.add(' produtos.cod_produto=movimento_mesa.cod_produto and movimento_mesa.cod_mesa='+Quotedstr(lb_mesa.caption)+' and numero_caixa='+Quotedstr(numero_caixa)+' order by cod_movimento');
  q.active:=true;

  if q.IsEmpty then Result:= false else Result:=true;


end;


function Tfrm_encerramento.verificaValidadeFaturamento() : boolean;
begin

 if( frm_modelo_vazio.verificaExistenciaCliente(ed_cod_cliente.Text) = false) then
  begin
    ShowMessage('Cliente informado não existe!');
    Result:=false;
    ed_cod_cliente.SetFocus;
    exit;
  end;

 if( frm_modelo_vazio.verificaClienteAtivo(ed_cod_cliente.Text) = false) then
  begin
    ShowMessage('Cliente informado encontra-se inativo!');
    Result:=false;
    ed_cod_cliente.SetFocus;
    exit;
  end;

  if (frm_modelo_vazio.verificaClienteTemCredito(ed_cod_cliente.Text, StrToFloat(ed_valor_forma.text))  = false ) then
   begin
    Showmessage('Cliente não possui crédito suficiente para efetuar faturamento.');
    Result:=false;
    ed_cod_cliente.SetFocus;
    exit;
   end;

   Result:=true;
end;

procedure Tfrm_encerramento.bt_confirma_faturaClick(Sender: TObject);
begin
  if (verificaValidadeFaturamento = true)
   then
     pn_faturamento.Visible:=false;

end;

procedure Tfrm_encerramento.bt_cancelarClick(Sender: TObject);
begin
  pn_faturamento.Visible:=false;
end;

procedure  Tfrm_encerramento.setRetornoForma(ret : boolean);
begin
  self.retornoForma :=ret;
end;

function  Tfrm_encerramento.getRetornoForma() : boolean;
begin
  result := self.retornoForma;
end;

function Tfrm_encerramento.getValorFormaPagamento() : double;
begin
  valorForma:=StrToFloat( ed_valor_forma.Text);
  result:=valorForma;
end;





procedure Tfrm_encerramento.setCodPedidoDelivery(codPedido : string);
begin
  self.codigoPedidoDelivery  := codPedido;
end;

function  Tfrm_encerramento.getCodPedidoDelivery() : string;
begin
  result:=self.codigoPedidoDelivery;
end;


function Tfrm_encerramento.verificaPossibilidadeDeTroco( troco : double) : Double;
var

  linhas,linhaAtual : integer;
  totalFormasPermitidas : double;

begin
  totalFormasPermitidas:=0;
  tbFormasPagamentoTemp.First;
  while not (tbFormasPagamentoTemp.Eof  ) do
   begin
     if ( getPermissaoDeTroco(tbFormasPagamentoTempcodForma.value) = true) then
      totalFormasPermitidas:= totalFormasPermitidas + tbFormasPagamentoTempvalorForma.Value;
     tbFormasPagamentoTemp.Next;
   end;

  Result :=(totalFormasPermitidas - troco);

end;


procedure Tfrm_encerramento.ed_valor_formaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key=vk_return
   then
     begin
       Perform(WM_NEXTDLGCTL,0,0)
     end;
end;


function Tfrm_encerramento.verificaImpressoraFiscal () : boolean;
var
 impressoraLigada : boolean;
 estado           : String;
 q                : TIBQuery;
 ctItemCupom      : integer;

begin



 Result :=false;


 try
   begin
    Estado := Estados[ frm_principal.ecf.Estado ];
   end;

 except
   on E : Exception do
    begin
       exibe_painel_erro(E.Message,'Ok');
       Result := false;
       exit;
    end;
 end;





 if UpperCase(trim(estado)) <> 'LIVRE' then
  begin
    if UpperCase(trim(estado)) <> 'NãO INICIALIZADA' then
     begin

      if UpperCase(trim(estado)) = 'REQUER Z' then
       begin
         dm.exibe_painel_erro('REDUÇÃO Z PENDENTE. EFETUE A REDUÇÃO Z ATRAVÉS DO MENU FISCAL.','OK');
         Result := FALSE;
         Exit;
       end
      else
        begin
         try
           dm.exibe_painel_erro('O SISTEMA IDENTIFICOU UMA OPERAÇÃO DE ERRO. O SISTEMA FARÁ O CANCELAMENTO AUTOMÁTICO DA OPERAÇÃO E REATIVARÁ O EMISSOR DE CUPOM FISCAL AGORA.','PROSSEGUIR');
           frm_principal.ECF.CorrigeEstadoErro();
           dm.exibe_painel_erro('O ERRO FOI CORRIGIDO COM SUCESSO. REABRA ESTE MÓDULO E REINICIE A OPERAÇÃO DE RECEBIMENTO.','FECHAR');
           Result := False;
           exit;
         except
           begin
             if (estado ='VENDA') then
             BEGIN
               dm.exibe_painel_erro('NÃO É POSSÍVEL CONTINUAR. O ECF ESTÁ EM ESTADO DE VENDA, PORÉM NÃO ESTÁ EM LINHA. COLOQUE A IMPRESSORA NO MODO'
               +' ONLINE PARA PROSSEGUIR','OK');
               Result := FALSE;
               exit;
             end

             else
              begin
               dm.exibe_painel_erro('NÃO É POSSÍVEL CONTINUAR. VERIFIQUE SE A IMPRESSORA ESTÁ ONLINE E  REINICIE O SISTEMA PARA NOVA TENTATIVA DE CORREÇÃO DE ERRO.'#13+'ESTADO DO ECF: '+estado,'OK');
               Result := FALSE;
               EXIT;
              end;
           end;
         end;
        end;
       exit;
     end
    else
     begin
       dm.exibe_painel_erro('A IMPRESSORA FISCAL ENCONTRA-SE DESATIVADA. VERIFIQUE SE A MESMA'+#13+' ENCONTRA-SE ON LINE E EM SEGUIDA CLIQUE EM REATIVAR','Reativar ECF');


       try
        begin
         frm_principal.ECF.Desativar;
         frm_principal.ECF.Ativar;
        end;
       except
         begin
            dm.exibe_painel_erro('Erro ao reativar o ECF. Feche o sistema e desligue/ligue o ECF','continuar..');
            Result := FALSE;
            exit;
         end;
       end;

       try
         begin
           frm_principal.ecf.CarregaAliquotas;
           frm_principal.ecf.CarregaFormasPagamento;
           frm_principal.ecf.CarregaComprovantesNaoFiscais;
           frm_principal.ecf.CarregaUnidadesMedida;
        end;
       except
        begin
          dm.exibe_painel_erro('Erro ao carregar variáveis do ECF','...');
          Result := FALSE;
          exit;
        end;
       end;
     end;
  end;

  Result := TRUE;
   {
 if (validacaoArquivoAuxiliarPaf(caminhoArquivoAuxiliarPAF) = false) then
  begin
   exit;
  end;

  }
end;




function Tfrm_encerramento.registraPagamentoCupomFiscal(codigoForma : string; valorForma : double ; observacao : string) : Boolean;
begin
   result := false;
    try
      frm_principal.ECF.EfetuaPagamento(codigoForma  ,valorForma ,observacao,false,0);


      except
       on E : Exception do
         begin
//          frmPainelAguarde.Close;
          exibe_painel_erro(E.Message,'Ok');
          Result := false;
          exit;
         end;
      end;

   result := true;

end;

function Tfrm_encerramento.registraItensCupomFiscal() : boolean;
var
 impressoraLigada : boolean;
 estado           : String;
 q                : TIBQuery;
 ctItemCupom      : integer;
 mesa             : string;

begin
 mesa := lb_mesa.Caption;
 frmPainelAguarde.Memo1.Lines.Clear;
 frmPainelAguarde.Memo1.Lines.Add('REGISTRANDO ÍTENS NO CUPOM FISCAL'+#13+#10' POR FAVOR, AGUARDE...');
 frmPainelAguarde.Show;


 dataMovimentoEcf := FormatDateTime('DD.MM.YYY',frm_principal.ecf.DataMovimento);
 HoraEcf := FormatDateTime('HH:MM:SS',frm_principal.ecf.DataHora);
 Estado := Estados[ frm_principal.ecf.Estado ] ;
 try
  frm_principal.ecf.AbreCupom(cpfClienteCupomFiscal,nomeClienteCupom,enderecoClienteCupomFiscal);
 except
   on E : Exception do
  begin
    frmPainelAguarde.Close;
    exibe_painel_erro(E.Message,'Ok');
    Result := false;
    exit;
  end;
 end;

 // Registro dos ítens no cupom fiscal
 q := TIBQuery.Create(self);
 q.Database := dm.dbrestaurante;
 q.Transaction := dm.transacao;
 q.Active:=false;
 q.sql.clear;
 q.sql.add('select * from (');
 q.sql.add(' select p.cod_barras, p.descricao,p.cfop_saida,p.ncm,p.cest, p.un_ecf,p.cst_saida, al.percentual_icms,vm.quantidade as quantidade,');
 q.sql.add(' vm.valor_unitario, vm.cancelado, al.percentagem as aliquota, ');
  q.sql.add(' p.reducao_base_icms as percentual_red_base_icms, ');
 q.sql.add(' udf_roundabnt((vm.valor_unitario * vm.quantidade),2) as total_produto,');
 q.sql.add(' udf_roundabnt( (vm.valor_unitario * vm.quantidade) * (p.reducao_base_icms  /100),2) as total_reducao_base_icms, ');
 q.sql.add('  udf_roundabnt( (udf_roundabnt((vm.valor_unitario * vm.quantidade),2) -  udf_roundabnt( (vm.valor_unitario * vm.quantidade) * (p.reducao_base_icms  /100),2)),2) AS base_icms_total, ');
 q.sql.add(' udf_roundabnt( ((udf_roundabnt((vm.valor_unitario * vm.quantidade),2) -  udf_roundabnt( (vm.valor_unitario * vm.quantidade) * (p.reducao_base_icms  /100),2)) * (al.percentual_icms /100) ),2) as valor_icms ');

 q.sql.add(' from movimento_mesa vm');

 q.sql.add('        inner join produtos p on (p.cod_produto = vm.cod_produto)');
 q.sql.add('        inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)');
 q.sql.add('         where vm.cod_mesa='+QuotedStr(mesa)+ 'and vm.valor_unitario > 0  ');
 q.sql.add('         and vm.id not in (select distinct sb.id_mov_mesa from sabores_pizza_movimento_mesa  sb ) ');


 q.sql.add(' union all ');
 q.sql.add(' select p.cod_barras, p.descricao,p.cfop_saida,p.ncm,p.cest, p.un_ecf,p.cst_saida, al.percentual_icms,vm.quantidade as quantidade, ');
 q.sql.add(' vm.valor_unitario_sabor, ms.cancelado, al.percentagem as aliquota,');
 q.sql.add(' p.reducao_base_icms as percentual_red_base_icms,');
 q.sql.add(' udf_roundabnt((vm.valor_unitario_sabor  * vm.quantidade),2) as total_produto,');
 q.sql.add(' udf_roundabnt((vm.valor_unitario_sabor * vm.quantidade) * (p.reducao_base_icms / 100),2) as total_reducao_base_icms,');
 q.sql.add('   udf_roundabnt( (udf_roundabnt((vm.valor_unitario_sabor * vm.quantidade),2) -  udf_roundabnt( (vm.valor_unitario_sabor * vm.quantidade) * (p.reducao_base_icms  /100),2)),2) AS base_icms_total,');
 q.sql.add('  udf_roundabnt( ((udf_roundabnt((vm.valor_unitario_sabor * vm.quantidade),2) -  udf_roundabnt( (vm.valor_unitario_sabor * vm.quantidade) * (p.reducao_base_icms  /100),2)) * (al.percentual_icms /100) ),2) as valor_icms');
 q.sql.add('  from sabores_pizza_movimento_mesa  vm');
 q.sql.add('         inner join produtos p on (p.cod_produto = vm.cod_produto)');
 q.sql.add('         inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)');
 q.sql.add('         inner join movimento_mesa ms on (ms.id = vm.id_mov_mesa)');
 q.sql.add('         where ms.cod_mesa='+QuotedStr(mesa));



 if (ed_total_tx_serv.Value > 0 ) then
  begin
   q.sql.add('          union all  ');
   q.sql.add(' select p.cod_barras, p.descricao,p.cfop_saida,p.ncm,'+quotedstr(' ')+' as cest, p.un_ecf,p.cst_saida, al.percentual_icms,');
   q.sql.add('       1 as quantidade,');
   q.sql.add(''+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+' ');
   q.sql.add(' as valor_unitario, 0 as cancelado, al.percentagem as aliquota,');
   q.sql.add(' p.reducao_base_icms as percentual_red_base_icms, ');
   q.sql.add(''+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+' as total_produto, ');
   q.sql.add(' udf_roundabnt( ('+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+') * (p.reducao_base_icms  /100),2) as total_reducao_base_icms, ');
   q.sql.add('  udf_roundabnt( (udf_roundabnt(('+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+'),2) -  udf_roundabnt( ('+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+') * (p.reducao_base_icms  /100),2)),2) AS base_icms_total, ');
   q.sql.add(' udf_roundabnt( ((udf_roundabnt(('+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+'),2) -  udf_roundabnt( ('+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+') * (p.reducao_base_icms  /100),2)) * (al.percentual_icms /100) ),2) as valor_icms ');



   q.sql.add('         from  produtos p');
   q.sql.add('         inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)');
   q.sql.add('         where p.cod_produto = '+Quotedstr('99999'));
  end;

 if (ed_total_entrega .Value > 0 ) then
  begin
   q.sql.add('          union all  ');
   q.sql.add(' select p.cod_barras, p.descricao,p.cfop_saida,p.ncm,'+quotedstr(' ')+' as cest,p.un_ecf,p.cst_saida, al.percentual_icms,');
   q.sql.add('       1 as quantidade,');
   q.sql.add(''+dm.TrocaVirgPPto(Floattostr(ed_total_entrega.Value))+' ');
   q.sql.add(' as valor_unitario, 0 as cancelado, al.percentagem as aliquota,');
   q.sql.add(' p.reducao_base_icms as percentual_red_base_icms, ');   
   q.sql.add(''+dm.TrocaVirgPPto(Floattostr(ed_total_entrega .Value))+' as total_produto, ');
   q.sql.add(' udf_roundabnt( ('+dm.TrocaVirgPPto(Floattostr(ed_total_entrega.Value))+') * (p.reducao_base_icms  /100),2) as total_reducao_base_icms, ');
   q.sql.add('  udf_roundabnt( (udf_roundabnt(('+dm.TrocaVirgPPto(Floattostr(ed_total_entrega.Value))+'),2) -  udf_roundabnt( ('+dm.TrocaVirgPPto(Floattostr(ed_total_entrega.Value))+') * (p.reducao_base_icms  /100),2)),2) AS base_icms_total, ');
   q.sql.add(' udf_roundabnt( ((udf_roundabnt(('+dm.TrocaVirgPPto(Floattostr(ed_total_entrega.Value))+'),2) -  udf_roundabnt( ('+dm.TrocaVirgPPto(Floattostr(ed_total_entrega.Value))+') * (p.reducao_base_icms  /100),2)) * (al.percentual_icms /100) ),2) as valor_icms ');



   q.sql.add('         from  produtos p');
   q.sql.add('         inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)');
   q.sql.add('         where p.cod_produto = '+Quotedstr('99998'));
  end;


 q.sql.add(') order by cod_barras');

 dm.adicionaLog(q.SQL.text);




 frm_principal.memo_avisos.Lines := q.SQL;
// frm_principal.memo_avisos.Visible := true;

 q.Active:=true;
 q.First;


 ctItemCupom :=0;
 while not q.Eof do
  begin
     // Faz o Registro do ítem
    try


      frm_principal.ecf.ArredondaItemMFD := true;
      frm_principal.ECF.VendeItem (q.fieldbyname('cod_barras').Value,
                                  q.fieldbyname('descricao').Value,
                                  q.fieldbyname('aliquota').Value,
                                  q.fieldbyname('quantidade').Value,
                                  q.fieldbyname('valor_unitario').Value,
                                  0,
                                  'UN','$');
      except
       on E : Exception do
         begin
          frmPainelAguarde.Close;
          exibe_painel_erro(E.Message,'Ok');
          Result := false;
          exit;
         end;
      end;
      ctItemCupom := ctItemCupom + 1;

      if q.fieldbyname('CANCELADO').Value = 1 then
        begin
           try
             frm_principal.ECF.CancelaItemVendido(ctItemCupom);
            except
             on E : Exception do
               begin
                frmPainelAguarde.Close;
                exibe_painel_erro(E.Message,'Ok');
                Result := false;
                exit;
              end;
           end;

        end;

     q.Next;
  end;


  dm.adicionaLog('Tenta subtotalizar o cupom');
   try
     frm_principal.ECF.SubtotalizaCupom( -ed_total_desconto.value);
    except
     on E : Exception do
       begin

         dm.adicionaLog('Erro ao subototalizar o cupom');
         try
           exibe_painel_erro(E.Message,'Ok');
         except

         end;
        Result := false;
        exit;
      end;
   end;
dm.adicionaLog('subtotalizou o cupom');

 dm.adicionaLog('Tenta fechar o painel');
 try
  frmPainelAguarde.Close;
 except

 end;
 dm.adicionaLog('Fechou o painel');
 q.Active :=false;
 FreeAndNil(q);
 Result :=true;
dm.adicionaLog('Terminou a função de registro de itens!');
end;




function Tfrm_encerramento.emitirNFCE(NumNFe: String) : boolean;
var
 numNFCE :  integer;
 vSincrono : String;
 Sincrono : boolean;
 segundosEnvioNFCE : smallint;

 horaInicioEmissao : TDateTime;
 horaFimEmissao : TDateTime;

begin

  result := false;

  dm.tb_parametros.Active := true;
  Sincrono := true;
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.Configuracoes.Geral.ModeloDF              := moNFCe;
   {
  if ( dm.verificaSeUltimaNFCEConstaNasVendas() = false) then
   begin
     exibe_painel_erro('A última NFC-e emitida não consta na base de dados de vendas. Entre em contato com a Real Softwares para correção'
     +#13#10#13#10' O Sistema permanecerá sem emitir NFC-e neste PDV até a resolução do problema.','Ok');
     result:= false;
     exit;

   end;
    }
  with dm.ACBrNFe1.NotasFiscais.Add.NFe do
   begin




    // Dados do Responsável Técnico
    if ( StrToInt(dm.LeIni(1,'NFCE','RespTec') ) = 1 ) then
     begin
       infRespTec.CNPJ     := '08101553000142';
       infRespTec.xContato := 'JOÃO MARCOS SANTOS DA SILVA';
       infRespTec.email    := 'joao@realsoftwares.com.br';
       infRespTec.fone     := '71999882928';
     end;



     Ide.cNF       := 1;
     Ide.natOp     := 'VENDA';
     Ide.indPag    := ipVista;
     Ide.modelo    := 65;
     Ide.serie     := 1;
     Ide.nNF       := 1;
     Ide.dEmi      := now;
     Ide.dSaiEnt   := now;
     Ide.hSaiEnt   := now;

     Ide.tpNF      := tnSaida;

       case StrToInt(dm.LeIni(1,'NFCE','ambienteEmissao'))  of
      1: begin
           Ide.tpAmb := taHomologacao;
           dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;

         end;
      2: begin
           dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao;
           Ide.tpAmb := taProducao;


         end;
     end;






     Ide.cUF       := UFtoCUF(dm.tb_parametrosUF.Value);
     Ide.cMunFG    := StrToInt(dm.tb_parametrosCOD_MUNICIPIO_IBGE.value );
     Ide.finNFe    := fnNormal;
     Ide.tpImp     := tiNFCe;
     Ide.indFinal  := cfConsumidorFinal;

     Ide.indPres   := pcPresencial;

      Emit.CNPJCPF           := dm.tb_parametrosCNPJ.Value;
      Emit.IE                := dm.tb_parametrosIE.Value;
      Emit.xNome             := dm.tb_parametrosRAZAO_SOCIAL.Value;
      Emit.xFant             := dm.tb_parametrosNOME_FANTASIA.Value;

      Emit.EnderEmit.fone    := dm.tb_parametrosTELEFONE_EMPRESA.Value;
      Emit.EnderEmit.CEP     := StrToInt(dm.tb_parametrosCEP.value);
      Emit.EnderEmit.xLgr    := dm.tb_parametrosLOGRADOURO.Value;
      Emit.EnderEmit.nro     := dm.tb_parametrosNUMERO.Value;
      Emit.EnderEmit.xCpl    := dm.tb_parametrosCOMPLEMENTO.Value;
      Emit.EnderEmit.xBairro := dm.tb_parametrosBAIRRO.Value;
      Emit.EnderEmit.cMun    := StrToInt(dm.tb_parametrosCOD_MUNICIPIO_IBGE.Value);
      Emit.EnderEmit.xMun    := dm.tb_parametrosNOME_CIDADE_CONTRIBUINTE.Value;
      Emit.EnderEmit.UF      := dm.tb_parametrosUF.Value;
      Emit.enderEmit.cPais   := 1058;
      Emit.enderEmit.xPais   := 'BRASIL';

      Emit.IEST              := '';



      if simplesNacional  then
       Emit.CRT               := crtSimplesNacional // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
      else
       Emit.CRT := crtRegimeNormal;

      Dest.indIEDest         := inNaoContribuinte;
      Dest.CNPJCPF           := cpfClienteCupomFiscal;
      Dest.ISUF              := '';
      Dest.xNome             := nomeClienteCupom;

      Dest.EnderDest.Fone    := '';
//      Dest.EnderDest.CEP     := ;
      Dest.EnderDest.xLgr    := '';
      Dest.EnderDest.nro     := '';
      Dest.EnderDest.xCpl    := '';
      Dest.EnderDest.xBairro := '';
//      Dest.EnderDest.cMun    := 3554003;
      Dest.EnderDest.xMun    := '';
      Dest.EnderDest.UF      := '';
      Dest.EnderDest.cPais   := 1058;
      Dest.EnderDest.xPais   := 'BRASIL';
      Transp.modFrete := mfSemFrete; // NFC-e não pode ter FRETE


      registraItensNFCE(lb_mesa.Caption);

      tbFormasPagamentoTemp.First;
      while not tbFormasPagamentoTemp.Eof do
       begin

        with pag.Add do //PAGAMENTOS apenas para NFC-e
         begin
           tPag := dm.getTipoPagamentoNFCE(tbFormasPagamentoTempcodForma.Value);
           tpIntegra := tiPagNaoIntegrado;
          if  tbFormasPagamentoTempcodForma.value = '001' then
           begin
             vPag := tbFormasPagamentoTempvalorForma.Value - ed_valor_troco.Value;
           end
          else
             vPag := tbFormasPagamentoTempvalorForma.Value;
         end;



         tbFormasPagamentoTemp.Next;
       end;





      if (lb_mesa.Caption  = mesaBalcao) then
        begin
          codPedidoBalcao := dm.geraCodigo('G_PEDIDOS_BALCAO',4);
          obsRodapeCupomFiscal:= 'PEDIDO BALCAO Nº: '+codPedidoBalcao  +#13#10;
        end;

      InfAdic.infCpl     :=  obsRodapeCupomFiscal;
      InfAdic.infAdFisco :=  '';


{      with InfAdic.obsCont.Add do
       begin
         xCampo := 'ObsCont';
         xTexto := 'Texto';
       end;

      with InfAdic.obsFisco.Add do
       begin
         xCampo := 'ObsFisco';
         xTexto := 'Texto';
       end; }

   end;

   case strToInt( dm.LeIni(2,'NFE','versaoNFE')) of
    0: begin

       end;
    1: begin

       end;
    2: begin
          if ed_valor_troco.Value > 0  then

          dm.ACBrNFe1.NotasFiscais[0].NFe.pag.vTroco := (ed_total_pago.Value - dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF);
       end;
   end;





//  dm.ACBrNFe1.DANFE.vTroco  := ed_valor_troco.Value;
//  dm.ACBrNFeDANFeESCPOS.vTroco := ed_valor_troco.Value;









  if (  StrToInt(dm.LeIni(2,'NFCE','forçarContingenciaOffline'))  = 0 ) then
   begin
     if (  (dm.VerificaConexaoInternet() = false)  ) then // Verifica a conexão com a internet
      begin

       segundosEnvioNFCE := 3;
       exibirMensagemPainelInformacoes('Emissão em contingência','',segundosEnvioNFCE,4,true);
       frm_encerramento.SetMensagemPainelInformacoes('Emitindo em modo de contingência offline.',
                              ' O Sistema não conseguiu se conectar com o servidor da SEFAZ.' +
                              '´Possivelmente sua conexão está instável ou o servidor está congestionado.'
                                ,segundosEnvioNFCE,4,true);


       while (segundosEnvioNFCE >=0 ) do
        begin

          frm_encerramento.SetMensagemPainelInformacoes('Emitindo em modo de contingência offline.',
                              ' O Sistema não conseguiu se conectar com o servidor da SEFAZ.' +
                              '´Possivelmente sua conexão está instável ou o servidor está congestionado.'
                                ,segundosEnvioNFCE,4,true);
           Sleep(1000);
           Application.ProcessMessages();
           segundosEnvioNFCE := segundosEnvioNFCE -1;
        end;

      fecharPainelInformacoes();


        horaInicioEmissao := now;
        if  dm.enviaNFCEContingencia() = true then
        begin
         result := true;
         horaFimEmissao := Now;
         tempoEmissaoNota := SecondsBetween(horaInicioEmissao, horaFimEmissao);
         dm.adicionaLog('Tempo de emissão: '+IntToStr(tempoEmissaoNota)+' segundos');

        end
        else
         begin
          Result := false;
          exit;
         end;

      end
     else
       begin
         horaInicioEmissao := Now;
         segundosEnvioNFCE := 15;
         dm.terminouEnvioNFCE := false;
         dm.tentandoEmissaoContingencia := false;
         dm.nfceEnviada := false;
         exibirMensagemPainelInformacoes('Enviando NFC-e ...','',segundosEnvioNFCE,0,true);
         dm.IdThreadComponent1.Start;
         frm_encerramento.Enabled := false;
         while not dm.terminouEnvioNFCE  do
          begin
           if dm.tentandoEmissaoContingencia = false then
             begin
               if segundosEnvioNFCE <=2 then
                 segundosEnvioNFCE := 10;

                 SetMensagemPainelInformacoes('Enviando NFC-e ...','',segundosEnvioNFCE,0,true);
    //           setMensagemOperador('Enviando NFC-e. Aguarde...('+IntToStr(segundosEnvioNFCE)+')');
                 segundosEnvioNFCE := segundosEnvioNFCE-1;
                 Sleep(1000);

             end;
            Application.ProcessMessages();
          end;


         if  dm.nfceEnviada  then
          begin
            horaFimEmissao := Now;
            tempoEmissaoNota := SecondsBetween(horaInicioEmissao, horaFimEmissao);
            dm.adicionaLog('Tempo de emissão: '+IntToStr(tempoEmissaoNota)+' segundos');
            fecharPainelInformacoes();
            result := true;
          end
         else
         begin
           segundosEnvioNFCE := 20;
           while segundosEnvioNFCE >=0 do
            begin
              SetMensagemPainelInformacoes(lbTituloMensagem.Caption , trim(lbMensagemErro.lines.Text) ,segundosEnvioNFCE,2,false);
              Sleep(1000);
              Application.ProcessMessages();
              segundosEnvioNFCE  := segundosEnvioNFCE -1
            end;

           fecharPainelInformacoes();
           podeFecharFormulario := true;
           Close;

           Result := false;
           exit;
         end;

       end;

   end

  else
   begin
     segundosEnvioNFCE := 6;
     exibirMensagemPainelInformacoes('Emissão em contingência','',segundosEnvioNFCE,4,true);
     frm_encerramento.SetMensagemPainelInformacoes('Emitindo em modo de contingência offline.',
                            ' O modo fixo de contingência está ativado. Esse modo só deve ser usado' +
                            '´em casos de URGÊNCIA autorizados pela Real Softwares.'
                              ,segundosEnvioNFCE,4,true);


     while (segundosEnvioNFCE >=0 ) do
      begin

     exibirMensagemPainelInformacoes('Emissão em contingência','',segundosEnvioNFCE,4,true);
     frm_encerramento.SetMensagemPainelInformacoes('Emitindo em modo de contingência offline.',
                            ' O modo fixo de contingência está ativado. Esse modo só deve ser usado' +
                            '´em casos de URGÊNCIA autorizados pela Real Softwares.'
                              ,segundosEnvioNFCE,4,true);
         Sleep(1000);
         Application.ProcessMessages();
         segundosEnvioNFCE := segundosEnvioNFCE -1;
      end;

    fecharPainelInformacoes();



    if  dm.enviaNFCEContingencia () = true then
    begin
       if StrToInt(dm.LeIni(2,'NFCE','qtdeEmitidasContingencia')) >= 10 then
         Begin
           dm.desativarModoContingenciaOFFlineNFCE();
         End;

      result := true
    end
    else
     begin
      Result := false;
      exit;
     end;

   end;


  result := true;
end;





function Tfrm_encerramento.emitirNFE() : boolean;
var
 numNFCE :  integer;
 Sincrono : boolean;

begin

  result := false;

  string_auxiliar :='';
  string_auxiliar2 := '';

  application.CreateForm(TfrmEmissaoNFEEncerramento,frmEmissaoNFEEncerramento);
  frmEmissaoNFEEncerramento.showmodal;
  frmEmissaoNFEEncerramento.free;

  if (verificaExistenciaFornecedor(string_auxiliar)  = false )   then
   begin
     exibe_painel_erro('Cliente/Fornecedor inexistente!','Clique para continuar');
     Result := false;
     exit;
   end
  else
    begin
      codClienteNFE55  := string_auxiliar;
    end;


  dm.tb_parametros.Active := true;
  Sincrono  := false;
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.Configuracoes.Geral.ModeloDF              := moNFe;



  with dm.ACBrNFe1.NotasFiscais.Add.NFe do
   begin
     with autXML.Add do
      begin
       CNPJCPF := dm.tb_parametrosCNPJ_CONTABILISTA.Value;
      end;

    // Dados do Responsável Técnico
    if ( StrToInt(dm.LeIni(1,'NFE','RespTec') ) = 1 ) then
     begin
       infRespTec.CNPJ     := '08101553000142';
       infRespTec.xContato := 'JOÃO MARCOS SANTOS DA SILVA';
       infRespTec.email    := 'joao@realsoftwares.com.br';
       infRespTec.fone     := '71999882928';
     end;



     Ide.cNF       := 1;
     Ide.natOp     := 'VENDA';
     Ide.indPag    := ipVista;
     Ide.modelo    := 55;
     Ide.serie     := 1;
     Ide.nNF       := 1;
     Ide.dEmi      := now;
     Ide.dSaiEnt   := now;
     Ide.hSaiEnt   := now;

     Ide.tpNF      := tnSaida;

       case StrToInt(dm.LeIni(1,'NFE','ambienteEmissao'))  of
      1: begin
           Ide.tpAmb := taHomologacao;
           dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;
           {
           if StrToInt(dm.LeIni(1,'NFCE','QrCodeAmbienteHomologacao')) = 1  then
              dm.ACBrNFe1.Configuracoes.Geral.IncluirQRCodeXMLNFCe := true
           else}
//              dm.ACBrNFe1.Configuracoes.Geral.IncluirQRCodeXMLNFCe := false;
         end;
      2: begin
           dm.ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao;{
           Ide.tpAmb := taProducao;
           if StrToInt(dm.LeIni(1,'NFCE','qrCodeAmbienteProducao')) = 1 then
              dm.ACBrNFe1.Configuracoes.Geral.IncluirQRCodeXMLNFCe := true
           else     }
//[              dm.ACBrNFe1.Configuracoes.Geral.IncluirQRCodeXMLNFCe := false ;

         end;
     end;






     Ide.cUF       := UFtoCUF(dm.tb_parametrosUF.Value);
     Ide.cMunFG    := StrToInt(dm.tb_parametrosCOD_MUNICIPIO_IBGE.value );
     Ide.finNFe    := fnNormal;
     Ide.tpImp     := tiRetrato;
     Ide.indFinal  := cfConsumidorFinal;
     Ide.indPres   := pcPresencial;

     Emit.CNPJCPF           := dm.tb_parametrosCNPJ.Value;
     Emit.IE                := dm.tb_parametrosIE.Value;
     Emit.xNome             := dm.tb_parametrosRAZAO_SOCIAL.Value;
     Emit.xFant             := dm.tb_parametrosNOME_FANTASIA.Value;
     Emit.EnderEmit.fone    := dm.tb_parametrosTELEFONE_EMPRESA.Value;
     Emit.EnderEmit.CEP     := StrToInt(dm.tb_parametrosCEP.value);
     Emit.EnderEmit.xLgr    := dm.tb_parametrosLOGRADOURO.Value;
     Emit.EnderEmit.nro     := dm.tb_parametrosNUMERO.Value;
     Emit.EnderEmit.xCpl    := dm.tb_parametrosCOMPLEMENTO.Value;
     Emit.EnderEmit.xBairro := dm.tb_parametrosBAIRRO.Value;

     //se for brasileiro
      Emit.EnderEmit.cMun    := StrToInt(dm.tb_parametrosCOD_MUNICIPIO_IBGE.Value);
      Emit.EnderEmit.xMun    := dm.tb_parametrosNOME_CIDADE_CONTRIBUINTE.Value;
      Emit.EnderEmit.UF      := dm.tb_parametrosUF.Value;
      Emit.enderEmit.cPais   := 1058;
      Emit.enderEmit.xPais   := 'BRASIL';
      Emit.IEST              := '';





      if simplesNacional  then
       Emit.CRT               := crtSimplesNacional // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
      else
       Emit.CRT := crtRegimeNormal;


      dm.qryauxiliar.Active := false;
      dm.qryauxiliar.SQL.Clear;
      dm.qryauxiliar.SQL.add('select f.*, c.nome as nome_cidade, e.nome as nome_estado, e.sigla as UF from fornecedor f ');
      dm.qryauxiliar.SQL.add(' inner join cidade c on (c.cod_cidade = f.cod_cidade)');
      dm.qryauxiliar.SQL.add(' inner join estado e on (e.codigo = f.cod_estado)');
      dm.qryauxiliar.SQL.add(' where f.cod_fornecedor='+Quotedstr(codClienteNFE55));

      dm.qryauxiliar.Active := true;

      if (dm.qryauxiliar.FieldByName('inscricao_estadual').Value <> null) then
       begin
         Dest.indIEDest := inContribuinte;
         Dest.IE :=dm.qryauxiliar.FieldByName('inscricao_estadual').Value;
       end
      else
         Dest.indIEDest         := inIsento;


      Dest.CNPJCPF           := dm.qryauxiliar.FieldByName('cgc_cpf').Value;
      Dest.ISUF              := '';
      Dest.xNome             := dm.qryauxiliar.FieldByName('razao_social').Value;

      nomeClienteNFE55 := Dest.xNome;

      if (dm.qryauxiliar.FieldByName('telefone').Value <> null) then
        Dest.EnderDest.Fone    := dm.qryauxiliar.FieldByName('telefone').Value
      else
        Dest.EnderDest.Fone    :='';


      Dest.EnderDest.CEP     := dm.qryauxiliar.FieldByName('cep').Value;
      Dest.EnderDest.xLgr    := dm.qryauxiliar.FieldByName('endereco').Value;
      Dest.EnderDest.nro     := dm.qryauxiliar.FieldByName('NUM_ENDERECO').Value;

      if (dm.qryauxiliar.FieldByName('complemento').Value <> null) then
         Dest.EnderDest.xCpl    := dm.qryauxiliar.FieldByName('complemento').Value
      else
        Dest.EnderDest.xCpl    := '';

      Dest.EnderDest.xBairro := dm.qryauxiliar.FieldByName('bairro').Value;

      Transp.modFrete := mfSemFrete; // NFC-e não pode ter FRETE

      if (dm.qryauxiliar.FieldByName('COD_PAIS').Value <> '1058') then
       begin
         Ide.indFinal   := cfConsumidorFinal;
         Dest.indIEDest := inNaoContribuinte;
         Ide.finNFe     := fnNormal;
         Dest.EnderDest.cMun    := StrToInt('9999999');
         Dest.EnderDest.xMun    := 'EXTERIOR';
         Dest.EnderDest.UF      := 'EX';
         Dest.EnderDest.cPais   := StrToInt('6076'); //StrToInt(dm.qryauxiliar.FieldByName('COD_PAIS').Value);
         Dest.EnderDest.xPais   := 'PORTUGAL'; //dm.qryauxiliar.FieldByName('NOME_PAIS').Value;
         Dest.CNPJCPF           := FormatFloat('00000000000000',StrToFloat(  dm.qryauxiliar.FieldByName('cgc_cpf').Value));
       end
      ELSE
       begin
        Dest.EnderDest.cMun    := dm.qryauxiliar.FieldByName('cod_cidade').Value;
        Dest.EnderDest.xMun    := dm.qryauxiliar.FieldByName('nome_cidade').Value;
        Dest.EnderDest.UF      := dm.qryauxiliar.FieldByName('uf').Value;
        Dest.EnderDest.cPais   := 1058;
        Dest.EnderDest.xPais   := 'BRASIL';
       end;
      registraItensNFCE(lb_mesa.Caption);

      tbFormasPagamentoTemp.First;
      while not tbFormasPagamentoTemp.Eof do
       begin

        with pag.Add do //PAGAMENTOS apenas para NFC-e
         begin
           tPag := dm.getTipoPagamentoNFCE(tbFormasPagamentoTempcodForma.Value);


           tpIntegra := tiPagNaoIntegrado;
          if  tbFormasPagamentoTempcodForma.value = '001' then
           begin
             vPag := tbFormasPagamentoTempvalorForma.Value - ed_valor_troco.Value;
           end
          else
             vPag := tbFormasPagamentoTempvalorForma.Value;
         end;
         tbFormasPagamentoTemp.Next;
       end;





      InfAdic.infCpl     :=  string_auxiliar2;
  //    InfAdic.infAdFisco :=  '';


{      with InfAdic.obsCont.Add do
       begin
         xCampo := 'ObsCont';
         xTexto := 'Texto';
       end;

      with InfAdic.obsFisco.Add do
       begin
         xCampo := 'ObsFisco';
         xTexto := 'Texto';
       end; }

   end;

   case strToInt( dm.LeIni(2,'NFE','versaoNFE')) of
    0: begin

       end;
    1: begin

       end;
    2: begin
          dm.ACBrNFe1.NotasFiscais[0].NFe.pag.vTroco := (ed_total_pago.Value - dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF);
       end;
   end;

//  dm.ACBrNFe1.DANFE.vTroco  := ed_valor_troco.Value;


  if  dm.setFormaEmissaOnlineNFE() = true then
   result := true
  else
   begin
    Result := false;
    exit;
   end;


  result := true;

end;




function Tfrm_encerramento.emitirCupomSATCFE() : boolean;
var
 numNFCE :  integer;
 vSincrono : String;
 Sincrono : boolean;
begin

  result := false;

  dm.tb_parametros.Active := true;

  with dm.sat do
  begin
    dm.inicializarSAT();
    InicializaCFe ;

    with CFe do
     begin
      ide.numeroCaixa := strToInt(numero_caixa);
      Dest.CNPJCPF := cpfClienteCupomFiscal;
      Dest.xNome   := nomeClienteCupom;

      Entrega.xLgr    := '';
      Entrega.nro     := '';
      Entrega.xCpl    := '';
      Entrega.xBairro := '';
      Entrega.xMun    := '';
      Entrega.UF      := '';
     end;
  end;



  registraItensNFCE(lb_mesa.Caption);

  tbFormasPagamentoTemp.First;


  while not tbFormasPagamentoTemp.Eof do
   begin

    with dm.sat.CFe.Pagto.add  do //PAGAMENTOS apenas para NFC-e
     begin
      cMP := dm.getTipoPagamentoSAT(tbFormasPagamentoTempcodForma.Value);



      if  tbFormasPagamentoTempcodForma.value = '001' then
         vMP := tbFormasPagamentoTempvalorForma.Value - ed_valor_troco.Value
      else
         vMP := tbFormasPagamentoTempvalorForma.Value;
     end;
     tbFormasPagamentoTemp.Next;
   end;



      if (lb_mesa.Caption  = mesaBalcao) then
        begin
          codPedidoBalcao := dm.geraCodigo('G_PEDIDOS_BALCAO',4);
          obsRodapeCupomFiscal:= 'PEDIDO BALCAO Nº: '+codPedidoBalcao  +#13#10;
        end;

  Result := dm.enviarCupomSat();


end;










function Tfrm_encerramento.registraItensNFCE(mesa : string) : boolean;
var
 q                  : TIBQuery;
 ctItemCupom        : integer;
 baseICMS           : real;
 valorICMS          : real;
 valorProduto       : currency;
 totalProdutos      : currency;
 descontoItem       : double;
 totalDescontoItem  : double;
 restoDescontos     : double;
 valorImpostosIBPT  : double;
 valorItemSAt       : real;

 BasePis,baseCofins : currency;
 totalPis,totalCofins : currency;


//




begin



 totalProdutos     := 0;
 valorICMS         := 0;
 baseICMS          := 0;
 valorImpostosIBPT :=0;
 valorItemSAt      :=0;

 totalPis     := 0;
 totalCofins  := 0;
 BasePis      := 0;
 baseCofins   := 0;
{
 frmPainelAguarde.Memo1.Lines.Clear;
 frmPainelAguarde.Memo1.Lines.Add('REGISTRANDO ÍTENS NO CUPOM FISCAL'+#13+#10' POR FAVOR, AGUARDE...');
 frmPainelAguarde.Show;
 }
 q := TIBQuery.Create(self);
 q.Database := dm.dbrestaurante;
 q.Transaction := dm.transacao;
 q.Active:=false;
 q.sql.clear;
 q.sql.add('select * from (');
 q.sql.add(' select p.cod_barras, p.descricao,p.cfop_saida,p.ncm,p.cest, p.un_ecf,p.cst_saida, al.percentual_icms,vm.quantidade as quantidade,');
 q.sql.add(' vm.valor_unitario, vm.cancelado, al.percentagem as aliquota, ');
  q.sql.add(' p.reducao_base_icms as percentual_red_base_icms,  p.aliq_pis,p.aliq_cofins, p.cst_pis_cofins, ');
 q.sql.add(' udf_roundabnt((vm.valor_unitario * vm.quantidade),2) as total_produto,');
 q.sql.add(' udf_roundabnt( (vm.valor_unitario * vm.quantidade) * (p.reducao_base_icms  /100),2) as total_reducao_base_icms, ');
 q.sql.add('  udf_roundabnt( (udf_roundabnt((vm.valor_unitario * vm.quantidade),2) -  udf_roundabnt( (vm.valor_unitario * vm.quantidade) * (p.reducao_base_icms  /100),2)),2) AS base_icms_total, ');
 q.sql.add(' udf_roundabnt( ((udf_roundabnt((vm.valor_unitario * vm.quantidade),2) -  udf_roundabnt( (vm.valor_unitario * vm.quantidade) * (p.reducao_base_icms  /100),2)) * (al.percentual_icms /100) ),2) as valor_icms ');

 q.sql.add(' from movimento_mesa vm');

 q.sql.add('        inner join produtos p on (p.cod_produto = vm.cod_produto)');
 q.sql.add('        inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)');
 q.sql.add('         where vm.cod_mesa='+QuotedStr(mesa)+ 'and vm.valor_unitario > 0  ');
 q.sql.add('         and vm.id not in (select distinct sb.id_mov_mesa from sabores_pizza_movimento_mesa  sb ) ');


 q.sql.add(' union all ');
 q.sql.add(' select p.cod_barras, p.descricao,p.cfop_saida,p.ncm,p.cest, p.un_ecf,p.cst_saida, al.percentual_icms,vm.quantidade as quantidade, ');
 q.sql.add(' vm.valor_unitario_sabor, ms.cancelado, al.percentagem as aliquota,');
 q.sql.add(' p.reducao_base_icms as percentual_red_base_icms,   p.aliq_pis,p.aliq_cofins, p.cst_pis_cofins, ');
 q.sql.add(' udf_roundabnt((vm.valor_unitario_sabor  * vm.quantidade),3) as total_produto,');
 q.sql.add(' udf_roundabnt((vm.valor_unitario_sabor * vm.quantidade) * (p.reducao_base_icms / 100),3) as total_reducao_base_icms,');
 q.sql.add('  udf_roundabnt( (udf_roundabnt((vm.valor_unitario_sabor * vm.quantidade),3) -  udf_roundabnt( (vm.valor_unitario_sabor * vm.quantidade) * (p.reducao_base_icms  /100),3)),2) aS base_icms_total,');
 q.sql.add('  udf_roundabnt( ((udf_roundabnt((vm.valor_unitario_sabor * vm.quantidade),3) -  udf_roundabnt( (vm.valor_unitario_sabor * vm.quantidade) * (p.reducao_base_icms  /100),3)) * (al.percentual_icms /100) ),2) as valor_icms');
 q.sql.add('  from sabores_pizza_movimento_mesa  vm');
 q.sql.add('         inner join produtos p on (p.cod_produto = vm.cod_produto)');
 q.sql.add('         inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)');
 q.sql.add('         inner join movimento_mesa ms on (ms.id = vm.id_mov_mesa)');
 q.sql.add('         where ms.cod_mesa='+QuotedStr(mesa));



 if (ed_total_tx_serv.Value > 0 ) then
  begin
   q.sql.add('          union all  ');
   q.sql.add(' select p.cod_barras, p.descricao,p.cfop_saida,p.ncm,'+quotedstr(' ')+' as cest, p.un_ecf,p.cst_saida, al.percentual_icms,');
   q.sql.add('       1 as quantidade,');
   q.sql.add(''+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+' ');
   q.sql.add(' as valor_unitario, 0 as cancelado, al.percentagem as aliquota,');
   q.sql.add(' p.reducao_base_icms as percentual_red_base_icms,   p.aliq_pis,p.aliq_cofins, p.cst_pis_cofins, ');
   q.sql.add(''+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+' as total_produto, ');
   q.sql.add(' udf_roundabnt( ('+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+') * (p.reducao_base_icms  /100),2) as total_reducao_base_icms, ');
   q.sql.add('  udf_roundabnt( (udf_roundabnt(('+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+'),2) -  udf_roundabnt( ('+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+') * (p.reducao_base_icms  /100),2)),2) AS base_icms_total, ');
   q.sql.add(' udf_roundabnt( ((udf_roundabnt(('+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+'),2) -  udf_roundabnt( ('+dm.TrocaVirgPPto(Floattostr(ed_total_tx_serv.Value))+') * (p.reducao_base_icms  /100),2)) * (al.percentual_icms /100) ),2) as valor_icms ');



   q.sql.add('         from  produtos p');
   q.sql.add('         inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)');
   q.sql.add('         where p.cod_produto = '+Quotedstr('99999'));
  end;

 if (ed_total_entrega .Value > 0 ) then
  begin
   q.sql.add('          union all  ');
   q.sql.add(' select p.cod_barras, p.descricao,p.cfop_saida,p.ncm,'+quotedstr(' ')+' as cest,p.un_ecf,p.cst_saida, al.percentual_icms,');
   q.sql.add('       1 as quantidade,');
   q.sql.add(''+dm.TrocaVirgPPto(Floattostr(ed_total_entrega.Value))+' ');
   q.sql.add(' as valor_unitario, 0 as cancelado, al.percentagem as aliquota,');
   q.sql.add(' p.reducao_base_icms as percentual_red_base_icms,   p.aliq_pis,p.aliq_cofins, p.cst_pis_cofins, ');
   q.sql.add(''+dm.TrocaVirgPPto(Floattostr(ed_total_entrega .Value))+' as total_produto, ');
   q.sql.add(' udf_roundabnt( ('+dm.TrocaVirgPPto(Floattostr(ed_total_entrega.Value))+') * (p.reducao_base_icms  /100),2) as total_reducao_base_icms, ');
   q.sql.add('  udf_roundabnt( (udf_roundabnt(('+dm.TrocaVirgPPto(Floattostr(ed_total_entrega.Value))+'),2) -  udf_roundabnt( ('+dm.TrocaVirgPPto(Floattostr(ed_total_entrega.Value))+') * (p.reducao_base_icms  /100),2)),2) AS base_icms_total, ');
   q.sql.add(' udf_roundabnt( ((udf_roundabnt(('+dm.TrocaVirgPPto(Floattostr(ed_total_entrega.Value))+'),2) -  udf_roundabnt( ('+dm.TrocaVirgPPto(Floattostr(ed_total_entrega.Value))+') * (p.reducao_base_icms  /100),2)) * (al.percentual_icms /100) ),2) as valor_icms ');



   q.sql.add('         from  produtos p');
   q.sql.add('         inner join aliquotas al on (al.cod_aliquota = p.cod_aliquota)');
   q.sql.add('         where p.cod_produto = '+Quotedstr('99998'));
  end;


 q.sql.add(') order by cod_barras');

 dm.adicionaLog(q.SQL.text);



 q.Active:=true;
 q.First;
 while not q.Eof do
  begin
    if ( ( q.fieldbyname('cod_barras').Value <> '99998') and (q.fieldbyname('cod_barras').Value <> '99999') ) then
       begin
          descontoItem := q.fieldbyname('total_produto').Value * 100;
          descontoItem := (descontoItem  / ed_valor_bruto.Value) / 100;
          descontoItem := RoundTo (  (descontoItem * ed_total_desconto.Value),-2);
          totalDescontoItem := totalDescontoItem + descontoItem;
       end;
    q.Next;
  end;

  restoDescontos := ed_total_desconto.Value - totalDescontoItem;



 q.Active:=true;
 q.First;

     totalDescontoItem := 0;
     dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vProd :=0;
     ctItemCupom := 1;
     while not q.Eof do
       begin
          valorProduto := 0;
          valorProduto := RoundABNT( q.fieldbyname('total_produto').Value,-2);
          dm.adicionaLog('Valor do Produto: '+CurrToStr(valorProduto));
          if q.fieldbyname('cancelado').Value <> 1 then
           begin

             descontoItem := 0;
             if ( ( q.fieldbyname('cod_barras').Value <> '99998') and (q.fieldbyname('cod_barras').Value <> '99999') ) then
              begin
                descontoItem := valorProduto  * 100;
                descontoItem := (descontoItem  / ed_valor_bruto.Value) / 100;
                descontoItem := RoundTo (  (descontoItem * ed_total_desconto.Value),-2) + restoDescontos;
                restoDescontos :=0;
              end;


             totalProdutos :=totalProdutos + valorProduto;





            if ( (modeloComprovanteFiscal=2) or (modeloComprovanteFiscal=3) ) then
             begin

                with dm.ACBrNFe1.NotasFiscais[0].NFe.det.Add do
                 begin
                   Prod.nItem    := ctItemCupom;
                   Prod.cProd    := q.fieldbyname('cod_barras').Value;
                   Prod.cEAN     := '';
                   Prod.xProd    := q.fieldbyname('descricao').Value;

                  { infAdProd:=
                      'VEICULO USADO: CHEVROLET/MONTANA L5'
                      +'CHASSI: 9BGCA80X0DB355745'
                      +'RENAVAM:566855763'
                      +'PLACA: OUO9999'
                      +'COMBUSTIVEL: ALCOOL/GASOLINA'
                      +'MOTOR: CSB080817'
                      +'COR EXT: BRANCA'
                      +'COR INT: BRANCA'
                      +'ANO MOD/FAB: 2013/2013';
                   }


                   Prod.NCM      := q.fieldbyname('ncm').Value;


                   Prod.cEAN := 'SEM GTIN';
                   Prod.cEANTrib := 'SEM GTIN';

                   if ( ( q.FieldByName('cest').Value <> null) and ( trim(q.FieldByName('cest').Value) <> '') ) then
                    begin
                      Prod.CEST := trim(q.FieldByName('cest').Value);
                    end;



                   Prod.EXTIPI   := '';
                   Prod.CFOP     := q.fieldbyname('cfop_saida').Value;
                   Prod.uCom     := q.fieldbyname('UN_ECF').Value;
                   Prod.qCom     := q.fieldbyname('quantidade').Value;
                   Prod.vUnCom   := q.fieldbyname('valor_unitario').Value;
                   Prod.vProd    := valorProduto;

                   dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vProd := RoundABNT((dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vProd + Prod.vProd),-2);


                   Prod.uTrib     := q.fieldbyname('UN_ECF').Value;
                   Prod.qTrib     := q.fieldbyname('quantidade').Value;
                   Prod.vUnTrib   := q.fieldbyname('valor_unitario').Value;

                   Prod.vOutro    := 0;
                   Prod.vFrete    := 0;
                   Prod.vSeg      := 0;
                   Prod.vDesc     := descontoItem;



          //         infAdProd      := 'Informação Adicional do Produto';

                   with Imposto do
                    begin
                      // lei da transparencia nos impostos
                      vTotTrib := 0;

                      with ICMS do
                       begin
                         case StrToInt(copy(q.fieldbyname('CST_SAIDA').Value,0,1)) of
                           0 : ICMS.orig    := oeNacional;
                           1 : ICMS.orig    := oeEstrangeiraImportacaoDireta;
                           2 : ICMS.orig    := oeEstrangeiraAdquiridaBrasil;
                           3 : ICMS.orig    := oeNacionalConteudoImportacaoSuperior40;
                           4 : ICMS.orig    := oeNacionalProcessosBasicos;
                           5 : ICMS.orig    := oeNacionalConteudoImportacaoInferiorIgual40;
                           6 : ICMS.orig    := oeEstrangeiraImportacaoDiretaSemSimilar;
                           7 : ICMS.orig    := oeEstrangeiraAdquiridaBrasilSemSimilar;
                           8 : ICMS.orig    := oeNacionalConteudoImportacaoSuperior70;
                         end;

                         case StrToInt(copy(q.fieldbyname('CST_SAIDA').Value,1,3)) of
                           00 :  cst:= cst00;
                           10 :  cst := cst10;
                           20 :  cst  := cst20;
                           30 :  CST := cst30;
                           40 :  CST := cst40;
                           50 :  CST := cst50;
                           60 :  CST := cst60;
                           70 :  CST := cst70;
                           80 :  CST := cst90;
                           81 :  CST := cst81;
                           90 :  CST := cst90;
                           41 :  CST := cst41;
                         end;

                         ICMS.modBC   := dbiValorOperacao;

                         if (simplesNacional = false) then
                          begin
                             if q.fieldbyname('percentual_icms').Value > 0 then
                              begin
    //                           ICMS.CSOSN := csosn101; // verificar isso depois
                                ICMS.vBC        :=  q.fieldbyname('base_icms_total').Value;
                                icms.pRedBC     :=  q.fieldbyname('percentual_red_base_icms').Value;
                                ICMS.pICMS      :=  q.fieldbyname('percentual_icms').Value;
                                ICMS.vICMS      :=  q.fieldbyname('valor_icms').Value;
                                baseICMS  := baseICMS + Q.fieldbyname('base_icms_total').Value;
                                valorICMS := ICMS.vICMS + valorICMS;

                             end
                           else
                             begin
                               ICMS.vBC     := 0;
                               ICMS.pICMS   := 0;
                               ICMS.vICMS   := 0;
                             end;

                             ICMS.pMVAST  := 0;
                             ICMS.pRedBCST:= 0;
                             ICMS.vBCST   := 0;
                             ICMS.pICMSST := 0;
                             ICMS.vICMSST := 0;
                             ICMS.pRedBC  := 0;





                          end
                         else
                          begin
                              // Se deve destacar o iposto na NFCE
                              if destacaImpostoNFCE then
                                begin
                                 ICMS.vBC        :=  q.fieldbyname('base_icms_total').Value;
                                 icms.pRedBC     :=  q.fieldbyname('total_reducao_base_icms').Value;
                                 ICMS.pICMS      :=  q.fieldbyname('percentual_icms').Value;
                                 ICMS.vICMS      :=  q.fieldbyname('valor_icms').Value;
                                 baseICMS  := baseICMS + Q.fieldbyname('base_icms_total').Value;
                                 valorICMS := ICMS.vICMS + valorICMS;
                               end
                              else
                               begin
                                 ICMS.vBC     := 0;
                                 ICMS.pICMS   := 0;
                                 ICMS.vICMS   := 0;
                                 baseICMS     := 0;
                                 valorICMS    := 0;

                               end;

                               case strtoint(q.fieldbyname('cfop_saida').Value) of
                                5102 : ICMS.CSOSN := csosn102;
                                5403 : ICMS.CSOSN := csosn500;
                                5405 : ICMS.CSOSN := csosn500;
                               end;

                             ICMS.vBC     := 0;
                             ICMS.pICMS   := 0;
                             ICMS.vICMS   := 0;
                             baseICMS  := 0;
                             valorICMS := 0;
                             ICMS.pMVAST  := 0;
                             ICMS.pRedBCST:= 0;
                             ICMS.vBCST   := 0;
                             ICMS.pICMSST := 0;
                             ICMS.vICMSST := 0;
                             ICMS.pRedBC  := 0;
                          end
                       end;


                       // colocar aqui as informações de Pis / Cofins

                       case strToInt(q.fieldbyname('cst_pis_cofins').Value) of
                        1: begin
                             COFINS.CST := cof01;
                             PIS.CST := pis01;
                           end;

                        2: begin
                             COFINS.CST := cof02;
                             PIS.CST := pis02;
                           end;

                        3: begin
                             COFINS.CST := cof03;
                             PIS.CST := pis03;
                           end;

                        4: begin
                             COFINS.CST := cof04;
                             PIS.CST := pis04;
                           end;


                        5: begin
                             COFINS.CST := cof05;
                             PIS.CST := pis05;
                           end;

                        6: begin
                             COFINS.CST := cof06;
                             PIS.CST := pis06;
                           end;

                        7: begin
                             COFINS.CST := cof07;
                             PIS.CST := pis07;
                           end;

                        8: begin
                             COFINS.CST := cof08;
                             PIS.CST := pis08;
                           end;

                        9: begin
                             COFINS.CST := cof09;
                             PIS.CST := pis09;
                           end;

                        49: begin
                             COFINS.CST := cof49 ;
                             PIS.CST := pis49;
                           end;

                        50: begin
                             COFINS.CST := cof50 ;
                             PIS.CST := pis50;
                           end;

                        51: begin
                             COFINS.CST := cof51 ;
                              PIS.CST := pis51;
                           end;

                        52: begin
                             COFINS.CST := cof52 ;
                              PIS.CST := pis52;
                           end;

                        53: begin
                             COFINS.CST := cof53 ;
                  			     PIS.CST := pis53;
                           end;

                        54: begin
                             COFINS.CST := cof54 ;
                              PIS.CST := pis54;
                           end;


                        55: begin
                             COFINS.CST := cof55 ;
                              PIS.CST := pis55;
                           end;

                        56: begin
                             COFINS.CST := cof56 ;
                              PIS.CST := pis56;
                           end;

                        60: begin
                             COFINS.CST := cof60 ;
                              PIS.CST := pis60;
                           end;

                        61: begin
                             COFINS.CST := cof61 ;
                              PIS.CST := pis61;
                           end;

                        62: begin
                             COFINS.CST := cof62 ;
                              PIS.CST := pis62;
                           end;

                        63: begin
                             COFINS.CST := cof63 ;
                              PIS.CST := pis63;
                           end;

                        64: begin
                             COFINS.CST := cof63 ;
                              PIS.CST := pis63;
                           end;


                        65: begin
                             COFINS.CST := cof65 ;
                              PIS.CST := pis65;
                           end;



                        66: begin
                             COFINS.CST := cof66 ;
                              PIS.CST := pis66;
                           end;

                        67: begin
                               COFINS.CST := cof67 ;
                              PIS.CST := pis67;
                           end;


                        70: begin
                             COFINS.CST := cof70 ;
                              PIS.CST := pis70;
                           end;

                        71: begin
                             COFINS.CST := cof71 ;
                              PIS.CST := pis71;
                           end;

                        72: begin
                             COFINS.CST := cof72 ;
                              PIS.CST := pis72;
                           end;

                        73: begin
                             COFINS.CST := cof73 ;
                              PIS.CST := pis73;
                           end;

                        74: begin
                             COFINS.CST := cof74 ;
                              PIS.CST := pis74;
                           end;

                        75: begin
                             COFINS.CST := cof75 ;
                              PIS.CST := pis75;
                           end;

                        98: begin
                             COFINS.CST := cof98 ;
                              PIS.CST := pis98;
                           end;

                        99: begin
                              COFINS.CST := cof99 ;
                              PIS.CST := pis99;
                           end;

                       end;


                       BasePis     := RoundABNT( valorProduto  ,-2);
                       baseCofins  :=  RoundABNT(  valorProduto  ,-2);

                       PIS.vBC   :=  BasePis;
                       PIS.pPIS  :=  q.fieldbyname('aliq_pis').Value;
                       pis.vPIS  := RoundABNT(     (  BasePis * ( q.fieldbyname('aliq_pis').Value / 100)),-2);
                       totalPis  := totalPis + PIS.vPIS;


                       COFINS.vBC      :=  baseCofins;
                       COFINS.pCOFINS  :=  q.fieldbyname('aliq_cofins').Value;
                       COFINS.vCOFINS  :=  RoundABNT ( ( baseCofins * ( q.fieldbyname('aliq_cofins').Value / 100)),-2);
                       totalCofins  := totalCofins + COFINS.vCOFINS;

                    end;
                 end ;
             end;

            //Se for SAT

            if ( (modeloComprovanteFiscal=4)) then
             begin
              with dm.sat.cfe.Det.Add do
               begin
                   valorItemSAt := valorProduto  - descontoItem;

                   nItem    := ctItemCupom;
                   Prod.cProd    := q.fieldbyname('cod_barras').Value;
                   Prod.cEAN     := '';

                   Prod.xProd    := q.fieldbyname('descricao').Value;
                   Prod.CFOP     := q.fieldbyname('cfop_saida').Value;
                   Prod.NCM      := q.fieldbyname('ncm').Value;
                   if ( ( q.FieldByName('cest').Value <> null) and ( trim(q.FieldByName('cest').Value) <> '') ) then
                    begin
                      Prod.CEST := trim(q.FieldByName('cest').Value);
                    end;


                   Prod.uCom     := q.fieldbyname('UN_ECF').Value;
                   Prod.qCom     := q.fieldbyname('quantidade').Value;
                   Prod.vUnCom   := q.fieldbyname('valor_unitario').Value;
                   Prod.indRegra := irArredondamento;
                   Prod.vProd    := valorProduto;
                   Prod.vDesc    := descontoItem;
                   Prod.vRatDesc  :=0;
                   Prod.vItem    :=  valorItemSAt;
                   Prod.vOutro   := 0;

                   with Imposto do
                    begin
                      with ICMS do
                       begin
                         case StrToInt(copy(q.fieldbyname('CST_SAIDA').Value,0,1)) of
                           0 : ICMS.orig    := oeNacional;
                           1 : ICMS.orig    := oeEstrangeiraImportacaoDireta;
                           2 : ICMS.orig    := oeEstrangeiraAdquiridaBrasil;
                           3 : ICMS.orig    := oeNacionalConteudoImportacaoSuperior40;
                           4 : ICMS.orig    := oeNacionalProcessosBasicos;
                           5 : ICMS.orig    := oeNacionalConteudoImportacaoInferiorIgual40;
                           6 : ICMS.orig    := oeEstrangeiraImportacaoDiretaSemSimilar;
                           7 : ICMS.orig    := oeEstrangeiraAdquiridaBrasilSemSimilar;
                           8 : ICMS.orig    := oeNacionalConteudoImportacaoSuperior70;
                         end;

                         case StrToInt(copy(q.fieldbyname('CST_SAIDA').Value,1,3)) of
                           00 :  cst:= cst00;
                           10 :  cst := cst10;
                           20 :  cst  := cst20;
                           30 :  CST := cst30;
                           40 :  CST := cst40;
                           50 :  CST := cst50;
                           60 :  CST := cst60;
                           70 :  CST := cst70;
                           80 :  CST := cst90;
                           81 :  CST := cst81;
                           90 :  CST := cst90;
                           41 :  CST := cst41;
                         end;

                         if (simplesNacional = true) then
                          begin
                            case strtoint(q.fieldbyname('cfop_saida').Value) of
                             5102 : ICMS.CSOSN := csosn102;
                             5403 : ICMS.CSOSN := csosn500;
                             5405 : ICMS.CSOSN := csosn500;
                            end;

                          end;

                         if q.fieldbyname('percentual_icms').Value > 0 then
                          begin
                            ICMS.pICMS   :=  q.fieldbyname('percentual_icms').Value;
                            valorICMS    := valorICMS + (   (valorItemSAt) * (q.fieldbyname('percentual_icms').Value / 100) );
                         end
                        else
                         begin
                           ICMS.pICMS   := 0;
                           ICMS.vICMS   := 0;
                         end;



                       end;


                      PIS.CST := pis49;
                      PIS.qBCProd :=0;
                      PIS.vAliqProd :=0;

                      COFINS.CST := cof49;
                      COFINS.qBCProd := 0;
                      COFINS.vAliqProd :=0;
                    end;

                   {
                    with Prod.obsFiscoDet.Add do
                    begin
                      xCampoDet := '';
                      xTextoDet := '';
                    end;
                    }
               end;
             end;

            ctItemCupom := ctItemCupom +1;
          end;

         q.Next;
       end;




      valorImpostosIBPT := (baseICMS   * aliquotaIBPT) / 100;

    if ( (modeloComprovanteFiscal=2) or (modeloComprovanteFiscal=3) ) then
     begin
      dm.ACBrNFe1.NotasFiscais[0].NFe.InfAdic.infCpl := 'Valor aprox. dos tributos ('+FormatFloat('#0.00',aliquotaIBPT)+') = '+FormatFloat('R$ #0.00',valorImpostosIBPT)+' fonte: IBPT'+#13#10;
       with dm.ACBrNFe1.NotasFiscais[0].NFe do
        begin
           Total.ICMSTot.vBC     := baseICMS;
           Total.ICMSTot.vICMS   := valorICMS;
           Total.ICMSTot.vBCST   := 0;
           Total.ICMSTot.vST     := 0;
//           Total.ICMSTot.vProd   := totalProdutos;
//           dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vProd
//           dm.adicionaLog('Total Produtos: '+FloatToStr(totalProdutos));
           Total.ICMSTot.vFrete  := 0;
           Total.ICMSTot.vSeg    := 0;
           Total.ICMSTot.vDesc   := ed_total_desconto.Value;
           Total.ICMSTot.vII     := 0;
           Total.ICMSTot.vIPI    := 0;
           Total.ICMSTot.vPIS    := RoundABNT  ( totalPis,-2);
           Total.ICMSTot.vCOFINS := RoundABNT  ( totalCofins,-2);
           Total.ICMSTot.vOutro  := 0;
           Total.ICMSTot.vNF     :=  ed_total_conta.Value;  //totalProdutos -  ed_total_desconto.Value;



           Total.ISSQNtot.vServ   := 0;
           Total.ISSQNTot.vBC     := 0;
           Total.ISSQNTot.vISS    := 0;
           Total.ISSQNTot.vPIS    := 0;
           Total.ISSQNTot.vCOFINS := 0;
        end;
     end
    else
      begin
         if (modeloComprovanteFiscal=4) then
          begin
             with dm.sat.CFe.Total  do
              begin
                ICMSTot.vICMS   := valorICMS;
                ICMSTot.vProd   := totalProdutos;
                ICMSTot.vPIS    :=0;
                ICMSTot.vCOFINS :=0;
                ICMSTot.vOutro  :=0;
                vCFe :=  totalProdutos -  ed_total_desconto.Value;
                vCFeLei12741:=0;
              end;

          end;
      end;



// frmPainelAguarde.Close;
 q.Active :=false;
 FreeAndNil(q);
 Result :=true;
end;




procedure Tfrm_encerramento.limpaMesadelivery();
var
 q : TIBquery;
begin

 q:= TIBQuery.create(self);
 q.Database := dm.dbrestaurante;
 q.Transaction := dm.transacao;
 q.sql.clear;
 q.sql.add('delete from movimento_mesa where cod_mesa='+Quotedstr(mesaDelivery));
 dm.adicionaLog(q.SQL.Text);
 q.ExecSQL;


 Q.active:=false;
 q.sql.clear;
 q.sql.add('delete from recebimento_parcial where mesa='+Quotedstr(mesaDelivery));
 dm.adicionaLog(q.SQL.Text);
 q.ExecSQL;



 dm.transacao.Commit;
 dm.transacao.Active:=false;
 dm.transacao.Active:=true;

 Q.Active:=false;
 FreeAndNil(q);

end;










procedure Tfrm_encerramento.FormCreate(Sender: TObject);
var
  SpeedButton4: TSpeedButton ;
   x : integer;
begin
  inherited;

  modeloComprovanteFiscal :=  StrToInt(dm.LeIni(2,'ENCERRAMENTO','modeloComprovantefiscal'));
  frm_principal.setNFE55VendaAtual(false);

 



  frm_principal.memoPagamentosTEF.Clear;
  dm.setOperacaoADMTEF(false);
  dm.setNumeroTransacaoTef(-1);
  transacaoTEFIniciada := false;
  dm.setEstadoSimuladoECF(tpsLivre);
  dm.setEstadoSimuladoECF(tpsVenda);
  codClienteNFE55 :='';

  if ( StrToInt(dm.LeIni(2,'TEF','instalado')) = 1 )
   then
     begin
        dm.autenticaTEF();
     end;

   tempoEmissaoNota := 0;
   dm.parametrizaAcbrNFE(moNFCe,false,true);
   veioDoCheckin := false;
   jaChamouActivate := false;
   application.CreateForm(TfrmPainelAguarde,frmPainelAguarde);
//   frmPainelAguarde.Memo1.Lines.Add('IMPRIMINDO CUPOM FISCAL'+#13+#10' POR FAVOR, AGUARDE...');

   pnConsultaFormas.Visible := false;
   dm.qryauxiliar.Active := false;
   dm.qryauxiliar.sql.Clear;
   dm.qryauxiliar.SQL.add(' select cod_forma,descricao from formas_pagamento order by cod_forma ');
   dm.qryauxiliar.Active := true;
   dm.qryauxiliar.First;
   x:=0;
   while ( (x < ComponentCount-1) and (dm.qryauxiliar.Eof = false) ) do
    begin
      if  Components[x].ClassName='TJvImgBtn' then
        begin
//          MakeRounded((components[x] as TSpeedButton));
           if  (Trim(copy( (components[x] as TJvImgBtn).Name ,0,7))  = 'btForma') then
            begin
             (components[x] as TJvImgBtn).Name :='forma'+ dm.qryauxiliar.fieldbyname('cod_forma').Value;
             (components[x] as TJvImgBtn).Caption :=  dm.qryauxiliar.fieldbyname('cod_forma').Value+#13+ dm.qryauxiliar.fieldbyname('descricao').Value;
             (components[x] as TJvImgBtn).Visible := true;
             (components[x] as TJvImgBtn).onClick :=  botaoClickFormaClick;

             dm.qryauxiliar.Next;

            end;

        end;
        x:= x+1;
    end;



end;

procedure Tfrm_encerramento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin




   if (pnOpcoes.Visible = true) then
    begin
      if ( (sender is TCurrencyEdit  and ((sender as TCurrencyEdit).Name='ed_valor_tx_serv')  ) )then
       begin
         if ( (Key = vk_return) or (Key = vk_f5) ) then
          begin
            iniciarEncerramentoDaConta;

          end;

       end;

       if key = vK_return then btIniciaEmissaoCupom.Click;
       if Key = vk_f5 then btDesconto.Click;
       if key = vk_f6 then btIdCliente.Click;
       if Key = vk_f7 then btCalculadora.Click;
       if key = vk_f10 then btIniciaEmissaoCupom.Click;
       if key = vk_f11 then btMenuFiscal.Click;
       if key = vk_escape then btCancelar.Click;

    end
   else
    begin
       if Key = vk_f7 then btCalculadora.Click;
       if key = vk_f10 then btEncerrarVenda.Click;
       if Key = VK_ESCAPE then btCancelar.Click;

    end;



end;




procedure Tfrm_encerramento.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(frmPainelAguarde);
//  dm.ACBrNFe1.Free;
end;

procedure Tfrm_encerramento.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
 segundosExibicaoMensagem : smallint;
begin
  inherited;

  if transacaoTEFIniciada  then
   begin
     Action := caNone;
       Action := caNone;
       segundosExibicaoMensagem := 20;
       ExibirMensagemPainelInformacoes('Transação de TEF já iniciada. ','',segundosExibicaoMensagem,8,true);



       while (segundosExibicaoMensagem >=0 ) do
        begin


          frm_encerramento.SetMensagemPainelInformacoes('Erro: Transação TEF já iniciada!','Uma transação de TEF foi iniciciada e aprovada.'+
                              'Caso deseje sair, será necessário cancelar a transação já aprovada e reiniciar o processo de pagamento. ' +LineBreak+
                              'Na janela à seguir, confirme se deseja cancelar a transação TEF atual',segundosExibicaoMensagem,8,true);
           Sleep(1000);
           Application.ProcessMessages();
           segundosExibicaoMensagem := segundosExibicaoMensagem -1;
        end;

          fecharPainelInformacoes();
          if dm.verificaPermissaoAcao('I20002019') = true then
           begin
            string_auxiliar:= '';
            Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
            frm_confirma_extrato.setTitulo('Confirmação');
            frm_confirma_extrato.setMensagem('Confirma o cancelamento da transação de TEF pendente   ?',12);
            frm_confirma_extrato.ShowModal;
            frm_confirma_extrato.free;
              if string_auxiliar = 'S' then
               begin

                 try
                  dm.ACBrTEFD1.CancelarTransacoesPendentes;
                  transacaoTEFIniciada := false;
                  dm.adicionaLog('Transação de TEF cancelada!');



                 except
                   dm.exibe_painel_erro('Erro ao cancelar transação TEF','Ok');
                   dm.adicionaLog('Erro ao cancelar transação TEF');
                   action := caNone;
                 end;

               end;
           end
        else
          begin
            action := caNone;
          end;




       Action := caNone;
  end;








  if (podeFecharFormulario = True) then
   begin

   end
  else
   begin
     Action := caNone;
     exibirMensagemInformacao('VENDA EM ANDAMENTO'+#13#10+'CANCELE PARA PROSSEGUIR!',6000,12, True);

   end;



end;

procedure Tfrm_encerramento.BitBtn5Click(Sender: TObject);
begin
  inherited;
//  btIniciaEmissaoCupom.SetFocus;
end;

procedure Tfrm_encerramento.btCalculadoraClick(Sender: TObject);
begin
  inherited;
    ACBrCalculadora1.Execute;
end;

procedure Tfrm_encerramento.btDescontoClick(Sender: TObject);
begin
  inherited;
   if (dm.verificaPermissaoAcao('B20002016') = true) then
     begin
      Application.CreateForm(TfrmDesconto,frmDesconto);
      frmDesconto.setOrigem(2);
      frmDesconto.ShowModal;
      frmDesconto.Free;
      calcula_valores(sender,true);
     end

end;

procedure Tfrm_encerramento.btIdClienteClick(Sender: TObject);
begin
  inherited;
    nomeClienteCupom :='';
    enderecoClienteCupomFiscal :='';
    cpfClienteCupomFiscal :='';
    Application.CreateForm(TfrmIdentificaClienteECF,frmIdentificaClienteECF);
    frmIdentificaClienteECF.ShowModal;
    frmIdentificaClienteECF.Free;

end;

procedure Tfrm_encerramento.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 if Key = VK_RETURN then
  begin

    if  ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_codigo_forma')) or (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_valor_forma')) ) then
     Perform(WM_NEXTDLGCTL,0,0)
  end;


 if key=vk_f2 then
  begin
    if  sender is Tedit and ((sender as Tedit).Name='ed_codigo_forma') then
    begin
      bt_pesquisa_forma.Click;
    end;

  end;

end;

procedure Tfrm_encerramento.iniciarEncerramentoDaConta();
begin
  inherited;
 tipo_comprovante:=StrtoInt(dm.LeIni(1,'ENCERRAMENTO','tipo_comprovante'));

 if tipo_comprovante = 1 then
  begin
    If tipo_cupom = 2 then
     tipo_comprovante := 2
    else
     tipo_comprovante := 1;
  end;
   if ( (tipo_comprovante = 1) ) then
     begin
       case  modeloComprovanteFiscal of //StrToInt(dm.LeIni(2,'ENCERRAMENTO','modeloComprovantefiscal')) of
         1: begin  // se for cupom fiscal

              IF verificaImpressoraFiscal then
                 begin
                  if (registraItensCupomFiscal() = True ) then
                   begin
                    pnConsultaFormas.Visible := True;
                    pnOpcoes.Visible := false;
                    pnFormasPagamento.Visible := true;
                    busca_recebimentos_parciais();
                    ed_codigo_forma.SetFocus;
                   end;
                 end;
            end;

         2: begin   // Se for NFCE
              pnConsultaFormas.Visible := True;
              pnOpcoes.Visible := false;
              pnFormasPagamento.Visible := true;
              busca_recebimentos_parciais();
              ed_codigo_forma.SetFocus;
            end;

         3: begin   // Se for NFe (modelo 55)
              pnConsultaFormas.Visible := True;
              pnOpcoes.Visible := false;
              pnFormasPagamento.Visible := true;
              busca_recebimentos_parciais();
              ed_codigo_forma.SetFocus;
            end;

         4: begin   // Se for SAT
              pnConsultaFormas.Visible := True;
              pnOpcoes.Visible := false;
              pnFormasPagamento.Visible := true;
              busca_recebimentos_parciais();
              ed_codigo_forma.SetFocus;
            end;

       end;

     end
   else
    begin
      pnConsultaFormas.Visible := True;
      pnOpcoes.Visible := false;
      pnFormasPagamento.Visible := true;
      busca_recebimentos_parciais();
      ed_codigo_forma.SetFocus;
    end;


end;

procedure Tfrm_encerramento.ed_valor_tx_servChange(Sender: TObject);
begin
  inherited;
    ed_valor_tx_serv.SelStart := length(ed_valor_tx_serv.text);
end;

procedure Tfrm_encerramento.ed_valor_tx_servExit(Sender: TObject);
begin
  inherited;
  calcula_valores(Sender,false);
end;

procedure Tfrm_encerramento.Timer1Timer(Sender: TObject);
begin
  inherited;
    memoMensagens.Color:=clRed;
    memoMensagens.font.Color:=clWhite;
    Timer1.Enabled:=false;
    Timer2.Enabled:=true;

end;

procedure Tfrm_encerramento.Timer2Timer(Sender: TObject);
begin
  inherited;
  memoMensagens.Color:=clBlack;
  memoMensagens.font.Color:=clYellow;
  Timer2.Enabled:=false;
  Timer1.Enabled:=true;

end;


procedure Tfrm_encerramento.setMensagemOperador (mensagem : string);
begin
  memoMensagens.lines.clear;
  memoMensagens.Lines.Add(mensagem);
end;




procedure Tfrm_encerramento.exibirMensagemPainelInformacoes(titulo: string; mensagem : string ; tempo : smallint; tipoMensagem : smallint; progresso : boolean);
begin


 pnMensagensErro.Left := 52;
 pnMensagensErro.Top := 95;
 ActivityIndicator.Active := progresso;
 SetMensagemPainelInformacoes(titulo,mensagem,tempo,tipoMensagem,progresso);
 pnMensagensErro.Visible := true;
 frm_encerramento.Enabled := false;
end;


procedure Tfrm_encerramento.SetMensagemPainelInformacoes(titulo: string; mensagem : string ; tempo : smallint; tipoMensagem : smallint; progresso : boolean);
begin

 case tipoMensagem  of
   0 : begin
         // Imagem da NFC-e
         try
           imgPainelErro.Picture.LoadFromFile(patchAplicacao+'imagens\nfce.png');
         except
           dm.adicionaLog('Imagem da NFC-e não localizada.');
         end;

       end;

   1 : begin
         // Imagem da NF-e
         try
           imgPainelErro.Picture.LoadFromFile(patchAplicacao+'imagens\nfce.png');
         except
           dm.adicionaLog('Imagem da NF-e não localizada.');
         end;

       end;

   2 : begin
         // Imagem de erro
         try
           imgPainelErro.Picture.LoadFromFile(patchAplicacao+'imagens\erro256.png');
         except
           dm.adicionaLog('Imagem de erro não localizada.');
         end;

       end;

   3 : begin
         // Imagem de aviso
         try
           imgPainelErro.Picture.LoadFromFile(patchAplicacao+'imagens\atencao.png');
         except
           dm.adicionaLog('Imagem da NF-e não localizada.');
         end;

       end;

  4 : begin
         // Imagem offline
         try
           imgPainelErro.Picture.LoadFromFile(patchAplicacao+'imagens\offline256.png');
         except
           dm.adicionaLog('Imagem da NF-e não localizada.');
         end;

       end;

  5 : begin
         // Imagem identifica cliente
         try
           imgPainelErro.Picture.LoadFromFile(patchAplicacao+'imagens\idcliente.png');
         except
           dm.adicionaLog('Imagem de identificação do cliente não localizada!');
         end;

       end;

  6 : begin
         // Imagem treinamento
         try
           imgPainelErro.Picture.LoadFromFile(patchAplicacao+'imagens\classroom256.png');
         except
           dm.adicionaLog('Imagem de treinamento não localizada!');
         end;

       end;


  7 : begin
         // Imagem treinamento
         try
           imgPainelErro.Picture.LoadFromFile(patchAplicacao+'imagens\printer256.png');
         except
           dm.adicionaLog('Imagem de impressão não localizada!');
         end;

       end;

  8 : begin
         // Imagem tef
         try
           imgPainelErro.Picture.LoadFromFile(patchAplicacao+'imagens\tef.png');
         except
           dm.adicionaLog('Imagem de impressão não localizada!');
         end;

       end;





 end;

 lbMensagemErro.Lines.Clear;
 lbMensagemErro.lines.Add(trim(mensagem));
 lbTituloMensagem.Caption := titulo;

 if tempo > 0  then
  lbTempoMensagem.Caption := Inttostr(tempo)+'s'
 else
   lbTempoMensagem.Caption :='';


 ActivityIndicator.Active := progresso;
end;

procedure Tfrm_encerramento.fecharPainelInformacoes();
begin
 pnMensagensErro.Left := -1000;
 pnMensagensErro.Top := -1000;
 pnMensagensErro.Visible := false;
  ActivityIndicator.Active := false;
 frm_encerramento.Enabled := true;

end;




function Tfrm_encerramento.getMensagemOperador() : string;
begin
  Result := memoMensagens.Lines.Text ;

end;

procedure Tfrm_encerramento.exibirMensagemInformacao(mensagem : string; tempo : Integer; fonte : Integer; urgencia : Boolean);
 begin
   memoMensagens.Lines.Clear;
   memoMensagens.Lines.Add(mensagem);
   memoMensagens.Font.Size := Fonte;

   if ( tempo <> 0 ) then
    begin
      timerTempoMensagem.Enabled := true;
      timerTempoMensagem.Interval := tempo;
      Timer1.Enabled := True;
    end
   else
    begin
      Timer1.Enabled:=true;
    end;


 end;

procedure Tfrm_encerramento.btMenuFiscalClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmMenuFiscal,frmMenuFiscal);
  frmMenuFiscal.ShowModal;
  frmMenuFiscal.free; 

end;

procedure Tfrm_encerramento.btCancelarClick(Sender: TObject);
begin
  If (verificaPossibilidadeCancelarVenda = True) then
   begin
     podeFecharFormulario := true;

     Close;
   end
  else
   begin
     podeFecharFormulario := false;
     exibe_painel_erro('Não foi possível cancelar a venda','OK');
     end;



end;

function Tfrm_encerramento.verificaPossibilidadeCancelarVenda () : Boolean;
var
 Est : TACBrECFEstado;
 segundosExibicaoMensagem : smallint;
begin
   result := False;
  if ( (tipo_comprovante = 1) ) then
   begin
     Est := frm_principal.ecf.Estado;

     if ( (Est =  estVenda ) or (est =  estPagamento) ) then
      begin
        string_auxiliar:= '';
        Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
        frm_confirma_extrato.setTitulo('Confirmação');
        frm_confirma_extrato.setMensagem('Confirma cancelamento da venda em andamento  ?',12);
        frm_confirma_extrato.ShowModal;
        frm_confirma_extrato.free;
          if string_auxiliar = 'S' then
           begin

                try
                 frm_principal.ECF.CorrigeEstadoErro();
                except
                 on E : Exception do
                   begin
                    exibe_painel_erro(E.Message,'Ok');
                    Result := false;
                    exit;
                  end;
               end;
              result := True;

            end

         else
          begin
             result := false;
          end;

      end

     else
      begin
        result := true;
      end;

   end
  else
   begin
     result := true;
   end;


  if transacaoTEFIniciada  then
   begin
       result := False;
       segundosExibicaoMensagem := 20;
       ExibirMensagemPainelInformacoes('Transação de TEF já iniciada. ','',segundosExibicaoMensagem,8,true);



       while (segundosExibicaoMensagem >=0 ) do
        begin


          frm_encerramento.SetMensagemPainelInformacoes('Erro: Transação TEF já iniciada!','Uma transação de TEF foi iniciciada e aprovada.'+
                              'Caso deseje sair, será necessário cancelar a transação já aprovada e reiniciar o processo de pagamento. ' +LineBreak+
                              'Na janela à seguir, confirme se deseja cancelar a transação TEF atual',segundosExibicaoMensagem,8,true);
           Sleep(1000);
           Application.ProcessMessages();
           segundosExibicaoMensagem := segundosExibicaoMensagem -1;
        end;

        fecharPainelInformacoes();
          if dm.verificaPermissaoAcao('I20002019') = true then
           begin
            string_auxiliar:= '';
            Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
            frm_confirma_extrato.setTitulo('Confirmação');
            frm_confirma_extrato.setMensagem('Confirma o cancelamento da transação de TEF pendente   ?',12);
            frm_confirma_extrato.ShowModal;
            frm_confirma_extrato.free;
              if string_auxiliar = 'S' then
               begin

                 try
                  dm.ACBrTEFD1.CancelarTransacoesPendentes;
                  transacaoTEFIniciada := false;
                  dm.adicionaLog('Transação de TEF cancelada!');
                  Result := true;


                 except
                   dm.exibe_painel_erro('Erro ao cancelar transação TEF','Ok');
                   dm.adicionaLog('Erro ao cancelar transação TEF');
                 end;

               end;
           end
        else
          begin
            Result := false;
          end;


  end;



end;

procedure Tfrm_encerramento.timerTempoMensagemTimer(Sender: TObject);
begin
  inherited;
  Timer2.Enabled := false;
  Timer1.Enabled := False;
  memoMensagens.Color:=clRed;
  memoMensagens.font.Color:=clWhite;
  memoMensagens.Clear;

end;

procedure Tfrm_encerramento.btIniciaEmissaoCupomClick(Sender: TObject);
begin
  inherited;

 if frm_principal.getNFE55VendaAtual  then
    modeloComprovanteFiscal := 3;

  IF (StrToInt(dm.LeIni(2,'CAIXA','permiteEncerrarContas')) = 0) THEN
    begin
      showmessage('Não é possível encerrar contas nesta estação!');
      exit;
    end;


  dm.atualizaDataDoSistema();
  if getDataSistemaCaixa(ultimoCaixaAberto) <> data_do_sistema  then
   begin
    dm.exibe_painel_erro('A data em que o caixa atual foi aberto difere da data atual do sistema.'
      +' Efetue o fechamento do caixa atual e abra um novo caixa!','Ok');
    exit;
   end;

  if  StrToInt(dm.LeIni(2,'ENCERRAMENTO','abrirIdentificacaoClienteAntes')) = 1 then
   begin
    btIdCliente.Click;
   end;
  calcula_valores(sender,true);
  iniciarEncerramentoDaConta();




end;



procedure Tfrm_encerramento.btEncerrarVendaClick(Sender: TObject);
begin
  inherited;


  if verificaValidade then
   begin

      Application.CreateForm(Tfrm_confirma_extrato, frm_confirma_extrato);
      string_auxiliar:= '';
      frm_confirma_extrato.setTitulo('Confirmação');
      frm_confirma_extrato.setMensagem('CONFIRMA O ENCERRAMENTO DA CONTA  ?',12);
      frm_confirma_extrato.ShowModal;
      frm_confirma_extrato.BringToFront;
      frm_confirma_extrato.free;

    if string_auxiliar = 'S' then
     begin
       FinalizarVenda();
     end;

//      FinalizarVenda();
   end;

end;


function Tfrm_encerramento.verificaValidade(): boolean;
begin
  result := false;

 if tbFormasPagamentoTemp.IsEmpty = true then
  begin
    dm.exibe_painel_erro('Nenhuma forma de pagamento foi informada','Continuar');
    result := false;
    exit;
  end;

 if (ed_total_pago.Value < ed_total_conta.Value) then
  begin
    dm.exibe_painel_erro('Total de pagamentos é inferior ao total da conta','Continuar');
    result := false;
    exit;

  end;

  result := true;


end;

procedure Tfrm_encerramento.SpeedButton5Click(Sender: TObject);
begin

  btCancelar.Click;
end;

procedure Tfrm_encerramento.botaoClickFormaClick(Sender: TObject);
var
x : integer;
begin
  inherited;
  x:=0;
   while ( (x < ComponentCount -1)) do
      begin                                                                               
        if ( Components[x] is Tedit  ) and     ( (Components[x]as Tedit).Name='ed_codigo_forma' ) then
          begin
             (Components[x] as Tedit).Text :=  Trim( copy((sender as TJvImgBtn).Name,6,10));
             ed_valor_forma.SetFocus;

          end;
        x:= x+1;
      end;
end;


procedure Tfrm_encerramento.MakeRounded(Control: TWinControl);
var
R: TRect;
Rgn: HRGN;
begin
with Control do
 begin
 R := ClientRect;
 rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 20, 20);
 Perform(EM_GETRECT, 0, lParam(@r));
 InflateRect(r, - 5, - 5);
 Perform(EM_SETRECTNP, 0, lParam(@r));
 SetWindowRgn(Handle, rgn, True);
 Invalidate;
 end;
end;

end.


