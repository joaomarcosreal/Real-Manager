unit uuRelDREComparativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.DateUtils,
  System.Classes, Vcl.Graphics, uuDMDRE, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, uu_modelo_Vazio, AdvGlassButton, Vcl.ComCtrls, AdvDateTimePicker,
  Vcl.StdCtrls, Vcl.ExtCtrls, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, Vcl.Buttons, Vcl.Menus;

type
  TfrmDREComparativo = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    ActionList1: TActionList;
    ControlAction1: TControlAction;
    Action1: TAction;
    JvControlActionList1: TJvControlActionList;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    Action13: TAction;
    Action14: TAction;
    Action15: TAction;
    Action16: TAction;
    Action17: TAction;
    Action18: TAction;
    Action19: TAction;
    Action20: TAction;
    Action21: TAction;
    Action22: TAction;
    Action23: TAction;
    Action24: TAction;
    Action25: TAction;
    Action26: TAction;
    Action27: TAction;
    Action28: TAction;
    Action29: TAction;
    Action30: TAction;
    Action31: TAction;
    Action32: TAction;
    Action33: TAction;
    Action34: TAction;
    Action35: TAction;
    Action36: TAction;
    Action37: TAction;
    Action38: TAction;
    Action39: TAction;
    Action40: TAction;
    Action41: TAction;
    Action42: TAction;
    Action43: TAction;
    Action44: TAction;
    Action45: TAction;
    Action46: TAction;
    Action47: TAction;
    Action48: TAction;
    Action49: TAction;
    Action50: TAction;
    Action51: TAction;
    Action52: TAction;
    Action53: TAction;
    Action54: TAction;
    Action55: TAction;
    Action56: TAction;
    Action57: TAction;
    Action58: TAction;
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ed_data_inicial: TAdvDateTimePicker;
    ed_data_final: TAdvDateTimePicker;
    Panel1: TPanel;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    procedure btSairClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure gerarRelatorio;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDREComparativo: TfrmDREComparativo;

implementation

{$R *.dfm}

uses
  UU_DM_RELATORIOS, uu_frm_principal;

procedure TfrmDREComparativo.btSairClick(Sender: TObject);
begin
  inherited;
  close;

end;

procedure TfrmDREComparativo.btSelecionarClick(Sender: TObject);
begin
  inherited;
  if verificaValidadeDatas(ed_data_inicial.Date, ed_data_final.Date) then
  begin
    gerarRelatorio();
  end;
end;

procedure TfrmDREComparativo.FormCreate(Sender: TObject);
begin
  inherited;
  dmDRE := TdmDRE.Create(Self);
  ed_data_inicial.Date := StartOfTheYear(now);
  ed_data_final.Date   := EndOfTheMonth(Now);
end;

procedure TfrmDREComparativo.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmDRE);
end;

procedure TfrmDREComparativo.gerarRelatorio();
var
  LSQL: TStringList;
  LSQLComparativo: TStringList;
begin

  LSQL := TStringList.Create;
  LSQLComparativo := TStringList.Create;

  try
    try

      LSQLComparativo.Clear;
      LSQLComparativo.Add(' select * from r_compartivo_dre(:vpDataInicio,:vpDataFim) dr ');
      LSQLComparativo.Text := StringReplace(LSQLComparativo.Text, ':vpDataInicio', Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_inicial.Date)), [rfReplaceAll]);
      LSQLComparativo.Text := StringReplace(LSQLComparativo.Text, ':vpDataFim', Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_final.Date)), [rfReplaceAll]);

      LSQL.Clear;
      LSQL.add('select * from (                                                                                                                                                                     ');
      LSQL.add('                                                                                                                                                                                    ');
      LSQL.add('     with totais_grupos_rd as                                                                                                                                                       ');
      LSQL.add('       ( select  extract(year from lr.data_rd) as ano, extract(month from lr.data_rd) as mes,                                                                                       ');
      LSQL.add('                 coalesce(sum(itr.valor),0) as total                                                                                                                                ');
      LSQL.add('                from itens_lancamento_rd itr                                                                                                                                        ');
      LSQL.add('                  inner join lancamentos_rd lr on (lr.codigo = itr.cod_lanc_rd)                                                                                                     ');
      LSQL.add('                    where lr.data_rd between :vpDataInicio and :vpDataFim                                                                                                           ');
      LSQL.add('                    group by 1,2                                                                                                                                                    ');
      LSQL.add('       ),                                                                                                                                                                           ');
      LSQL.add('      totais_vendas as (                                                                                                                                                            ');
      LSQL.add('        select                                                                                                                                                                      ');
      LSQL.add('          extract(year from v.data) as ano,                                                                                                                                         ');
      LSQL.add('          extract(month from v.data) as mes,                                                                                                                                        ');
      LSQL.add('        coalesce(sum(v.valor),0.01) as total                                                                                                                                        ');
      LSQL.add('         from recebimentos v                                                                                                                                                        ');
      LSQL.add('         where v.data between :vpDataInicio and :vpDataFim                                                                                                                          ');
      LSQL.add('           group by 1,2                                                                                                                                                             ');
      LSQL.add('          ),                                                                                                                                                                        ');
      LSQL.add('                                                                                                                                                                                    ');
      LSQL.add('      meses_ano as (                                                                                                                                                                ');
      LSQL.add('         select distinct ano,mes  from                                                                                                                                              ');
      LSQL.add('          (                                                                                                                                                                         ');
      LSQL.add('          select distinct rd.ano, rd.mes                                                                                                                                            ');
      LSQL.add('             from totais_grupos_rd rd                                                                                                                                               ');
      LSQL.add('          union all                                                                                                                                                                 ');
      LSQL.add('          select distinct tv.ano, tv.mes                                                                                                                                            ');
      LSQL.add('            from totais_vendas tv                                                                                                                                                   ');
      LSQL.add('            )                                                                                                                                                                       ');
      LSQL.add('            order by ano,mes                                                                                                                                                        ');
      LSQL.add('          )                                                                                                                                                                         ');
      LSQL.add('                                                                                                                                                                                    ');
      LSQL.add('                                                                                                                                                                                    ');
      LSQL.add('  select  ms.ano, ms.mes, m.mes ||' + Quotedstr(' ') + '|| cast(ms.ano as varchar(4)) as nome_mes , coalesce(tv.total,0.01)  as totalFaturamento, coalesce(rd.total,0) as totalDespesa, ');
      LSQL.add('      (( coalesce(rd.total,0) / coalesce(tv.total,0.01) ) * 100) as PF,                                                                                                             ');
      LSQL.add('      ( coalesce(tv.total,0.01) - coalesce(rd.total,0)) as resultado,                                                                                                               ');
      LSQL.add('      (( ( coalesce(tv.total,0.01) - coalesce(rd.total,0)) /  coalesce(tv.total,0.01)) * 100) as PCTRest                                                                            ');
      LSQL.add('      from meses_ano ms                                                                                                                                                             ');
      LSQL.add('        left join totais_grupos_rd rd on (rd.ano = ms.ano and rd.mes = ms.mes)                                                                                                      ');
      LSQL.add('        left join totais_vendas  tv on (tv.mes = ms.mes and tv.ano= rd.ano)                                                                                                         ');
      LSQL.add('        inner join meses m on (m.id = ms.mes)                                                                                                                                       ');
      LSQL.add('                                                                                                                                                                                    ');
      LSQL.add('              ) order by ano, mes                                                                                                                                                   ');
      LSQL.Text := StringReplace(LSQL.Text, ':vpDataInicio', Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_inicial.Date)), [rfReplaceAll]);
      LSQL.Text := StringReplace(LSQL.Text, ':vpDataFim', Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_final.Date)), [rfReplaceAll]);

      dmDRE.qryResumoDREComparativo.Active := false;
      dmDRE.qryResumoDREComparativo.SQL.Clear;
      dmDRE.qryResumoDREComparativo.SQL.Add(LSQL.Text);
      dmDRE.qryResumoDREComparativo.Active := True;
      dmDRE.qryResumoDREComparativo.FetchAll;

      dmDRE.qryDREComparativo.Active := false;
      dmDRE.qryDREComparativo.SQL.Clear;
      dmDRE.qryDREComparativo.SQL.Text := LSQLComparativo.Text;
      dmDRE.qryResumoDREComparativo.Active := true;
      dmDRE.qryResumoDREComparativo.FetchAll;
//
//      if ((dmDRE.qryResumoDREComparativo.IsEmpty) or (dmDRE.qryDREComparativo.IsEmpty)) then
//      begin
//        dm.exibe_painel_erro('Sem dados para o período!', 'Ok', mtError);
//
//      end
//      else
//      begin
//
//      end;
        dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\dreComparativo.fr3', true);
        dm_relatorios.setPeriodoRelatorio('De ' + FormatDateTime('DD/MM/YY', ed_data_inicial.Date) + ' até ' + FormatDateTime('DD/MM/YY', ed_data_final.Date));
        dm_relatorios.rpt.ShowReport(true);
//      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao gerar o relatório: ' + sLineBreak + E.Message);
      end;

    end;

  finally
    dmDRE.qryDREComparativo.Active := false;
    dmDRE.qryResumoDREComparativo.Active := false;
    LSQL.Clear;
    LSQLComparativo.Clear;
    FreeAndNil(LSQL);
    FreeAndNil(LSQLComparativo);
  end;

end;

end.

