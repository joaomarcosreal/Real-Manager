unit uuRecebimentoContaAssinada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, DB, RxMemDS, Grids, DBGrids, Mask, 
   StdCtrls,  ExtCtrls, Buttons, RxCurrEdit, ibquery, RxToolEdit, Vcl.ActnList,
  System.Actions, IBX.IBScript;

type
  TfrmEncerramentoContasAssinadas = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Edit3: TEdit;
    Memo2: TMemo;
    Memo3: TMemo;
    gp_desconto: TGroupBox;
    ed_valor_desconto: Tedit;
    ckb_desconto: TCheckBox;
    Panel2: TPanel;
    gp_formas: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    bt_pesquisa_forma: TSpeedButton;
    edCodFormaPagamento: Tedit;
    ed_valor_forma: TCurrencyEdit;
    Panel7: TPanel;
    DBGrid1: TDBGrid;
    dsFormasPagtoTemp: TDataSource;
    tbFormasPagamentoTemp: TRxMemoryData;
    tbFormasPagamentoTempcodForma: TStringField;
    tbFormasPagamentoTempdescricaoForma: TStringField;
    tbFormasPagamentoTempvalorForma: TCurrencyField;
    tbFormasPagamentoTemprp: TStringField;
    Label3: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel4: TPanel;
    edTotalFaturas: TCurrencyEdit;
    Label2: TLabel;
    edTotalFormas: TCurrencyEdit;
    Label5: TLabel;
    Panel5: TPanel;
    edDescricaoForma: TEdit;
    Label4: TLabel;
    edTroco: TCurrencyEdit;
    Label6: TLabel;
    lbCodCliente: TLabel;
    Shape1: TShape;
    lbNomeCliente: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure adicionar_pagamento(cod_forma : string; descricao_forma: string; valor : string);
    procedure registraFormaPagto(cod_forma : string ; descricao_forma : string; valor : string);
    function  verificaValidadeEncerramento() : boolean;
    function  verificaPossibilidadeDeTroco( troco : double) : boolean;
    procedure baixarFaturas();
    procedure Edit1Exit(Sender: TObject);
    procedure emitirComprovanteNaoFiscal();
    procedure edCodFormaPagamentoExit(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEncerramentoContasAssinadas: TfrmEncerramentoContasAssinadas;

implementation

uses uu_data_module ,uu_frm_principal;

{$R *.dfm}

procedure TfrmEncerramentoContasAssinadas.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmEncerramentoContasAssinadas.edCodFormaPagamentoExit(
  Sender: TObject);
begin
  inherited;
  actExitFormaPagamentoExecute(Sender);
end;

procedure TfrmEncerramentoContasAssinadas.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If verificaValidadeEncerramento = false then
   begin
    exit;
   end
  else
   begin
     if impressora_fiscal_instalada = 1 then
       begin
          dm.imprimeReciboRecebimentoFaturas(marca_impressora_fiscal,lbCodCliente.Caption ,lbNomeCliente.Caption  ,edTotalFaturas.Value);
          emitirComprovanteNaoFiscal;
       end
     else
       dm.imprimeReciboRecebimentoFaturas(marca_impressora_nao_fiscal_01,lbCodCliente.Caption ,lbNomeCliente.Caption  ,edTotalFaturas.Value);


     baixarFaturas();
     if (edTroco.Value > 0) then
       begin
         frm_principal.escreveExtenso.Valor:= edTroco.VALUE;
         dm.exibe_painel_troco('TROCO A REPASSAR '+#13#10+#13#10+StrUpper(pchar(frm_principal.escreveExtenso.Texto)),FormatFloat('R$ ###,###,##0.00',edTroco.Value)  );
         close;
       end
     else
      begin
       close;
      end;

   end;
end;


procedure TfrmEncerramentoContasAssinadas.emitirComprovanteNaoFiscal();
var
cnf : string;
begin
  cnf := FormatFloat('00',StrToFloat(dm.LeIni(2,'IMPRESSORA_FISCAL','codigoRecebimentoPendura'))) ;
  frm_principal.ecf.AbreNaoFiscal('');
  frm_principal.ecf.RegistraItemNaoFiscal(cnf,edTotalFaturas.Value);
  frm_principal.ecf.SubtotalizaNaoFiscal(0);
  tbFormasPagamentoTemp.First;

  while not tbFormasPagamentoTemp.Eof do
  begin
     try
        frm_principal.ECF.EfetuaPagamentoNaoFiscal(tbFormasPagamentoTemprp.Value ,tbFormasPagamentoTempvalorForma.Value,'',false);
     except
      begin
        dm.exibe_painel_erro('Erro ao efetuar forma de pagamento '+tbFormasPagamentoTempdescricaoForma.Value,'tecle enter para continuar...');
        exit;
      end;
     end;
     tbFormasPagamentoTemp.Next;
  end;

  frm_principal.ecf.FechaNaoFiscal('', StrToIntDef('0', 0) );

end;



procedure TfrmEncerramentoContasAssinadas.baixarFaturas();
var
 q : TIBQuery;
 qtdFaturas : integer;
 rp : string;                                                                                         
 q2  : TIBQuery;
 valorFatura : real;
begin


 dm.transacao.Active :=false;
 dm.transacao.Active :=true;
 q :=  TIBQuery.create(self);
 q.Database := dm.dbrestaurante;
 q.Transaction := dm.transacao;

 q2 :=  TIBQuery.create(self);
 q2.Database := dm.dbrestaurante;
 q2.Transaction := dm.transacao;


 q.Active:=false;
 q.sql.clear;
 q.sql.add('select count(*) from faturas f where f.cod_cli='+Quotedstr(lbCodCliente.Caption)+' and f.status=0 and f.selecao=1');
 q.Active:=true;

 qtdFaturas := q.Fields[0].Value;
 q.Active:=false;
 q.sql.clear;
 q.sql.add('select  f.* from faturas f where f.cod_cli='+Quotedstr(lbCodCliente.Caption)+' and f.status=0 and f.selecao=1');
 q.Active:=true;
 q.First;

 while not q.Eof do
  begin
    tbFormasPagamentoTemp.First;
    while not tbFormasPagamentoTemp.Eof do
     begin
       valorFatura := tbFormasPagamentoTempvalorForma.Value / qtdFaturas;
       q2.Active := false;
       q2.SQL.Clear;
       q2.SQL.Add('insert into recebimentos_fatura (cod_fatura,cod_forma,valor,cod_caixa) values (');
       q2.SQL.Add(Quotedstr(q.fieldbyname('cod_fatura').Value)+',');
       q2.SQL.Add(Quotedstr(tbFormasPagamentoTempcodForma.Value)+',');       
       q2.SQL.Add(dm.TrocaVirgPPto(Floattostr(valorFatura))+',');
       q2.SQL.Add(Quotedstr(ultimoCaixaAberto)+')');
       q2.ExecSQL;
       tbFormasPagamentoTemp.Next;
     end;
    q.Next;
  end;

 q.Active := false;
 q.SQL.Clear;
 q.sql.Add('update faturas f set f.data_pagamento='+Quotedstr(FormatDateTime('DD.MM.YY',date))+',');
 q.sql.Add(' f.status = 1 where f.cod_cli='+Quotedstr(lbCodCliente.Caption)+' and f.status=0 and f.selecao=1');
 q.ExecSQL;

 dm.transacao.Commit;
end;

procedure TfrmEncerramentoContasAssinadas.registraFormaPagto(cod_forma : string ; descricao_forma : string; valor : string);
var
 tipoForma : integer;
begin

 if (verificaExistenciaFormaDePagamento(cod_forma) = true) then
  begin
    tipoForma:=dm.verificaTipoFormaPagamento(cod_forma);
    if (tipoForma <> 2) then
     begin
       adicionar_pagamento(cod_forma,descricao_forma,valor);
     end
    else
     begin
       ShowMessage('Esta forma de pagamento não pode ser utilizada para pagar uma fatura!');
       edCodFormaPagamento.clear;
       edDescricaoForma.Clear;
       edCodFormaPagamento.SetFocus;
     end;
  end;

end;




procedure TfrmEncerramentoContasAssinadas.adicionar_pagamento(cod_forma : string; descricao_forma: string; valor : string);
var
 q : TIBQuery;
 rp : string;
begin


  q :=  TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  q.sql.clear;
  q.sql.add('select * from formas_pagamento where cod_forma='+Quotedstr(cod_forma));
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
    tbFormasPagamentoTemp.Post;
   end
  else
    begin
      tbFormasPagamentoTemp.Edit;
      tbFormasPagamentoTempvalorForma.value := tbFormasPagamentoTempvalorForma.Value + StrToFloat(valor);
      tbFormasPagamentoTemp.Post;
    end;




  edTotalFormas.Value:=StrToFloat(valor)+edTotalFormas.Value;
  edTroco.Value:=edTotalFormas.Value-edTotalFaturas.value;
  edCodFormaPagamento.clear;
  edDescricaoForma.Clear;
  edCodFormaPagamento.SetFocus;
  ed_valor_forma.value:= edTotalFaturas.value-edTotalFormas.Value;


end;



procedure TfrmEncerramentoContasAssinadas.Edit1Exit(Sender: TObject);
begin
  inherited;
   if  ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_valor_forma')) and (ed_valor_forma.Value >0 )) then
   begin
     if (edTotalFormas.Value < edTotalFaturas.Value ) then
       registraFormaPagto(edCodFormaPagamento.Text,edDescricaoForma.Text,FormatFloat('#0.00',ed_valor_forma.Value ))
     else
      begin
        showmessage('Já foram feitos pagamentos suficientes para o encerramento desta fatura!');
        exit;
      end;
   end;

end;




function TfrmEncerramentoContasAssinadas.verificaValidadeEncerramento() : boolean;
begin
  if edTotalFormas.Value < edTotalFaturas.value then
  begin
    ShowMessage('Valor pago é inferior ao total da conta!');
    ed_valor_forma.SetFocus;
    result:=false;
    Exit;
  end;

   if ( verificaPossibilidadeDeTroco(edTroco.Value) = false ) then
    begin
       dm.exibe_painel_erro('O encerramento não pode ser efetuado pois não há valor suficiente para o troco da venda nas formas de pagamento especificadas (O REPIQUE NÃO É PERMITIDO)!','OK');
       Result:=false;
       exit;
    end;

  result:=true;
end ;




function TfrmEncerramentoContasAssinadas.verificaPossibilidadeDeTroco( troco : double) : boolean;
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

  if ( (totalFormasPermitidas - troco) >= 0) then
    Result:=true
  else
    Result:=false;
end;




end.
