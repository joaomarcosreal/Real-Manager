unit uuRelCurvaABCProdutosComprados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.DateUtils, frxDBSet,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio,
  JvControlActions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons,


  FireDAC.Comp.Client, AdvGlassButton,
  JvValidateEdit, AdvDateTimePicker,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  Data.DB, FireDAC.Comp.DataSet, JvExStdCtrls, JvEdit, Vcl.ComCtrls,
  JvActionsEngine, System.Actions, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Vcl.Menus;

type
  TfrmRelCurvaABCProdutosComprados = class(Tfrm_modelo_vazio)
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
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    RadioGroup1: TRadioGroup;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ed_data_inicial: TAdvDateTimePicker;
    ed_data_final: TAdvDateTimePicker;
    edPCTA: TJvValidateEdit;
    edPCTB: TJvValidateEdit;
    edPCTC: TJvValidateEdit;
    Panel1: TPanel;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    FDMemTable1: TFDMemTable;
    procedure FormActivate(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private
    procedure gerarRelatorio;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCurvaABCProdutosComprados: TfrmRelCurvaABCProdutosComprados;

implementation

uses
  uu_frm_principal, uuDmRelatorios, uu_data_module;

{$R *.dfm}

procedure TfrmRelCurvaABCProdutosComprados.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelCurvaABCProdutosComprados.btSelecionarClick(Sender: TObject);
begin
  inherited;
 if verificaValidadeDatas(ed_data_inicial.Date, ed_data_final.Date)  then
   begin
     gerarRelatorio;

   end;
end;

procedure TfrmRelCurvaABCProdutosComprados.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.Date  := StartOfTheMonth(data_do_sistema);
  ed_data_final.Date    := EndOfTheMonth(data_do_sistema);
end;



procedure  TfrmRelCurvaABCProdutosComprados.gerarRelatorio();
var
 LSQL : TStringList;
 LTbAux : TFDMemTable;
 dtCurvaABCCompras : TfrxDBDataset;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  dtCurvaABCCompras := TfrxDBDataset.Create(self);
  dtCurvaABCCompras.UserName := 'dtCurvaABCCompras';
  dtCurvaABCCompras.Name     :=  dtCurvaABCCompras.UserName;
  dRelatorios.setPeriodoRelatorio('De '+FormatDateTime('DD/MM/YY',ed_data_inicial.Date)+' até '+FormatDateTime('DD/MM/YY',ed_data_final.Date));

  try
     try



       LSQL.Clear;
       LSQL.add(' select r.*, g.descricao as descricaoGrupo from R_CURVA_ABC_COMPRAS('+dm.TrocaVirgPPto(edPCTA.Value)+','+dm.TrocaVirgPPto(edPCTB.value)+','+dm.TrocaVirgPPto(edPCTC.Value)+',');
       LSQL.Add(Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_inicial.date)));
       LSQL.Add(','+Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_final .date)));
       LSQL.add(','+Quotedstr('')+') r');
       LSQL.add(' inner join grupos g on (g.cod_grupo = r.cod_grupo) ');


       ////dm.adicionalog(LSQL.Text);
       dm.getMemTable(LTbAux, LSQL.Text);
       dtCurvaABCCompras.DataSet := LTbAux;
       dRelatorios.rpt.DataSets.Add(dtCurvaABCCompras);
       dRelatorios.rpt.LoadFromFile(patchAplicacao+'\relatorios\relCurvaABCProdutosComprados.fr3');



       dRelatorios.rpt.ShowReport(true);

     except
      on E: Exception do
       begin
         dm.exibe_painel_erro('Erro ao ','Ok');
         raise Exception.Create('Erro ao gerar o relatório!');
       end;
     end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(dtCurvaABCCompras);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

end.
