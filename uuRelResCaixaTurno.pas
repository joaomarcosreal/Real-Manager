unit uuRelResCaixaTurno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Mask, ExtCtrls, Buttons, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmRelResCaixaTurno = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    ed_data_inicial: TMaskEdit;
    ed_data_final: TMaskEdit;
    cbk_visualizar: TCheckBox;
    rdTurno: TRadioGroup;
    rdTipo: TRadioGroup;

    function verificaValidade() : boolean;
    procedure emitirRelatorio();
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelResCaixaTurno: TfrmRelResCaixaTurno;

implementation

uses UU_DM_RELATORIOS, uu_data_module, uu_frm_principal;

{$R *.dfm}




function TfrmRelResCaixaTurno.verificaValidade() : boolean;
begin
  try
    ed_data_inicial.Text := FormatDateTime('DD/MM/YYY',StrToDate(ed_data_inicial.Text));
  except
   begin
     ShowMessage('Data inicial inválida');
     ed_data_inicial.SetFocus;
     result:=false;
     exit;
   end;
  end;



  try
    ed_data_final.Text := FormatDateTime('DD/MM/YYY',StrToDate(ed_data_final.Text));
  except
   begin
     ShowMessage('Data final inválida');
     ed_data_final.SetFocus;
     result:=false;
     exit;
   end;
  end;

  if (  StrToDate(ed_data_inicial.Text) > StrToDate(ed_data_final.Text) ) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    ed_data_inicial.SetFocus;
    result:=false;
    exit;
  end;

  result:=true;

end;





procedure TfrmRelResCaixaTurno.emitirRelatorio();

begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\margemProdutosVendidos.fr3',true);


  dm_relatorios.qryResumoCaixaTurno.Active := false;
  dm_relatorios.qryResumoCaixaTurno.SQL.Clear;
  dm_relatorios.qryResumoCaixaTurno.SQL.Add('select * from v_resumo_caixa_por_turno where data between ');
  dm_relatorios.qryResumoCaixaTurno.sql.add(Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(ed_data_inicial.Text)))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(ed_data_final.Text))));
  case rdTurno.ItemIndex of
   0: begin

      end;
   1: begin
       dm_relatorios.qryResumoCaixaTurno.sql.Add(' and turno = 1  ');
      end;
   2: begin
       dm_relatorios.qryResumoCaixaTurno.sql.Add(' and turno = 2');
      end;
  end;

  dm_relatorios.qryResumoCaixaTurno.SQL.add('order by data,hora_abertura');

//frm_principal.memo_avisos.Lines := dm_relatorios.qryResumoCaixaTurno.SQL;
//frm_principal.memo_avisos.Visible := true;

 case rdTipo.ItemIndex of
  0: begin
      dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relResumoCaixasTurno.fr3',true);
     end;

  1: begin
      dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relResumoCaixasTurnoAgData.fr3',true);
     end;
 end;

 dm_relatorios.qryResumoCaixaTurno.Active:= true; 


  dm_relatorios.setPeriodoRelatorio('De  '+ ed_data_inicial.Text +'  até  '+ed_data_final.Text);

  dm_relatorios.rpt.ShowReport(true);

end;



procedure TfrmRelResCaixaTurno.BitBtn1Click(Sender: TObject);
begin
  inherited;

  if verificaValidade then
   begin
     emitirRelatorio;
   end;
end;

procedure TfrmRelResCaixaTurno.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.SetFocus;
end;

procedure TfrmRelResCaixaTurno.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
