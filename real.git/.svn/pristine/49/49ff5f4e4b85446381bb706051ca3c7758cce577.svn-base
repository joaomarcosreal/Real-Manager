unit uuFechamentoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask,  
   ExtCtrls, ibquery, DB, RxMemDS, Grids, DBGrids,
  AdvTouchKeyboard, JvExStdCtrls, RxCurrEdit,JvButton, JvCtrls, RxToolEdit,
  Vcl.ActnList, System.Actions, IBX.IBScript;

type
  TfrmFechamentoCaixa = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    tbFormasPagamentoTemp: TRxMemoryData;
    tbFormasPagamentoTempdescricaoForma: TStringField;
    tbFormasPagamentoTempvalorForma: TCurrencyField;
    tbFormasPagamentoTempcodForma: TStringField;
    dsFormasPagtoTemp: TDataSource;
    pnConsultaFormas: TPanel;
    bt_pesquisa_forma: TSpeedButton;
    btForma001: TJvImgBtn;
    btForma002: TJvImgBtn;
    btForma003: TJvImgBtn;
    btForma004: TJvImgBtn;
    btForma005: TJvImgBtn;
    btForma006: TJvImgBtn;
    btForma007: TJvImgBtn;
    btForma008: TJvImgBtn;
    btForma009: TJvImgBtn;
    btForma010: TJvImgBtn;
    btForma011: TJvImgBtn;
    btForma012: TJvImgBtn;
    btForma013: TJvImgBtn;
    btForma014: TJvImgBtn;
    btForma015: TJvImgBtn;
    btForma016: TJvImgBtn;
    btForma017: TJvImgBtn;
    btForma018: TJvImgBtn;
    btForma019: TJvImgBtn;
    btForma020: TJvImgBtn;
    Panel2: TPanel;
    gp_formas: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    btPesqFormaPagto: TSpeedButton;
    Label4: TLabel;
    edCodFormaPagamento: Tedit;
    edDescricaoForma: TEdit;
    ed_valor_forma: TCurrencyEdit;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    Panel5: TPanel;
    btFecharCaixa: TBitBtn;
    BitBtn1: TBitBtn;
    Panel6: TPanel;
    botaoClickForma: TSpeedButton;
    procedure Edit1Exit(Sender: TObject);
    procedure adicionar_pagamento(cod_forma : string; descricao_forma: string; valor : string);
    procedure gravarApuracaoCaixa();
    procedure BitBtn1Click(Sender: TObject);
    procedure btFecharCaixaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure botaoClickFormaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edCodFormaPagamentoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFechamentoCaixa: TfrmFechamentoCaixa;

implementation

uses uu_data_module, uu_frm_principal, Math, uuFrenteCaixa;

{$R *.dfm}

procedure TfrmFechamentoCaixa.Edit1Exit(Sender: TObject);
begin
  inherited;


   if  ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_valor_forma') and (TRIM(ed_valor_forma.Text) = ''))) then
     btFecharCaixa.SetFocus
   else
    begin
     if  ( (sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_valor_forma')) and (ed_valor_forma.Value >=0 )) then
      begin
       if (verificaExistenciaFormaDePagamento(edCodFormaPagamento.Text) = true )then
          adicionar_pagamento(edCodFormaPagamento.text,edDescricaoForma.Text,FormatFloat('#0.00',ed_valor_forma.Value ))
       else
         begin
           ShowMessage('Forma de Pagamento inválida');
           edCodFormaPagamento.SetFocus;
           edCodFormaPagamento.clear;
         end;
     end;
    end;


end;



procedure TfrmFechamentoCaixa.adicionar_pagamento(cod_forma : string; descricao_forma: string; valor : string);
begin

  if not tbFormasPagamentoTemp.Locate('codForma',cod_forma,[]) then
   begin
    tbFormasPagamentoTemp.Append;
    tbFormasPagamentoTempcodForma.Value:=cod_forma;
    tbFormasPagamentoTempdescricaoForma.value:= descricao_forma;
    tbFormasPagamentoTempvalorForma.value := StrToFloat(valor);
    tbFormasPagamentoTemp.Post;
   end
  else
    begin
      tbFormasPagamentoTemp.Edit;
      tbFormasPagamentoTempvalorForma.value := tbFormasPagamentoTempvalorForma.Value + StrToFloat(valor);
      tbFormasPagamentoTemp.Post;
    end;


  ed_valor_forma.Clear;
  edCodFormaPagamento.clear;
  edCodFormaPagamento.Clear;
  edCodFormaPagamento.SetFocus;
  edDescricaoForma.Clear;
end;




procedure TfrmFechamentoCaixa.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;


procedure TfrmFechamentoCaixa.gravarApuracaoCaixa();
var
 q : Tibquery;
begin
  q:= TIBQuery.Create(self);
  q.Database:=dm.dbrestaurante;
  q.Transaction:=dm.transacao;
  q.active:=false;

  q.Transaction.Active:=false;
  q.Transaction.StartTransaction;

  q.Active:=false;
  q.sql.clear;
  q.sql.add('delete from apuracao_caixa where cod_caixa='+Quotedstr(ultimoCaixaAberto));
  q.ExecSQL;


  tbFormasPagamentoTemp.First;
  while not tbFormasPagamentoTemp.Eof do
   begin
    q.Active:=false;
    q.sql.clear;
    q.sql.add('insert into apuracao_caixa (cod_caixa,cod_forma,total_operador) values (');
    q.sql.add(Quotedstr(ultimoCaixaAberto)+',');
    q.sql.add(''+QuotedStr(tbFormasPagamentoTempcodForma.value )+',');
    q.sql.add(''+dm.TrocaVirgPPto(Floattostr(tbFormasPagamentoTempvalorForma.value))+')');
    try
     begin
       q.ExecSQL;
     end;

    except
     begin
      ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Systems');
      dm.cria_log_de_erros(q.sql,'Módulo de caixa','Erro ao gravar forma de pagamento',codigo_usuario);
      exit;
     end;
    end;
    tbFormasPagamentoTemp.Next;
   end;

  dm.procProcessaCaixa.Active:=false;
  dm.procProcessaCaixa.Params[0].Value:=ultimoCaixaAberto;
  dm.procProcessaCaixa.ExecProc;

  q.Active:=false;
  q.sql.clear;
  q.sql.add(' update caixas c set c.status=0,  c.hora_fechamento=current_time,'+'c.data_fechamento=current_date');
  q.sql.add(' , c.total_sangrias='+dm.TrocaVirgPPto(FloatTostr(getTotalSangriasCaixa(ultimoCaixaAberto))));
  q.SQL.add(' where c.codigo='+Quotedstr(ultimoCaixaAberto));
  q.ExecSQL;
  dm.transacao.Commit;

  FreeAndNil(q);
end;



procedure TfrmFechamentoCaixa.btFecharCaixaClick(Sender: TObject);
begin
  inherited;

  If (MessageDlg('Confirma o fechamento do caixa ?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
   begin

     gravarApuracaoCaixa();
     if ( StrToInt(dm.LeIni(2,'CAIXA','impRelFechamento') ) =1 ) then
      begin
        if localDeEmissaoDeExtrato = 1 then
         begin
          dm.imprimeRelatorioCaixa(marca_impressora_fiscal,ultimoCaixaAberto);
         end
        else
         begin
          dm.imprimeRelatorioCaixa(marca_impressora_nao_fiscal_01,ultimoCaixaAberto);
         end;

      end;



     ShowMessage('Fechamento efetuado');
     Close;
   end;
end;

procedure TfrmFechamentoCaixa.edCodFormaPagamentoExit(Sender: TObject);
begin
  inherited;
  actExitFormaPagamentoExecute(Sender);
end;

procedure TfrmFechamentoCaixa.FormActivate(Sender: TObject);
begin
  inherited;
    {
  if (dm.verificaExistenciaNotasPendentesCancelamento ) then
   begin
      dm.exibe_painel_erro('Existem notas fiscais pendentes de cancelamento por erro de conexão.'+sLineBreak+
       'O sistema tentará fazer o cancelamento automático.' +sLineBreak+
       'Certifique-se que o computador esteja conectado à internet, pois do contrário o processo não será efetuado.'+sLineBreak+
       ' e não será possível encerrar o dia!','Ok');
      dm.CancelaNotasPendentes();
      dm.CancelaNotasPendentesPorSubstituicao();
   end;

   }

  tbFormasPagamentoTemp.Active:=false;
  tbFormasPagamentoTemp.EmptyTable;
  tbFormasPagamentoTemp.Active:=true;
  edCodFormaPagamento.SetFocus;
end;

procedure TfrmFechamentoCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_escape then
   close;
end;






procedure TfrmFechamentoCaixa.botaoClickFormaClick(Sender: TObject);
var
x : integer;
nomebt : string;
begin
  inherited;
  x:=0;
   while ( (x < ComponentCount -1)) do
      begin                                                                               
        if ( Components[x] is Tedit  ) and     ( (Components[x]as Tedit).Name='edCodFormaPagamento' ) then
          begin
             nomebt :=Trim( copy((sender as TJvImgBtn).Name,13,5));
             (Components[x] as Tedit).Text := nomebt;
             edCodFormaPagamento.OnExit(edCodFormaPagamento);
             ed_valor_forma.SetFocus;

          end;
        x:= x+1;
      end;
end;

procedure TfrmFechamentoCaixa.FormCreate(Sender: TObject);
var
   x : integer;

begin
  inherited;

      if (dm.verificaNotasContingenciaNoCaixa  = true) then
       begin
        dm.exibe_painel_erro('Existem NFC-e(s) em contingência pendentes de envio. Envie as notas e contingência antes de fechar o caixa. '#13#10#13#10+' ','Ok');
        close;

       end;








   dm.qryauxiliar.Active := false;
   dm.qryauxiliar.sql.Clear;
   dm.qryauxiliar.SQL.add(' select cod_forma,descricao from formas_pagamento order by cod_forma ');
   dm.qryauxiliar.Active := true;
   dm.qryauxiliar.First;
   x:=0;
   while ( (x < ComponentCount-1) and (dm.qryauxiliar.Eof = false) ) do
    begin
      if  Components[x].ClassName='TJvImgBtn' then
        begin
//          MakeRounded((components[x] as TSpeedButton));
           if  (Trim(copy( (components[x] as TJvImgBtn).Name ,0,7))  = 'btForma') then
            begin
             (components[x] as TJvImgBtn).name := 'btFormaPagto'+dm.qryauxiliar.fieldbyname('cod_forma').Value;
             (components[x] as TJvImgBtn).Caption :=  dm.qryauxiliar.fieldbyname('cod_forma').Value+#13+ dm.qryauxiliar.fieldbyname('descricao').Value;
             (components[x] as TJvImgBtn).Visible := true;
             (components[x] as TJvImgBtn).onClick :=  botaoClickFormaClick;

             dm.qryauxiliar.Next;

            end;

        end;
        x:= x+1;
    end;


end;

end.
