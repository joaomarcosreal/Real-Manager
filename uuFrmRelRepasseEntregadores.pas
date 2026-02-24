unit uuFrmRelRepasseEntregadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uu_modelo_Vazio, Vcl.StdCtrls, System.DateUtils, Vcl.ExtCtrls, AdvGlassButton,
  uu_data_module, UU_DM_RELATORIOS, RxToolEdit, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions, Vcl.Buttons, Vcl.Mask,
  Vcl.Menus;

type
  TfrmRelRepasseEntregadores = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    btImprimirInventario: TAdvGlassButton;
    AdvGlassButton1: TAdvGlassButton;
    ed_data_final: TDateEdit;
    ed_data_inicial: TDateEdit;
    Panel2: TPanel;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btImprimirInventarioClick(Sender: TObject);
    procedure AdvGlassButton1Click(Sender: TObject);
  private
    function verificaValidade: boolean;
    procedure emitirRelatorio;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelRepasseEntregadores: TfrmRelRepasseEntregadores;

implementation

{$R *.dfm}

uses
  uu_frm_principal;

procedure TfrmRelRepasseEntregadores.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  close();
end;

procedure TfrmRelRepasseEntregadores.btImprimirInventarioClick(Sender: TObject);
begin
  inherited;
  if verificaValidade then
  begin
    emitirRelatorio;
  end;
end;

procedure TfrmRelRepasseEntregadores.emitirRelatorio();
begin
  inherited;

  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\relRepasseMotoboys.fr3', true);
  dm_relatorios.qryResumoMotoboys.Active := false;
  dm_relatorios.qryResumoMotoboys.sql.Clear;
  dm_relatorios.qryResumoMotoboys.SQL.Add('select * from  resumo_motoboys(' + Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_inicial.Date)));
  dm_relatorios.qryResumoMotoboys.SQL.Add(',' + Quotedstr(FormatDateTime('DD.MM.YYY', ed_data_final.Date)) + ') rs');
  dm_relatorios.qryResumoMotoboys.SQL.Add(' order by rs.codentregador, rs.ordem, rs.valorcomissao, rs.ordemdia ');

  dm.adicionaLog(dm_relatorios.qryResumoMotoboys.SQL.Text);

  dm_relatorios.setPeriodoRelatorio('De ' + FormatDateTime('DD/MM/YY', ed_data_inicial.Date) + ' até ' + FormatDateTime('DD/MM/YY', ed_data_final.Date));
  dm_relatorios.rpt.PrepareReport(true);
  dm_relatorios.rpt.ShowReport(false);
  dm_relatorios.qryResumoMotoboys.Active := false;
  dm.transacao.Active := false;

end;

procedure TfrmRelRepasseEntregadores.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.Date := StartOfTheMonth(data_do_sistema);
  ed_data_final.Date := EndOfTheMonth(data_do_sistema);
  ed_data_inicial.SetFocus;
end;

function TfrmRelRepasseEntregadores.verificaValidade(): boolean;
begin

  if (ed_data_inicial.date > ed_data_final.date) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    ed_data_inicial.SetFocus;
    result := false;
    exit;
  end;

  result := true;

end;

end.

