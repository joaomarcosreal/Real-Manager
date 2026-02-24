unit uuSangria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, DBCtrls,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxDBLookupComboBox, RxLookup, Mask,
   ibquery, RxToolEdit, RxCurrEdit;

type
  TfrmSangria = class(Tfrm_modelo_vazio)
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbTipoSangria: TRxDBLookupCombo;
    edValorSangria: TCurrencyEdit;
    Panel2: TPanel;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    memoObsSangria: TMemo;
    Label6: TLabel;
    btPesqFormaPagto: TSpeedButton;
    edCodFormaPagamento: Tedit;
    Label13: TLabel;
    Panel3: TPanel;
    edDescFormaPagto: Tedit;
    procedure FormActivate(Sender: TObject);
    procedure gravarSangria();
    procedure btConfirmarClick(Sender: TObject);
    function  verificaValidade() : boolean;
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSangria: TfrmSangria;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}



procedure TfrmSangria.FormActivate(Sender: TObject);
begin
  inherited;

  dm.qryTiposSangria.Active:=false;
  dm.qryTiposSangria.SQL.clear;
  dm.qryTiposSangria.SQL.add('select * from tipos_sangria order by descricao');
  dm.qryTiposSangria.Active:=true;
  edCodFormaPagamento.Text := '001';
end;


procedure TfrmSangria.gravarSangria();
var
 qrySangria : TIBQuery;
 codSangria : string;
 ct : integer;
 obs : string;
begin

  for ct:=0 to memoObsSangria.Lines.Count-1 do
  begin
    obs:=obs + memoObsSangria.lines[ct];
  end;


  qrySangria :=TIBquery.create(self);
  qrySangria.database:=dm.dbrestaurante;
  qrySangria.transaction:=dm.transacao;
  qrySangria.Active:=False;
  qrySangria.SQL.Clear;
  qrySangria.Active:=false;
  qrySangria.sql.Clear;
  codSangria :=  dm.geraCodigo('G_SANGRIAS',5);
  qrySangria.SQL.Add('insert into sangrias (codigo,codigo_tipo,cod_forma,valor,data,cod_usuario,cod_caixa,obs, cod_usuario_autorizou,nome_usuario_autorizou) values ');
  qrySangria.sql.add('('+Quotedstr(codSangria)+',');
  qrySangria.sql.add(''+Quotedstr(VarToStr(cbTipoSangria.KeyValue))+',');
  qrySangria.sql.add(''+Quotedstr(edCodFormaPagamento.Text)+',');
  qrySangria.sql.add(''+dm.TrocaVirgPPto(trim(FloatToStr(edValorSangria.value))) +',');
  qrySangria.sql.add(''+QuotedStr(FormatDateTime('DD.MM.YYY',data_do_sistema))+',');
  qrySangria.sql.add(''+QuotedStr(codigo_usuario)+',');
  qrySangria.sql.add(''+QUotedstr( ultimoCaixaAberto)+',');
  qrySangria.sql.add(''+QUotedstr(obs)+',');
  qrySangria.sql.add(QuotedStr(codigo_usuario_responsavel)+',');
  qrySangria.sql.add(QuotedStr(nome_usuario_responsavel)+')');




   try
    begin
        qrySangria.ExecSQL;
    end;
  except
   begin
     dm.cria_log_de_erros(qrySangria.sql ,'Módulo de caixa','Erro ao efetuar sangria',codigo_usuario);
     exit;
   end;
  end;

  dm.transacao.Commit;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;

  try
   begin

      if localDeEmissaoDeExtrato = 1 then
       begin
         dm.imprimeComprovanteSangria(marca_impressora_fiscal ,codSangria);
       end
      else
       begin
          dm.imprimeComprovanteSangria(marca_impressora_nao_fiscal_01 ,codSangria);

       end;

   end;
  except
   begin
     ShowMessage('Erro ao imprimir');
   end;
  end;

  if impressora_fiscal_instalada = 1 then
    frm_principal.ECF.Sangria(edValorSangria.Value,'','SANGRIA','DINHEIRO');



  dm.exibe_painel_erro('Sangria realizada com sucesso!','');
  close;

end;

procedure TfrmSangria.btConfirmarClick(Sender: TObject);
begin
  inherited;
  if verificaValidade then
  begin
    if (MessageDlg('Confirma Sangria ?',mtConfirmation,[mbYes,mbNo],0) = MrYes) then 
    gravarSangria();
  end;
end;



function TfrmSangria.verificaValidade() : boolean;
begin

  if ( verificaExistenciaTipoSangria(VarToStr(cbTipoSangria.KeyValue))= false ) then
   begin
    MessageDlg('Tipo de Sangria inválido!',mtError,[mbOk],0);
    Result:=false;
    Exit;
   end;



   if (edValorSangria.value <= 0) then
    begin
      MessageDlg('Valor de Sangria inválido !',mtError,[mbOk],0);
      Result:=false;
      Exit;
    end;

    if (verificaExistenciaFormaPagto(edCodFormaPagamento.Text) = false) then
    begin
      MessageDlg('Forma de pagamento inválida!',mtError,[mbOk],0);
      edCodFormaPagamento.clear;
      edDescFormaPagto.clear;
      edCodFormaPagamento.setfocus;
      Result:=false;
      exit;
    end;

   Result:=true;

end;

procedure TfrmSangria.btCancelarClick(Sender: TObject);
begin
  inherited;
  close;
end;

end.
