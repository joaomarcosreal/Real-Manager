unit uu_relatorio;

interface
//teste de caixa

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RDprint, StdCtrls,  Mask, ExtCtrls, Buttons,
   DBCtrls;

type
  Tfrm_relatorio_caixa = class(TForm)
    Panel3: TPanel;
    rdp: TRDprint;
    RDprint1: TRDprint;
    Panel2: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    RadioGroup2: TRadioGroup;
    Panel5: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ed_data_inicial: TMaskEdit;
    ed_data_final: TMaskEdit;
    ed_hora_in: TMaskEdit;
    ed_hora_fim: TMaskEdit;
    cb_tipo_relatorio: TComboBox;
    cb_usuario: TDBLookupComboBox;
    Panel6: TPanel;
    ckb_filtro_horas: TCheckBox;
    RDprint2: TRDprint;
    RDprint3: TRDprint;
    bt_imprimir: TBitBtn;
    bt_sair: TBitBtn;
    ckb_importadas: TCheckBox;
    procedure imprimir_cabecalho;
    procedure corpo_relatorio;
    procedure bt_imprimirClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    procedure ed_data_inicialEnter(Sender: TObject);
    procedure ed_data_inicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   function verificaValidade() : boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_relatorio_caixa: Tfrm_relatorio_caixa;
  linha : integer;
  cor_foco_edit : tcolor;
  primeira,ultima : string;
implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}


procedure Tfrm_relatorio_caixa.imprimir_cabecalho;
begin
  rdp.ImpC(linha,40,'Relatório de fechamento de caixa',[negrito,expandido]);
  linha:=linha+1;
  rdp.ImpC(linha,40,'De: '+ed_data_inicial.text+'  Até: '+ed_data_final.text,[negrito,expandido]);
  linha:=linha+1;
  if cb_tipo_relatorio.ItemIndex = 0 then
   rdp.ImpC(linha,40,'Todos os usuários',[negrito,expandido])
  else
   rdp.ImpC(linha,40,cb_usuario.Text,[negrito,expandido]);
  rdp.impf(linha,1,'------------------------------------------------------------------------------------------',[negrito]);
  linha:=linha+2;
end;



procedure Tfrm_relatorio_caixa.corpo_relatorio;
VAR
  total_bruto,total_txserv,total_desconto,total_troco,total_geral,total_pago,total_vendas,total_recebimentos : double;
  total_suprimento,valor : double;
  cupons_emitidos : integer;


begin
  total_bruto:=0;
  total_txserv:=0;
  total_desconto:=0;
  total_troco:=0;
  total_geral:=0;
  total_pago:=0;
  total_vendas:=0;
  total_suprimento:=0;
  cupons_emitidos:=0;

  dm.ac_recebimentos_temp.EmptyTable;
  dm.ac_recebimentos_temp.Active:=false;
  dm.ac_recebimentos_temp.Active:=true;

  rdp.ImpF(linha,1,'RESUMO DE PRODUTOS VENDIDOS',[NEGRITO]);
  linha:=linha+2;
  rdp.impf(linha,1,'Código',[negrito]);
  rdp.impf(linha,8,'Descrição',[negrito]);
  rdp.impf(linha,40,'Qtde.',[negrito]);
  rdp.impf(linha,54,'Preço (R$)',[negrito]);
  rdp.impf(linha,65,'Total (R$)',[negrito]);
  linha:=linha+2;
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add(' select sum(quantidade) as quantidade,valor_unitario,cod_produto  from movimento_venda where ');
  dm.qryauxiliar.sql.add(' data >='+QuotedStr(FormatDateTime('DD.MM.YY',StrToDate(ed_data_inicial.text))));
  dm.qryauxiliar.sql.add(' and data <='+QuotedStr(FormatDateTime('DD.MM.YY',StrToDate(ed_data_final.text))));
  if ckb_filtro_horas.Checked then
  begin
    dm.qryauxiliar.sql.add(' and hora>='+Quotedstr(FormatDateTime('HH:MM',StrToTime(ed_hora_in.text)))+' and hora<='+Quotedstr(FormatDateTime('HH:MM',StrToTime(ed_hora_fim.text))));
  end;

  If (ckb_importadas.Checked = true) then
  begin
   dm.qryauxiliar.sql.add(' and imp=0');

  end;

  if cb_tipo_relatorio.ItemIndex = 1 then
  dm.qryauxiliar.sql.add(' and cod_usuario='+Quotedstr(cb_usuario.KeyValue));
  dm.qryauxiliar.SQL.Add(' group by cod_produto,valor_unitario order by cod_produto');



  dm.qryauxiliar.Active:=true;
  while not dm.qryauxiliar.Eof do
  begin

    if linha >= 60 then
    begin
      linha:=1;
      rdp.Novapagina;
      imprimir_cabecalho;
    end;

    TRY
     BEGIN
    rdp.impf(linha,1,dm.qryauxiliar.fieldbyname('cod_produto').value,[]);
    dm.qryauxiliar2.Active:=false;
    dm.qryauxiliar2.SQL.Clear;
    dm.qryauxiliar2.SQL.Add('select * from produtos where cod_produto='+QuotedStr(dm.qryauxiliar.fieldbyname('cod_produto').value));
    dm.qryauxiliar2.Active:=true;

    rdp.impf(linha,8,dm.qryauxiliar2.fieldbyname('descricao').value,[]);
    rdp.impf(linha,40,FormatFloat('#0.000',dm.qryauxiliar.fieldbyname('quantidade').value),[]);
    rdp.impf(linha,54,FormatFloat('R$ ###,###,##0.00 ',dm.qryauxiliar.fieldbyname('valor_unitario').value) ,[]);
    rdp.impf(linha,65,FormatFloat('R$ ###,###,##0.00 ',dm.qryauxiliar.fieldbyname('quantidade').value * dm.qryauxiliar.fieldbyname('valor_unitario').value) ,[]);
    linha:=linha+1;
    dm.qryauxiliar.next;
    end;
    except
//    ShowMessage(dm.qryauxiliar.fieldbyname('cod_produto').value);
    end;
  end;

  if linha+4 >=65 then
    begin
      linha:=1;
      rdp.Novapagina;
      imprimir_cabecalho;
    end;

  linha:=linha+1;
  rdp.impf(linha,1,'------------------------------------------------------------------------------------------',[negrito]);
  linha:=linha+2;
  rdp.ImpF(linha,1,'RESUMO DE VENDAS',[NEGRITO]);
  linha:=linha+2;
  rdp.impf(linha,1,'Código',[negrito]);
  rdp.impf(linha,10,'Vl. Bruto',[negrito]);
  rdp.impf(linha,20,'Desconto',[negrito]);
  rdp.impf(linha,30,'Vl. Liq.',[negrito]);
  rdp.impf(linha,40,'Vl. Pago',[negrito]);
  rdp.impf(linha,50,'Troco',[negrito]);
  rdp.impf(linha,60,'Mesa',[negrito]);
  linha:=linha+1;

  dm.qryauxiliar.active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select * from vendas where ');
  dm.qryauxiliar.sql.add(' data >='+QuotedStr(FormatDateTime('DD.MM.YY',StrToDate(ed_data_inicial.text))));
  dm.qryauxiliar.sql.add(' and data <='+QuotedStr(FormatDateTime('DD.MM.YY',StrToDate(ed_data_final.text))));
  if ckb_filtro_horas.Checked then
  begin
    dm.qryauxiliar.sql.add(' and hora>='+Quotedstr(FormatDateTime('HH:MM',StrToTime(ed_hora_in.text)))+' and hora<='+Quotedstr(FormatDateTime('HH:MM',StrToTime(ed_hora_fim.text))));
  end;

   If (ckb_importadas.Checked = true) then
  begin
   dm.qryauxiliar.sql.add(' and imp=0');

  end;
  if cb_tipo_relatorio.ItemIndex = 1 then
  dm.qryauxiliar.sql.add(' and cod_usuario='+Quotedstr(cb_usuario.KeyValue));
  dm.qryauxiliar.sql.add(' order by hora,cod_venda');
  dm.qryauxiliar.Active:=true;
  dm.qryauxiliar.first;

  if dm.qryauxiliar.IsEmpty then
  begin
    ShowMessage('Não movimento relativo aos critérios selecionados!');
    exit;
  end;


  primeira:=dm.qryauxiliar.fieldbyname('cod_venda').value;

  while  not dm.qryauxiliar.Eof do
  begin
    If linha >= 65 then
    begin
      linha:=1;
      rdp.Novapagina;
      imprimir_cabecalho;
    end;
    rdp.Impf(linha,1,dm.qryauxiliar.fieldbyname('cod_venda').value,[]);
    rdp.ImpVal(linha,10,'#0.00',dm.qryauxiliar.fieldbyname('valor_bruto').value,[]);
    total_bruto:=total_bruto+dm.qryauxiliar.fieldbyname('valor_bruto').value;

    rdp.ImpVal(linha,20,'#0.00',dm.qryauxiliar.fieldbyname('valor_desconto').value,[]);
    total_desconto:=total_desconto+dm.qryauxiliar.fieldbyname('valor_desconto').value;

    rdp.ImpVal(linha,30,'#0.00',dm.qryauxiliar.fieldbyname('valor_total').value,[]);
    total_geral:=total_geral+dm.qryauxiliar.fieldbyname('valor_total').value;

    rdp.ImpVal(linha,40,'#0.00',dm.qryauxiliar.fieldbyname('total_pago').value,[]);
    total_pago:=total_pago+dm.qryauxiliar.fieldbyname('total_pago').value;

    rdp.ImpVal(linha,50,'#0.00',dm.qryauxiliar.fieldbyname('valor_troco').value,[]);
    total_troco:=total_troco+dm.qryauxiliar.fieldbyname('valor_troco').value;
    rdp.Impf(linha,60,dm.qryauxiliar.fieldbyname('MESA').value,[]);
    rdp.impf(linha,75,FormatDateTime('HH:MM:SS',dm.qryauxiliar.fieldbyname('hora').value),[]);
    linha:=linha+1;
    /// Recebimentos da venda
    dm.qryauxiliar2.Active:=false;
    dm.qryauxiliar2.sql.clear;
    dm.qryauxiliar2.sql.add('select recebimentos.*,formas_pagamento.* from recebimentos, formas_pagamento ');
    dm.qryauxiliar2.sql.add(' where formas_pagamento.cod_forma=recebimentos.cod_forma ');
    dm.qryauxiliar2.sql.add(' and  recebimentos.cod_venda='+Quotedstr(dm.qryauxiliar.fieldbyname('cod_venda').value));
    dm.qryauxiliar2.Active:=true;
    dm.qryauxiliar2.first;
    while not dm.qryauxiliar2.eof do
    begin
      if linha+5 >=65 then
       begin
        linha:=1;
        rdp.Novapagina;
        imprimir_cabecalho;
       end;

       if not dm.ac_recebimentos_temp.Locate('cod_forma',dm.qryauxiliar2.fieldbyname('cod_forma').value,[]) then
        begin
         dm.ac_recebimentos_temp.Append;
         dm.ac_recebimentos_tempcod_forma.Value:=dm.qryauxiliar2.fieldbyname('cod_forma').value;
         dm.ac_recebimentos_tempvalor.value:=dm.qryauxiliar2.fieldbyname('valor').value;
         dm.ac_recebimentos_tempDescricao.Value:=dm.qryauxiliar2.fieldbyname('descricao').value;
         dm.ac_recebimentos_temp.Post;
        end
       else
        begin
         dm.ac_recebimentos_temp.edit;
         dm.ac_recebimentos_tempvalor.value:=dm.ac_recebimentos_tempvalor.value+dm.qryauxiliar2.fieldbyname('valor').value;
         dm.ac_recebimentos_temp.Post;
        end;


       rdp.impf(linha,8,'**'+dm.qryauxiliar2.fieldbyname('cod_forma').value,[]);
       rdp.impf(linha,16,dm.qryauxiliar2.fieldbyname('descricao').value,[]);
       rdp.impf(linha,40,FormatFloat('R$ ###,###,##0.00 ',dm.qryauxiliar2.fieldbyname('valor').value) ,[]);
       rdp.impf(linha,65,dm.qryauxiliar2.fieldbyname('cod_venda').value,[]);
       linha:=linha+1;
       total_recebimentos:=total_recebimentos+dm.qryauxiliar2.fieldbyname('valor').value;
       dm.qryauxiliar2.next;
    end;
    total_txserv:=dm.qryauxiliar.fieldbyname('valor_txserv').value+total_txserv;
    dm.qryauxiliar.next;
  end;
  dm.qryauxiliar.Last;

  ultima:=dm.qryauxiliar.fieldbyname('cod_venda').value;

  if linha+5 >=65 then
    begin
      linha:=1;
      rdp.Novapagina;
      imprimir_cabecalho;
    end;


  linha:=linha+1;
  rdp.impf(linha,1,'Bruto',[negrito]);
  rdp.impf(linha,13,'Desconto',[negrito]);
  rdp.impf(linha,24,'Liquido',[negrito]);
  rdp.impf(linha,35,'Pago',[negrito]);
  rdp.impf(linha,45,'Troco',[negrito]);

  linha:=linha+1;
  rdp.impf(linha,1,dm.ImpDireita(Formatfloat('#0.00',total_bruto),0),[]);
  rdp.impf(linha,13,dm.ImpDireita(FormatFloat('#0.00',total_desconto),0),[]);
  rdp.impf(linha,24,dm.ImpDireita(Formatfloat('#0.00',total_geral),0),[]);
  rdp.impf(linha,35,dm.ImpDireita(FormatFloat('#0.00',total_pago),0),[]);
  rdp.impf(linha,45,dm.ImpDireita(FormatFloat('#0.00',total_troco),0),[]);


  linha:=linha+1;
  rdp.impf(linha,1,'------------------------------------------------------------------------------------------',[negrito]);

  linha:=1;
  rdp.Novapagina;

  imprimir_cabecalho;
  rdp.ImpF(linha,1,'Totais sintéticos',[negrito]);
  linha:=linha+2;

  dm.ac_recebimentos_temp.First;
  while not dm.ac_recebimentos_temp.Eof do
  begin
    if linha >= 60 then
    begin
      linha:=1;
      rdp.Novapagina;
      imprimir_cabecalho;
    end;

    rdp.ImpF(linha,1,dm.ac_recebimentos_temp.fieldbyname('descricao').value,[negrito]);
    rdp.impf(linha,18,FormatFloat('R$ ###,###,##0.00 ',dm.ac_recebimentos_temp.fieldbyname('valor').value),[]);
    linha:=linha+1;
    dm.ac_recebimentos_temp.Next;
  end;
  linha:=linha+2;
  rdp.impf(linha,1,'Total de recebimentos no período: '+FormatFloat('R$ ###,###,##0.00 ',total_recebimentos),[negrito]);
  linha:=linha+1;
  rdp.impf(linha,1,'------------------------------------------------------------------------------------------',[negrito]);

  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.Add('select count(cod_venda) from vendas where ');
  dm.qryauxiliar.sql.add(' data >='+QuotedStr(FormatDateTime('DD.MM.YY',StrToDate(ed_data_inicial.text))));
  dm.qryauxiliar.sql.add(' and data <='+QuotedStr(FormatDateTime('DD.MM.YY',StrToDate(ed_data_final.text))));
  if ckb_filtro_horas.Checked then
  begin
    dm.qryauxiliar.sql.add(' and hora>='+Quotedstr(FormatDateTime('HH:MM',StrToTime(ed_hora_in.text)))+' and hora<='+Quotedstr(FormatDateTime('HH:MM',StrToTime(ed_hora_fim.text))));
  end;

  if cb_tipo_relatorio.ItemIndex = 1 then
   dm.qryauxiliar.sql.add(' and cod_usuario='+Quotedstr(cb_usuario.KeyValue));

   If (ckb_importadas.Checked = true) then
  begin
   dm.qryauxiliar.sql.add(' and imp=0');

  end;


  dm.qryauxiliar.Active:=true;
  if dm.qryauxiliar.fieldbyname('count').value <> null then
   cupons_emitidos:=dm.qryauxiliar.fieldbyname('count').value;



  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select sum(valor) as total from suprimentos where ');
  dm.qryauxiliar.sql.add(' data >='+QuotedStr(FormatDateTime('DD.MM.YY',StrToDate(ed_data_inicial.text))));
  dm.qryauxiliar.sql.add(' and data <='+QuotedStr(FormatDateTime('DD.MM.YY',StrToDate(ed_data_final.text))));
   if cb_tipo_relatorio.ItemIndex = 1 then
  dm.qryauxiliar.sql.add(' and cod_usuario='+Quotedstr(cb_usuario.KeyValue));


  dm.qryauxiliar.Active:=true;
  IF dm.qryauxiliar.fieldbyname('total').value <> null then
   total_suprimento:=dm.qryauxiliar.fieldbyname('total').value;

  IF LINHA+10 >=65 THEN
  begin
     linha:=1;
     rdp.Novapagina;
     imprimir_cabecalho;
  end;


  linha:=linha+2;
  rdp.ImpF(linha,1,'RESUMO GERAL DE CAIXA',[NEGRITO]);
  linha:=linha+2;
  rdp.ImpF(linha,1,'Total de suprimentos: ',[negrito]);
  rdp.impf(linha,25,Formatfloat('R$ ###,###,##0.00',total_suprimento),[]);;
  linha:=linha+1;
  rdp.ImpF(linha,1,'Tx de Serviço: ',[negrito]);
  rdp.impf(linha,25,Formatfloat('R$ ###,###,##0.00',total_txserv),[]);;
  linha:=linha+1; 
  rdp.ImpF(linha,1,'Total do caixa: ',[negrito]);
  rdp.impf(linha,25,Formatfloat('R$ ###,###,##0.00',total_geral+total_suprimento),[]);
  linha:=linha+1;
  rdp.ImpF(linha,1,'Cupons emitidos:',[negrito]);
  rdp.impf(linha,25,IntToStr(cupons_emitidos),[]);



end;




procedure Tfrm_relatorio_caixa.bt_imprimirClick(Sender: TObject);
begin
  if verificaValidade = false then exit;

  rdp.abrir;
  linha:=1;
  imprimir_cabecalho;
  corpo_relatorio;
  rdp.OpcoesPreview.Preview:=true;
  rdp.OpcoesPreview.CaptionPreview:='Relatório de caixa';
  rdp.OpcoesPreview.Remalina:=true;
  rdp.Fechar;
end;

procedure Tfrm_relatorio_caixa.bt_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_relatorio_caixa.ed_data_inicialEnter(Sender: TObject);
begin

end;

procedure Tfrm_relatorio_caixa.ed_data_inicialKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key=vk_return
   then
     begin
       Perform(WM_NEXTDLGCTL,0,0);
     end;

  if key=vk_escape then
  begin
   if  sender is TMaskedit and ((sender as TMaskedit).Name <> 'ed_data_inicial') then
    begin

     ed_data_inicial.SetFocus;

     exit;
    end
   else
     Close;
  end;
end;

function Tfrm_relatorio_caixa.verificaValidade() : boolean;
begin
  try
     ed_data_inicial.Text:=FormatDateTime('DD/MM/YYY',StrToDate(ed_data_inicial.Text));
  except
   begin
     Showmessage('Data inicial inválida!');
     ed_data_inicial.Clear;
     ed_data_inicial.SetFocus;
     Result:=false;
     exit;
   end;
  end;

  try
     ed_data_final.Text:=FormatDateTime('DD/MM/YYY',StrToDate(ed_data_final.Text));
  except
   begin
     Showmessage('Data final inválida!');
     ed_data_final.Clear;
     ed_data_final.SetFocus;
     Result:=false;
     exit;
   end;
  end;

  if ( StrToDate(ed_data_final.text) < StrToDate(ed_data_inicial.Text)) then
   begin
     Showmessage('Data final não pode ser menor que a data inicial!');
     ed_data_final.Clear;
     ed_data_final.SetFocus;
     Result:=false;
     Exit;
   end;


  Result:=true;

end;

end.

