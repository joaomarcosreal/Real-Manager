unit uu_rel_gastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RDprint, StdCtrls,  ExtCtrls, Buttons, 
  Mask;

type
  Tfrm_rel_gasto_diario = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    rdp: TRDprint;
    Panel1: TPanel;
    ed_data_final: TMaskEdit;
    ed_data_inicial: TMaskEdit;
    cbk_visualizar: TCheckBox;
    Panel5: TPanel;
    bt_imprimir: TBitBtn;
    bt_sair: TBitBtn;
    procedure ed_data_inicialEnter(Sender: TObject);
    procedure ed_data_inicialExit(Sender: TObject);
    procedure ed_data_inicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_imprimirClick(Sender: TObject);
   procedure imprimir_cabecalho;
   procedure calcula_baixa;
    procedure bt_sairClick(Sender: TObject);
    procedure corpo_relatorio;


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_rel_gasto_diario: Tfrm_rel_gasto_diario;
  linha : integer;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure Tfrm_rel_gasto_diario.ed_data_inicialEnter(Sender: TObject);
begin


 if  sender is TComboBox then
  begin
     (sender as TComboBox).DroppedDown:=true;
     (sender as TComboBox).Color:=cor_foco_edit;
  end;

end;

procedure Tfrm_rel_gasto_diario.ed_data_inicialExit(Sender: TObject);
begin



 if  sender is TComboBox then
  begin
     (sender as TComboBox).DroppedDown:=false;
     (sender as TComboBox).Color:=clWhite;
  end;

  if  sender is TMaskEdit then
  begin
     (sender as TMaskEdit).Color:=clWhite;
  end;

    

   if  sender is TMaskedit and ((sender as TMaskedit).Name = 'ed_data_inicial') then
   begin
     Try
       ed_data_inicial.Text:=FormatDateTime('DD/MM/YYY',StrTodate(ed_data_inicial.Text));
     except
      begin
        ShowMessage('Data inicial inválida!');
        ed_data_inicial.Clear;
        ed_data_inicial.SetFocus;
        exit;
      end;
     end;
   end;

   if  sender is TMaskedit and ((sender as TMaskedit).Name = 'ed_data_final') then
   begin
     Try
       ed_data_final.Text:=FormatDateTime('DD/MM/YYY',StrTodate(ed_data_final.Text));
     except
      begin
        ShowMessage('Data final inválida!');
        ed_data_final.Clear;
        ed_data_final.SetFocus;
        exit;
      end;
     end;

     if StrToDate(ed_data_inicial.text) > StrToDate(ed_data_final.Text) then
     begin
       ShowMessage('Data final não pode ser maior do que a data inicial');
       ed_data_final.Clear;
       ed_data_final.SetFocus;
       exit;
     end;
   end;


end;

procedure Tfrm_rel_gasto_diario.ed_data_inicialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return
 then
     begin
       Perform(WM_NEXTDLGCTL,0,0);
     end;


  if key=vk_escape then
  begin
     Close;
  end;
end;

procedure Tfrm_rel_gasto_diario.bt_imprimirClick(Sender: TObject);
begin
  linha:=1;
  rdp.Abrir;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  calcula_baixa;
  imprimir_cabecalho;
  corpo_relatorio;
  if cbk_visualizar.Checked then
   begin
    rdp.OpcoesPreview.Preview:=true;
    rdp.OpcoesPreview.CaptionPreview:='Relatório de Gastos de produção por período';
    rdp.OpcoesPreview.Remalina:=true;
    rdp.Fechar;
   end
  else
   begin
     rdp.OpcoesPreview.Preview:=False;
     if rdp.Setup then rdp.Fechar;
   end;

end;








procedure Tfrm_rel_gasto_diario.imprimir_cabecalho;
begin
  dm.tb_parametros.active:=true;
  rdp.ImpF(linha,1,dm.tb_parametros.fieldbyname('razao_social').Value+' - '+dm.tb_parametros.fieldbyname('nome_fantasia').Value,[negrito]);
  linha:=linha+1;
  rdp.ImpF(linha,1,'Data: '+FormatDateTime('DD/MM/YY',data_do_sistema)+' - Hora: '+formatdatetime('HH:MM',time),[negrito]);
  linha:=linha+1;
  rdp.impf(linha,1,'Usuário: '+codigo_usuario,[negrito]);
  linha:=linha+3;
  rdp.ImpC(linha,40,'Relatório de Gastos de produção - Por período', [negrito,expandido]);
  linha:=linha+1;
  rdp.ImpC(linha,40,ed_data_inicial.Text+' até '+ed_data_final.Text, [negrito,expandido]);
  linha:=linha+2;

  rdp.impf(linha,1,'Código',[negrito]);
  rdp.impf(linha,8,'Descrição',[negrito]);
  rdp.impf(linha,40,'Qtde.',[negrito]);
  rdp.impf(linha,50,'Unidade',[negrito]);
  rdp.impf(linha,70,'Custo',[negrito]);
  rdp.impf(linha,77,'Custo total',[negrito]);

  linha:=linha+1;
  rdp.impf(linha,1,'------------------------------------------------------------------------------------------',[negrito]);
  linha:=linha+2;
end;



procedure Tfrm_rel_gasto_diario.calcula_baixa;
begin
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add(' select sum(quantidade) as quantidade ,cod_produto  from movimento_venda where ');
  dm.qryauxiliar.sql.add(' data >='+QuotedStr(FormatDateTime('DD.MM.YY',StrToDate(ed_data_inicial.text))));
  dm.qryauxiliar.sql.add(' and data <='+QuotedStr(FormatDateTime('DD.MM.YY',StrToDate(ed_data_final.text))));
  dm.qryauxiliar.SQL.Add(' group by cod_produto order by cod_produto');
  dm.qryauxiliar.Active:=true;
  dm.qryauxiliar.First;

  dm.gastos_temp.Active:=false;
  dm.gastos_temp.EmptyTable;
  dm.gastos_temp.Active:=true;

  while not dm.qryauxiliar.eof do
  begin
   dm.qryauxiliar2.Active:=false;
   dm.qryauxiliar2.sql.clear;
   dm.qryauxiliar2.SQL.Add('select it.descricao_item,cp.cod_produto,cp.cod_item,');
   dm.qryauxiliar2.SQL.Add('    it.unidade_entrada,it.valor_custo as custo_unitario,');
   dm.qryauxiliar2.SQL.Add('    cp.quantidade,');
   dm.qryauxiliar2.SQL.Add('    un.cod_unidade,un.descricao as descricao_entrada,');
   dm.qryauxiliar2.SQL.Add('    cp.quantidade /(select parametro from unidades');
   dm.qryauxiliar2.SQL.Add('    where cod_unidade=it.unidade_entrada) as baixa');
   dm.qryauxiliar2.SQL.Add('    from composicoes_produto cp, itens_estoque it');
   dm.qryauxiliar2.SQL.Add('    inner join unidades un on(un.cod_unidade=it.unidade_entrada)');
   dm.qryauxiliar2.SQL.Add('       where it.cod_item=cp.cod_item');
   dm.qryauxiliar2.SQL.Add('       and cp.cod_produto='+QuotedStr(dm.qryauxiliar.fieldbyname('cod_produto').value));
   dm.qryauxiliar2.SQL.Add('    order by cp.cod_produto,cp.cod_item');
   dm.qryauxiliar2.Active:=true;
   dm.qryauxiliar2.First;
   while not dm.qryauxiliar2.Eof do
   begin
     if not dm.gastos_temp.Locate('codigo_item',dm.qryauxiliar2.fieldbyname('cod_item').Value,[]) then
      begin
        dm.gastos_temp.Append;
        dm.gastos_tempcodigo_item.Value:=dm.qryauxiliar2.fieldbyname('cod_item').Value;
        dm.gastos_tempqtde.Value:=(dm.qryauxiliar2.fieldbyname('baixa').Value * dm.qryauxiliar.fieldbyname('quantidade').value);
        dm.gastos_tempdescricao.value:=dm.qryauxiliar2.fieldbyname('descricao_item').Value;
        dm.gastos_tempunidade.Value:=dm.qryauxiliar2.fieldbyname('descricao_entrada').Value;
        dm.gastos_tempcusto_unitario.value:=dm.qryauxiliar2.fieldbyname('custo_unitario').Value;
      end
     else
      begin
        dm.gastos_temp.Edit;
        dm.gastos_tempqtde.Value:=(dm.qryauxiliar2.fieldbyname('baixa').Value * dm.qryauxiliar.fieldbyname('quantidade').value) +dm.gastos_tempqtde.Value;
      end;
     dm.gastos_temp.Post;
     dm.qryauxiliar2.next;
   end;
   dm.qryauxiliar.Next;
  end;
end;






procedure Tfrm_rel_gasto_diario.bt_sairClick(Sender: TObject);
begin
 close;
end;



procedure Tfrm_rel_gasto_diario.corpo_relatorio;
VAR
 custo_total : real;
begin
  custo_total:=0;
  dm.gastos_temp.First;
  while not dm.gastos_temp.Eof do
  begin
    if linha >= 60 then
    begin
      linha:=1;
      rdp.Novapagina;
      imprimir_cabecalho;
    end;
  rdp.impf(linha,1,dm.gastos_tempcodigo_item.value,[negrito]);
  rdp.impf(linha,8,dm.gastos_tempdescricao.value,[negrito]);
  rdp.impf(linha,40,FormatFloat('#0.000',dm.gastos_tempqtde.value),[negrito]);
  rdp.impf(linha,50,dm.gastos_tempunidade.value,[negrito]);
  rdp.impf(linha,70,FormatFloat('#0.00',dm.gastos_tempcusto_unitario.value),[negrito]);
  custo_total:=(dm.gastos_tempcusto_unitario.value * dm.gastos_tempqtde.value)+custo_total;
  rdp.impf(linha,77,FormatFloat('#0.00',dm.gastos_tempcusto_unitario.value * dm.gastos_tempqtde.value),[negrito]);
  linha:=linha+1;
  dm.gastos_temp.Next;
  end;
  linha:=linha+1;
  rdp.impf(linha,1,'------------------------------------------------------------------------------------------',[negrito]);
  linha:=linha+2;
  rdp.impf(linha,1,'Custo total de Produção: R$ '+FormatFloat('#0.00',custo_total),[negrito]);  


end;






end.

