unit uuexportaMDC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ExtCtrls, DB, ADODB, IBquery;

type
  TfrmExportaMDC = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cn: TADOConnection;
    edCaminho: TEdit;
    OpenDialog1: TOpenDialog;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    qry: TADOQuery;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportaMDC: TfrmExportaMDC;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmExportaMDC.BitBtn1Click(Sender: TObject);
var
 q : TIBQuery;
 ct : smallint;

begin
  inherited;

  ct:=
  0;

  q := TIBquery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.sql.clear;
  q.sql.Add('delete from pedidos_delivery');
  q.ExecSQL;

  q.sql.clear;
  q.sql.Add('delete from clientes_delivery');
  q.ExecSQL;

  q.sql.clear;
  q.sql.Add('delete from bairro');
  q.ExecSQL;

  q.sql.clear;
  q.sql.Add('delete from produtos');
  q.ExecSQL;



  cn.ConnectionString:='FILE NAME='+edCaminho.Text;
  cn.Connected:=true;

  qry.Active:=false;
  qry.Active:=true;
  qry.sql.add('select * from item');
  qry.Active:=true;
  qry.first;

  while not qry.eof do
   begin

    try
     begin
      q.active:=false;
      q.sql.clear;
      q.sql.add('insert into produtos(cod_produto,cod_barras,descricao,valor_unitario,numero_vendas,cod_aliquota,permite_acompanhamento,acompanhamentos_fixos,');
      q.SQL.add('numero_acompanhamentos,produto_final,cardapio,balanca,fracionado,preco_digitado,informar_sabor,incide_servico,couvert) values (');
      q.sql.add(''+Quotedstr(Inttostr(qry.fieldbyname('cod_item').value))+',');
      q.sql.add(''+Quotedstr(Inttostr(qry.fieldbyname('cod_item').value))+',');
      q.sql.add(''+Quotedstr(qry.fieldbyname('nome').value)+',');
      q.sql.add(''+ dm.TrocaVirgPPto(qry.fieldbyname('preco').value)+',')  ;
      q.sql.add('0,'+Quotedstr('01')+',0,0,0,1,0,0,0,0,0,1,0)');
      q.execsql;
     end;

    except
     begin
      frm_principal.memo_avisos.lines:=q.sql;
      showmessage(Inttostr(ct));
     end;
    end;
    qry.next;
   end;

   q.Active:=false;
   q.sql.clear;

   q.sql.add('update produtos p');
   q.sql.add(' set p.cod_produto=udf_strzero(cod_produto,5),  p.cod_barras=udf_strzero(cod_produto,5),p.data_cadastro='+Quotedstr(FormatDateTime('DD.MM.YY',date))+',p.ultima_venda='+Quotedstr(FormatDateTime('DD.MM.YY',date))+',');
   q.sql.add(' p.caminho_foto='+Quotedstr('C:\Restaurante\imagens\semfoto.jpg')+',');
   q.sql.add(' p.cod_grupo='+Quotedstr('101002')+',p.cod_miniprinter='+Quotedstr('001')+',');
   q.sql.add(' p.valor_comissao=0,p.descricao_reduzida= udf_copy(p.descricao,0,15)');
   q.execsql;

   dm.transacao.Commit;
   dm.transacao.Active:=true;

   qry.Active:=false;
   qry.sql.clear;
   qry.sql.add('select *  from bairro');
   qry.Active:=true;
   qry.first;

   while not qry.Eof do
   begin
    q.Active:=false;
    q.sql.Clear;
    q.SQL.add('insert into bairro(codigo,descricao) values ('+Quotedstr(IntToStr(qry.fieldbyname('BairroID').value))+',');
    q.sql.add(''+Quotedstr(qry.fieldbyname('Bairro').value)+')');
     try
       q.execsql;
     except
      begin
        frm_principal.memo_avisos.Lines := q.SQL;
        showmessage('Erro capturando bairro');
        exit;
      end;
     end;




    qry.next;
   end;


   qry.active:=false;
   qry.sql.clear;
   qry.sql.add('select * from cliente');
   qry.active:=true;
   qry.first;

   while not qry.Eof do
   begin
        if qry.fieldbyname('ClienteID').value = 98 then
      begin
        showmessage('');
      end;

     q.Active:=false;
     q.sql.clear;
     q.SQL.add('insert into clientes_delivery (codigo,nome,telefone,endereco,cod_bairro,complemento,referencia1,referencia2,sexo) values (');
     q.sql.add(''+Quotedstr(IntToStr(qry.fieldbyname('ClienteID').value))+',');
     q.sql.add(''+Quotedstr(qry.fieldbyname('cliente').value)+',');
     q.sql.add(''+Quotedstr(qry.fieldbyname('telRes').value)+',');
     q.sql.add(''+Quotedstr(qry.fieldbyname('logradouro').value)+',');
     q.sql.add(''+Quotedstr(IntToStr(qry.fieldbyname('bairroID').value))+',');
     q.sql.add(''+Quotedstr(trim(qry.fieldbyname('complemento').value))+',');
     q.sql.add(''+Quotedstr(trim(qry.fieldbyname('referencia').value))+',');
     q.sql.add(''+Quotedstr(trim(qry.fieldbyname('observacao').value))+',');
     q.sql.add(''+Quotedstr(trim(qry.fieldbyname('sexo').value))+')');

     try
       q.execsql;
     except
      begin
        frm_principal.memo_avisos.Lines := q.SQL;
        showmessage('Erro capturando cliente');
        exit;
      end;
     end;
     qry.next;
   end;



   q.sql.clear;
   q.sql.Add('   update clientes_delivery set codigo=udf_strzero(codigo,5)');
   q.ExecSQL;



   dm.transacao.Commit;
end;

end.
