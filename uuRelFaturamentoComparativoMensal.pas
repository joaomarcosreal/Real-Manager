unit uuRelFaturamentoComparativoMensal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.DateUtils,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uu_modelo_Vazio, FireDAC.Stan.Param,

  FireDAC.Comp.DataSet, FireDAC.Comp.Client, AdvGlassButton,
  AdvDateTimePicker, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvControlActions, Vcl.ActnList, Vcl.Buttons, Vcl.ComCtrls, JvActionsEngine,
  System.Actions, Vcl.Menus;

type
  TfrmRelFaturamentoComparativoMensal = class(Tfrm_modelo_vazio)
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
    procedure FormActivate(Sender: TObject);
  private
    procedure gerarRelatorio;
    function verificaValidadeDatas(ADataInicial, ADataFinal: TDate): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFaturamentoComparativoMensal: TfrmRelFaturamentoComparativoMensal;

implementation

{$R *.dfm}

uses
  uuDmRelatorios, uu_data_module, uu_frm_principal;

function TfrmRelFaturamentoComparativoMensal.verificaValidadeDatas(ADataInicial: TDate; ADataFinal: TDate): boolean;
begin

  if (ADataInicial > ADataFinal) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    result := false;
    exit;
  end;
  result := true;

end;

procedure TfrmRelFaturamentoComparativoMensal.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelFaturamentoComparativoMensal.btSelecionarClick(
  Sender: TObject);
begin
  inherited;
  if verificaValidadeDatas(ed_data_inicial.Date, ed_data_final.Date)  then
   begin
     gerarRelatorio;

   end;
end;

procedure TfrmRelFaturamentoComparativoMensal.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.Date  := StartOfTheMonth(data_do_sistema);
  ed_data_final.Date    := EndOfTheMonth(data_do_sistema);
end;

procedure TfrmRelFaturamentoComparativoMensal.gerarRelatorio();
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  dRelatorios.setPeriodoRelatorio('De ' + FormatDateTime('DD/MM/YY', ed_data_inicial.Date) + ' até ' + FormatDateTime('DD/MM/YY', ed_data_final.Date));

  try
    try

      LSQL.Clear;
      LSQL.Add('     select udf_year(v.data)|| udf_strzero( udf_month(v.data),2) as mesano,                  ');
      LSQL.Add('            udf_year(v.data) ano,                                                            ');
      LSQL.Add('            udf_year(v.data) mes_num,                                                        ');
      LSQL.Add('            udf_strzero( udf_month(v.data),2) ||'+QuotedStr(' - ')+'|| udf_monthname(v.data) mes_nome,      ');
      LSQL.Add(' sum(v.valor_total) as total                                                                 ');
      LSQL.Add(' from vendas v                                                                               ');
      LSQL.Add('    where v.data between :vpDataIni and :vpDataFinal                                         ');
      LSQL.Add('  group by 1,2,3,4                                                                           ');
      LSQL.Add('   order by 1                                                                                ');
      ////dm.adicionalog(LSQL.Text);
      dRelatorios.qryRelFatComparativoMensal.Active := false;
      dRelatorios.qryRelFatComparativoMensal.SQL.Clear;
      dRelatorios.qryRelFatComparativoMensal.SQL.Add(LSQL.Text);
      dRelatorios.qryRelFatComparativoMensal.Prepare;
      dRelatorios.qryRelFatComparativoMensal.ParamByName('vpDataIni').Value := ed_data_inicial.Date;
      dRelatorios.qryRelFatComparativoMensal.ParamByName('vpDataFinal').Value := ed_data_final.Date;
      dRelatorios.qryRelFatComparativoMensal.Active := True;
      dRelatorios.rpt.LoadFromFile(patchAplicacao + '\relatorios\relFaturamentoComparativo.fr3');
      dRelatorios.rpt.ShowReport(true);

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao ', 'Ok');
        raise Exception.Create('Erro ao gerar o relatório!');
      end;
    end;
  finally
    FreeAndNil(LSQL);

    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

end.

