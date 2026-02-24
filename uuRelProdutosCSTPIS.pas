unit uuRelProdutosCSTPIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Mask, ExtCtrls, Buttons, JvActionsEngine,
  JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmRelProdutosCSTPis = class(Tfrm_modelo_vazio)
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
    pn_grupos: TPanel;
    procedure emitirRelatorio();
    function verificaValidade() : boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProdutosCSTPis: TfrmRelProdutosCSTPis;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}


function TfrmRelProdutosCSTPis.verificaValidade() : boolean;
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


procedure TfrmRelProdutosCSTPis.emitirRelatorio();
begin
  inherited;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm_relatorios.qryProdutosVendidosCSTPis.Active := false;
  dm_relatorios.qryProdutosVendidosCSTPis.SQL.clear;


  dm_relatorios.qryProdutosVendidosCSTPis.SQL.add('SELECT * from R_PRODUTOS_VENDIDOS_CST_PIS(');
  dm_relatorios.qryProdutosVendidosCSTPis.SQL.add(Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(ed_data_inicial.Text)))+',');
  dm_relatorios.qryProdutosVendidosCSTPis.SQL.add(Quotedstr(FormatDateTime('DD.MM.YYY',StrToDate(ed_data_final.Text)))+')');
  ////dm.adicionalog(dm_relatorios.qryProdutosVendidosCSTPis.SQL.Text);
  dm_relatorios.qryProdutosVendidosCSTPis.Active := true;
  dm_relatorios.setPeriodoRelatorio('De  '+ ed_data_inicial.Text +'  até  '+ed_data_final.Text);
  dm_relatorios.rpt.Clear;
  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relProdutosVendidosCSTPisCofins.fr3',true);
  dm_relatorios.rpt.PrepareReport(true);




  dm_relatorios.rpt.ShowReport(true);

end;


procedure TfrmRelProdutosCSTPis.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade then
   begin
     emitirRelatorio;
   end;

end;

procedure TfrmRelProdutosCSTPis.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.SetFocus;

end;

procedure TfrmRelProdutosCSTPis.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
