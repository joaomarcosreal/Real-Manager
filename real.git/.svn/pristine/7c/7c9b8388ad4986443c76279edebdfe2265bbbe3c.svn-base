unit uUSuprimentoExtra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Mask,  RxCurrEdit, Buttons,
  ExtCtrls, RxToolEdit;

type
  TfrmSuprimentoExtra = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    edvalorSuprimento: TCurrencyEdit;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSuprimentoExtra: TfrmSuprimentoExtra;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmSuprimentoExtra.BitBtn1Click(Sender: TObject);
begin
  inherited;

  if (edvalorSuprimento.Value <= 0) then
   begin
     ShowMessage('Valor de suprimento tem que ser superior a zero!');
     exit;
   end
  else
   begin
    if ( dialogConfirmacao('Confirma suprimento','Confirma suprimento extra ?',20) = true ) then
     begin
       dm.qryAuxiliar.Active:=false;
       dm.qryAuxiliar.sql.Clear;
       dm.qryAuxiliar.Active:=false;
       dm.qryAuxiliar.sql.Clear;
       dm.qryAuxiliar.SQL.Add('insert into suprimentos (cod_forma,valor,data,cod_usuario,cod_caixa) values (');
       dm.qryAuxiliar.sql.add(''+QuotedStr('001')+',');
       dm.qryAuxiliar.sql.add(''+dm.TrocaVirgPPto(trim(FloatToStr(edvalorSuprimento.value))) +',');
       dm.qryAuxiliar.sql.add(''+QuotedStr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
       dm.qryAuxiliar.sql.add(''+QuotedStr(codigo_usuario)+',');
       dm.qryAuxiliar.sql.add(''+QUotedstr( ultimoCaixaAberto)+')');
       dm.qryAuxiliar.ExecSQL;
       IF (impressora_fiscal_instalada= 1) THEN
         frm_principal.ECF.Suprimento(edvalorSuprimento.Value,'','SUPRIMENTO','DINHEIRO');

       if dm.transacao.Active = false then dm.transacao.Active:=true;
        dm.transacao.Commit;

        close;
     end;
   end;

end;

procedure TfrmSuprimentoExtra.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.
