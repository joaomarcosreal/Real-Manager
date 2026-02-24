unit uuRelTaxaServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_modelo_rel_datasa, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TfrmRelTaxaServico = class(Tfrm_modelo_rel_datas)
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    rdpAgrupamento: TRadioGroup;
    procedure emitirRelatorio();
    procedure bt_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelTaxaServico: TfrmRelTaxaServico;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}

procedure TfrmRelTaxaServico.emitirRelatorio();
begin
 case rdpAgrupamento.ItemIndex of

   0: begin
        dm.tb_parametros.Active:=true;
        dm_relatorios.qryTaxaServico.Active :=false;
        dm_relatorios.qryTaxaServico.sql.clear;
        dm_relatorios.qryTaxaServico.SQL.add('select x.data,x.cod_garcon,g.apelido ,sum(total_taxa_garcon) as total_taxa from ');
        dm_relatorios.qryTaxaServico.SQL.add('          (  select mv.cod_venda,v.data, v.base_calculo_servico,v.valor_pago_tx_servico, mv.cod_garcon,sum(mv.quantidade * mv.valor_unitario) as total_vendido_garcon, ');
        dm_relatorios.qryTaxaServico.SQL.add('              ((sum(mv.quantidade * mv.valor_unitario) * 100) / v.base_calculo_servico) as percentual_vendido,');
        dm_relatorios.qryTaxaServico.SQL.add('              ((((sum(mv.quantidade * mv.valor_unitario) * 100) / v.base_calculo_servico) /100) * v.valor_pago_tx_servico) as total_taxa_garcon');
        dm_relatorios.qryTaxaServico.SQL.add('                from movimento_venda mv');
        dm_relatorios.qryTaxaServico.SQL.add('                   inner join v_taxa_servico_vendas v on (v.cod_venda = mv.cod_venda)');
        dm_relatorios.qryTaxaServico.SQL.add('                   inner join produtos p on (p.cod_produto = mv.cod_produto)');
        dm_relatorios.qryTaxaServico.SQL.add('                    where mv.data between '+dataInicial +' and '+dataFinal);
        dm_relatorios.qryTaxaServico.SQL.add('                    and p.incide_servico=1');
        dm_relatorios.qryTaxaServico.SQL.add('                    group by mv.cod_venda,v.data,mv.cod_garcon, v.base_calculo_servico, v.valor_pago_tx_servico');
        dm_relatorios.qryTaxaServico.SQL.add('                    order by cod_venda) as x');
        dm_relatorios.qryTaxaServico.SQL.add('                inner join garcons g on (g.cod_garcon = x.cod_garcon)');
        dm_relatorios.qryTaxaServico.SQL.add('       group by x.cod_garcon, g.apelido, x.data');
        dm_relatorios.qryTaxaServico.SQL.add('order by x.cod_garcon,data ');

        dm.adicionaLog(dm_relatorios.qryTaxaServico.SQL.Text);


        dm_relatorios.qryTaxaServico.Active :=true;




        if ( ed_data_inicial.Text <> ed_data_final.Text) then
         begin
          dm_relatorios.setPeriodoRelatorio('Período: De '+ed_data_inicial.Text +'  até  '+ed_data_final.Text);
         end
        else
         begin
          dm_relatorios.setPeriodoRelatorio('Data: '+ed_data_inicial.Text);
         end;


        dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelTaxaServicoAgrupadoGarcom.fr3',true);
        dm_relatorios.rpt.ShowReport(true);


      end;



   1: begin
        dm.tb_parametros.Active:=true;
        dm_relatorios.qryTaxaServico.Active :=false;
        dm_relatorios.qryTaxaServico.sql.clear;
        dm_relatorios.qryTaxaServico.SQL.add('select x.data,x.cod_garcon,g.apelido ,sum(total_taxa_garcon) as total_taxa from ');
        dm_relatorios.qryTaxaServico.SQL.add('          (  select mv.cod_venda,v.data, v.base_calculo_servico,v.valor_pago_tx_servico, mv.cod_garcon,sum(mv.quantidade * mv.valor_unitario) as total_vendido_garcon, ');
        dm_relatorios.qryTaxaServico.SQL.add('              ((sum(mv.quantidade * mv.valor_unitario) * 100) / v.base_calculo_servico) as percentual_vendido,');
        dm_relatorios.qryTaxaServico.SQL.add('              ((((sum(mv.quantidade * mv.valor_unitario) * 100) / v.base_calculo_servico) /100) * v.valor_pago_tx_servico) as total_taxa_garcon');
        dm_relatorios.qryTaxaServico.SQL.add('                from movimento_venda mv');
        dm_relatorios.qryTaxaServico.SQL.add('                   inner join v_taxa_servico_vendas v on (v.cod_venda = mv.cod_venda)');
        dm_relatorios.qryTaxaServico.SQL.add('                   inner join produtos p on (p.cod_produto = mv.cod_produto)');
        dm_relatorios.qryTaxaServico.SQL.add('                    where mv.data between '+dataInicial +' and '+dataFinal);
        dm_relatorios.qryTaxaServico.SQL.add('                    and p.incide_servico=1');
        dm_relatorios.qryTaxaServico.SQL.add('                    group by mv.cod_venda,v.data,mv.cod_garcon, v.base_calculo_servico, v.valor_pago_tx_servico');
        dm_relatorios.qryTaxaServico.SQL.add('                    order by cod_venda) as x');
        dm_relatorios.qryTaxaServico.SQL.add('                inner join garcons g on (g.cod_garcon = x.cod_garcon)');
        dm_relatorios.qryTaxaServico.SQL.add('       group by x.cod_garcon, g.apelido, x.data');
        dm_relatorios.qryTaxaServico.SQL.add('order by data,x.cod_garcon ');
      dm.adicionaLog(dm_relatorios.qryTaxaServico.SQL.Text);

        dm_relatorios.qryTaxaServico.Active :=true;




        if ( ed_data_inicial.Text <> ed_data_final.Text) then
         begin
          dm_relatorios.setPeriodoRelatorio('Período: De '+ed_data_inicial.Text +'  até  '+ed_data_final.Text);
         end
        else
         begin
          dm_relatorios.setPeriodoRelatorio('Data: '+ed_data_inicial.Text);
         end;


        dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelTaxaServicoAgrupadoData.fr3',true);
        dm_relatorios.rpt.ShowReport(true);


      end;
   2: begin
        dm.tb_parametros.Active:=true;
        dm_relatorios.qryTaxaServico.Active :=false;
        dm_relatorios.qryTaxaServico.sql.clear;
        dm_relatorios.qryTaxaServico.SQL.add(' select data as data_venda, sum(total_taxa_garcon) as total from ');
        dm_relatorios.qryTaxaServico.SQL.add('          (  select mv.cod_venda,v.data, v.base_calculo_servico,v.valor_pago_tx_servico, mv.cod_garcon,sum(mv.quantidade * mv.valor_unitario) as total_vendido_garcon,');
        dm_relatorios.qryTaxaServico.SQL.add('              ((sum(mv.quantidade * mv.valor_unitario) * 100) / v.base_calculo_servico) as percentual_vendido,');
        dm_relatorios.qryTaxaServico.SQL.add('              ((((sum(mv.quantidade * mv.valor_unitario) * 100) / v.base_calculo_servico) /100) * v.valor_pago_tx_servico) as total_taxa_garcon');
        dm_relatorios.qryTaxaServico.SQL.add('                from movimento_venda mv');
        dm_relatorios.qryTaxaServico.SQL.add('                  inner join v_taxa_servico_vendas v on (v.cod_venda = mv.cod_venda)');
        dm_relatorios.qryTaxaServico.SQL.add('                  inner join produtos p on (p.cod_produto = mv.cod_produto)');
        dm_relatorios.qryTaxaServico.SQL.add('                    where mv.data between '+dataInicial +' and '+dataFinal);
        dm_relatorios.qryTaxaServico.SQL.add('                    and p.incide_servico=1');
        dm_relatorios.qryTaxaServico.SQL.add('                    group by mv.cod_venda,v.data,mv.cod_garcon, v.base_calculo_servico, v.valor_pago_tx_servico');
        dm_relatorios.qryTaxaServico.SQL.add('                    order by cod_venda)');
        dm_relatorios.qryTaxaServico.SQL.add('       group by data');
        dm_relatorios.qryTaxaServico.SQL.add('       order by data');

        dm_relatorios.qryTaxaServico.Active :=true;




        if ( ed_data_inicial.Text <> ed_data_final.Text) then
         begin
          dm_relatorios.setPeriodoRelatorio('Período: De '+ed_data_inicial.Text +'  até  '+ed_data_final.Text);
         end
        else
         begin
          dm_relatorios.setPeriodoRelatorio('Data: '+ed_data_inicial.Text);
         end;


        dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelTaxaServicoDiario.fr3',true);
        dm_relatorios.rpt.ShowReport(true);

      end;


   3: begin
        dm.tb_parametros.Active:=true;
        dm_relatorios.qryTaxaServico.Active :=false;
        dm_relatorios.qryTaxaServico.sql.clear;
        dm_relatorios.qryTaxaServico.SQL.add('select * from r_taxa_servico('+dataInicial+','+dataFinal+')');
        dm_relatorios.qryTaxaServico.Active :=true;


        if ( ed_data_inicial.Text <> ed_data_final.Text) then
         begin
          dm_relatorios.setPeriodoRelatorio('Período: De '+ed_data_inicial.Text +'  até  '+ed_data_final.Text);
         end
        else
         begin
          dm_relatorios.setPeriodoRelatorio('Data: '+ed_data_inicial.Text);
         end;


        dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelTaxaServicoRateado.fr3',true);
        dm_relatorios.rpt.ShowReport(true);
      end;

   4: begin
        dm.tb_parametros.Active:=true;
        dm_relatorios.qryTaxaServico.Active :=false;
        dm_relatorios.qryTaxaServico.sql.clear;



        dm_relatorios.qryTaxaServico.SQL.add(' select v.*, (v.base_calculo_servico * 0.1) as deveriaSer,(v.valor_bruto - v.base_calculo_servico) naoIncidentes,');
        dm_relatorios.qryTaxaServico.SQL.add('  (select garcons from R_GET_GARCONS_ATENDERAM_MESA(v.cod_venda)) garconsAtenderam');
        dm_relatorios.qryTaxaServico.SQL.add('  from v_taxa_servico_vendas v');
        dm_relatorios.qryTaxaServico.SQL.add('  where data between '+dataInicial+' and '+dataFinal);
        dm_relatorios.qryTaxaServico.SQL.add('   order by v.cod_venda ');
        dm_relatorios.qryTaxaServico.Active :=true;



        if ( ed_data_inicial.Text <> ed_data_final.Text) then
         begin
          dm_relatorios.setPeriodoRelatorio('Período: De '+ed_data_inicial.Text +'  até  '+ed_data_final.Text);
         end
        else
         begin
          dm_relatorios.setPeriodoRelatorio('Data: '+ed_data_inicial.Text);
         end;


        dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelTaxaServicoAuditoria.fr3',true);
        dm_relatorios.rpt.ShowReport(true);
      end;


 end;








end;

procedure TfrmRelTaxaServico.bt_imprimirClick(Sender: TObject);
begin
  inherited;
 if ( verificaDatas = false) then
   begin
     Exit;
   end
  else
   begin
     emitirRelatorio();
   end;
end;

end.
