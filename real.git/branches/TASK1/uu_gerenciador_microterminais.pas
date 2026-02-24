unit uu_gerenciador_microterminais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, RxMemDS, Grids, DBGrids,uu_modelo_vazio, StdCtrls,
  jpeg, RXShell, Menus;

type
  TfrmPrincipalTerminais = class(Tfrm_modelo_vazio)
    Timer1: TTimer;
    tbTerminais: TRxMemoryData;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    tbTerminaisterminal: TIntegerField;
    tbTerminaisestado: TStringField;
    tbTerminaisocupado: TIntegerField;
    tbTerminaisfuncao: TIntegerField;
    tbTerminaisparametroAtual: TIntegerField;
    tbTerminaisvalidar: TIntegerField;
    memoLogErros: TMemo;
    tbTerminaiscodGarcon: TStringField;
    tbTerminaiscodProduto: TStringField;
    tbTerminaisquantidade: TFloatField;
    tbTerminaisdescricaoProduto: TStringField;
    tbTerminaismesa: TStringField;
    tbTerminaiserroLancamento: TIntegerField;
    Image1: TImage;
    timerInicializacao: TTimer;
    Label3: TLabel;
    RxTrayIcon1: TRxTrayIcon;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure inicializacao;
    procedure Timer1Timer(Sender: TObject);
    procedure inicializaTerminais(conjunto : integer);
    procedure trataRetorno(conjunto : integer; canal : integer ; funcao : integer; retorno : integer);
    function  formataString(texto : string; espacos : integer) : string;
    procedure identificaFuncao(conjunto : integer; canal : integer; dadoLido : string);
    function  retornaIndiceParametroAtualFuncao(canal : integer) : integer;
    procedure habilitaValidacao(canal : integer);
    procedure desahabilitaValidacao(canal : integer);
    procedure trataDadoRecebidoTed(canal : integer ;dadoLido : string);
    function  retirarCaracteresFuncao(str: string) : string;

    procedure enviaMensagemDeErroTedcomDelay(canal : integer; mensagem : string);
    function enviarMensagemTerminal(conjunto : integer; canal : integer; msg : string) : integer;

    function   verificaSePrecisaValidarDado(canal : integer) : boolean;
    function   retornaFuncaoSendoExecutada(canal : integer) : integer;
    function   verificaTerminalOcupado(canal : integer) : boolean;

   function  funcaoConferencia(canal : integer; mesa : string) : boolean;
   function  validaFuncaoConferencia(canal : integer; dadoLido : string) : boolean;


   procedure  funcaoLancamento(conjunto : integer; canal : integer; dadoLido : string);
   procedure  reiniciarFuncaoLancamento(canal : integer);
   procedure  reiniciarTerminal(canal : integer);
   function   validacaoFuncaoLancamento(conjunto : integer; canal : integer; parametro :integer; dadoLido : string) : boolean;
   procedure  passaParaProximoParametro(canal : integer);
   procedure  voltaParaParameroAnterior(canal : integer);

   function  trataPesoLidoBalanca(peso : string) : string;
   procedure getPesoBalanca(conjunto : integer;  canal :integer);

   function  getNumeroLinhasDisplayTed(canal : integer) : integer;
   procedure setFuncaoAtualTerminal(canal : integer ; funcao : integer);
   procedure SetTerminalOcupado(canal : integer) ;
   function  getNumeroMesa(canal : integer) : string;
   procedure setNumeroMesa(canal : integer; numeroMesa : string);


   procedure setCodGarcon(canal : integer; codGarcon : string);

   procedure setQuantidade(canal : integer; quantidade : double);
   function  getQuantidade(canal : integer) : double;
   function  getCodGarcon(canal : integer) : string;
   procedure setDescricaoProduto(canal : integer; descricaoProduto: string);
   function  getDescricaoProduto(canal : integer) : string;
   procedure setCodProduto(canal : integer; codProduto : string);
   function  getCodProduto(canal : integer) : string;
   function  getErroLancamento(canal : integer) : integer;
   procedure setErroLancamento(canal : integer ; flag : integer);


   function conexao_banco : boolean;
   procedure registraErro(erro : string);
    procedure timerInicializacaoTimer(Sender: TObject);
    procedure RxTrayIcon1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  hub1 : integer; // Hub conectado na COM2
  qtdCanais : integer;  // Quantidade de canais do HUB 1
  frmPrincipalTerminais: TfrmPrincipalTerminais;

  funcaoEscolhidaTerminal : integer;  // Funcao escolhida
  dadoTratado : string; // Dado tratado sem o caracter identificador de função


implementation

uses UnitDeclaracoes, uu_data_module, uudmTerminais;

{$R *.dfm}


procedure TfrmPrincipalTerminais.inicializacao;
begin
  conexao_banco;
  tbTerminais.Active:=true;
  hub1:=0;
  qtdCanais := StrToInt(dm.LeIniTerminais(1,'GERAL','quantidadeCanais'));
  if (qtdCanais > 1) then
    setncan(qtdCanais)
   else
    setncan(0);
  tbTerminais.EmptyTable;
  inicializaTerminais(hub1);
  Timer1.Enabled:=true;

end;


procedure TfrmPrincipalTerminais.trataDadoRecebidoTed(canal : integer ;dadoLido : string);
var
 caratereFuncao : string;
 tamanho : integer;
begin
  caratereFuncao := trim(copy(dadoLido,length(dadoLido),1)); // Pega o último caracter da string - caracter que identifica a função.
  dadoTratado := retirarCaracteresFuncao(dadoLido);

  if (  (caratereFuncao = 'A') or (caratereFuncao = 'B') or (caratereFuncao = 'C')  )then
   begin
     if caratereFuncao = 'A' then funcaoEscolhidaTerminal := 4;
     if caratereFuncao = 'B' then funcaoEscolhidaTerminal := 3;
     if caratereFuncao = 'C' then funcaoEscolhidaTerminal := 2;

   end
  else
    begin
      funcaoEscolhidaTerminal:=1;
    end;
  setFuncaoAtualTerminal(canal, funcaoEscolhidaTerminal);
end;


procedure TfrmPrincipalTerminais.Timer1Timer(Sender: TObject);
var
 terminalAtual : integer; // Variável que armazena o terminal que passou o dado
 dadoLidoTerminal : shortstring; // armazena o dado lido do terminal
begin
  if (dm.dbrestaurante.TestConnected = false) then
   begin
     registraErro('Desconexão no banco de dados... Reconectando');
     conexao_banco;
     registraErro('Reinicializando terminais...');
     inicializaTerminais(hub1);
   end;

  if(getcnt(dadoLidoTerminal,terminalAtual,hub1)=1) then
  begin
    // Verifica se o terminal em questão já está
    // executando alguma função, se estiver dá sequência na mesma.

    if (verificaTerminalOcupado(terminalAtual)) then
      begin
        identificaFuncao(hub1,terminalAtual,dadoLidoTerminal);
      end
    else
      begin
        // Se o terminal não estiver executando nenhuma função
        // identifica a função através da substring do último caracter lido
        // que identifica a função.

        trataDadoRecebidoTed(terminalAtual,dadoLidoTerminal);
        identificaFuncao(hub1,terminalAtual,dadoTratado);
      end;

  end;
end;



procedure TfrmPrincipalTerminais.identificaFuncao(conjunto : integer; canal : integer; dadoLido : string);
var
 funcao : integer;
begin
  funcao:= retornaFuncaoSendoExecutada(canal);

  case funcao of
    1: begin
        SetTerminalOcupado(canal);  // Seta  o terminal atual como ocupado.
        funcaoLancamento(conjunto,canal,dadoLido);         // Chama Função de lancamento de conta
       end;

    2: begin
         funcaoConferencia(canal,dadoLido);
       end;
    3: begin
         reiniciarTerminal(canal);
       end;
    4: begin
         reiniciarTerminal(canal);
       end;
  end;
end;


function TfrmPrincipalTerminais.retornaFuncaoSendoExecutada(canal : integer) : integer;
begin
   if tbTerminais.Locate('terminal',canal,[])   then
    begin
      result := tbTerminaisfuncao.Value;
    end;
end;


// Função de lançamento na conta
procedure TfrmPrincipalTerminais.funcaoLancamento(conjunto : integer; canal : integer; dadoLido : string);
var
 parametroFuncao : integer;
 validacao       : integer;
begin
  parametroFuncao:= retornaIndiceParametroAtualFuncao(canal);
  if (  (verificaSePrecisaValidarDado(canal)) or (parametroFuncao=0)  )
   then
     begin     if ( (validacaoFuncaoLancamento(conjunto,canal,parametroFuncao,dadoLido)) ) then
     begin
      // Incrementa parâmetro da função.
      passaParaProximoParametro(canal);
     end;
   end;

  parametroFuncao:= retornaIndiceParametroAtualFuncao(canal);
  case parametroFuncao of
   1: begin
        envcldisp(conjunto,canal);

        if (dm.verificaExtratosEmitidos(getNumeroMesa(canal)) = true) then
         begin
           enviaMensagemDeErroTedcomDelay(canal,'MESA FECHADA!!!');
           reiniciarTerminal(CANAL);
           exit;
         end
        else
          begin
            // Se não é necessário digitar o código do garçon, pega o código do garçon programado para mesa balcão.
            if( StrToInt(dm.LeIni(2,'CAIXA','usa_cod_garcon')) =1) then
             begin
              enviarMensagemTerminal(conjunto,canal,formataString('Cod. Garcon:',getNumeroLinhasDisplayTed(canal)));
              habilitaValidacao(canal);
             end
            else
             begin
               setCodGarcon(canal,dm.getCodGarconMesaBalcao());
               passaParaProximoParametro(canal);
               parametroFuncao:= retornaIndiceParametroAtualFuncao(canal);
               desahabilitaValidacao(canal);
               funcaoLancamento(conjunto,canal,dadoLido);
             end;

          end;
      end;

   2: begin
        envcldisp(conjunto,canal);
        enviarMensagemTerminal(conjunto,canal,formataString('Cod. Produto',getNumeroLinhasDisplayTed(canal)));
        habilitaValidacao(canal);
      end;

   3: begin
        envcldisp(conjunto,canal);
        if (verificaSeProdutoLeQuantidadeDaBalanca(getCodProduto(canal),2) = false ) then
           enviarMensagemTerminal(conjunto,canal,formataString(getDescricaoProduto(canal),getNumeroLinhasDisplayTed(canal))+'Qtde: ')
        else
          begin
             enviarMensagemTerminal(conjunto,canal,formataString('Lendo o peso',getNumeroLinhasDisplayTed(canal))+'na balanca...: ');
             getPesoBalanca(conjunto,canal);
          end;
      end;

   4: begin
        if (dm.adicionarProdutoContaMicroterminal(canal,getNumeroMesa(canal),getCodGarcon(canal),getCodProduto(canal),getQuantidade(canal)) = false) then
           begin
             registraErro('Erro ao lançar produto '+getCodProduto(canal)+' do terminal '+IntToStr(canal));
             setErroLancamento(canal,1);
           end
        else
          begin
            setErroLancamento(canal,0);
            if (validacaoFuncaoLancamento(conjunto,canal,parametroFuncao,dadoLido)) then
             begin
               passaParaProximoParametro(canal);
               envcldisp(conjunto,canal);
               enviarMensagemTerminal(conjunto,canal,formataString('Lancar outro ?',getNumeroLinhasDisplayTed(canal))+'Tecle: Sim/Nao');
               habilitaValidacao(canal);
             end;
          end;
      end;
  end;

end;


function TfrmPrincipalTerminais.validacaoFuncaoLancamento(conjunto : integer; canal : integer; parametro :integer; dadoLido : string) : boolean;
var
 msg_erro : string;
begin

   if ( trim(copy(dadoLido,length(dadoLido),1)) = 'A' ) then
   begin
     reiniciarTerminal(canal);
     result:=false;
     exit;
   end;

   if ((parametro >1) and (parametro <4)  ) then
    begin
     if ( trim(copy(dadoLido,length(dadoLido),1)) = 'C' ) then
       begin
         voltaParaParameroAnterior(canal);
         Result:=false;
         exit;
       end;
    end;

   Result:=true;
   case parametro of
     0: begin
         try
           begin
             dadoLido:= FormatFloat('0000',StrToFLoat(dadoLido));
           end;
         except
          begin
            msg_erro:='Numero de mesa  invalido!!';

            result:=false;
          end;
         end;

         if (Result = false) then
          begin
            enviaMensagemDeErroTedcomDelay( canal, msg_erro);
            Result:=false;
           end
         else
          begin
           setNumeroMesa(canal,dadoLido);
          end;
        end;

     1: begin    // Código do Garçon / atendente
          try
            dadoLido:= FormatFloat('000', strtofloat(dadoLido ));
          except
           begin
             Result:=false;
           end;
          end;

          result:=(verificaExistenciaGarconMetre(dadoLido));

          if (Result = false) then
            begin
             msg_erro:='Cod. de garcon   Invalido !!';
             enviaMensagemDeErroTedcomDelay( canal, msg_erro);
             Result:=false;
           end
          else
            begin
              setCodGarcon(canal,dadoLido);
            end;
        end;

     2: begin    // Código do produto
          try
            dadoLido:= FormatFloat('00000', strtofloat(dadoLido ));
          except
           begin
           end;
          end;

          result:=(verificaExistenciaProduto(dadoLido,2));

          if (Result = false) then
            begin
             msg_erro:='Cod. de produto    Invalido !!';
             enviaMensagemDeErroTedcomDelay( canal,msg_erro);
             Result:=false;
           end
          else
            begin
              setCodProduto(canal,dadoLido);
              setDescricaoProduto(canal,getDescricaoReduzidaProduto(dadoLido));
            end;
        end;


     3: begin    // Validação de Quantidade
          if (verificaSeProdutoLeQuantidadeDaBalanca(getCodProduto(canal),2) = true) then
           begin
             // Se o peso não é lido na balança...
             dadoLido:= trataPesoLidoBalanca(dadoLido);
           end;

          try
           begin
            dadoLido:= dm.TrocaPontoPVirgula(dadoLido);
           end;
          except
            begin
             msg_erro:='Quantidade      invalida';
             Result:=false;
            end;
          end;

          try
           StrToFloat(dadoLido);
          except
           begin
              if (verificaSeProdutoLeQuantidadeDaBalanca(getCodProduto(canal),2) = true) then
                msg_erro:='Peso invalido'
              else
                msg_erro:='Quantidade      invalida';
            Result:=false;
           end;
          end;

          if ( (result=true) and (verificaSeProdutoVendeFracionado(getCodProduto(canal),2) = false) )then
           begin
            try
             strToInt(dadoLido);
            except
             begin
              msg_erro:='Fracao nao      permitida!!';
              result:=false;
             end;
            end;
           end;


          if (Result = false) then
            begin
             enviaMensagemDeErroTedcomDelay( canal,msg_erro);
             Result:=false;
           end
          else
           begin
             setQuantidade(canal,strToFloat(dadoLido));
           end;  
        end;


     4: begin    // lanca o produto na conta
          if (getErroLancamento(canal) = 1)  then
            begin
              msg_erro:='Erro ao lançar  produto';
              result:=false;
            end
          else
            begin
              msg_erro:='Produto lancado   com sucesso!';
              result:=true;
            end;

          if (Result = false) then
            begin
             enviaMensagemDeErroTedcomDelay( canal, msg_erro);
             Result:=false;
           end
          else
            begin
             enviaMensagemDeErroTedcomDelay( canal, msg_erro);
             Result:=true;
            end;
        end;


     5: begin    //Verifica se reinicializa a função de lançamento
          if (  (trim(dadoLido)='C') or (trim(dadoLido)='B') ) then
           begin
             if (trim(dadoLido)='C') then
               begin   //  Reinicia a função de lancamento a partir do cod. do produto
                 reiniciarFuncaoLancamento(canal);
                 habilitaValidacao(canal);
                 Result:=true;
               end
             else
               begin // Reinicializa o ted para a tela inicial
                 reiniciarTerminal(canal);
                 desahabilitaValidacao(canal);
                 Result:=false;
               end;
           end
          else
            begin
             reiniciarTerminal(canal);
             desahabilitaValidacao(canal);
             Result:=false;
            end
        end;
   end;
end;



procedure TfrmPrincipalTerminais.reiniciarFuncaoLancamento(canal : integer);
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     tbTerminais.edit;
     tbTerminaisfuncao.value:=1;
     tbTerminaisparametroAtual.value:=1;
     tbTerminaisocupado.value:=1;
     tbTerminais.Post;
     desahabilitaValidacao(canal);
     DBGrid1.Refresh;
   end;
end;


function  TfrmPrincipalTerminais.validaFuncaoConferencia(canal : integer; dadoLido : string) : boolean;
var
frmVazio : Tfrm_modelo_vazio;
begin
  if(verificaTerminalOcupado(canal) = false) then   // Se o terminal não está ocupado, significa que o dado a tratar é
   begin                                            // o número da mesa para conferência
     try
      begin
       dadoLido:=FormatFloat('0000',StrToFloat(dadoLido));
       setNumeroMesa(canal,dadoLido) // Seta o número da mesa para o terminal em questão
      end;
     except
      begin
       envcldisp(hub1,canal);
       enviaMensagemDeErroTedcomDelay(canal,'Mesa invalida!');
       Result:=false;
       exit;
      end;
     end;

     if (dm.verificaseExisteMovimentoMesa(dadoLido) = false) then
      begin
        envcldisp(hub1,canal);
        enviaMensagemDeErroTedcomDelay(canal,formataString('Mesa sem',getNumeroLinhasDisplayTed(canal))+'Movimento!!');
        Result:=false;
        exit;
      end;
   end

  else
    begin
      if(trim(dadoLido) ='A') then
       begin
         Result:=false;
         exit;
       end;
    end;


   Result:=true;
end;


function TfrmPrincipalTerminais.funcaoConferencia(canal : integer; mesa : string) : boolean;
begin

   if ( validaFuncaoConferencia(canal,mesa) = false) then
    begin
      reiniciarTerminal(canal);
      result:=false;
      exit;
    end;

   case canal of
   0: begin
        if (verificaTerminalOcupado(canal) = false) then
         begin
           dmTerminais.qryTerminal0.Active:=false;
           dmTerminais.qryTerminal0.sql.clear;
           dmTerminais.qryTerminal0.sql.add('select vm.*, p.descricao_reduzida,p.cod_barras from V_MOV_MESA vm  inner join produtos p ');
           dmTerminais.qryTerminal0.SQL.add(' on (p.cod_produto = vm.cod_produto)');
           dmTerminais.qryTerminal0.sql.add(' where vm.mesa ='+Quotedstr(getNumeroMesa(canal)));
           dmTerminais.qryTerminal0.Active:=true;
           SetTerminalOcupado(canal);
           memoLogErros.Lines:=dmTerminais.qryTerminal0.SQL;
           envcldisp(hub1,canal);
           enviarMensagemTerminal(hub1,canal,formataString(dmTerminais.qryTerminal0.fieldbyname('descricao_reduzida').Value,getNumeroLinhasDisplayTed(canal))+formataString(dmTerminais.qryTerminal0.fieldbyname('qtde').AsString,3)+' X '+ formatFloat('R$ #0.00',dmTerminais.qryTerminal0.fieldbyname('valor_unitario').value));
           dmTerminais.qryTerminal0.Next;
         end
        else
          begin
            if (dmTerminais.qryTerminal0.Eof = false) then
             begin
               envcldisp(hub1,canal);
               enviarMensagemTerminal(hub1,canal,formataString(dmTerminais.qryTerminal0.fieldbyname('descricao_reduzida').Value,getNumeroLinhasDisplayTed(canal))+formataString(dmTerminais.qryTerminal0.fieldbyname('qtde').AsString,3)+' X '+formatFloat('R$ #0.00',dmTerminais.qryTerminal0.fieldbyname('valor_unitario').value));
               dmTerminais.qryTerminal0.Next;
             end
            else
              begin
                reiniciarTerminal(canal);
              end;
          end
      end;

   1: begin
        if (verificaTerminalOcupado(canal) = false) then
         begin
           dmTerminais.qryTerminal1.Active:=false;
           dmTerminais.qryTerminal1.sql.clear;
           dmTerminais.qryTerminal1.sql.add('select vm.*, p.descricao_reduzida,p.cod_barras from V_MOV_MESA vm  inner join produtos p ');
           dmTerminais.qryTerminal1.SQL.add(' on (p.cod_produto = vm.cod_produto)');
           dmTerminais.qryTerminal1.sql.add(' where vm.mesa ='+Quotedstr(getNumeroMesa(canal)));
           dmTerminais.qryTerminal1.Active:=true;
           SetTerminalOcupado(canal);
           memoLogErros.Lines:=dmTerminais.qryTerminal1.SQL;
           envcldisp(hub1,canal);
           enviarMensagemTerminal(hub1,canal,formataString(dmTerminais.qryTerminal1.fieldbyname('descricao_reduzida').Value,getNumeroLinhasDisplayTed(canal))+formataString(dmTerminais.qryTerminal1.fieldbyname('qtde').AsString,3)+' X '+ formatFloat('R$ #0.00',dmTerminais.qryTerminal1.fieldbyname('valor_unitario').value));
           dmTerminais.qryTerminal1.Next;
         end
        else
          begin
            if (dmTerminais.qryTerminal1.Eof = false) then
             begin
               envcldisp(hub1,canal);
               enviarMensagemTerminal(hub1,canal,formataString(dmTerminais.qryTerminal1.fieldbyname('descricao_reduzida').Value,getNumeroLinhasDisplayTed(canal))+formataString(dmTerminais.qryTerminal1.fieldbyname('qtde').AsString,3)+' X '+formatFloat('R$ #0.00',dmTerminais.qryTerminal1.fieldbyname('valor_unitario').value));
               dmTerminais.qryTerminal1.Next;
             end
            else
              begin
                reiniciarTerminal(canal);
              end;
          end
      end;









  end;


end;



procedure TfrmPrincipalTerminais.setNumeroMesa(canal : integer; numeroMesa : string);
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     tbTerminais.edit;
     tbTerminaisMesa.value := numeroMesa;
     tbTerminais.Post;
     DBGrid1.Refresh;
   end;
end;



function TfrmPrincipalTerminais.getNumeroMesa(canal : integer) : string;
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     result:= tbTerminaisMesa.value;
   end;
end;


function TfrmPrincipalTerminais.getNumeroLinhasDisplayTed(canal : integer) : integer;
begin
  Result := StrToInt(dm.LeIniTerminais(1,'TERMINAL'+IntToStr(canal) ,'colunasDisplay'));
end;



procedure TfrmPrincipalTerminais.setCodGarcon(canal : integer; codGarcon : string);
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     tbTerminais.edit;
     tbTerminaiscodGarcon.Value:= codGarcon;
     tbTerminais.Post;
     DBGrid1.Refresh;
   end;
end;


function TfrmPrincipalTerminais.getCodGarcon(canal : integer) : string;
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     result:=tbTerminaiscodGarcon.Value;
   end;
end;



procedure TfrmPrincipalTerminais.passaParaProximoParametro(canal : integer);
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     tbTerminais.edit;
     tbTerminaisparametroAtual.Value:= tbTerminaisparametroAtual.Value+1;
     tbTerminais.Post;
     DBGrid1.Refresh;
   end;
end;


procedure TfrmPrincipalTerminais.voltaParaParameroAnterior(canal : integer);
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     tbTerminais.edit;
     tbTerminaisparametroAtual.Value:= tbTerminaisparametroAtual.Value-1;
     tbTerminais.Post;
     DBGrid1.Refresh;
   end;
end;


procedure TfrmPrincipalTerminais.setCodProduto(canal : integer; codProduto: string);
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     tbTerminais.edit;
     tbTerminaiscodProduto.Value:= codProduto;
     tbTerminais.Post;
     DBGrid1.Refresh;
   end;
end;



function TfrmPrincipalTerminais.getCodProduto(canal : integer) : string;
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     result:= tbTerminaiscodProduto.Value;
   end;
end;


procedure TfrmPrincipalTerminais.setErroLancamento(canal : integer; flag : integer);
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     tbTerminais.edit;
     tbTerminaisErroLancamento.Value:=flag;
     tbTerminais.Post;
     DBGrid1.Refresh;
   end;
end;

function  TfrmPrincipalTerminais.getErroLancamento(canal : integer) : integer;
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     result:= tbTerminaisErroLancamento.Value;
   end;
end;


procedure TfrmPrincipalTerminais.setDescricaoProduto(canal : integer; descricaoProduto: string);
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     tbTerminais.edit;
     tbTerminaisdescricaoProduto.Value:= descricaoProduto;
     tbTerminais.Post;
     DBGrid1.Refresh;
   end;
end;

function TfrmPrincipalTerminais.getDescricaoProduto(canal : integer) : string;
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     result := tbTerminaisDescricaoProduto.value;
   end;
end;



procedure TfrmPrincipalTerminais.setQuantidade(canal : integer; quantidade : double);
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     tbTerminais.edit;
     tbTerminaisQuantidade.Value:= quantidade;
     tbTerminais.Post;
     DBGrid1.Refresh;
   end;
end;



function TfrmPrincipalTerminais.getQuantidade(canal : integer) : double;
begin
  if tbTerminais.Locate('terminal',canal,[])   then
   begin
     result:= tbTerminaisQuantidade.Value;
   end;
end;



procedure TfrmPrincipalTerminais.enviaMensagemDeErroTedcomDelay(canal : integer; mensagem : string);
begin
  envcldisp(0,canal);
  envcmbeep(0,canal);
  enviarMensagemTerminal(hub1,canal,mensagem);
  envdelay(0,canal,10);
end;



function TfrmPrincipalTerminais.retornaIndiceParametroAtualFuncao(canal : integer) : integer;
begin

   if tbTerminais.Locate('terminal',canal,[])   then
    result:= tbTerminaisparametroAtual.Value;
end;



// Função que habilita o flag de validação do último parâmetro informado

procedure TfrmPrincipalTerminais.habilitaValidacao(canal : integer);
begin
   if tbTerminais.Locate('terminal',canal,[])   then
    begin
      tbTerminais.Edit;
      tbTerminaisvalidar.Value:=1;
      tbTerminais.Post;
      DBGrid1.Refresh;
    end;
end;


// Função que dehabilita o flag de validação do último parâmetro informado
procedure TfrmPrincipalTerminais.desahabilitaValidacao(canal : integer);
begin
   if tbTerminais.Locate('terminal',canal,[])   then
    begin
      tbTerminais.Edit;
      tbTerminaisvalidar.Value:=0;
      tbTerminais.Post;
      DBGrid1.Refresh;
    end;
end;




// Função que verifica se o último parâmetro digitado no terminal
// em questão precisa ser validado para passar para o próximo parâmetro.
function TfrmPrincipalTerminais.verificaSePrecisaValidarDado(canal : integer) : boolean;
begin
   if tbTerminais.Locate('terminal',canal,[])   then
    begin
      if(tbTerminaisvalidar.value = 1) then
        Result:=true
      else
        result:=false;
    end;

end;



function TfrmPrincipalTerminais.verificaTerminalOcupado(canal : integer) : boolean;
begin
   if tbTerminais.Locate('terminal',canal,[])   then
    begin
      if(tbTerminaisOcupado.value = 1) then
        Result:=true
      else
        result:=false;
    end;
end;



// Seta o terminal atual como ocupado.
procedure TfrmPrincipalTerminais.SetTerminalOcupado(canal : integer) ;
begin
   if tbTerminais.Locate('terminal',canal,[])   then
    begin
      tbTerminais.Edit;
      tbTerminaisOcupado.value:= 1;
      tbTerminais.post;
      DBGrid1.Refresh;
    end;
end;


// Seta a função corrente sendo executada pelo ted.
procedure TfrmPrincipalTerminais.setFuncaoAtualTerminal(canal : integer ; funcao : integer);
begin
   if tbTerminais.Locate('terminal',canal,[])   then
    begin
      tbTerminais.Edit;
      tbTerminaisFuncao.value:= funcao;
      tbTerminais.post;
      DBGrid1.Refresh;
    end;
end;


procedure TfrmPrincipalTerminais.reiniciarTerminal(canal : integer);
var
msg : string;
begin
   if tbTerminais.Locate('terminal',canal,[])   then
    begin
     dm.atualizarPedidos(canal);
     tbTerminais.edit;
     tbTerminaisterminal.Value := canal;
     tbTerminaisocupado.Value         := 0;
     tbTerminaisfuncao.Value          := 0;
     tbTerminaisparametroAtual.value  := 0;
     tbTerminais.post;
     DBGrid1.Refresh;
     msg:= formataString(dm.LeIniTerminais(2,'TERMINAL'+IntToStr(canal),'tituloInicial'),getNumeroLinhasDisplayTed(canal));
     enviarMensagemTerminal(hub1,canal,msg );
     trataRetorno(hub1,canal,1,enviarMensagemTerminal(hub1,canal,msg ));
     desahabilitaValidacao(canal);
   end;

end;















procedure TfrmPrincipalTerminais.inicializaTerminais(conjunto : integer);
var
canalAtual : integer;
msg : string;
begin
  canalAtual:=0;
  while (canalAtual < qtdCanais) do
   begin
     tbTerminais.Append;
     tbTerminaisterminal.Value := canalAtual;
     tbTerminaisocupado.Value         := 0;
     tbTerminaisfuncao.Value          := 0;
     tbTerminaisparametroAtual.value  := 0;
     tbTerminais.post;
     DBGrid1.Refresh;
     msg:= formataString(dm.LeIniTerminais(2,'TERMINAL'+IntToStr(canalAtual),'tituloInicial'),getNumeroLinhasDisplayTed(canalAtual) );
//     enviarMensagemTerminal(conjunto,canalAtual,msg );
     trataRetorno(conjunto,canalAtual,1,enviarMensagemTerminal(conjunto,canalAtual,msg ));
     canalAtual:=canalAtual+1;
   end;
end;

function TfrmPrincipalTerminais.formataString(texto : string ; espacos : integer) : string;
var
  tamanho : integer;
begin
  tamanho := StrLen(pchar(Texto));
  if(tamanho < espacos ) then
   begin
     while(tamanho  < espacos) do
     begin
       texto:=texto+' ';
       tamanho:=tamanho+1;
     end;
   end;
  Result:=texto;
end;




procedure TfrmPrincipalTerminais.trataRetorno(conjunto : integer; canal : integer ; funcao : integer; retorno : integer);
begin

    case funcao of
     1: begin
          case retorno of
            0: begin
                 if tbTerminais.Locate('terminal',canal,[])  then
                  begin
                     tbTerminais.Edit;
                     tbTerminais.fields[1].Value := 'O ted não recebeu a mensagem';
                  end;
               end;

            1: begin
                 if tbTerminais.Locate('terminal',canal,[])  then
                  begin
                     tbTerminais.Edit;
                     tbTerminais.fields[1].Value := 'Mensagem recebida no ted.'
                  end;
               end;
          end;
        end;

     2: begin

        end;
    end;

    tbTerminais.Post;
    DBGrid1.Refresh;
end;





function TfrmPrincipalTerminais.retirarCaracteresFuncao(str: string) : string;
var n : integer;
achou : boolean;
begin
  n:=1;
  while( (n <=  length(Text)) ) do//for n := 1 to length(Text) do
  begin
    if  ( (trim(Copy(str,n,1)) ='A') or (trim(Copy(str,n,1)) ='B') or (trim(Copy(str,n,1)) ='C')  )     then
      begin
        Delete(str,n,1); Insert('',str,n);
        achou:=true;
      end;
    n:=n+1;
   end;
  Result := str;
end;




function TfrmPrincipalTerminais.conexao_banco : boolean;
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

procedure TfrmPrincipalTerminais.registraErro(erro : string);
begin
  memoLogErros.Lines.Add(erro+' Data: '+FormatDateTime('DD/MM/YYY',date)+' Hora: '+FormatDateTime('HH:MM:SS',Time));
  if FileExists('c:\restaurante\logs\LogErrosMicroterminais'+FormatDateTime('DDMMYYY',date)+'.err')
   then
      begin
        DeleteFile('c:\restaurante\logs\LogErrosMicroterminais'+FormatDateTime('DDMMYYY',date)+'.err')
      end;

  memoLogErros.Lines.SaveToFile('c:\restaurante\logs\LogErrosMicroterminais'+FormatDateTime('DDMMYYY',date)+'.err')
end;


procedure TfrmPrincipalTerminais.timerInicializacaoTimer(Sender: TObject);
begin
  inherited;
   inicializacao();
   timerInicializacao.Enabled:=false;
   frmPrincipalTerminais.hide;
   
end;

procedure TfrmPrincipalTerminais.RxTrayIcon1DblClick(Sender: TObject);
begin
  inherited;
  frmPrincipalTerminais.Show;
end;

procedure TfrmPrincipalTerminais.Button1Click(Sender: TObject);
begin
  inherited;
  inicializacao;
end;

procedure TfrmPrincipalTerminais.Button2Click(Sender: TObject);
begin
  inherited;
  Application.terminate;
end;

procedure TfrmPrincipalTerminais.Button3Click(Sender: TObject);
begin
  inherited;
  frmPrincipalTerminais.Hide;
end;

procedure TfrmPrincipalTerminais.FormActivate(Sender: TObject);
begin
  inherited;
  Daruma_FI_FechaPortaSerial();
end;


function TfrmPrincipalTerminais.enviarMensagemTerminal(conjunto : integer; canal : integer; msg : string) : integer;
begin
 result :=envtmsg(conjunto,canal,msg);
end;


procedure TfrmPrincipalTerminais.getPesoBalanca(conjunto : integer;  canal :integer);
begin
 getSerial(conjunto,canal);
end;

function TfrmPrincipalTerminais.trataPesoLidoBalanca(peso : string) : string;
var
p_inteira : string;
p_decimal : string;
begin
  peso:=copy(peso,2,6);
  peso:=trim(peso);
  p_inteira:=copy(peso,1,2);
  p_decimal:=copy(peso,3,6);
  peso:=p_inteira+','+p_decimal;
  result:=peso;
end;

end.
