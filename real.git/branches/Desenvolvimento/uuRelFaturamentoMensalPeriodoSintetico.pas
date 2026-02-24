unit uuRelFaturamentoMensalPeriodoSintetico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask,  StdCtrls, ExtCtrls, RxToolEdit,
  Vcl.Buttons;

type
  TfrmFaturamentoMensalPeriodoSintetico = class(Tfrm_modelo_vazio)
    SpeedButton1: TSpeedButton;
    Edit2: TEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
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
    procedure BitBtn2Click(Sender: TObject);

    procedure emitirRelatorio();
    function  verificaValidade() : boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFaturamentoMensalPeriodoSintetico: TfrmFaturamentoMensalPeriodoSintetico;

implementation

uses uu_data_module, UU_DM_RELATORIOS, uu_frm_principal;

{$R *.dfm}


function TfrmFaturamentoMensalPeriodoSintetico.verificaValidade() : boolean;
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

procedure TfrmFaturamentoMensalPeriodoSintetico.emitirRelatorio();
begin
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
  dm_relatorios.qryFaturamento.Active:=false;
  dm_relatorios.qryFaturamento.SQL.clear;

  dm_relatorios.setFormaPagamentoRelatorio(' TODAS AS FORMAS DE PAGAMENTO');


  dm_relatorios.qryFaturamento.sql.add('      select sum(f.total) as valor,f.anomes,f.nomemes');
  dm_relatorios.qryFaturamento.sql.add('       from faturamentomensal f');
  dm_relatorios.qryFaturamento.sql.add('    where f.data between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataInicial.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edDataFinal.Date)));
  if (  trim(edCodFormaPagamento.Text) <> '') then
   begin
     dm_relatorios.qryFaturamento.sql.add(' and f.codForma = '+QuotedStr(edCodFormaPagamento.Text));
        dm_relatorios.setFormaPagamentoRelatorio('APENAS '+edDescFormaPagto.Text);
   end;
  dm_relatorios.qryFaturamento.sql.add('       group by f.anomes,f.nomemes');
  dm_relatorios.qryFaturamento.sql.add('       order by f.anomes');



  dm_relatorios.qryFaturamento.Active:=true;
  dm_relatorios.setPeriodoRelatorio('De  '+ edDataInicial.Text +'  até  '+edDataFinal.Text);
  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelatorioFaturamentoMensalPorPeriodoSintetico.fr3',true);
  dm_relatorios.rpt.ShowReport(true);
  dm_relatorios.qryParametros.Active:=true;
  dm_relatorios.qryFaturamento.Active:=false;

end;



procedure TfrmFaturamentoMensalPeriodoSintetico.BitBtn2Click(
  Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmFaturamentoMensalPeriodoSintetico.BitBtn1Click(
  Sender: TObject);
begin
  inherited;
  if verificaValidade then
   emitirRelatorio;
end;

procedure TfrmFaturamentoMensalPeriodoSintetico.FormActivate(
  Sender: TObject);
begin
  inherited;
  edDataInicial.SetFocus;
end;

end.
