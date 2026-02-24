unit uuRelFaturamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask,  StdCtrls, ExtCtrls, Buttons, RxToolEdit;

type
  TfrmRelatorioFaturamentoDiarioPeriodoAnalitico = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
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
    edCodFormaPagamento: TEdit;
    Label48: TLabel;
    btPesqFormaPagto: TSpeedButton;
    Panel7: TPanel;
    Label4: TLabel;
    edDescFormaPagto: TEdit;
    rdpTipoFaturamento: TRadioGroup;
    function  verificaValidade() : boolean;
    procedure emitirRelatorio();
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edDataInicialChange(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioFaturamentoDiarioPeriodoAnalitico: TfrmRelatorioFaturamentoDiarioPeriodoAnalitico;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal, DateUtils;

{$R *.dfm}


function TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.verificaValidade() : boolean;
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

  if ( Trim(edCodFormaPagamento.Text) <> ''  ) then
   begin
    if verificaExistenciaFormaDePagamento(edCodFormaPagamento.Text) = false then
     begin
       ShowMessage('Forma de pagamento inválida');
       edCodFormaPagamento.Clear;
       edDescFormaPagto.clear;
       result:=false;
       exit;
     end;
   end;


  result:=true;
end;

procedure TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.emitirRelatorio();
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm_relatorios.qryFaturamento.Active:=false;
  dm_relatorios.qryFaturamento.SQL.clear;
  dm_relatorios.qryFaturamento.sql.add('  select r.cod_forma, r.data, udf_month(r.data)||'+Quotedstr('/')+'||udf_year(r.data) as mes , upper(udf_monthname(r.data))||'+Quotedstr('/')+'||udf_year(r.data) as NomeMes, sum(r.valor) as total, upper(f.descricao) as Descricao from  recebimentos r');
  dm_relatorios.qryFaturamento.sql.add('   inner join formas_pagamento f on (f.cod_forma =  r.cod_forma)');
  dm_relatorios.qryFaturamento.sql.add('   inner join vendas v on (v.cod_venda = r.cod_venda) ');
  dm_relatorios.qryFaturamento.sql.add('   where r.data between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));

  case rdpTipoFaturamento.ItemIndex of
   0 : begin
         dm_relatorios.qryFaturamento.SQL.add('');
       end;
   1:  begin
         dm_relatorios.qryFaturamento.SQL.add(' and v.modelo_comprovante = 0');
       end;

   2:  begin
         dm_relatorios.qryFaturamento.SQL.add(' and v.modelo_comprovante <> 0');
       end;
   end;




  if (  trim(edCodFormaPagamento.Text) <> '') then
   begin
     dm_relatorios.qryFaturamento.sql.add(' and r.cod_forma = '+QuotedStr(edCodFormaPagamento.Text));
   end;
  dm_relatorios.qryFaturamento.sql.add('   group by r.data,r.cod_forma,f.descricao');
  dm_relatorios.qryFaturamento.sql.add('   order by r.data,r.cod_forma');

  dm.adicionaLog(dm_relatorios.qryFaturamento.SQL.Text);

  dm_relatorios.qryFaturamento.Active:=true;
  dm_relatorios.setPeriodoRelatorio('De  '+ edDataInicial.Text +'  até  '+edDataFinal.Text);
  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelatorioFaturamentoDiarioPorPeriodo.fr3',true);
  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryParametros.Active:=true;
  dm_relatorios.qryFaturamento.Active:=false;


end;


procedure TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.BitBtn1Click(
  Sender: TObject);
begin
  inherited;
  if verificaValidade  then
    emitirRelatorio;
end;

procedure TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.BitBtn2Click(
  Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.FormActivate(
  Sender: TObject);
begin
  inherited;
  edDataInicial.SetFocus;
  edDataInicial.Date := Today;
  edDataFinal.Date := today;
end;

procedure TfrmRelatorioFaturamentoDiarioPeriodoAnalitico.edDataInicialChange(
  Sender: TObject);
begin
  inherited;
  if edDataInicial.Text ='00/00/0000' then
   begin
    edDataInicial.Clear;
    rdpTipoFaturamento.Visible:=true;
   end;
end;

end.
