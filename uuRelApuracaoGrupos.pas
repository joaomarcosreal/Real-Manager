unit uuRelApuracaoGrupos;

interface

uses
  Windows, Dateutils, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, ComCtrls, ExtCtrls,
   RxToolEdit, JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions,
  Vcl.Mask, Vcl.Menus;

type
  TfrmRealApuracaoGrupos = class(Tfrm_modelo_vazio)
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edDataFinal: TDateEdit;
    cal1: TMonthCalendar;
    rdTipoRelatorio: TRadioGroup;

    procedure cal1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRealApuracaoGrupos: TfrmRealApuracaoGrupos;

implementation

uses UU_DM_RELATORIOS, uu_data_module, uu_frm_principal;

{$R *.dfm}




procedure TfrmRealApuracaoGrupos.cal1Click(Sender: TObject);
begin
  inherited;
//  edDataInicial.Date := StartOfTheMonth(cal1.Date);
//  edDataFinal.Date := EndOfTheMonth(cal1.Date);
end;

procedure TfrmRealApuracaoGrupos.BitBtn1Click(Sender: TObject);
var
  dataInicial,dataFinal : string;
begin
  dataInicial := Quotedstr(FormatDateTime('DD.MM.YYY', StartOfTheMonth(cal1.date)));
  dataFinal := Quotedstr(FormatDateTime('DD.MM.YYY', EndOfTheMonth(cal1.date)));

  dm.transacao.Active:=false;
  dm.transacao.Active:=true;


  case rdTipoRelatorio.ItemIndex of
   0: begin
        dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelGruposApuracao.fr3',true);
        dm_relatorios.qryRelGruposApuracao.Active := false;
        dm_relatorios.qryRelGruposApuracao.SQL.Clear;
        dm_relatorios.qryRelGruposApuracao.sql.add('  select t.cod_produto, t.descricao, t.cod_grupo_apuracao, g.descricao as desc_grupo_ap,  t.qtditem, t.basecalculo, ');
        dm_relatorios.qryRelGruposApuracao.sql.add('   g.pis as al_pis,');
        dm_relatorios.qryRelGruposApuracao.sql.add('   g.cofins as al_cofins,');
        dm_relatorios.qryRelGruposApuracao.sql.add('   g.cont_social as al_social,');
        dm_relatorios.qryRelGruposApuracao.sql.add('   g.imposto_renda as al_ir,');
        dm_relatorios.qryRelGruposApuracao.sql.add('   g.icms as al_icms,');

        dm_relatorios.qryRelGruposApuracao.sql.add('  ( (t.basecalculo * g.pis) / 100) as total_pis,');
        dm_relatorios.qryRelGruposApuracao.sql.add('  ( (t.basecalculo * g.cofins ) / 100) as total_cofins,');
        dm_relatorios.qryRelGruposApuracao.sql.add('  ( (t.basecalculo * g.cont_social  ) / 100) as total_c_social,');
        dm_relatorios.qryRelGruposApuracao.sql.add('  ( (t.basecalculo * g.imposto_renda   ) / 100) as total_ir,');
        dm_relatorios.qryRelGruposApuracao.sql.add('    ( (t.basecalculo * g.icms    ) / 100) as total_icms');
        dm_relatorios.qryRelGruposApuracao.sql.add('  from totais_grupo_apuracao('+dataInicial  +','+dataFinal  +') t');
        dm_relatorios.qryRelGruposApuracao.sql.add('   inner join grupos_apuracao g on (g.codigo = t.cod_grupo_apuracao)');
        dm_relatorios.qryRelGruposApuracao.sql.add('order by t.cod_grupo_apuracao, t.cod_produto');
        dm_relatorios.qryRelGruposApuracao.Active := true;
        dm_relatorios.setPeriodoRelatorio('De  '+ DateToStr (StartOfTheMonth(cal1.date)) +'  até  '+dateToStr(EndOfTheMonth(cal1.date)));
        dm_relatorios.rpt.ShowReport(true);
        dm_relatorios.qryRelGruposApuracao.Active := false;




       end;

   1: begin
        dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelGruposApuracaoSintetico.fr3',true);
        dm_relatorios.qryRelGruposApuracaoSintetico.Active := false;
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Clear;

        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('select rs.*, (rs.total_pis + rs.total_cofins + rs.total_c_social + rs.total_ir + rs.total_icms) as total_impostos   from (');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('  select  t.cod_grupo_apuracao, g.descricao as desc_grupo_ap,');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('   g.pis as al_pis,');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('   g.cofins as al_cofins,');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('   g.cont_social as al_social,');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('   g.imposto_renda as al_ir,');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('   g.icms as al_icms,');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('  sum( t.basecalculo) as base_calculo,');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('  sum ( ( (t.basecalculo * g.pis) / 100) ) as total_pis,');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('  sum ( ( (t.basecalculo * g.cofins ) / 100)) as total_cofins,');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('  sum ( ( (t.basecalculo * g.cont_social  ) / 100)  ) as total_c_social,');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('  sum(  ( (t.basecalculo * g.imposto_renda   ) / 100) ) as total_ir,');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('  sum(  ( (t.basecalculo * g.icms    ) / 100)) as total_icms');
        dm_relatorios.qryRelGruposApuracaoSintetico.sql.add('  from totais_grupo_apuracao('+dataInicial  +','+dataFinal  +') t');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('   inner join grupos_apuracao g on (g.codigo = t.cod_grupo_apuracao)');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('   group by t.cod_grupo_apuracao,g.descricao,  g.pis,  g.cofins , g.cont_social , g.imposto_renda , g.icms');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('order by t.cod_grupo_apuracao');
        dm_relatorios.qryRelGruposApuracaoSintetico.SQL.Add('               ) as rs');
        dm_relatorios.qryRelGruposApuracaoSintetico.Active := true;
        dm_relatorios.setPeriodoRelatorio('De  '+ DateToStr (StartOfTheMonth(cal1.date)) +'  até  '+dateToStr(EndOfTheMonth(cal1.date)));
        dm_relatorios.rpt.ShowReport(true);
        dm_relatorios.qryRelGruposApuracaoSintetico.Active := false;






      end;
  end;


  frm_principal.memo_avisos.Lines := dm_relatorios.qryRelGruposApuracao.SQL;
//    frm_principal.memo_avisos.Visible := true;







end;

procedure TfrmRealApuracaoGrupos.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
