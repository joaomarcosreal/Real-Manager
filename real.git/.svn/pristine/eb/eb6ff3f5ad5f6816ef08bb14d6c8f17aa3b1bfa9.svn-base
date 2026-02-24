unit uuBaixaTitulosContasApagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, Mask,  ibquery,
   ComCtrls, RxCurrEdit, RxToolEdit;

type
  TfrmBaixaTituloContasApagar = class(Tfrm_modelo_vazio)
    Panel2: TPanel;
    Panel3: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    edDataPagamento: TDateEdit;
    Label1: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel4: TPanel;
    edNumeroTitulo: TEdit;
    Label2: TLabel;
    edParcela: TEdit;
    Label3: TLabel;
    edDescricaoConta: TEdit;
    Label4: TLabel;
    edValor: TCurrencyEdit;
    Label5: TLabel;
    Label6: TLabel;
    edVencimento: TDateEdit;
    Panel5: TPanel;
    F01: TRadioButton;
    F02: TRadioButton;
    F03: TRadioButton;
    Label7: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaTituloContasApagar: TfrmBaixaTituloContasApagar;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmBaixaTituloContasApagar.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmBaixaTituloContasApagar.FormActivate(Sender: TObject);
var
 q : TIBquery;
begin
  inherited;
  q := TIBquery.create(self);
  q.database:= dm.dbrestaurante;
  q.transaction:= dm.transacao;

  q.active:=false;
  q.sql.clear;
  q.active:=false;

  q.SQL.Clear;
  q.sql.add('select * from r_contas_a_pagar where codigo='+Quotedstr(edNumeroTitulo.Text));
  q.Active :=true;
  frmBaixaTituloContasApagar.edParcela.Text := q.fieldbyname('parcela').value;
  frmBaixaTituloContasApagar.edDescricaoConta.Text := q.fieldbyname('descricaoconta').value;
  frmBaixaTituloContasApagar.edVencimento.Date :=  q.fieldbyname('data_vencimento').value;
  frmBaixaTituloContasApagar.edValor.Value     :=  q.fieldbyname('valoratualizado').value;
  q.Active :=false;
  freeandnil(q);






  edDataPagamento.Date := edVencimento.Date;
  F01.SetFocus;
end;

procedure TfrmBaixaTituloContasApagar.BitBtn1Click(Sender: TObject);
var
cod_forma : string;
begin
  inherited;

  if F01.Checked then
   cod_forma :='01';

  if F02.Checked then
   cod_forma :='02';

  if F03.Checked then
   cod_forma :='03';


  if (MessageBox(0, 'Confirma a baixa do título  ?', 'Confirmação de baixa', MB_ICONQUESTION  or MB_YESNO or MB_DEFBUTTON1) = idYes) then
   begin
     dm.transacao.Active :=false;
     dm.transacao.Active :=true;
     dm.qryauxiliar.Active :=false;
     dm.qryauxiliar.sql.clear;
     dm.qryauxiliar.sql.add('update contas_a_pagar set cod_forma_pagto='+QuotedStr(cod_forma)+',status=1,data_pagamento='+quotedstr(FormatDateTime('DD.MM.YYY',edDataPagamento.date))+' where codigo='+quotedstr(edNumeroTitulo.Text));
     try
      begin
        dm.qryauxiliar.ExecSQL;
        dm.transacao.Commit;
        showmessage('Título baixado com sucesso!');
        close;
      end;
     except
      begin
        showmessage('erro ao baixar conta');
        frm_principal.memo_avisos.Lines := dm.qryauxiliar.SQL;
        close;
      end;
     end;
   end;


end;
end.
