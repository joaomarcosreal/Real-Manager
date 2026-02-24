unit UUentradaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, cxControls, cxContainer, ibquery,
  cxEdit, cxTextEdit, ExtCtrls;

type
  TfrmEntradaClientes = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    edCartao: TcxTextEdit;
    Label1: TLabel;
    edRgCliente: TEdit;
    Label2: TLabel;
    edCodCliBoate: TEdit;
    Panel3: TPanel;
    edNomeClienteBoate: TEdit;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel4: TPanel;
    Label4: TLabel;
    rdPagante: TRadioButton;
    rdLista: TRadioButton;
    btCheckin: TBitBtn;
    btClientesNaCasa: TBitBtn;
    btSair: TBitBtn;
    rdPreconvite: TRadioButton;
    procedure Edit1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CadastrarCliente();
    procedure efetuarCheckIn();
    function  validaInformacoes() : boolean;
    procedure lancarCouvertAutomaticamente(cartao : string);
    procedure btCheckinClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure efetuaAberturaDoCartao(mesa : string);
    procedure FormActivate(Sender: TObject);
    procedure B20002002Click(Sender: TObject);
    procedure btClientesNaCasaClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);

   procedure apagaMovimentoMesaBalcao();


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntradaClientes: TfrmEntradaClientes;

implementation

uses uu_data_module, uu_frm_principal, uuCadClientesReduzido,
  uu_clientes_na_casa, DB, uu_encerramento;

{$R *.dfm}

procedure TfrmEntradaClientes.Edit1Exit(Sender: TObject);
begin
  inherited;

  if  sender is TcxTextEdit and ((sender as TcxTextEdit).Name='edCartao') then
   begin
     if (trim(edCartao.Text) ='') then exit;

     try
      begin
        edCartao.Text := FormatFloat('0000',StrToFloat( edCartao.Text));
      end;
     except
      begin
        Showmessage('Número do cartão inválido!');
        exit;
      end;
     end;
   end;

 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edRgCliente') then
  begin
    dm.transacao.Active:=false;
    dm.transacao.Active:=true;
    if trim(edRgCliente.Text) = '' then exit;
     if (verificaExistenciaClienteRg(edRgCliente.Text) = false) then
      begin
        if MessageDlg('Cliente Não Cadastrado, Deseja cadastrar agora?',mtConfirmation,[mbYes,mbNo],0) = mrYes  then
         begin
          string_auxiliar:=edRgCliente.text;
          CadastrarCliente();
          exibeInformacoesClienteBoateRG(edRgCliente.Text);          
        end;
      end
     else
       begin
        exibeInformacoesClienteBoateRG(edRgCliente.Text);
       end;

  end;

end;

procedure TfrmEntradaClientes.SpeedButton1Click(Sender: TObject);
begin
  inherited;
    pesquisaClienteReduzido;
    edRgCliente.Text:= string_auxiliar2 ;
    edCodCliBoate.Text := string_auxiliar;
 if (verificaExistenciaClienteRg(edRgCliente.Text) = false) then
  begin
   dm.exibe_painel_erro('Cliente inexistente!','');
   edRgCliente.Clear;
   edNomeClienteBoate.Clear;
   exit;
  end
 else
   begin
     exibeInformacoesClienteBoateRG(edRgCliente.Text);
   end;

end;

procedure TfrmEntradaClientes.CadastrarCliente();
begin

   Application.CreateForm(TfrmCadastroClientesReduzido,frmCadastroClientesReduzido);
   frmCadastroClientesReduzido.showmodal;
   frmCadastroClientesReduzido.free;
   edRgCliente.Text := string_auxiliar;
end;


procedure TfrmEntradaClientes.btCheckinClick(Sender: TObject);
var
 cartao : string;
begin
  cartao := edCartao.Text;
  inherited;
  if ( MessageDlg('Confirma o Check-in do cliente ?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      if validaInformacoes = true then
       begin
        apagaMovimentoMesaBalcao();
        lancarCouvertAutomaticamente(edCartao.Text);

        if (dm.verificaSeRecebeCouvertEntrada = true) then
         begin
           Application.CreateForm(Tfrm_encerramento, frm_encerramento);
           frm_encerramento.veioDoCheckin := true;
           frm_encerramento.lb_mesa.Caption :=  edCartao.Text ; //mesaBalcao;
           frm_encerramento.ShowModal;
           frm_encerramento.free;
         end;
         if (dm.verificaSeRecebeCouvertEntrada = true) then
          begin
            if (dm.verificaseExisteMovimentoMesa(edCartao.Text) = false) then
             begin
               efetuarCheckIn();
               efetuaAberturaDoCartao(cartao);
               edCartao.SetFocus();
               dm.transacao.Commit;
               edCartao.Clear;
               edNomeClienteBoate.Clear;
               edRgCliente.Clear;
               dm.exibe_painel_erro('CHECK-IN EFETUADO COM SUCESSO','Ok');
             end
            else
             begin
               dm.exibe_painel_erro('O PAGAMENTO NÃO FOI EFETUADO, CHECK-IN CANCELADO!','Ok');
             end;
          end
         else
          begin
            efetuarCheckIn();
            efetuaAberturaDoCartao(cartao);
            edCartao.SetFocus();
            dm.transacao.Commit;
            edCartao.Clear;
            edNomeClienteBoate.Clear;
            edRgCliente.Clear;
            dm.exibe_painel_erro('CHECK-IN EFETUADO COM SUCESSO','Ok');
          end;

       end;
    end;
end;



procedure TfrmEntradaClientes.efetuarCheckIn();
var
 q: TIBquery;
 codigo : string;
begin

  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  q := TIBquery.create(self);
  q.database:= dm.dbrestaurante;
  q.transaction:= dm.transacao;
  q.active:=false;
  q.sql.clear;

  codigo:=dm.geraCodigo('G_MOVIMENTO_CLIENTES',6);
  q.SQL.add('insert into movimentacao_clientes(cod_movimentacao,cod_cli,cartao,data,hora_entrada) values (');
  q.SQL.add(''+Quotedstr(codigo)+',');
  q.SQL.add(''+Quotedstr(edCodCliBoate.Text)+',');
  q.SQL.add(''+Quotedstr(edCartao.Text)+',');
  q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
  q.sql.add('current_timestamp)');
  try
   q.ExecSQL;
  except
   begin
     Showmessage('Erro ao incluir movimentação de clientes!');
     exit;
   end;
  end;

  q.Active:=false;
  q.SQL.Clear;
  q.sql.add('update cartoes set cod_cli ='+Quotedstr(edCodCliBoate.Text)+',status=0,cod_movimentacao='+codigo+' where cod_cartao='+Quotedstr(edCartao.Text));
  try
   q.ExecSQL;
  except
   begin
     Showmessage('Erro ao atualizar status do cartão');
     exit;
   end;
  end;
end;


function TfrmEntradaClientes.validaInformacoes() : boolean;
begin
  if (verificaExistenciaCliente(edCodCliBoate.Text) = false) then
   begin
     dm.exibe_painel_erro('Cliente Inexistente!!','Enter para continuar...');
     edRgCliente.SetFocus;
     Result:=false;
     exit;
   end;

  try
    edCartao.Text:=FormatFloat('0000',strToFLoat(edCartao.Text));
  except
    begin
     dm.exibe_painel_erro('Cartão inválido!!','Enter para continuar...');
     edCartao.SetFocus;
     Result:=false;
     exit;
    end;
  end;

  if (verificaExistenciaCartao(edCartao.Text) = false) then
   begin
     dm.exibe_painel_erro('Cartão inexistente !!','Enter para continuar...');
     edCartao.SetFocus;
     Result:=false;
     exit;
   end;

   if (verificaStatusCartaoNoCheckin(edCartao.Text) = false) then
    begin
     edCartao.SetFocus;
     Result:=false;
     exit;
    end;


   if (verificaSeCartaoEstaSendoUtilizado(edCartao.Text) = true) then
    begin
     dm.exibe_painel_erro('O CARTÃO INFORMADO JÁ ESTÁ EM USO !','Enter para continuar...');
     edCartao.SetFocus;
     Result:=false;
     exit;
    end;


  if(verificaSeClienteEstaNaCasa(edCodCliBoate.Text) = true) then
   begin
     dm.exibe_painel_erro('O CLIENTE INFORMADO JÁ EFETUOU CHECKIN!!','Enter para continuar...');
     edRgCliente.SetFocus;
     Result:=false;
     exit;
   end;

   result := true;

end;



procedure TfrmEntradaClientes.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if key = vk_f2 then
   begin
    exibeInformacoesClienteBoateRG(edRgCliente.Text);
   end;
end;



procedure TfrmEntradaClientes.apagaMovimentoMesaBalcao();
var
  q : TIBquery;
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

  q:=TIBquery.create(self);
  q.database:=dm.dbrestaurante;
  q.transaction:= dm.transacao;
  q.active := false;
  
  q.Active := false;
  q.SQL.Clear;
  q.SQL.Add('delete from movimento_mesa where cod_mesa='+QuotedStr(edCartao.text));
  q.ExecSQL; 
  dm.transacao.Commit;

end;

procedure  TfrmEntradaClientes.lancarCouvertAutomaticamente(cartao : string);
var
  codigo_lancamento: string;
  observacoesProducao, saboresProducao : string;
  q : TIBquery;
  codigoCouvert : string;


begin


  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm.tb_parametros.Active :=true;

  /// Cartões VIP
  if ( (StrToInt(cartao) >= dm.tb_parametrosINI_FAIXA_VIP.Value ) and (StrToInt(cartao) <= dm.tb_parametrosFIM_FAIXA_VIP.Value)  ) then
   begin
     codigoCouvert:= dm.tb_parametrosCOUVERT_VIP.Value;
   end;                      


  // Cartões Masculinos
  if ( (StrToInt(cartao) >= dm.tb_parametrosINI_FAIXA_MASC.Value ) and (StrToInt(cartao) <= dm.tb_parametrosFIM_FAIXA_MASC.Value )  ) then
   begin
     if rdPagante.Checked  then
      codigoCouvert:= dm.tb_parametrosCOUVERT_MASC_PAGANTE.Value
     else
       if rdLista.Checked then
          codigoCouvert:= dm.tb_parametrosCOUVERT_MASC_LISTA.Value
       else
          codigoCouvert:= dm.tb_parametrosCOUVERT_MASC_PRECONVITE.Value;
   end;


  // Cartões Femininos
  if ( (StrToInt(cartao) >= dm.tb_parametrosINI_FAIXA_FEM.Value) and (StrToInt(cartao) <= dm.tb_parametrosFIM_FAIXA_FEM.Value)  ) then
  begin
     if rdPagante.Checked then
      codigoCouvert:= dm.tb_parametrosCOUVERT_FEM_PAGANTE.Value
     else
       if rdLista.Checked then
         codigoCouvert:= dm.tb_parametrosCOUVERT_FEM_LISTA.Value
       else
         codigoCouvert:= dm.tb_parametrosCOUVERT_FEM_PRECONVITE.Value;
   end;




  q:=TIBquery.create(self);
  q.database:=dm.dbrestaurante;
  q.transaction:= dm.transacao;
  q.active := false;
  q.SQL.clear;
  q.sql.add('select max(cod_movimento)as novo_cod from movimento_mesa where cod_mesa=' + QuotedStr(cartao));
  q.Active := true;
  if ((q.IsEmpty) or (q.fieldbyname('novo_cod').IsNull)) then
  begin
    codigo_lancamento := '1';
    codigo_lancamento := FormatFloat('0000', Strtofloat(codigo_lancamento));
  end
  else
  begin
    codigo_lancamento := VarToStr(q.fieldbyname('novo_cod').value);
    codigo_lancamento := IntToStr(StrToInt(codigo_lancamento) + 1);
    codigo_lancamento := FormatFloat('0000', Strtofloat(codigo_lancamento));
  end;


  q.Active := false;
  q.SQL.Clear;
  q.SQL.Add('delete from movimento_mesa where cod_mesa='+QuotedStr(mesaBalcao));
  q.ExecSQL;

  q.Active := false;
  q.SQL.clear;
  q.sql.add('insert into movimento_mesa (cod_mesa,cod_garcon,cod_produto,quantidade,comanda,cod_movimento,');
  q.sql.add('numero_caixa,cod_usuario,valor_unitario) values (');

//  if (dm.verificaSeRecebeCouvertEntrada = true) then
//   q.sql.add('' + QuotedStr(mesaBalcao) + ',')
//  else
   q.sql.add('' + QuotedStr(cartao) + ',');

  q.sql.add('' + QuotedStr('000') + ',');
  q.sql.add('' + QuotedStr(getCodProduto(codigoCouvert) ) + ',');
  q.sql.add('' + DM.TrocaVirgPPto('1') + ',');
  q.sql.add('' +QuotedStr('') + ',');
  q.sql.add('' + Quotedstr(codigo_lancamento) + ',');
  q.sql.add('' + Quotedstr(numero_caixa) + ',');
  q.sql.add('' + Quotedstr(codigo_usuario) + ',');
  q.SQL.Add('' + dm.TrocaVirgPPto(FloatToStr(getValorProduto(codigoCouvert,2))   )+')');

  try
    begin
      q.ExecSQL;
    end;
  except
    begin
      dm.cria_log_de_erros(q.sql, 'Caixa - Restaurante ', 'Erro ao lançar produto no movimento da mesa ', codigo_usuario);
      exit;
    end;
  end;
  dm.transacao.Commit;
  
end;





procedure TfrmEntradaClientes.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  CLOSE;
end;

procedure TfrmEntradaClientes.efetuaAberturaDoCartao(mesa : string);
var
  Q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.SQL.add('insert into informacoes_mesa (mesa,hora,cod_usuario) values('+Quotedstr(mesa)+',current_time,'+QuotedStr(codigo_usuario)+')');
  q.ExecSQL;
end;


procedure TfrmEntradaClientes.FormActivate(Sender: TObject);
begin
  inherited;

  btCheckin.Caption := 'Confirmar o '+#10+'check-in'+#10+'';
  btClientesNaCasa.Caption := 'Movimentação '+#10+' da '+#10+'casa'+#10+'';
  btSair.Caption := 'Sair '+#10+'(ESC)';
//  apagaMovimentoMesaBalcao;

end;

procedure TfrmEntradaClientes.B20002002Click(Sender: TObject);
begin

  if validaInformacoes = true then
    begin
 
    end;

end;

procedure TfrmEntradaClientes.btClientesNaCasaClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmClientesNaCasa,frmClientesNaCasa);
  frmClientesNaCasa.ShowModal;
  frmClientesNaCasa.free;

end;

procedure TfrmEntradaClientes.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

end.
