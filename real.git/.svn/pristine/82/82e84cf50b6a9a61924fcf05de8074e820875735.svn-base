unit uRelFaturasAbertasDetalhada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask,  StdCtrls, ExtCtrls, Buttons, RxToolEdit;

type
  TfrmRelFaturasAbertasDetalhada = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    Edit3: TEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Panel6: TPanel;
    rdPeriodo: TRadioGroup;
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
    rdFiltro: TRadioGroup;
    rdStatusFatura: TRadioGroup;
    rdTipoPeriodo: TRadioGroup;
    procedure emitirRelatorio();
    function  verificaValidade() : boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rdTipoPeriodoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFaturasAbertasDetalhada: TfrmRelFaturasAbertasDetalhada;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}



function TfrmRelFaturasAbertasDetalhada.verificaValidade() : boolean;
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

  if verificaExistenciaCliente(ed_cod_cliente.Text) = false then
   begin
     ShowMessage('Cliente inválido!');
     ed_cod_cliente.Clear;
     ed_desc_cliente.clear;
     result:=false;
     exit;
   end;


  result:=true;

end;





procedure TfrmRelFaturasAbertasDetalhada.emitirRelatorio();
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm_relatorios.qryFaturasAbertas.Active:=false;
  dm_relatorios.qryFaturasAbertas.SQL.clear;

  dm_relatorios.qryFaturasAbertas.sql.add('   select  cl.razao_social, cl.telefone,v.mesa, v.valor_bruto,v.valor_txserv,v.valor_total,v.mesa,v.coo_cupom, ');
  dm_relatorios.qryFaturasAbertas.sql.add('    f.cod_venda,f.* from faturas f ');
  dm_relatorios.qryFaturasAbertas.sql.add('    inner join clientes cl on (cl.cod_cli = f.cod_cli) ');
  dm_relatorios.qryFaturasAbertas.sql.add('    inner join vendas v on  (v.cod_venda = f.cod_venda) ');


  case rdStatusFatura.ItemIndex  of
   0: begin
        dm_relatorios.qryFaturasAbertas.sql.add('      where status = 0 ');
         dm_relatorios.setObservacaoRelatorio(' FATURAS EM ABERTO - DETALHADO');
      end;

   1: begin
        dm_relatorios.qryFaturasAbertas.sql.add('      where status = 1 ');
         dm_relatorios.setObservacaoRelatorio(' FATURAS PAGAS - DETALHADO');
      end;

   2: begin

        dm_relatorios.qryFaturasAbertas.sql.add('      where status <> -1 ');
         dm_relatorios.setObservacaoRelatorio(' TODAS AS FATURAS - DETALHADO');
      end;
  end;



   dm_relatorios.qryFaturasAbertas.sql.add('   and f.cod_cli='+quotedstr(ed_cod_cliente.Text));

  case rdFiltro.ItemIndex of
   0 :  begin
         dm_relatorios.qryFaturasAbertas.sql.add('    and f.data_fatura between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
         dm_relatorios.setPeriodoRelatorio('Faturadas entre '+ edDataInicial.Text +'  e  '+edDataFinal.Text);
        end;
   1 :  begin
         dm_relatorios.qryFaturasAbertas.sql.add('    and f.data_vencimento between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
         dm_relatorios.setPeriodoRelatorio('Vencidas entre '+ edDataInicial.Text +'  e  '+edDataFinal.Text);
        end;

   2 :  begin
         dm_relatorios.qryFaturasAbertas.sql.add('    and f.data_pagamento between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
         dm_relatorios.setPeriodoRelatorio('Pagas entre '+ edDataInicial.Text +'  e  '+edDataFinal.Text);
        end;


  end;

  if edDataInicial.Date = StrToDate('01/01/1600') then
        dm_relatorios.setPeriodoRelatorio('TODAS AS FATURAS DO CLIENTE');




  dm_relatorios.qryFaturasAbertas.sql.add('    order by f.cod_fatura');
  dm.adicionaLog(dm_relatorios.qryFaturasAbertas.sql.Text);
  dm_relatorios.qryFaturasAbertas.Active:=true;
  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relatorioFaturasEmAbertoDetalhado.fr3',true);
  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryParametros.Active:=true;
  dm_relatorios.qryFaturasAbertas.Active:=false;

end;


procedure TfrmRelFaturasAbertasDetalhada.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if verificaValidade then
    emitirRelatorio;

end;

procedure TfrmRelFaturasAbertasDetalhada.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelFaturasAbertasDetalhada.FormActivate(Sender: TObject);
begin
  inherited;
  edDataInicial.Date:=StrToDate('01/'+FormatDateTime('MM',date)+'/'+FormatDateTime('YYY',date));
  edDataFinal.Date:=Date;
  edDataInicial.SetFocus;

end;

procedure TfrmRelFaturasAbertasDetalhada.rdTipoPeriodoClick(
  Sender: TObject);
begin
  inherited;
  if rdTipoPeriodo.ItemIndex = 0 then
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
