unit uu_controle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, IBquery;

type
  Tfrm_controle = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function importar_arquivos : boolean;
    procedure  importarEstornos();
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    function TrocaVirgPPto(Valor: string): String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_controle: Tfrm_controle;
  patch : string;


implementation

uses  uu_relatorio, DB, uu_data_module, uu_frm_principal_naves;

{$R *.dfm}

procedure Tfrm_controle.BitBtn1Click(Sender: TObject);
VAR
 pacth : string;
begin

end;

procedure Tfrm_controle.Button1Click(Sender: TObject);
begin
  ShowMessage('Ao capturar os dados certifique-se que nenhuma estação está com o sistema aberto, do contrário poderá haver corrupção dos dados e arquivos.');

  if MessageDlg('Confirma início da recepção ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    if (importar_arquivos = true) then
    ShowMessage('Exportação concluída!');
  end;
end;

function Tfrm_controle.importar_arquivos : boolean;
var
 codigo : string;
 linha : string;
 arq: TextFile; {handle do arquivo texto}
 chave : string;
 arquivo : string;
 ln : integer;
 codigo_venda : string;
 data_do_sistema : Tdate;
  local_banco,usuario,senha : string;
begin

  local_banco:=dm.LeIni(2,'BANCO_DE_DADOS','local_bd');
  usuario:=dm.LeIni(2,'BANCO_DE_DADOS','usuario');
  senha:=dm.LeIni(2,'BANCO_DE_DADOS','senha');
  dm.DB2.Connected:=false;
  dm.DB2.DatabaseName:=local_banco;
  dm.DB2.Params.Values['user_name']:=usuario;
  dm.DB2.Params.Values['password']:=senha;
  try
    dm.DB2.Connected:=true;
  except
    begin
      ShowMessage('Erro ao conectar com o servidor / caixa ');
      exit;
    end;
  end;





dm.qry_remota2.Active:=false;
dm.qry_remota2.SQL.Clear;
dm.qry_remota2.sql.add('select data_sistema from parametros');
dm.qry_remota2.Active:=true;
data_do_sistema:=dm.qry_remota2.fieldbyname('data_sistema').value;

patch:=dm.LeIni(2,'BANCO_DE_DADOS','patch');


 dm.qryauxiliar.Active:=false;
 dm.qryauxiliar.SQL.clear;
 dm.qryauxiliar.sql.add('delete from usuarios');
 dm.qryauxiliar.ExecSQL;



 dm.qryauxiliar.Active:=false;
 dm.qryauxiliar.SQL.clear;
 dm.qryauxiliar.sql.add('delete from produtos');
 dm.qryauxiliar.ExecSQL;

 dm.qryauxiliar.Active:=false;
 dm.qryauxiliar.SQL.clear;
 dm.qryauxiliar.sql.add('delete from aliquotas');
 dm.qryauxiliar.ExecSQL;

 dm.qryauxiliar.Active:=false;
 dm.qryauxiliar.SQL.clear;
 dm.qryauxiliar.sql.add('delete from garcons');
 dm.qryauxiliar.ExecSQL;

 dm.qryauxiliar.Active:=false;
 dm.qryauxiliar.SQL.clear;
 dm.qryauxiliar.sql.add('delete from formas_pagamento');
 dm.qryauxiliar.ExecSQL;

 dm.qryauxiliar.Active:=false;
 dm.qryauxiliar.SQL.clear;
 dm.qryauxiliar.sql.add('delete from  grupos');
 dm.qryauxiliar.ExecSQL;

 dm.qryauxiliar.Active:=false;
 dm.qryauxiliar.SQL.clear;
 dm.qryauxiliar.sql.add('delete from  tipos_estorno');
 dm.qryauxiliar.ExecSQL;


 dm.qry_remota.Active:=false;
 dm.qry_remota.sql.clear;
 dm.qry_remota.SQL.Add('select * from usuarios order by cod_usuario');
 dm.qry_remota.Active:=true;
 dm.qry_remota.First;

 while not dm.qry_remota.eof do
 begin
   dm.qryauxiliar.Active:=false;
   dm.qryauxiliar.sql.clear;
   dm.qryauxiliar.sql.add('insert into usuarios (cod_usuario,login,nome_usuario,senha) values (');
   dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota.fieldbyname('cod_usuario').value));
   dm.qryauxiliar.sql.add(','+Quotedstr(dm.qry_remota.fieldbyname('login').value));
   dm.qryauxiliar.sql.add(','+Quotedstr(dm.qry_remota.fieldbyname('nome_usuario').value));
   dm.qryauxiliar.sql.add(','+Quotedstr(dm.qry_remota.fieldbyname('senha').value)+')');
   try
     dm.qryauxiliar.ExecSQL;
   except
   end;

   dm.qry_remota.Next;
 end;

 dm.qry_remota.Active:=false;
 dm.qry_remota.sql.clear;
 dm.qry_remota.SQL.Add('select * from grupos order by cod_grupo');
 dm.qry_remota.Active:=true;
 dm.qry_remota.First;

 while not dm.qry_remota.eof do
 begin
   dm.qryauxiliar.Active:=false;
   dm.qryauxiliar.sql.clear;
   dm.qryauxiliar.sql.add('insert into grupos (cod_grupo,descricao) values (');
   dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota.fieldbyname('cod_grupo').value));
   dm.qryauxiliar.sql.add(','+Quotedstr(dm.qry_remota.fieldbyname('descricao').value)+')');

   try
     dm.qryauxiliar.ExecSQL;
   except
   end;
   dm.qry_remota.Next;
 end;



 dm.qry_remota.Active:=false;
 dm.qry_remota.sql.clear;
 dm.qry_remota.SQL.Add('select * from formas_pagamento order by cod_forma');
 dm.qry_remota.Active:=true;
 dm.qry_remota.First;

 while not dm.qry_remota.eof do
 begin
   dm.qryauxiliar.Active:=false;
   dm.qryauxiliar.sql.clear;
   dm.qryauxiliar.sql.add('insert into formas_pagamento (cod_forma,descricao) values (');
   dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota.fieldbyname('cod_forma').value));
   dm.qryauxiliar.sql.add(','+Quotedstr(dm.qry_remota.fieldbyname('descricao').value)+')');
   try
     dm.qryauxiliar.ExecSQL;
   except
   end;
   dm.qry_remota.Next;
 end;




 dm.qry_remota.Active:=false;
 dm.qry_remota.sql.clear;
 dm.qry_remota.SQL.Add('select * from produtos order by cod_produto ');
 dm.qry_remota.Active:=true;
 dm.qry_remota.First;

 while not dm.qry_remota.eof do
 begin
   dm.qryauxiliar.Active:=false;
   dm.qryauxiliar.sql.clear;
   dm.qryauxiliar.sql.add('insert into produtos  (cod_produto,cod_grupo,descricao,valor_unitario,');
   dm.qryauxiliar.sql.add('cod_aliquota,cod_barras,parametro_contagem,balanca,fracionado,preco_digitado,informar_sabor,');
   dm.qryauxiliar.sql.add('controla_estoque,comissionado,valor_comissao,descricao_reduzida) values (');
   dm.qryauxiliar.sql.add(''+QUotedstr(dm.qry_remota.fieldbyname('cod_produto').value)+',');
   dm .qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota.fieldbyname('cod_grupo').value)+',');
   dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota.fieldbyname('descricao').value)+',');
   dm.qryauxiliar.SQL.add(''+dm.TrocaVirgPPto(dm.qry_remota.fieldbyname('valor_unitario').value)+',');
   dm.qryauxiliar.sql.add(''+quotedstr(dm.qry_remota.fieldbyname('cod_aliquota').value)+',');
   dm.qryauxiliar.sql.add(''+quotedstr(dm.qry_remota.fieldbyname('cod_barras').value)+','+dm.TrocaVirgPPto(dm.qry_remota.fieldbyname('parametro_contagem').value)+',');
   dm.qryauxiliar.sql.add(''+dm.qry_remota.fieldbyname('balanca').AsString+',');
   dm.qryauxiliar.sql.add(''+dm.qry_remota.fieldbyname('fracionado').AsString+',');
   dm.qryauxiliar.sql.add(''+dm.qry_remota.fieldbyname('preco_digitado').AsString+',');
   dm.qryauxiliar.sql.add(''+dm.qry_remota.fieldbyname('informar_sabor').AsString+',');
   dm.qryauxiliar.sql.add(''+dm.qry_remota.fieldbyname('controla_estoque').AsString+',');
   dm.qryauxiliar.sql.add(''+dm.qry_remota.fieldbyname('comissionado').AsString+',');
   dm.qryauxiliar.SQL.add(''+dm.TrocaVirgPPto(dm.qry_remota.fieldbyname('valor_comissao').value)+',');
   dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota.fieldbyname('descricao_reduzida').value)+')');


   try
     dm.qryauxiliar.ExecSQL;
   except
   end;
   dm.qry_remota.Next;
 end;

 dm.qry_remota.Active:=false;
 dm.qry_remota.SQL.clear;
 dm.qry_remota.SQL.add('select * from aliquotas');
 dm.qry_remota.Active:=true;
 dm.qry_remota.First;

 while not dm.qry_remota.eof do
 begin
   dm.qryauxiliar.Active:=false;
   dm.qryauxiliar.sql.clear;
   dm.qryauxiliar.sql.add('insert into aliquotas (cod_aliquota,descricao,parametro,percentagem,sintegra) values (');
   dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota.fieldbyname('cod_aliquota').value)+',');
   dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota.fieldbyname('descricao').value)+',');
   dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota.fieldbyname('parametro').value)+',');
   dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(dm.qry_remota.fieldbyname('percentagem').value)+',');
   dm.qryauxiliar.sql.add(''+Quotedstr('')+')');
   dm.qryauxiliar.ExecSQL;
   dm.qry_remota.Next;
 end;


 dm.qry_remota.Active:=false;
 dm.qry_remota.SQL.clear;
 dm.qry_remota.SQL.add('select * from garcons');
 dm.qry_remota.Active:=true;
 dm.qry_remota.First;

 while not dm.qry_remota.Eof do
 begin
   dm.qryauxiliar.Active:=false;
   dm.qryauxiliar.sql.clear;
   dm.qryauxiliar.sql.add('insert into garcons (cod_garcon,apelido,metre,cod_metre) values (');
   dm.qryauxiliar.SQL.add(''+Quotedstr(dm.qry_remota.fieldbyname('cod_garcon').value)+',');
   dm.qryauxiliar.SQL.add(''+Quotedstr(dm.qry_remota.fieldbyname('apelido').value)+',');
   dm.qryauxiliar.SQL.add(''+Inttostr(dm.qry_remota.fieldbyname('metre').value)+',');
   dm.qryauxiliar.SQL.add(''+Quotedstr(dm.qry_remota.fieldbyname('cod_metre').value)+')');
   dm.qryauxiliar.ExecSQL;
   dm.qry_remota.Next;
 end;

  dm.qry_remota.Active:=false;
  dm.qry_remota.sql.clear;
  dm.qry_remota.SQL.add('select * from vendas where nv=0  ');
  dm.qry_remota.active:=true;
  dm.qry_remota.First;

  while not dm.qry_remota.Eof do
  begin
    codigo_venda:=FormatFloat('00000000',dm.maiorVenda('vendas','cod_venda'));
    if ( StrToInt(codigo_venda) = 1) then
     begin
      codigo_venda:=FormatFloat('0000000',StrToFloat(codigo_venda));
      codigo_venda:='1'+codigo_venda;
     end;
    dm.qryauxiliar.Active:=false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.sql.add(' insert into vendas (cod_venda,data,hora,cupom,valor_bruto,valor_desconto,valor_txserv,valor_total,');
    dm.qryauxiliar.sql.add(' total_pago,valor_troco,repique,cod_usuario,numero_caixa,processada,imp,mesa) values (');
    dm.qryauxiliar.sql.add(''+Quotedstr(codigo_venda)+',');
    dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',dm.qry_remota.fieldbyname('data').value))+',');
    dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('HH:MM:SS',dm.qry_remota.fieldbyname('hora').value))+',');
    dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota.fieldbyname('cupom').value )+',');
    dm.qryauxiliar.sql.add(''+TrocaVirgPPto(dm.qry_remota.fieldbyname('valor_bruto').value)+',');
    dm.qryauxiliar.sql.add(''+TrocaVirgPPto(dm.qry_remota.fieldbyname('valor_desconto').value)+',');
    dm.qryauxiliar.sql.add(''+TrocaVirgPPto(dm.qry_remota.fieldbyname('valor_txserv').value)+',');
    dm.qryauxiliar.sql.add(''+TrocaVirgPPto(dm.qry_remota.fieldbyname('valor_total').value)+',');
    dm.qryauxiliar.sql.add(''+TrocaVirgPPto(dm.qry_remota.fieldbyname('total_pago').value)+',');
    dm.qryauxiliar.sql.add(''+TrocaVirgPPto(dm.qry_remota.fieldbyname('valor_troco').value)+',');
    dm.qryauxiliar.sql.add(''+TrocaVirgPPto(dm.qry_remota.fieldbyname('repique').value)+',');
    dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota.fieldbyname('cod_usuario').value )+',');
    dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota.fieldbyname('numero_caixa').value )+',');
    dm.qryauxiliar.sql.add(''+dm.qry_remota.fieldbyname('processada').asstring+',1,'+Quotedstr(dm.qry_remota.fieldbyname('mesa').value)+')');
    try
      dm.qryauxiliar.ExecSQL;
    except
     begin
      showmessage('Erro importanto vendas tipo 1');
      Memo1.Visible:=true;
      Memo1.Lines := dm.qryauxiliar.sql;
      exit;
     end;
    end;


    dm.qry_remota2.Active:=false;
    dm.qry_remota2.sql.clear;
    dm.qry_remota2.sql.Add('update vendas set nv=1 where cod_venda='+Quotedstr(dm.qry_remota.fieldbyname('cod_venda').value));
    dm.qry_remota2.ExecSQL;


    dm.qry_remota2.Active:=false;
    dm.qry_remota2.sql.clear;
    dm.qry_remota2.sql.Add('select * from movimento_venda where cod_venda='+Quotedstr(dm.qry_remota.fieldbyname('cod_venda').value));
    dm.qry_remota2.Active:=true;
    dm.qry_remota2.first;



    while not dm.qry_remota2.eof do
    begin
     dm.qryauxiliar.active:=false;
     dm.qryauxiliar.SQL.clear;
     dm.qryauxiliar.SQL.add('insert into movimento_venda (cod_venda,cod_mesa,cod_produto,cod_garcon,data,hora,');
     dm.qryauxiliar.sql.add('cod_usuario,numero_caixa,processada,quantidade,valor_unitario,imp,cod_metre) values (');
     dm.qryauxiliar.sql.add(''+Quotedstr(codigo_venda)+',');
     dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota2.fieldbyname('cod_mesa').value )+',');
     dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota2.fieldbyname('cod_produto').value )+',');
     dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota2.fieldbyname('cod_garcon').value )+',');
     dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',dm.qry_remota2.fieldbyname('data').value))+',');
       dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('HH:MM:SS',dm.qry_remota2.fieldbyname('hora').value))+',');
     dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota2.fieldbyname('cod_usuario').value )+',');
     dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota2.fieldbyname('numero_caixa').value )+',');
     dm.qryauxiliar.sql.add(''+'1,'+'');
     dm.qryauxiliar.sql.add(''+TrocaVirgPPto(dm.qry_remota2.fieldbyname('quantidade').value)+',');
     dm.qryauxiliar.sql.add(''+TrocaVirgPPto(dm.qry_remota2.fieldbyname('valor_unitario').value)+',1,'+Quotedstr(dm.qry_remota2.fieldbyname('cod_metre').value )+')');

     try
      dm.qryauxiliar.ExecSQL;

     except
       begin
        showmessage('Erro importanto movimento de venda tipo 1');
        Memo1.Visible :=true;
        Memo1.Lines := dm.qryauxiliar.sql;
        exit;
      end;
     end;


     dm.qry_remota2.next;
    end;


    dm.qry_remota2.Active:=false;
    dm.qry_remota2.SQL.clear;
    dm.qry_remota2.sql.add('select * from recebimentos where cod_venda='+Quotedstr(dm.qry_remota.fieldbyname('cod_venda').value));
    dm.qry_remota2.Active:=true;
    dm.qry_remota2.First;


    while not dm.qry_remota2.Eof do
    begin
      dm.qryauxiliar.Active:=false;
      dm.qryauxiliar.sql.clear;
      dm.qryauxiliar.sql.add('insert into recebimentos (cod_venda,cod_forma,valor,data,cod_usuario,numero_caixa,processado,imp) values(');
      dm.qryauxiliar.sql.add(''+Quotedstr(codigo_venda)+',');
      dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota2.fieldbyname('cod_forma').value )+',');
      dm.qryauxiliar.sql.add(''+TrocaVirgPPto(dm.qry_remota2.fieldbyname('valor').value)+',');
      dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',dm.qry_remota2.fieldbyname('data').value))+',');
      dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota2.fieldbyname('cod_usuario').value )+',');
      dm.qryauxiliar.sql.add(''+Quotedstr(dm.qry_remota2.fieldbyname('numero_caixa').value )+',');
      dm.qryauxiliar.sql.add(''+'1'+',1)');

      try
       dm.qryauxiliar.ExecSQL;
      except
       begin
        showmessage('Erro importanto recebimentos de venda tipo 1');
        Memo1.Visible :=true;
        memo1.Lines := dm.qryauxiliar.sql;
        exit;
       end;
      end;


      dm.qry_remota2.Next;
    end;

   dm.qry_remota.Next;
  end;


  dm.qry_remota2.Active:=false;
  dm.qry_remota2.sql.clear;
  dm.qry_remota2.SQL.add('select * from stream where imp=0 order by tipo ');
  dm.qry_remota2.Active:=true;
  dm.qry_remota2.First;

  while not dm.qry_remota2.Eof  do
  begin
    dm.qryauxiliar.Active:=false;
    dm.qryauxiliar.sql.clear;
    dm.qryauxiliar.sql.add(dm.remover_espacos_direita(dm.qry_remota2.fieldbyname('stream').value ,''));
    dm.qryauxiliar.ExecSQL;
    dm.qry_remota2.Next;
  end;

  dm.qry_remota2.Active:=false;
  dm.qry_remota2.SQL.clear;
  dm.qry_remota2.sql.add('update stream set imp=1 where imp=0');
  dm.qry_remota2.ExecSQL;



/////////////////////////////////////  TRECHO DE IMPORTACAO NORMAL

{
dm.qry_importacoes.Active:=true;
dm.qry_importacoes.First;
while not dm.qry_importacoes.Eof do
begin
 patch:=Trim(dm.qry_importacoes.fieldbyname('patch').Value);

 try
   begin
     arquivo:=patch+'daruma.cfg';
     AssignFile(arq,arquivo);
     Reset(arq);
     CloseFile(arq);

     arquivo:=patch+'bematech.dof';
     AssignFile(arq,arquivo);
     Reset(arq);
     CloseFile(arq);

     arquivo:=patch+'daruma.cfg';
     AssignFile(arq,arquivo);
     Reset(arq);
     CloseFile(arq);
   end;
 except
  begin
    showmessage('Não foi possível abrir um ou mais arquivos de exportação. As causas podem ser as seguintes:'+
                 chr(13)+chr(10)+'1 - Os arquivos já foram importados'+
                 chr(13)+chr(10)+'2 - O diretório informado no arquivo de parâmetros está incorreto'+
                 chr(13)+chr(10)+'3 - A rede local encontra-se desabilitada ou fora de serviço.'+
                 chr(13)+chr(10)+''+
                 chr(13)+chr(10)+'Verifique a ocorrência de um dos possíveis erros e tente novamente!'+
                 chr(13)+chr(10)+''+
                 chr(13)+chr(10)+''+
                 chr(13)+chr(10)+'Verifique o mapeamento '+dm.qry_importacoes.fieldbyname('pacth').value+'  com '+dm.qry_importacoes.fieldbyname('descricao_maquina').value);

    Result:=false;
    exit;
  end;
 end;





  arquivo:=patch+'bematech.dof';
  AssignFile(arq,arquivo);
  Reset(arq);
  while not Eof(arq) do begin
   readln(arq,linha);
   linha:=dm.remover_espacos_direita(linha,'');
   dm.qryauxiliar.Active:=false;
   dm.qryauxiliar.sql.clear;
   dm.qryauxiliar.SQL.add(linha);
   try
     begin
       dm.qryauxiliar.ExecSQL;
     end
   except
    begin
     // showmessage('Erro importando bematech.dof'+' em '+dm.qry_importacoes.fieldbyname('descricao_maquina').value);
    end;
   end;
  end;
  CloseFile(arq);


  arquivo:=patch+'bematech.cfg';
  AssignFile(arq,arquivo);
  Reset(arq);
  while not Eof(arq) do begin
   readln(arq,linha);
   linha:=dm.remover_espacos_direita(linha,'');
   dm.qryauxiliar.Active:=false;
   dm.qryauxiliar.sql.clear;
   dm.qryauxiliar.SQL.add(linha);
   try
     begin
       dm.qryauxiliar.ExecSQL;
     end
   except
    begin
            showmessage('Erro importando bematech.cfg'+' em '+dm.qry_importacoes.fieldbyname('descricao_maquina').value);

    end;
   end;
  end;
  CloseFile(arq);


  arquivo:=patch+'daruma.cfg';
  AssignFile(arq,arquivo);
  Reset(arq);
  while not Eof(arq) do begin
   readln(arq,linha);
   linha:=dm.remover_espacos_direita(linha,'');
   dm.qryauxiliar.Active:=false;
   dm.qryauxiliar.sql.clear;
   dm.qryauxiliar.SQL.add(linha);
   try
     begin
       dm.qryauxiliar.ExecSQL;
     end
   except
    begin
      showmessage('Erro importando o daruma.cfg'+' em '+dm.qry_importacoes.fieldbyname('descricao_maquina').value);
    end;
   end;
  end;
  CloseFile(arq);

  RenameFile(patch+'bematech.dof',patch+FormatDateTime('DDMMYYY',data_do_sistema)+FormatDateTime('HHMMSS',time)+'bematech.dof' );
  RenameFile(patch+'bematech.cfg',patch+FormatDateTime('DDMMYYY',data_do_sistema)+FormatDateTime('HHMMSS',time)+'bematech.cfg' );
  RenameFile(patch+'daruma.cfg',patch+FormatDateTime('DDMMYYY',data_do_sistema)+FormatDateTime('HHMMSS',time)+'daruma.cfg' );

  dm.qry_importacoes.Next;
end;
 }
////////////////////////////////////////////// Término


  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('update vendas set cod_usuario='+Quotedstr('00')+' where cod_usuario not in (select cod_usuario from usuarios)');
  dm.qryauxiliar.ExecSQL;


  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('update movimento_venda set cod_usuario='+Quotedstr('00')+' where cod_usuario not in (select cod_usuario from usuarios)');
  dm.qryauxiliar.ExecSQL;


  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('update recebimentos set cod_usuario='+Quotedstr('00')+' where cod_usuario not in (select cod_usuario from usuarios)');
  dm.qryauxiliar.ExecSQL;

  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('update movimento_venda set cod_produto='+Quotedstr('00000')+' where cod_produto  not in (select cod_produto from produtos)');
  dm.qryauxiliar.ExecSQL;



    if dm.transacao.Active=false then
   dm.transacao.Active:=true;
  dm.transacao.Commit;


  if dm.transRemota.Active=false then
   dm.transRemota.Active:=true;
  dm.transRemota.Commit;


  Showmessage('Importação de dados concluída com sucesso!');
end;

procedure Tfrm_controle.Button2Click(Sender: TObject);
begin
  dm.tb_usuarios.Active:=true;
  Application.CreateForm(Tfrm_principal_naves,frm_principal_naves);
  frm_principal_naves.ShowModal;
  dm.tb_usuarios.Active:=false;
  frm_principal_naves.free;
end;

procedure Tfrm_controle.Button3Click(Sender: TObject);
begin
  close;
end;



function Tfrm_controle.TrocaVirgPPto(Valor: string): String;
//
// Troca a virgula pelo ponto em um valor Float
//
var i:integer;
begin
if Valor <> ' ' then
   begin
   for i := 0 to Length(Valor) do
       begin
       if Valor[i]='.' then
          begin
          Valor[i]:=',';
          end
       else if Valor[i] = ',' then
               begin
               Valor[i]:='.';
               end;
       end;
   end;
   Result := valor;
end;

procedure Tfrm_controle.importarEstornos();
var
 q : TIbquery;
 q2 : TIbquery;
 codEstorno : string;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.DB2;
  q.Transaction := dm.transRemota;
  q.Active:=false;
  q.SQL.clear;

  q2 := TIBQuery.Create(self);
  q2.Database := dm.dbrestaurante;
  q2.Transaction := dm.transacao;
  q2.Active:=false;
  q2.SQL.clear;

  q.Active:=false;
  q.sql.clear;
  q.SQL.add('select * from tipos_estorno');
  q.Active:=true;

  while not q.eof do
  begin
    q2.Active:=false;
    q2.SQL.clear;
    q2.SQL.add('insert into tipos_estorno (cod_tipo_estorno,descricao) values ('+QuotedStr(q.fieldbyname('cod_tipo_estorno').value)+','+Quotedstr(q.fieldbyname('descricao').value)+')');
    q2.execsql;
    q.Next;
  end;


  q.Active:=false;
  q.sql.clear;
  q.SQL.add('select * from estornos where imp=0');
  q.Active:=true;
  q.first;

  while not q.Eof do
  begin
    q2.Active:=false;
    q2.sql.clear;
    q2.sql.add('insert into estornos (cod_estorno, cod_tipo_estorno, mesa, valor, cod_usuario, data, hora, imp) values (');
    q2.sql.add(''+Quotedstr(q.fieldbyname('cod_estorno').value)+',');
    q2.sql.add(''+Quotedstr(q.fieldbyname('cod_tipo_estorno').value)+',');
    q2.sql.add(''+Quotedstr(q.fieldbyname('mesa').value)+',');
    q2.sql.add(''+TrocaVirgPPto(q.fieldbyname('valor').value)+',');
    q2.sql.add(''+Quotedstr(q.fieldbyname('cod_usuario').value)+',');
    q2.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',q.fieldbyname('data').value))+',');
    q2.sql.add(''+Quotedstr(FormatDateTime('HH:MM:SS',q.fieldbyname('hora').value))+',1)');
    q2.ExecSQL;
    q.Next;
  end;

  q.Active:=false;
  q.sql.clear;
  q.SQL.add('select * from itens_estornos where imp=0');
  q.Active:=true;
  q.first;

  while not q.Eof do
  begin
    q2.Active:=false;
    q2.sql.clear;
    q2.sql.add('insert into itens_estornos (cod_estorno, cod_produto, quantidade,imp) values(');
    q2.sql.add(''+Quotedstr(q.fieldbyname('cod_estorno').value)+',');
    q2.sql.add(''+Quotedstr(q.fieldbyname('cod_produto').value)+',');
    q2.sql.add(''+TrocaVirgPPto(q.fieldbyname('quantidade').value)+',1)');
    q2.ExecSQL();
    q.Next;
  end;
  

  q.Active:=false;
  q.SQL.clear;
  q.sql.add('update estornos set imp=1');
  q.ExecSQL;


  q.Active:=false;
  q.SQL.clear;
  q.sql.add('update itens_estornos set imp=1');
  q.ExecSQL;




end;


end.

