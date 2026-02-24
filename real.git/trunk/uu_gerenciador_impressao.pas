unit uu_gerenciador_impressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, ibquery, RXShell,uu_modelo_vazio;

type
  TfrmPrincipalGerenciador = class(Tfrm_modelo_vazio)
    memoLogErros: TMemo;
    Image1: TImage;
    memoLogEventos: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    timerInicializacao: TTimer;
    timerPedidos: TTimer;
    memo_avisos: TMemo;
    Label3: TLabel;
    RxTrayIcon1: TRxTrayIcon;
    Button1: TButton;
    Button2: TButton;
  procedure registraErro(erro : string);
  procedure registraEvento(evento : string);
  function  conexao_banco : boolean;
  procedure iniciaImpressaoDePedidos();
  procedure cabecalhoImpressaoLocalProducao(n_seq : string; cod_garcon: string; marca : integer; modelo :integer ; mesa : string; tipo : integer);
  procedure imprimePedidos();
  procedure imprimeCancelamentoDePedidos();
  procedure excluiPedido(codProduto : string; nSeq : string; tipo : string);

    procedure FormActivate(Sender: TObject);
    procedure timerInicializacaoTimer(Sender: TObject);
    procedure timerPedidosTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RxTrayIcon1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalGerenciador: TfrmPrincipalGerenciador;

implementation

uses uu_data_module, UnitDeclaracoes;

{$R *.dfm}


function TfrmPrincipalGerenciador.conexao_banco : boolean;
var
 local_banco,usuario,senha : string;
 tentativas : integer;
begin
  tentativas:=1;
  dm.dbrestaurante.Connected:=false;

  while ( (dm.dbrestaurante.TestConnected = false) ) do
   begin
    local_banco:=dm.LeIni(2,'BANCO_DE_DADOS','local_bd');
    usuario:=dm.LeIni(2,'BANCO_DE_DADOS','usuario');
    senha:=dm.LeIni(2,'BANCO_DE_DADOS','senha');
    dm.dbrestaurante.DatabaseName:=local_banco;
    dm.dbrestaurante.Params.Values['user_name']:=usuario;
    dm.dbrestaurante.Params.Values['password']:=senha;
    try
     begin
      dm.dbrestaurante.Connected:=true;
      registraErro('Conexão ao banco efetuada com sucesso.');
     end;
    except
      begin
        registraErro('Erro ao conectar ao banco de dados. Tentativa '+Inttostr(tentativas));
        tentativas:=tentativas+1;
      end;
    end;
   end;

   Result:=true;
end;


procedure TfrmPrincipalGerenciador.registraErro(erro : string);
begin
  memoLogErros.Lines.Add(erro+' Data: '+FormatDateTime('DD/MM/YYY',date)+' Hora: '+FormatDateTime('HH:MM:SS',Time));
  if FileExists('c:\restaurante\logs\LogErros'+FormatDateTime('DDMMYYY',date)+'.err')
   then
      begin
        DeleteFile('c:\restaurante\logs\LogErros'+FormatDateTime('DDMMYYY',date)+'.err')
      end;

  memoLogErros.Lines.SaveToFile('c:\restaurante\logs\LogErros'+FormatDateTime('DDMMYYY',date)+'.err')
end;


procedure TfrmPrincipalGerenciador.registraEvento(evento : string);
begin
  memoLogEventos.Lines.Add(evento+' Data: '+FormatDateTime('DD/MM/YYY',date)+' Hora: '+FormatDateTime('HH:MM:SS',Time));
  if FileExists('c:\restaurante\logs\LogAplicacao'+FormatDateTime('DDMMYYY',date)+'.err')
   then
      begin
        DeleteFile('c:\restaurante\logs\LogAplicacao'+FormatDateTime('DDMMYYY',date)+'.err')
      end;

  memoLogEventos.Lines.SaveToFile('c:\restaurante\logs\LogAplicacao'+FormatDateTime('DDMMYYY',date)+'.err')
end;


procedure TfrmPrincipalGerenciador.FormActivate(Sender: TObject);
begin

  Daruma_FI_FechaPortaSerial();
  timerInicializacao.Enabled:=true;
  if FileExists('c:\restaurante\logs\LogErros'+FormatDateTime('DDMMYYY',date)+'.err') then
   memoLogErros.Lines.LoadFromFile('c:\restaurante\logs\LogErros'+FormatDateTime('DDMMYYY',date)+'.err');

  if FileExists('c:\restaurante\logs\LogAplicacao'+FormatDateTime('DDMMYYY',date)+'.err') then
   memoLogEventos.Lines.LoadFromFile('c:\restaurante\logs\LogAplicacao'+FormatDateTime('DDMMYYY',date)+'.err');



end;

procedure TfrmPrincipalGerenciador.timerInicializacaoTimer(Sender: TObject);
begin
  conexao_banco;
  timerInicializacao.Enabled:=false;
  timerPedidos.Enabled:=true;
  frmPrincipalGerenciador.Hide;

end;

procedure TfrmPrincipalGerenciador.timerPedidosTimer(Sender: TObject);
begin
  registraEvento('Entrada no onTimer de impressão');
  timerPedidos.Enabled:=false;
  registraEvento('Timer desabilitado para início de impressão');

  if (dm.dbrestaurante.TestConnected = false) then
   begin
     registraErro('Deconexão no banco de dados... Reconectando');
     conexao_banco;
   end;
  iniciaImpressaoDePedidos();
  timerPedidos.Enabled:=true;
end;



procedure TfrmPrincipalGerenciador.iniciaImpressaoDePedidos();
begin
  try
   begin
     dm.transacao.Active:=false;
     dm.transacao.Active:=true;
   end;
  except
   begin
     registraErro('Erro ao refrescar transações  na função de iniciar impressão...');
     registraErro('desconectando do banco...');
     conexao_banco();
     exit;
   end;
  end;
    imprimePedidos();
    imprimeCancelamentoDePedidos();
  try
   begin
    dm.transacao.Commit;
   end;
  except
   begin
     registraErro('Erro ao commitar transação na função de início de pedidos...');
     registraErro('desconectando do banco...');
     conexao_banco();
   end;
  end;
end;

procedure TfrmPrincipalGerenciador.cabecalhoImpressaoLocalProducao(n_seq : string; cod_garcon: string; marca : integer; modelo :integer ; mesa : string; tipo : integer);
var
 str : string;
begin
 registraEvento('Inícia impressão do cabeçalho do pedido '+n_seq);

 case marca of
 1:begin
     case modelo of
      1 : begin
            dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------------------', false,false,false,false,true,false,true);
            case tipo of
             1: begin
                 dm.imprime_linha_impNF(marca,modelo,dm.centralizar('PEDIDO '+n_seq,30),true,false,false,false,true,true,true);
                end;

             2: begin
                 dm.imprime_linha_impNF(marca,modelo,dm.centralizar('******************************',30),true,false,false,false,true,true,true);
                dm.imprime_linha_impNF(marca,modelo,dm.centralizar('******** CANCELAMENTO ********',30),true,false,false,false,true,true,true);
                dm.imprime_linha_impNF(marca,modelo,dm.centralizar('******************************',30),true,false,false,false,true,true,true);
                end;
             3:dm.imprime_linha_impNF(marca,modelo,dm.centralizar('AVISO DE PEDIDO ATRASADO '+n_seq,30),true,false,false,false,true,true,true);
            end;

            if (dm.verificaMesaBalcao(mesa) = false) then
             dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Mesa: '+mesa,30),true,false,false,false,true,true,true)
            else
             dm.imprime_linha_impNF(marca,modelo,dm.centralizar(dm.getDescricaoPedidoBalcao(),30),true,false,false,false,true,true,true);


            str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
           dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
//            str:='Operador: '+'usuario';
           dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
           Str:='Garcon: '+getNomeGarcon(cod_garcon);
           dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
           dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------------------', false,false,false,false,true,false,true);

            str:='########****************************';
            str:=dm.organizarCupom(str,'Qtde.','#');
            str:=dm.organizarCupom(str,'Descricao','*');
           dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,false,false,false);
           dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------------------', false,false,false,false,true,false,true);
          end;

     end;
    end;

  5:begin
     case modelo of
      1 : begin
           dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);
            case tipo of
             1: begin
                   dm.imprime_linha_impNF(marca,modelo,dm.centralizar('PEDIDO '+n_seq,20),false,false,false,false,true,true,true);
                end;


             2: begin
                dm.imprime_linha_impNF(marca,modelo,dm.centralizar('********************',20),false,false,false,false,true,true,true);
                dm.imprime_linha_impNF(marca,modelo,dm.centralizar('*** CANCELAMENTO ***',20),false,false,false,false,true,true,true);
                dm.imprime_linha_impNF(marca,modelo,dm.centralizar('********************',20),false,false,false,false,true,true,true);
                end;
             3:dm.imprime_linha_impNF(marca,modelo,dm.centralizar('AVISO DE PEDIDO ATRASADO '+n_seq,24),true,false,false,true,false,true,false);
            end;
            if (dm.verificaMesaBalcao(mesa) = false) then
             dm.imprime_linha_impNF(marca,modelo,dm.centralizar('Mesa: '+mesa,20),false,false,false,false,true,true,true)
            else
             dm.imprime_linha_impNF(marca,modelo,dm.centralizar(dm.getDescricaoPedidoBalcao(),20),false,false,false,false,true,true,true);


            str:=FormatDateTime('DD/MM/YYY',DATE)+' '+FormatDateTime('HH:MM:SS',time);
           dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
            str:='Operador: '+'usuario';
           dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
           Str:='Garcon: '+getNomeGarcon(cod_garcon);
           dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
           dm.imprime_linha_impNF(marca,modelo,'------------------------------------------------',false,false,false,true,false,false,false);

            str:='#########*******************************';
            str:=dm.organizarCupom(str,'Qtde','#');
            str:=dm.organizarCupom(str,'Descricao','*');
            str:=dm.organizarCupom(str,'','*');
           dm.imprime_linha_impNF(marca,modelo,str,false,false,false,false,true,false,false);
          end;

     end;
    end;
 end;

end;


procedure  TfrmPrincipalGerenciador.imprimePedidos();
var
 str : string;
 linhaAtual, totalLinhas : integer;
 q,q2,q3 : TIBQuery;

begin
    Q := TIBQuery.Create(self);
    q.Database := dm.dbrestaurante;
    q.Transaction := dm.transacao;
    q.Active:=false;
    q.SQL.clear;

    q2 := TIBQuery.Create(self);
    q2.Database := dm.dbrestaurante;
    q2.Transaction := dm.transacao;
    q2.Active:=false;
    q2.SQL.clear;

    q3 := TIBQuery.Create(self);
    q3.Database := dm.dbrestaurante;
    q3.Transaction := dm.transacao;
    q3.Active:=false;
    q3.SQL.clear;

    q.Active := false;
    q.SQL.clear;
    q.sql.add('select * from miniprinters where cod_miniprinter <> '+Quotedstr('001')+'and n_estacao='+dm.LeIni(2, 'BANCO_DE_DADOS','estacao'));
    q.Active:=true;
    q.First;
    registraEvento('Início da função de impressão de pedidos');

    while not q.Eof do
    begin
      q3.Active:=false;
      q3.sql.clear;
      q3.sql.add('select mesa from v_fila_impressao v where v.status=0  and v.tipo=1 and cod_miniprinter='+Quotedstr(q.fieldbyname('cod_miniprinter').value)+'group by v.mesa');
      try
       begin
         q3.Active:=true;
         q3.first;
       end;
      except
       begin
         registraErro('Erro ao abrir a Query 3');
       end;
       end;


      while (not q3.Eof ) do
      begin
        q2.Active:=false;
        q2.SQL.clear;
        q2.SQL.add('select * from v_fila_impressao where tipo=1 and mesa='+QUotedstr(q3.fieldbyname('mesa').value)+'and status=0 and cod_miniprinter='+Quotedstr(q.fieldbyname('cod_miniprinter').value));
        try
         begin
           q2.Active:=true;
         end;
        except
         begin
           registraErro('Erro ao abrir a Query 2 na impressão de pedidos');
         end;
        end;

        try
         begin
          dm.abre_porta_imp_NF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,q.fieldbyname('porta').value);
         end;
        except
          registraErro('Erro ao abrir a porta de impressão na impressão de pedidos');
        end;

        cabecalhoImpressaoLocalProducao(dm.getNumSequencia(q.fieldbyname('cod_miniprinter').value),q2.fieldbyname('cod_garcon').value,q.fieldbyname('marca').value,q.fieldbyname('modelo').value,q3.fieldbyname('mesa').value,1);

        while( not q2.Eof ) do
        begin
           registraEvento('Imprime a quantidade do produto ');
           try
             begin
               str:='#####***********************************';
               StrToInt(q2.fieldbyname('quantidade').Value);
               str:=dm.organizarCupom(str, InttoStr(StrToInt(q2.fieldbyname('quantidade').Value)) ,'#');
             end;
           except
             begin
               str:='#####***********************************';
               str:=dm.organizarCupom(str, FormatFloat('#0.000',strToFloat(q2.fieldbyname('quantidade').Value)) ,'#');
             end;
           end;
          registraEvento('Imprime a descrição do produto');
          str:=dm.organizarCupom(str,q2.fieldbyname('descricao').Value,'*');
          dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,str,false,false,false,true,true,true,true);
          dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'Preço: '+FormatFloat('R$ ###,###,##0.00 ',q2.fieldbyname('valorunitario').Value),false,false,false,false,true,false,false);
          memo_avisos.clear;
          memo_avisos.Lines.Add(trim(q2.fieldbyname('sabores').Value));
          dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'------------------------------------------------',false,false,false,true,false,false,false);
           if (trim(q2.fieldbyname('sabores').Value)  <> '') then
           begin
             dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'SABORES SELECIONADOS',true,false,false,false,true,true,true);
              totalLinhas:= memo_avisos.Lines.count;
              memo_avisos.Visible:=TRUE;
              linhaAtual:=0;
              while linhaAtual < totalLinhas do
              begin
               str:='########################################';
               str:=dm.organizarCupom(str,memo_avisos.Lines[linhaAtual],'#');
              dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,str,FALSE,false,false,false,true,true,false);
               linhaAtual:=linhaAtual+1;
              end;
           end;
           dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'------------------------------------------------',false,false,false,true,false,false,false);
           memo_avisos.clear;
           memo_avisos.Lines.Add(trim(q2.fieldbyname('observacoes').Value));
           if (trim(q2.fieldbyname('observacoes').Value)  <> '') then
           begin
             dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'OBSERVACOES',true,false,false,false,true,true,true);
              totalLinhas:= memo_avisos.Lines.count;
              linhaAtual:=0;
              while linhaAtual < totalLinhas do
              begin
               str:='########################################';
               str:=dm.organizarCupom(str,memo_avisos.Lines[linhaAtual],'#');
              dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,str,true,false,false,false,true,false,false);
               linhaAtual:=linhaAtual+1;
              end;
           end;
           registraEvento('Inicia a exclusão do pedido');
           excluiPedido(q2.fieldbyname('cod_produto').Value,q2.fieldbyname('n_seq').Value,'1');

          dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'------------------------------------------------',false,false,false,true,false,false,false);
          q2.Next;
        end;
       dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'',false,false,false,true,false,false,false);
       dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'',false,false,false,true,false,false,false);
       dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'',false,false,false,true,false,false,false);
       dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'',false,false,false,true,false,false,false);
       dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'',false,false,false,true,false,false,false);
       dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'',false,false,false,true,false,false,false);
       dm.cortaPapelImpNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value);
       q3.Next;
      end;
      q.Next;
    end;

    registraErro('Finaliza a impressão dos pedidos');

    q.Free;
    q2.free;
    q3.Free;

end;




procedure  TfrmPrincipalGerenciador.imprimeCancelamentoDePedidos();
var
 str : string;
 linhaAtual, totalLinhas : integer;
 q,q2,q3 : TIBQuery;

begin

    Q := TIBQuery.Create(self);
    q.Database := dm.dbrestaurante;
    q.Transaction := dm.transacao;
    q.Active:=false;
    q.SQL.clear;

    q2 := TIBQuery.Create(self);
    q2.Database := dm.dbrestaurante;
    q2.Transaction := dm.transacao;
    q2.Active:=false;
    q2.SQL.clear;

    q3 := TIBQuery.Create(self);
    q3.Database := dm.dbrestaurante;
    q3.Transaction := dm.transacao;
    q3.Active:=false;
    q3.SQL.clear;


    q.Active := false;
    q.SQL.clear;
    q.sql.add('select * from miniprinters where cod_miniprinter <> '+Quotedstr('001')+'and n_estacao='+dm.leini(2, 'BANCO_DE_DADOS','estacao'));
    q.Active:=true;
    q.First;

    while not q.Eof do
    begin
      q3.Active:=false;
      q3.sql.clear;
      q3.sql.add('select mesa from v_fila_impressao v where v.status=0  and v.tipo=2 and cod_miniprinter='+Quotedstr(q.fieldbyname('cod_miniprinter').value)+'group by v.mesa');
      q3.Active:=true;
      q3.first;

      while (not q3.Eof ) do
      begin
        q2.Active:=false;
        q2.SQL.clear;
        q2.SQL.add('select * from v_fila_impressao where tipo=2 and mesa='+QUotedstr(q3.fieldbyname('mesa').value)+'and status=0 and cod_miniprinter='+Quotedstr(q.fieldbyname('cod_miniprinter').value));
        q2.Active:=true;
      {
        try
         begin
           Comport.Connected:=false;
           Comport.close;
         end;
        except
          registraErro('Erro ao fechar a porta de impressão no cancelamento de pedidos');
        end;
          }
        try
         begin
          dm.abre_porta_imp_NF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,q.fieldbyname('porta').value);
         end;
        except
          registraErro('Erro ao abrir a porta de impressão no cancelamento de pedidos');
        end;

        dm.abre_porta_imp_NF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,q.fieldbyname('porta').value);
        cabecalhoImpressaoLocalProducao(dm.getNumSequencia(q.fieldbyname('cod_miniprinter').value),q2.fieldbyname('cod_garcon').value,q.fieldbyname('marca').value,q.fieldbyname('modelo').value,q3.fieldbyname('mesa').value,2);

        while( not q2.Eof ) do
        begin
           try
             begin
               str:='#####***********************************';
               StrToInt(q2.fieldbyname('quantidade').Value);
               str:= dm.organizarCupom(str, InttoStr(StrToInt(q2.fieldbyname('quantidade').Value)) ,'#');
             end;
           except
             begin
               str:='#####***********************************';
               str:= dm.organizarCupom(str, FormatFloat('#0.000',strToFloat(q2.fieldbyname('quantidade').Value)) ,'#');
             end;
           end;

           str:=dm.organizarCupom(str,q2.fieldbyname('descricao').Value,'*');
           dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,str,false,false,false,true,true,true,true);
           dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'Preço: '+FormatFloat('R$ ###,###,##0.00 ',q2.fieldbyname('valorunitario').Value),false,false,false,false,true,false,false);

           memo_avisos.clear;
           memo_avisos.Lines.Add(trim(q2.fieldbyname('observacoes').Value));
           if (trim(q2.fieldbyname('observacoes').Value)  <> '') then
           begin
              totalLinhas:= memo_avisos.Lines.count;
              linhaAtual:=0;
              while linhaAtual < totalLinhas do
              begin
               str:='########################################';
               str:=dm.organizarCupom(str,memo_avisos.Lines[linhaAtual],'#');
               dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,str,true,false,false,false,true,false,false);
               linhaAtual:=linhaAtual+1;
              end;
           end;

           excluiPedido(q2.fieldbyname('cod_produto').Value,q2.fieldbyname('n_seq').Value,'2');

           dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'------------------------------------------------',false,false,false,true,false,false,false);
           q2.Next;
        end;
        dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'',false,false,false,true,false,false,false);
        dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'',false,false,false,true,false,false,false);
        dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'',false,false,false,true,false,false,false);
        dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'',false,false,false,true,false,false,false);
        dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'',false,false,false,true,false,false,false);
        dm.imprime_linha_impNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value,'',false,false,false,true,false,false,false);
        dm.cortaPapelImpNF(q.fieldbyname('marca').value,q.fieldbyname('modelo').value);

        q3.Next;
      end;
      q.Next;
    end;


end;





procedure TfrmPrincipalGerenciador.excluiPedido(codProduto : string; nSeq : string; tipo : string);
var
 q : TIbquery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.SQL.clear;
  q.sql.Add('delete from fila_de_impressao where cod_produto='+Quotedstr(codProduto)+' and tipo='+tipo+' and n_seq='+QuotedStr(nSeq));
  try
   begin
    q.ExecSQL;
    registraEvento('Pedido '+nSeq+'-'+codProduto+' excluído da fila de impressão');
   end;
  except
   begin
     registraErro('Erro ao excluir o pedido '+nSeq+' da fila de impressão');
   end;
  end;
  q.Free;
end;





procedure TfrmPrincipalGerenciador.Button1Click(Sender: TObject);
begin
 frmPrincipalGerenciador.Hide;
end;

procedure TfrmPrincipalGerenciador.RxTrayIcon1DblClick(Sender: TObject);
begin
  frmPrincipalGerenciador.Show;
end;

procedure TfrmPrincipalGerenciador.Button2Click(Sender: TObject);
begin
  Application.terminate;
end;

end.
