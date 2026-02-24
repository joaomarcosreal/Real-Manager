unit uuRelFaturasAbertasPorVencimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask,  StdCtrls, ExtCtrls, Buttons, RxToolEdit,
  JvActionsEngine, JvControlActions, Vcl.ActnList, System.Actions;

type
  TfrmRelFaturasAbertasPorVencimento = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Panel6: TPanel;
    RadioGroup2: TRadioGroup;
    Panel5: TPanel;
    Label3: TLabel;
    cbk_visualizar: TCheckBox;
    edDataInicial: TDateEdit;
    Panel3: TPanel;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    edDataFinal: TDateEdit;
    Panel2: TPanel;
    Label48: TLabel;
    bt_pesq_cliente: TSpeedButton;
    ed_cod_cliente: TEdit;
    Panel7: TPanel;
    Label4: TLabel;
    ed_desc_cliente: TEdit;
    ckbTodas: TCheckBox;
    procedure emitirRelatorio();
    function  verificaValidade() : boolean;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ckbTodasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFaturasAbertasPorVencimento: TfrmRelFaturasAbertasPorVencimento;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}

procedure TfrmRelFaturasAbertasPorVencimento.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInicial.Date:=StrToDate('01/'+FormatDateTime('MM',date)+'/'+FormatDateTime('YYY',date));
  edDataFinal.Date:=Date;
  edDataInicial.SetFocus;
end;




function TfrmRelFaturasAbertasPorVencimento.verificaValidade() : boolean;
begin
  Result:=false;

  try
   begin
     StrToDate(edDataInicial.text);
     StrToDate(edDataFinal.text);

   end;
  except
   begin
      Showmessage('Período de datas inválido');
      edDataInicial.SetFocus;
      result:=false;
      exit;
   end;
  end;

  if (  edDataInicial.Date  > edDataFinal.Date  ) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    edDataInicial.SetFocus;
    result:=false;
    exit;
  end;

  if ( Trim(ed_cod_cliente.Text) <> ''  ) then
   begin
    if verificaExistenciaCliente(ed_cod_cliente.Text) = false then
     begin
       ShowMessage('Cliente inválido!');
       ed_cod_cliente.Clear;
       ed_desc_cliente.clear;
       result:=false;
       exit;
     end;
   end;

  result:=true;

end;





procedure TfrmRelFaturasAbertasPorVencimento.emitirRelatorio();
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm_relatorios.qryFaturasAbertas.Active:=false;
  dm_relatorios.qryFaturasAbertas.SQL.clear;



  dm_relatorios.qryFaturasAbertas.sql.add('      select  cl.razao_social, cl.telefone, f.* from faturas f ');
  dm_relatorios.qryFaturasAbertas.sql.add('          inner join clientes cl on (cl.cod_cli = f.cod_cli) ');
  dm_relatorios.qryFaturasAbertas.sql.add('    where f.status=0 and f.data_fatura between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
  if (  trim(ed_cod_cliente.Text) <> '') then
   begin
        dm_relatorios.qryFaturasAbertas.sql.add(' and f.cod_cli='+quotedstr(ed_cod_cliente.Text));
        dm_relatorios.setFormaPagamentoRelatorio('APENAS '+ed_desc_cliente.Text);
   end;

  dm_relatorios.qryFaturasAbertas.sql.add('     order by f.cod_cli,f.cod_fatura');


  if edDataInicial.Date = StrToDate('01/01/1600') then
    begin
      if ed_cod_cliente.Text <> '' then
        dm_relatorios.setPeriodoRelatorio('TODAS AS FATURAS EM ABERTO DE '+ed_desc_cliente.Text)
      else
        dm_relatorios.setPeriodoRelatorio('TODAS AS FATURAS EM ABERTO')
    end
  else
   begin
      if ed_cod_cliente.Text <> '' then
          dm_relatorios.setPeriodoRelatorio('De  '+ edDataInicial.Text +'  até  '+edDataFinal.Text +' DO CLIENTE '+ed_desc_cliente.Text)
      else
          dm_relatorios.setPeriodoRelatorio('De  '+ edDataInicial.Text +'  até  '+edDataFinal.Text);
   end;

  dm_relatorios.qryFaturasAbertas.Active:=true;

  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relatorioFaturasEmAbertoPorVencimento.fr3',true);
  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryParametros.Active:=true;
  dm_relatorios.qryFaturasAbertas.Active:=false;

end;


procedure TfrmRelFaturasAbertasPorVencimento.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade then
    emitirRelatorio;

end;

procedure TfrmRelFaturasAbertasPorVencimento.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelFaturasAbertasPorVencimento.ckbTodasClick(
  Sender: TObject);
begin
  inherited;
if ckbTodas.Checked then
   begin
     edDataInicial.Date:=StrToDate('01/01/1600');
     edDataFinal.Date:=StrToDate('31/12/9999');
     Panel3.Visible := false;
     Panel5.Visible := false;
   end
  else
   begin
    edDataInicial.Date:=StrToDate('01/'+FormatDateTime('MM',date)+'/'+FormatDateTime('YYY',date));
    edDataFinal.Date:=Date;
     Panel3.Visible := true;
     Panel5.Visible := true;

   end;
end;

end.
