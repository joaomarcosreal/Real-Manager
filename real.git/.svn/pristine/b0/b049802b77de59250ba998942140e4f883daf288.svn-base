unit uuContasPagarEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask, DBCtrls, StdCtrls, ExtCtrls, Buttons,
    RXDBCtrl, Grids, DBGrids, rxcurredit,DB, RxMemDS, ibquery, RxToolEdit,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.ActnList, System.Actions;

type
  TfrmContasApagarEntradas = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label27: TLabel;
    Panel3: TPanel;
    Panel11: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    bt_pesq_centro_custo: TSpeedButton;
    Label3: TLabel;
    Panel6: TPanel;
    Label4: TLabel;
    edDescricaoConta: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel8: TPanel;
    edTotalConta: TCurrencyEdit;
    edNumeroParcelas: TCurrencyEdit;
    edPrazoParcelas: TCurrencyEdit;
    btGerar: TBitBtn;
    ed_cod_fornecedor: TEdit;
    ed_razao_social_fornecedor: TEdit;
    ed_cnpj_fornecedor: TEdit;
    ed_desc_c_custo: TEdit;
    Label14: TLabel;
    tbParcelas: TRxMemoryData;
    tbParcelasdataVencimento: TDateField;
    tbParcelasvalorParcela: TCurrencyField;
    tbParcelasdescricaoConta: TStringField;
    tbParcelasvalorMulta: TCurrencyField;
    tbParcelasvalorMora: TFloatField;
    tbParcelasvalorDesconto: TFloatField;
    tbParcelasflagMulta: TSmallintField;
    tbParcelasflagMora: TSmallintField;
    tbParcelasflagDesconto: TSmallintField;
    tbParcelasdiasDesconto: TIntegerField;
    ed_cod_centro_custo: TEdit;
    dsParcelas: TDataSource;
    ckbDiasUteis: TCheckBox;
    tbParcelasnumeroControle: TStringField;
    tbParcelasdiaSemana: TStringField;
    Label15: TLabel;
    DBGrid1: TDBGrid;
    edNumeroEntrada: TEdit;
    edNumeroNota: TEdit;
    Label17: TLabel;
    gp_loja: TGroupBox;
    Panel9: TPanel;
    edDescLoja: TDBEdit;
    edCodLoja: TDBEdit;
    tbParcelasparcela: TStringField;
    btSair: TBitBtn;
    btLancar: TBitBtn;
    Label19: TLabel;
    Panel7: TPanel;
    Panel10: TPanel;
    Label18: TLabel;
    memoObs: TMemo;
    Label20: TLabel;
    DBGrid3: TDBGrid;
    Label16: TLabel;
    edDataDoc: TDateEdit;
    Label21: TLabel;
    edDataVencimento: TcxDateEdit;
    edDataRD: TcxDateEdit;
    procedure FormActivate(Sender: TObject);
    procedure gerarParcelas();
    procedure btGerarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btSairClick(Sender: TObject);
    procedure btLancarClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    function  validarParcelas(testaSomaParcelas : boolean) : boolean;
    procedure efetuarLancamento(parcelado : boolean);

    procedure carregaDadosRd();
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContasApagarEntradas: TfrmContasApagarEntradas;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmContasApagarEntradas.FormActivate(Sender: TObject);
begin
  inherited;
  carregaDadosRd();
  btLancar.Caption :=  'Lançar no '+#10+'Contas a'+#10+'Pagar';
  btSair.Caption   :=  'Sair sem'+#10+'Lançar';
  edDataVencimento.Date := Now;
  ed_cod_centro_custo.SetFocus;

end;


procedure TfrmContasApagarEntradas.gerarParcelas();
var
 q : TIBQuery;
 i :  integer;
 dataInicio : string;
 diasUteis : smallint;
 ct : integer;
 valorParcelas      : double;
 diferencaParcelas  : double;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  valorParcelas     :=  StrToFloat(formatFloat('0.00',(edTotalConta.Value /  edNumeroParcelas.value)));
  diferencaParcelas := edTotalConta.Value  - (valorParcelas * edNumeroParcelas.Value );

  dataInicio := Quotedstr(FormatDateTime('DD.MM.YYY',edDataVencimento.Date));
  if ckbDiasUteis.Checked then
    diasUteis:=1
  else
   diasUteis:=0;

  tbParcelas.EmptyTable;
  tbParcelas.Active :=true;


  q.Active :=false;
  q.sql.clear;

  q.sql.add('select gp.*,udf_dayname(gp.datavencimento) as nomeDia from gera_parcelas('+dataInicio+','+FloatToStr(edNumeroParcelas.Value)+','+FloatToStr(edPrazoParcelas.Value)+','+IntToStr(diasUteis)+') gp');
  q.Active:=true;
  q.First;

  ct:= 1;

  while not q.Eof do
   begin
     tbParcelas.Append;
     tbParcelasdataVencimento.Value := q.fieldbyname('DATAVENCIMENTO').VALUE;
     tbParcelasnumeroControle.Value := formatfloat('00',ct)+' / '+FloatToStr(edNumeroParcelas.Value);
     tbParcelasdescricaoConta.Value := edDescricaoConta.Text +' - '+formatfloat('00',ct)+' / '+FloatToStr(edNumeroParcelas.Value);
     tbParcelasparcela.Value  := formatfloat('00',ct)+'/'+formatfloat('00',edNumeroParcelas.Value);
     tbParcelasdiaSemana.Value  :=   q.fieldbyname('nomeDia').value;
     if ct = 1 then
       tbParcelasvalorParcela.Value := valorParcelas + diferencaParcelas
     else
       tbParcelasvalorParcela.Value := valorParcelas;

     tbParcelas.Post;
     ct := ct+1;
     q.next;
   end;

   tbParcelas.First;
   btLancar.Enabled :=true;
end;

procedure TfrmContasApagarEntradas.btGerarClick(Sender: TObject);
begin
  inherited;
  if ( validarParcelas(false) = true) then
   begin
    gerarParcelas();
   end;
end;

procedure TfrmContasApagarEntradas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
if tbParcelas.Active = false then exit;

if odd(tbParcelas.RecNo) then
DBGrid1.Canvas.Brush.Color:= clwhite
else
DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte



end;



procedure TfrmContasApagarEntradas.btSairClick(Sender: TObject);
begin
  inherited;
  if (MessageBox(0, 'Confirma saída ?', 'Cancelar lançamento', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
   begin
     close;
   end;
end;

procedure TfrmContasApagarEntradas.btLancarClick(Sender: TObject);
var
 parcelado : boolean;
begin
  inherited;
  if  (tbParcelas.Active = false) then
     tbParcelas.Active :=true;
  
  if (tbParcelas.IsEmpty ) then
    parcelado := false
   else
    parcelado := true;

  if  validarParcelas(parcelado) then
    begin
     if (MessageBox(0, 'Confirma lançamento ?', 'Confirmar lançamento', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
      begin
       efetuarLancamento(parcelado);
       close;
      end;
    end;
end;

procedure TfrmContasApagarEntradas.Edit1Exit(Sender: TObject);
begin
   if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edNumeroParcelas') then
    begin
      if edNumeroParcelas.Value > 1 then
        begin
         ckbDiasUteis.Enabled := true;
         btGerar.Enabled := true;
         btLancar.Enabled := false;

        end
      else
       begin
         ckbDiasUteis.Enabled := false;
         btGerar.Enabled := false;
         btLancar.Enabled :=true;
       end;
    end;

  inherited;
end;


function TfrmContasApagarEntradas.validarParcelas(testaSomaParcelas : boolean) : boolean;
var
 somaParcelas : real;
 valorConta : real;
begin

 Result := true;
 somaParcelas :=0;
 valorConta := 0;
 valorConta := edTotalConta.Value;

 if ( trim(edDescricaoConta.Text) = '' ) then
  begin
    showmessage('Digite uma descrição para a conta');
    edDescricaoConta.SetFocus;
    Result:=false;
    exit;
  end;




 if (Length(trim(ed_cod_centro_custo.Text)) < 5) then
  begin
    ShowMessage('Selecione um centro de custo analítico (Nivel 3)');
    ed_cod_centro_custo.SetFocus;
    ed_cod_centro_custo.Clear;
    result:=false;
    exit;
  end;









  if ( verificaExistenciaCentroDeCusto(ed_cod_centro_custo.Text) = false ) then
   begin
    showmessage('o código da conta informada não é válida!');
    ed_cod_centro_custo.SetFocus;
    Result:=false;
    exit;
   end;


   if ( testaSomaParcelas = true ) then
    begin
      tbParcelas.First;
      somaParcelas:=0;
      while not tbParcelas.Eof do
       begin
        somaParcelas := somaParcelas + tbParcelasvalorParcela.Value;
        tbParcelas.Next;
       end;

      if (  FloatToCurr(somaParcelas) <> FloatToCurr(valorConta)   ) then
       begin
         showmessage('Valor da soma das parcelas não é equivalente ao total do lançamento!');
         edTotalConta.SetFocus;
         Result:=false;
         exit;
       end;
    end;
end;


procedure TfrmContasApagarEntradas.efetuarLancamento(parcelado : boolean);
var
 q : TIBquery;
 codContaAPagar : string;
 codLancRD : string;
 flagMulta,flagMora,flagDesconto,diasDesconto : string;
 codPrimeiroTitulo : string;
begin
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;

 q.active:=false;
 q.sql.clear;



 if (parcelado = true) then
  begin
    tbParcelas.First;
    while not tbParcelas.Eof do
     begin
        codContaAPagar :=dm.geraCodigo('G_CONTAS_A_PAGAR',6);

        if tbParcelas.Bof then // se for o primeiro registro, pega o código do primeiro título
         begin
           codPrimeiroTitulo := codContaAPagar;
         end;

        q.Active :=false;
        q.SQL.clear;
        q.sql.add('insert into contas_a_pagar (');
        q.sql.add('    CODIGO,cod_emp_grupo,COD_FORNECEDOR,COD_CONTA,DESCRICAO_CONTA,PARCELA,data_entrada, data_lancamento,');
        q.sql.add('    DATA_VENCIMENTO, VALOR,');
        q.sql.add('    USUARIO_INCLUSAO,USUARIO_BAIXA,CODIGO_ENTRADA,COD_PRIMEIRO_TITULO,NUMERO_NOTA_FISCAL) values (');
        q.SQL.add(''+Quotedstr(codContaAPagar)+',');
        q.SQL.add(''+Quotedstr(edCodLoja.Text)+',');
        q.SQL.Add(''+Quotedstr(ed_cod_fornecedor.Text)+',');
        q.SQL.Add(''+Quotedstr(ed_cod_centro_custo.Text)+',');
        q.SQL.Add(''+Quotedstr(tbParcelasdescricaoConta.Value)+',');
        q.SQL.Add(''+Quotedstr(tbParcelasparcela.Value)+',');
        q.sql.add('current_date,');
        q.sql.add('current_date,');
        q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',tbParcelasdataVencimento.Value))+',');
        q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(tbParcelasvalorParcela.Value))+',');
        q.SQL.Add(''+Quotedstr(nome_usuario)+',');
        q.SQL.Add(''+Quotedstr('')+',');
        q.SQL.Add(''+Quotedstr(edNumeroEntrada.Text)+',');
        q.SQL.Add(''+Quotedstr(codPrimeiroTitulo)+',');
        q.SQL.Add(''+Quotedstr(edNumeroNota.Text)+')');

        try
          q.ExecSQL;
        except
         begin
          showmessage('Erro ao lançar parcelas. Verifique o erro no arquivo de log!');
          dm.adicionaLog('Erro ao lançar parcelas!');
          dm.adicionaLog(q.SQL.Text);

//          frm_principal.memo_avisos.Visible := true;
          exit;
         end;
        end;
        tbParcelas.Next;
     end;
  end
 else
  begin
   codContaAPagar :=dm.geraCodigo('G_CONTAS_A_PAGAR',6);
   codPrimeiroTitulo := codContaAPagar;
   q.Active :=false;
   q.SQL.clear;
   q.sql.add('insert into contas_a_pagar (');
   q.sql.add('    CODIGO,cod_emp_grupo,COD_FORNECEDOR,COD_CONTA,DESCRICAO_CONTA,PARCELA,DATA_ENTRADA,');
   q.sql.add('    data_lancamento,DATA_VENCIMENTO, VALOR,');
   q.sql.add('    USUARIO_INCLUSAO,USUARIO_BAIXA,CODIGO_ENTRADA,COD_PRIMEIRO_TITULO,NUMERO_NOTA_FISCAL) values (');
   q.SQL.add(''+Quotedstr(codContaAPagar)+',');
   q.SQL.add(''+Quotedstr(edCodLoja.Text)+',');
   q.SQL.Add(''+Quotedstr(ed_cod_fornecedor.Text)+',');
   q.SQL.Add(''+Quotedstr(ed_cod_centro_custo.Text)+',');
   q.SQL.Add(''+Quotedstr(edDescricaoConta.text)+',');
   q.SQL.Add(''+Quotedstr('01/01')+',');
   q.sql.add('current_date,');
   q.sql.add('current_date,');
   q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',edDataVencimento.Date))+',');
   q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(edTotalConta.Value))+',');
   q.SQL.Add(''+Quotedstr(nome_usuario)+',');
   q.SQL.Add(''+Quotedstr('')+',');
   q.SQL.Add(''+Quotedstr(edNumeroEntrada.Text)+',');
   q.SQL.Add(''+Quotedstr(codContaAPagar)+',');
   q.SQL.Add(''+Quotedstr(edNumeroNota.Text)+')');
   try
    q.ExecSQL;
   except
    begin
     showmessage('Erro ao efetuar o lançamento no contas a pagar!');
     dm.adicionaLog(q.SQL.Text);
     exit;
    end;
   end

  end;

  codLancRD := dm.geraCodigo('G_LANCAMENTOS_RD',8);

  q.Active := false;
  q.SQL.Clear;
  q.sql.add('insert into lancamentos_rd (codigo,cod_ct_pagar,cod_fornecedor,num_doc,data_documento,data_rd,nome_usuario,total) values (');
  q.SQL.add(''+Quotedstr(codLancRD)+',');
  q.SQL.add(''+Quotedstr(codContaAPagar )+',');
  q.SQL.Add(''+Quotedstr(ed_cod_fornecedor.Text)+',');
  q.SQL.Add(''+Quotedstr(edNumeroNota.Text)+',');
  q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',edDataDoc .Date))+',');
  q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',edDataRd.Date))+',');
  q.SQL.Add(''+Quotedstr(nome_usuario)+',');
  q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(edTotalConta.Value))+')');

  try
    q.ExecSQL;
   except
    begin
     showmessage('Erro ao efetuar o lançamento no RD');
     dm.adicionaLog(q.SQL.Text);
     exit;
    end;
   end;


  dm.tbLancamentosRDTEMP.First;
  while not dm.tbLancamentosRDTEMP.Eof do
   begin
    q.Active := false;
    q.SQL.Clear;
    q.sql.add('insert into itens_lancamento_rd (cod_lanc_rd,cod_grupo,valor) values (');
    q.SQL.add(''+Quotedstr(codLancRD)+',');
    q.SQL.add(''+Quotedstr(dm.tbLancamentosRDTEMPCOD_GRUPO.Value  )+',');
    q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(dm.tbLancamentosRDTEMPvalor.Value))+')');

    try
      q.ExecSQL;
     except
      begin
       showmessage('Erro ao efetuar o lançamento no RD');
       dm.adicionaLog(q.SQL.Text);
       exit;
      end;
    end;

    dm.tbLancamentosRDTEMP.Next;

   end;



 if ( StrToInt(dm.LeIni(1,'CONTAS_A_PAGAR','imprimirProtocolo')) = 1)   then
    dm.imprimeProtocoloLancamentoRd(marca_impressora_nao_fiscal_01,codLancRD);



  q.Active :=false;
  FreeAndNil(q);
  if dm.transacao.Active = false then dm.transacao.Active:=true;
  dm.transacao.Commit;


  if (MessageDlg('Deseja imprimir o borderô para esta conta ?',mtConfirmation,[mbYes,mbNo],0) = Mryes) then
       begin
          imprimirBorderoContasApagar( codPrimeiroTitulo)
       end;

  showmessage('Lançamento efetuado com sucesso!');
end;

procedure TfrmContasApagarEntradas.carregaDadosRd();
var
 q : TIBQuery;

begin
    dm.tbLancamentosRDTEMP.Active := false;
    dm.tbLancamentosRDTEMP.EmptyTable;


    q := TIBQuery.Create(self);
    q.Database := dm.dbrestaurante;
    q.Transaction := dm.transacao;
    q.Active:=false;
    q.SQL.Clear;

    q.active := false;
    q.SQL.Clear;
    q.SQL.Add('     select p.cod_grupo, g.descricao,    sum( ');
    q.SQL.Add('                 (ite.quantidade * ite.valor_unitario) +');
    q.SQL.Add('                 (ite.valor_ipi + ite.valor_icms_st + ite.outras_despesas)');
    q.SQL.Add('               ) as valor ');
    q.SQL.Add('      from itens_entrada ite ');
    q.SQL.Add('      inner join produtos p on ( p.cod_produto = ite.cod_item) ');
    q.SQL.Add('      inner join grupos g on (g.cod_grupo = p.cod_grupo) ');
    q.SQL.Add('        where ite.cod_entrada='+Quotedstr(edNumeroEntrada.Text));
    q.SQL.Add('      group by p.cod_grupo ,g.descricao  ');
    q.Active := true;
    q.First;

    while not q.Eof do
     begin

      dm.tbLancamentosRDTEMP.Active := true;
      dm.tbLancamentosRDTEMP.Append;
      dm.tbLancamentosRDTEMPCOD_GRUPO.Value := q.fieldbyname('cod_grupo').value;
      dm.tbLancamentosRDTEMPdescricao.Value := q.fieldbyname('descricao').value;
      dm.tbLancamentosRDTEMPvalor.Value     := q.fieldbyname('valor').value;
      dm.tbLancamentosRDTEMP.Post;

      q.Next;
     end;

end;


procedure TfrmContasApagarEntradas.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  if odd(dm.qryLancamentosRD.RecNo) then
DBGrid3.Canvas.Brush.Color:= clwhite
else
DBGrid3.Canvas.Brush.Color:= clMoneyGreen;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


end;

end.
