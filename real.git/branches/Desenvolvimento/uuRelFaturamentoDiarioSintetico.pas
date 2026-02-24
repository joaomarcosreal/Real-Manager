unit uuRelFaturamentoDiarioSintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask,  StdCtrls, ExtCtrls, Buttons, RxToolEdit;

type
  TfrmRelatorioFaturamentoDiarioSintetico = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
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
    btPesqFormaPagto: TSpeedButton;
    edCodFormaPagamento: TEdit;
    Panel7: TPanel;
    Label4: TLabel;
    edDescFormaPagto: TEdit;
    ckbFatEstacao: TCheckBox;


    function verificaValidade() : boolean;
    procedure emitirRelatorio();
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioFaturamentoDiarioSintetico: TfrmRelatorioFaturamentoDiarioSintetico;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}

function TfrmRelatorioFaturamentoDiarioSintetico.verificaValidade() : boolean;
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

procedure TfrmRelatorioFaturamentoDiarioSintetico.emitirRelatorio();
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm_relatorios.qryFaturamento.Active:=false;
  dm_relatorios.qryFaturamento.SQL.clear;
  dm_relatorios.setFormaPagamentoRelatorio(' TODAS AS FORMAS DE PAGAMENTO');

  if (  trim(edCodFormaPagamento.Text) <> '') then
   begin
     dm_relatorios.qryFaturamento.sql.add(' and r.cod_forma = '+QuotedStr(edCodFormaPagamento.Text));
        dm_relatorios.setFormaPagamentoRelatorio('APENAS '+edDescFormaPagto.Text);
   end;

  if ( ckbFatEstacao.Checked = false ) then

   begin

      dm_relatorios.qryFaturamento.sql.add('  select r.data, udf_month(r.data)||'+Quotedstr('/')+'||udf_year(r.data) as mes , upper(udf_monthname(r.data))||'+Quotedstr('/')+'||udf_year(r.data) as NomeMes, sum(r.valor) as total from  recebimentos r');
      dm_relatorios.qryFaturamento.sql.add('   where r.data between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
      dm_relatorios.qryFaturamento.sql.add('     group by r.data ');
      dm_relatorios.qryFaturamento.sql.add('     order by r.data ');
      dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelatorioFaturamentoDiarioPorPeriodoSintetico.fr3',true);

   end
  else
   begin

      dm_relatorios.qryFaturamento.sql.add('  select r.data, cf.descricao, udf_month(r.data)||'+Quotedstr('/')+'||udf_year(r.data) as mes , upper(udf_monthname(r.data))||'+Quotedstr('/')+'||udf_year(r.data) as NomeMes, sum(r.valor) as total from  recebimentos r');
      dm_relatorios.qryFaturamento.sql.add('  inner join configuracoes_estacao cf on (cf.numero_caixa = r.numero_caixa) ');
      dm_relatorios.qryFaturamento.sql.add('   where r.data between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
      dm_relatorios.qryFaturamento.sql.add('     group by cf.descricao, r.data ');
      dm_relatorios.qryFaturamento.sql.add('     order by cf.descricao, r.data');
      dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelatorioFaturamentoDiarioPorPeriodoSinteticoEstacao.fr3',true);      

   end;



  dm.adicionaLog(dm_relatorios.qryFaturamento.SQL.Text);

  dm_relatorios.qryFaturamento.Active:=true;
  dm_relatorios.setPeriodoRelatorio('De  '+ edDataInicial.Text +'  até  '+edDataFinal.Text);

  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryParametros.Active:=true;
  dm_relatorios.qryFaturamento.Active:=false;

end;

procedure TfrmRelatorioFaturamentoDiarioSintetico.BitBtn2Click(
  Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioFaturamentoDiarioSintetico.BitBtn1Click(
  Sender: TObject);
begin
  inherited;
  if verificaValidade then
   emitirRelatorio;
end;

procedure TfrmRelatorioFaturamentoDiarioSintetico.FormActivate(
  Sender: TObject);
begin
  inherited;
  edDataInicial.SetFocus;
end;

end.
