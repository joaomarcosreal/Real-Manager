unit uuRelProducaoGarconsSintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frm_modelo_rel_datasa, StdCtrls, Buttons, Mask, ExtCtrls,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmRelProducaoGarconsSintetico = class(Tfrm_modelo_rel_datas)
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    rdpAgrupamento: TRadioGroup;
    procedure emitirRelatorio;
    procedure bt_imprimirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;






var
  frmRelProducaoGarconsSintetico: TfrmRelProducaoGarconsSintetico;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}


procedure TfrmRelProducaoGarconsSintetico.emitirRelatorio;
begin

 case rdpAgrupamento.ItemIndex  of
  0: begin
      dm.tb_parametros.Active:=true;
      dm_relatorios.qryProducaoGarconsSintetico.Active :=false;
      dm_relatorios.qryProducaoGarconsSintetico.SQL.Clear;
      dm_relatorios.qryProducaoGarconsSintetico.SQL.add('select mv.data,mv.cod_garcon,g.apelido, sum(mv.quantidade * mv.valor_unitario) as total from movimento_venda mv ');
      dm_relatorios.qryProducaoGarconsSintetico.SQL.add('  inner  join garcons g on (g.cod_garcon = mv.cod_garcon)');
      dm_relatorios.qryProducaoGarconsSintetico.SQL.add('  where  mv.data between '+dataInicial +' and '+dataFinal);
      dm_relatorios.qryProducaoGarconsSintetico.SQL.add('  group by mv.cod_garcon, g.apelido,mv.data order by mv.cod_garcon');
      dm_relatorios.qryProducaoGarconsSintetico.Active :=true;


      if ( ed_data_inicial.Text <> ed_data_final.Text) then
       begin
        dm_relatorios.setPeriodoRelatorio('Período: De '+ed_data_inicial.Text +'  até  '+ed_data_final.Text);
       end
      else
       begin
        dm_relatorios.setPeriodoRelatorio('Data: '+ed_data_inicial.Text);
       end;


      dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relProducaoGarconsSinteticoAgrupadoGarcom.fr3',true);
      dm_relatorios.rpt.ShowReport(true);




     end;
  1: begin
      dm.tb_parametros.Active:=true;
      dm_relatorios.qryProducaoGarconsSintetico.Active :=false;
      dm_relatorios.qryProducaoGarconsSintetico.SQL.Clear;
      dm_relatorios.qryProducaoGarconsSintetico.SQL.add('select mv.data,mv.cod_garcon,g.apelido, sum(mv.quantidade * mv.valor_unitario) as total from movimento_venda mv ');
      dm_relatorios.qryProducaoGarconsSintetico.SQL.add('  inner  join garcons g on (g.cod_garcon = mv.cod_garcon)');
      dm_relatorios.qryProducaoGarconsSintetico.SQL.add('  where  mv.data between '+dataInicial +' and '+dataFinal);
      dm_relatorios.qryProducaoGarconsSintetico.SQL.add('  group by mv.data,mv.cod_garcon, g.apelido order by mv.data');
      dm_relatorios.qryProducaoGarconsSintetico.Active :=true;


      if ( ed_data_inicial.Text <> ed_data_final.Text) then
       begin
        dm_relatorios.setPeriodoRelatorio('Período: De '+ed_data_inicial.Text +'  até  '+ed_data_final.Text);
       end
      else
       begin
        dm_relatorios.setPeriodoRelatorio('Data: '+ed_data_inicial.Text);
       end;


      dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relProducaoGarconsSinteticoAgrupadoData.fr3',true);
      dm_relatorios.rpt.ShowReport(true);

     end;
  2: begin
      dm.tb_parametros.Active:=true;
      dm_relatorios.qryProducaoGarconsSintetico.Active :=false;
      dm_relatorios.qryProducaoGarconsSintetico.SQL.Clear;
      dm_relatorios.qryProducaoGarconsSintetico.SQL.add('select mv.cod_garcon,g.apelido, sum(mv.quantidade * mv.valor_unitario) as total from movimento_venda mv ');
      dm_relatorios.qryProducaoGarconsSintetico.SQL.add('  inner  join garcons g on (g.cod_garcon = mv.cod_garcon)');
      dm_relatorios.qryProducaoGarconsSintetico.SQL.add('  where  mv.data between '+dataInicial +' and '+dataFinal);
      dm_relatorios.qryProducaoGarconsSintetico.SQL.add('  group by mv.cod_garcon, g.apelido order by 3');
      dm_relatorios.qryProducaoGarconsSintetico.Active :=true;


      if ( ed_data_inicial.Text <> ed_data_final.Text) then
       begin
        dm_relatorios.setPeriodoRelatorio('Período: De '+ed_data_inicial.Text +'  até  '+ed_data_final.Text);
       end
      else
       begin
        dm_relatorios.setPeriodoRelatorio('Data: '+ed_data_inicial.Text);
       end;


      dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relProducaoGarconsSintetico.fr3',true);
      dm_relatorios.rpt.ShowReport(true);
     end;
 end;


 

end;


procedure TfrmRelProducaoGarconsSintetico.bt_imprimirClick(
  Sender: TObject);
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
