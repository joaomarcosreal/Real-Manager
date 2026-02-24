unit uuRelAuditoriaPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask,  StdCtrls, ExtCtrls, Buttons, RxToolEdit,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmRelAuditoriaPedidos = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ed_data_inicial: TDateEdit;
    ed_data_final: TDateEdit;
    rdFiltro: TRadioGroup;
   function  verificaValidade() : boolean;
   procedure emitirRelatorio();
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAuditoriaPedidos: TfrmRelAuditoriaPedidos;

implementation

uses UU_DM_RELATORIOS, uu_data_module, uu_frm_principal;

{$R *.dfm}



function TfrmRelAuditoriaPedidos.verificaValidade() : boolean;
begin
  try
    ed_data_inicial.Text := FormatDateTime('DD/MM/YYY',ed_data_inicial.date);
  except
   begin
     ShowMessage('Data inicial inválida');
     ed_data_inicial.SetFocus;
     result:=false;
     exit;
   end;
  end;



  try
    ed_data_final.Text := FormatDateTime('DD/MM/YYY',ed_data_final.Date );
  except
   begin
     ShowMessage('Data final inválida');
     ed_data_final.SetFocus;
     result:=false;
     exit;
   end;
  end;

  if (  ed_data_inicial.date > ed_data_final.date ) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    ed_data_inicial.SetFocus;
    result:=false;
    exit;
  end;

  result:=true;

end;


procedure TfrmRelAuditoriaPedidos.emitirRelatorio();
begin
// showmessage('');

  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relAuditoriaPedidosDelivery.fr3',true);


 dm_relatorios.QryPedidosAlterados.Active := false;
 dm_relatorios.QryPedidosAlterados.sql.clear;
 dm_relatorios.QryPedidosAlterados.sql.Add(' select distinct cod_pedido from pedidos_delivery_alteracao p ');
 dm_relatorios.QryPedidosAlterados.sql.Add(' where cast( p.data_hora_alteracao as date)  between '+Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_inicial.Date ))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',ed_data_final.Date)));
 dm_relatorios.QryPedidosAlterados.Active := true;

 case rdFiltro.ItemIndex of
  1: begin
       dm_relatorios.QryPedidosAlterados.sql.Add('   and p.tipo_alteracao = 2');
     end;
  2: begin
       dm_relatorios.QryPedidosAlterados.sql.Add('   and p.tipo_alteracao = 3');
     end;
 end;

 dm_relatorios.QryPedidosAlterados.sql.Add('order by p.cod_pedido'); 

// ////dm.adicionalog(dm_relatorios.QryPedidosAlterados.SQL.Text);

 dm_relatorios.setPeriodoRelatorio('De  '+ ed_data_inicial.Text +'  até  '+ed_data_final.Text);
 dm_relatorios.QryPedidosAlterados.Active := true;
 dm_relatorios.rpt.ShowReport(true);





end;


procedure TfrmRelAuditoriaPedidos.FormActivate(Sender: TObject);
begin
  inherited;
  ed_data_inicial.Date := date;
  ed_data_final.Date := date;
end;

procedure TfrmRelAuditoriaPedidos.BitBtn1Click(Sender: TObject);
begin
  inherited;
if verificaValidade then
   begin
     emitirRelatorio;
   end;

end;

procedure TfrmRelAuditoriaPedidos.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
