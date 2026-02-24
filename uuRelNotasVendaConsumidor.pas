unit uuRelNotasVendaConsumidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, ExtCtrls, StdCtrls, Mask,  Buttons, RxToolEdit,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmRelatorioNotasConsumidor = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    cbk_visualizar: TCheckBox;
    edDe: TDateEdit;
    edAte: TDateEdit;
    GroupBox5: TGroupBox;
    Label46: TLabel;
    cbMesRefContabil: TComboBox;
    edAnoRefContabil: TEdit;
    gpTipoRelatorio: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    function  verificaValidade() : boolean;
    procedure emitirRelatorio();
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioNotasConsumidor: TfrmRelatorioNotasConsumidor;

implementation

uses uu_frm_principal, UU_DM_RELATORIOS, uu_data_module;

{$R *.dfm}

procedure TfrmRelatorioNotasConsumidor.FormActivate(Sender: TObject);
begin
  inherited;
  cbMesRefContabil.ItemIndex :=  StrToInt(FormatDateTime('MM',data_do_sistema)) - 1;
  edAnoRefContabil.Text      :=  FormatDateTime('YYY',data_do_sistema);

  edDe.Date:=StrToDate('01/'+FormatDateTime('MM',date)+'/'+FormatDateTime('YYY',date));
  edAte.Date:=Date;
  edDe.SetFocus;

end;



function TfrmRelatorioNotasConsumidor.verificaValidade() : boolean;
begin

if gpTipoRelatorio.ItemIndex = 0 then
 begin

  if edAte.Date < edDe.Date then
   begin
    showmessage('Período Inválido');
    edDe.SetFocus;
    result:=false;
    exit;
   end;

  end
 else
  begin
   if edAnoRefContabil.Text = '' then
     begin
       ShowMessage('Ano de referência inválido!');
     end;
  end;

  result:=true;
end;



procedure TfrmRelatorioNotasConsumidor.emitirRelatorio();
var
 mes : string;


begin
  mes:= edAnoRefContabil.Text + FormatFLoat('00',(cbMesRefContabil.ItemIndex + 1));
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm_relatorios.qryNotasConsumidor.SQL.clear;
  dm_relatorios.qryNotasConsumidor.sql.add('  select nc.data_doc,nc.numero_nota,nc.serie,nc.sub_serie,nc.cfop,nc.cst_icms,nc.cpf_cnpj_adquirente,   ');
  dm_relatorios.qryNotasConsumidor.sql.add('         nc.base_icms,nc.reducao_base_icms,nc.aliq_icms,nc.valor_icms,nc.valor_doc,nc.numero_ecf,nc.numero_cupom_fiscal,');
  dm_relatorios.qryNotasConsumidor.sql.add('      case nc.cancelado');
  dm_relatorios.qryNotasConsumidor.sql.add('        when 1 then '+Quotedstr('CANCELADA'));
  dm_relatorios.qryNotasConsumidor.sql.add('      end as status_nota');
  dm_relatorios.qryNotasConsumidor.sql.add('        from notas_consumidor nc');

  if gpTipoRelatorio.ItemIndex =0 then
    begin
      dm_relatorios.setPeriodoRelatorio(edDe.Text+'  ATÉ  '+edAte.Text);
      dm_relatorios.qryNotasConsumidor.sql.add(' where nc.data_doc between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte.Date)));
    end
  else
   begin
      dm_relatorios.setPeriodoRelatorio(cbMesRefContabil.Text +' - '+edAnoRefContabil.Text);
      dm_relatorios.qryNotasConsumidor.sql.add(' where nc.MES_REF_CONTABIL='+Quotedstr(mes));
   end;

   dm_relatorios.qryNotasConsumidor.Active :=true;
  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relatorioNotasConsumidor.fr3',true);


  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryNotasConsumidor.Active:=false;




end;


procedure TfrmRelatorioNotasConsumidor.BitBtn1Click(Sender: TObject);
begin
  inherited;
 if verificaValidade then
  emitirRelatorio;
end;

procedure TfrmRelatorioNotasConsumidor.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
