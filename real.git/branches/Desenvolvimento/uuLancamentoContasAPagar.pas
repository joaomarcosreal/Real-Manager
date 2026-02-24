unit uuLancamentoContasAPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo,  StdCtrls,  Buttons, Mask, ExtCtrls,
  DB, RxMemDS, ibquery, DBCtrls, Grids, DBGrids, ComCtrls, Menus, RxCurrEdit,
  RxToolEdit;

type
  TfrmLancamentoContasApagar = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Panel5: TPanel;
    bt_pesq_centro_custo: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Panel6: TPanel;
    ed_desc_c_custo: TEdit;
    Panel3: TPanel;
    ed_razao_social_fornecedor: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    ed_cod_fornecedor: TEdit;
    edNumeroNotaFiscal: TEdit;
    ed_cod_centro_custo: TEdit;
    edDescricaoConta: TEdit;
    edTotalConta: TCurrencyEdit;
    edDataVencimento: TDateEdit;
    edMulta: TCurrencyEdit;
    ckbMulta: TCheckBox;
    edMora: TCurrencyEdit;
    ckbMora: TCheckBox;
    edDesconto: TCurrencyEdit;
    ckbDesconto: TCheckBox;
    edDiasDesconto: TCurrencyEdit;
    bt_pesq_fornecedor: TSpeedButton;
    gp_loja: TGroupBox;
    Label18: TLabel;
    btPesqLoja: TSpeedButton;
    Label28: TLabel;
    Panel9: TPanel;
    edDescLoja: TEdit;
    edCodLoja: TEdit;
    edNumeroParcelas: TCurrencyEdit;
    Label16: TLabel;
    tbParcelas: TRxMemoryData;
    tbParcelasdataVencimento: TDateField;
    tbParcelasdescricaoConta: TStringField;
    tbParcelasnumeroControle: TStringField;
    tbParcelasvalorParcela: TCurrencyField;
    tbParcelasvalorMulta: TCurrencyField;
    tbParcelasvalorMora: TFloatField;
    tbParcelasvalorDesconto: TFloatField;
    tbParcelasflagMulta: TSmallintField;
    tbParcelasflagMora: TSmallintField;
    tbParcelasflagDesconto: TSmallintField;
    tbParcelasdiasDesconto: TIntegerField;
    tbParcelasdiaSemana: TStringField;
    tbParcelasparcela: TStringField;
    lbCodPrimeiraConta: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    edDataRD: TDateEdit;
    Label21: TLabel;
    Panel7: TPanel;
    Label22: TLabel;
    Panel10: TPanel;
    Label17: TLabel;
    dsParcelas: TDataSource;
    Panel2: TPanel;
    bt_pesq_grupo: TSpeedButton;
    Label19: TLabel;
    Label43: TLabel;
    Label20: TLabel;
    Panel4: TPanel;
    ed_desc_grupo: TEdit;
    btAdicionar: TBitBtn;
    edValor: TCurrencyEdit;
    ed_cod_grupo: TEdit;
    DBGrid3: TDBGrid;
    memoObs: TMemo;
    Panel8: TPanel;
    edTotalRD: TCurrencyEdit;
    Label23: TLabel;
    edDataDocumento: TDateEdit;
    Label24: TLabel;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    Panel11: TPanel;
    edDataLancamento: TDateEdit;
    Label25: TLabel;
    tbParcelasCodLancRD: TStringField;
    lbCodEntrada: TLabel;
    Label26: TLabel;
    procedure bt_novoClick(Sender: TObject);

   function  validarParcelas(testaRD : boolean) : boolean;
    procedure efetuarLancamento();
    procedure Edit1Exit(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure limpaComponentes();
    procedure bt_cancelarClick(Sender: TObject);
    procedure retornaInformacoes(codConta : string);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_alterarClick(Sender: TObject);
    procedure bt_consultarClick(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
    procedure gerarParcelas();
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btLancarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_sairClick(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
    function getTotalLancamentosRD : double;
    function  verificaValidadeItemRD() : boolean;
    function efetuaLancamentoRD(codCpag : string; dataRD : TDate  ) : string;
    procedure btAdicionarClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);

    procedure estornarTitulo();

  private
    { Private declarations }
     codLancamentoRD : string;
  public
    { Public declarations }
    procedure setEvento(ev : smallint);    
  end;

var
  frmLancamentoContasApagar: TfrmLancamentoContasApagar;

implementation

uses uu_data_module, uu_frm_principal, uu_modelo_vazio,
  uuBaixaTitulosContasApagar;

{$R *.dfm}

procedure TfrmLancamentoContasApagar.bt_novoClick(Sender: TObject);
begin
  if dm.verifica_permissao('80001','001',codigo_usuario,true)=true then
   begin
    inherited;
    dm.tbLancamentosRDTEMP.Active := false;
    dm.tbLancamentosRDTEMP.EmptyTable;
    dm.tbLancamentosRDTEMP.Active := true;

    limpaComponentes();
    tbParcelas.EmptyTable;
    tbParcelas.Active :=true;
    pn_principal.Enabled:=true;
    pn_codigo.Enabled:=false;
    edCodLoja.Text :=codEmpresa;
    exibeInformacoesLoja(codEmpresa  );
    edCodLoja.SelectAll;
    edCodLoja.SetFocus;
    edNumeroParcelas.Value :=1;
    edDataVencimento.Date := Now;
    edDataDocumento.Date := now;
    edDataRD.Date := now;
    edDataLancamento.date := now;
   end;

end;

function TfrmLancamentoContasApagar.validarParcelas(testaRD : boolean) : boolean;
var
 somaParcelas : currency;
begin

 Result := true;




 if edTotalConta.Value <= 0 then
  begin
    showmessage('Valor da conta deve ser maior que zero!');
    edTotalConta.SetFocus;
    result:=false;
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


 if ( trim(edDescricaoConta.Text) = '' ) then
  begin
    showmessage('Digite uma descrição para a conta');
    edDescricaoConta.SetFocus;
    Result:=false;
    exit;
  end;


 if edMulta.Value < 0 then
  begin
    showmessage('Valor da multa não pode ser menor que zero!');
    edMulta.SetFocus;
    Result:=false;
    exit;
  end;




 if edMora.Value < 0 then
  begin
    showmessage('Valor da mora não pode ser menor que zero!');
    edMora.SetFocus;
    Result:=false;
    exit;
  end;

 if edNumeroParcelas.Value < 1 then
  begin
    showmessage('Número de parcelas não pode ser inferior a 1');
    edNumeroParcelas.SetFocus;
    Result:=false;
    exit;
  end;



 if edDesconto.Value >=100  then
  begin
    showmessage('Valor da mora não pode ser maior que 100 %');
    edDesconto.SetFocus;
    Result:=false;
    exit;
  end;

 if edDesconto.Value < 0  then
  begin
    showmessage('Valor do desconto não pode ser negativo!');
    edDesconto.SetFocus;
    Result:=false;
    exit;
  end;


  if ( verificaExistenciaCentroDeCusto(ed_cod_centro_custo.Text) = false ) then
   begin
    showmessage('o código da conta informada não é válida!');
    ed_cod_centro_custo.SetFocus;
    Result:=false;
    exit;
   end;


   try
    StrToDate(edDataVencimento.Text);
   except
    begin
      ShowMessage('Data de Vencimento é inválida!');
      edDataVencimento.SetFocus;
      Result:=false;
      exit;
    end;
   end;


   try
    StrToDate(edDataDocumento .Text);
   except
    begin
      ShowMessage('Data do documento é inválida!');
      edDataDocumento.SetFocus;
      Result:=false;
      exit;
    end;
   end;


   try
    StrToDate(edDataRD  .Text);
   except
    begin
      ShowMessage('Data do lançamento no RD é inválida!');
      edDataRD.SetFocus;
      Result:=false;
      exit;
    end;
   end;


   if (edDataDocumento.Date  > edDataVencimento.date ) then
    begin
      ShowMessage('Data do documento não pode ser maior que data do vencimento!');
      edDataDocumento.SetFocus;
      Result:=false;
      exit;
    end;


   if ( testaRD ) then
    begin

     if ( StrToFloat( Floattostr(getTotalLancamentosRD())) <> edTotalConta.Value) then
      begin
        Showmessage('A soma do detalhamentos das despesas no RD é diferente do total do título!');
        ed_cod_grupo.SetFocus;
        result := false;
        exit;

      end;
    end;



   if (Trim(edNumeroNotaFiscal.Text) = '' ) then
    begin
      ShowMessage('Número do documento inválido!');
      edNumeroNotaFiscal.SetFocus;
      Result:=false;
      exit;
    end;


     try
       edNumeroNotaFiscal.Text:= FormatFloat('000000000000000',StrToFloat(edNumeroNotaFiscal.Text));
     except
       begin
         showmessage('Número da nota fiscal inválido!');
         edNumeroNotaFiscal.SetFocus;
         Result := false;
         exit;
       end;
     end;





end;


procedure TfrmLancamentoContasApagar.Edit1Exit(Sender: TObject);
begin
  inherited;

   if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edNumeroParcelas') then
    begin
     tbParcelas.EmptyTable;
     tbParcelas.Active :=true;
      if edNumeroParcelas.Value > 1 then
        begin

         if ( validarParcelas(false) =  true) then
          begin
           gerarParcelas();
          end;

        end
      else
       begin
//         bt_gravar.Click;
       end;
    end;



  if (evento  = 1 ) then
   begin
     if (trim(edNumeroNotaFiscal.Text) = '' ) then
      exit;


     try
       edNumeroNotaFiscal.Text:= FormatFloat('000000000000000',StrToFloat(edNumeroNotaFiscal.Text));
     except
       begin
         showmessage('Número da nota fiscal inválido!');
         edNumeroNotaFiscal.SetFocus;
         exit;
       end;
     end;
   end;

end;

procedure TfrmLancamentoContasApagar.bt_gravarClick(Sender: TObject);
var
 mensagem : string;
 obs : string;
 ct : integer;

begin



  case evento of
   1: mensagem:='Confirma lançamento ?';
   2: mensagem:='Confirma alteração ?';
   3: mensagem:='Confirma exclusão ?';
  end;


  if ( validarParcelas(true) = true) then
    begin

     if (MessageBox(0, pchar(mensagem),pchar(mensagem), MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
      begin
       efetuarLancamento();
       limpaComponentes;
       tbParcelas.EmptyTable;
       tbParcelas.Active:=true;


       inherited;
      end;

      if (evento= 2) then
        begin
         close;
        end;


    end;



end;





procedure TfrmLancamentoContasApagar.efetuarLancamento();
var
 q : TIBquery;
 codContaAPagar : string;
 flagMulta,flagMora,flagDesconto,diasDesconto : string;
 codPrimeiroTitulo : string;
 atualizavel : string;
 ct : integer;
 obs : string;
 codLancamentoRd : string;


begin
 atualizavel :='0';
 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;
 q.active:=false;
 q.sql.clear;




 if ckbMulta.Checked then
   flagMulta :='1' // se for em percentual
 else
   flagMulta :='0'; // se for em dinheiro (mesma regra vale para os outros flags)

 if ckbMora.Checked then
   flagMora :='1'
 else
   flagMora :='0';

 if ckbDesconto.Checked then
   flagDesconto :='1'
 else
   flagDesconto :='0';

 diasDesconto := FormatFloat('00',edDiasDesconto.Value);

 for ct:=0 to memoObs.Lines.Count-1 do
  begin
    obs:=obs + memoObs.lines[ct];
  end;

 if ( (evento = 2) or (evento = 3) ) then
  begin
     estornarTitulo;
  end;


  if  ( (evento = 1) or (evento = 2) ) then
   begin
       if (edNumeroParcelas.value > 1 ) then
        begin
          tbParcelas.First;
          while not tbParcelas.eof do
           begin
              codContaAPagar :=dm.geraCodigo('G_CONTAS_A_PAGAR',6);

              if tbParcelas.Bof then // se for o primeiro registro, pega o código do primeiro título
               begin
                 codPrimeiroTitulo := codContaAPagar;
                 atualizavel :='0';
               end
              else
               begin
                atualizavel := '1';
               end;


              q.Active :=false;
              q.SQL.clear;
              q.sql.add('insert into contas_a_pagar (');
              q.sql.add('    CODIGO,cod_emp_grupo,parcela,COD_FORNECEDOR,COD_CONTA,DESCRICAO_CONTA,DATA_ENTRADA,');
              q.sql.add('    DATA_VENCIMENTO, VALOR,MULTA,FLAG_MULTA,MORA,FLAG_MORA,DESCONTO,flag_desconto,');
              q.sql.add('    DIAS_ANTES_DESCONTO,USUARIO_INCLUSAO,USUARIO_BAIXA,CODIGO_ENTRADA,COD_PRIMEIRO_TITULO,NUMERO_NOTA_FISCAL, ATUALIZAR_PARCELA,obs) values (');
              q.SQL.add(''+Quotedstr(codContaAPagar)+',');
              q.SQL.add(''+Quotedstr(edCodLoja.Text)+',');
              q.SQL.add(''+Quotedstr(tbParcelas.fieldbyname('parcela').value)+',');
              q.SQL.Add(''+Quotedstr(ed_cod_fornecedor.Text)+',');
              q.SQL.Add(''+Quotedstr(ed_cod_centro_custo.Text)+',');
              q.SQL.Add(''+Quotedstr(tbParcelas.fieldbyname('descricaoConta').Value  )+',');
              q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY', edDataDocumento.Date  ))+',');
              q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY', tbParcelas.fieldbyname('DATAVENCIMENTO').value))+',');
              q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(edTotalConta.value ))+',');
              q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(edMulta.Value))+',');
              q.sql.add(''+flagMulta+',');
              q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(edMora.Value))+',');
              q.sql.add(''+flagMora+',');
              q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(edDesconto.Value))+',');
              q.sql.add(''+flagDesconto+',');
              q.sql.add(''+diasDesconto+',');
              q.SQL.Add(''+Quotedstr(nome_usuario)+',');
              q.SQL.Add(''+Quotedstr('')+',');
              q.SQL.Add(''+Quotedstr(lbCodEntrada.Caption   )+',');
              q.SQL.Add(''+Quotedstr(codPrimeiroTitulo)+',');
              q.SQL.Add(''+Quotedstr(edNumeroNotaFiscal.Text)+',');
              q.SQL.Add(''+atualizavel+',');
              q.SQL.Add(''+Quotedstr(obs)+')');

              try
                q.ExecSQL;
              except
               begin
                showmessage('Erro ao lançar parcelas');
                dm.adicionaLog(q.SQL.Text );
                exit;
               end;
              end;


              tbParcelas.Edit;
              tbParcelasCodLancRD.Value := efetuaLancamentoRD(codContaAPagar,tbParcelas.fieldbyname('DATAVENCIMENTO').value);
              tbParcelas.Post;

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
         q.sql.add('    CODIGO,cod_emp_grupo,parcela,COD_FORNECEDOR,COD_CONTA,DESCRICAO_CONTA,DATA_ENTRADA,');
         q.sql.add('    DATA_VENCIMENTO, VALOR,MULTA,FLAG_MULTA,MORA,FLAG_MORA,DESCONTO,flag_desconto,');
         q.sql.add('    DIAS_ANTES_DESCONTO,USUARIO_INCLUSAO,USUARIO_BAIXA,CODIGO_ENTRADA,COD_PRIMEIRO_TITULO,NUMERO_NOTA_FISCAL,obs) values (');
         q.SQL.add(''+Quotedstr(codContaAPagar)+',');
         q.SQL.add(''+Quotedstr(edCodLoja.Text)+',');
         q.SQL.add(''+Quotedstr('01/01')+',');
         q.SQL.Add(''+Quotedstr(ed_cod_fornecedor.Text)+',');
         q.SQL.Add(''+Quotedstr(ed_cod_centro_custo.Text)+',');
         q.SQL.Add(''+Quotedstr(edDescricaoConta.text)+',');
         q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',edDataDocumento.Date ))+',');
         q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',edDataVencimento.Date))+',');
         q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(edTotalConta.Value))+',');
         q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(edMulta.Value))+',');
         q.sql.add(''+flagMulta+',');
         q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(edMora.Value))+',');
         q.sql.add(''+flagMora+',');
         q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(edDesconto.Value))+',');
         q.sql.add(''+flagDesconto+',');
         q.sql.add(''+diasDesconto+',');
         q.SQL.Add(''+Quotedstr(nome_usuario)+',');
         q.SQL.Add(''+Quotedstr('')+',');
          q.SQL.Add(''+Quotedstr(lbCodEntrada.Caption  )+',');
         q.SQL.Add(''+Quotedstr(codContaAPagar)+',');
         q.SQL.Add(''+Quotedstr(edNumeroNotaFiscal.Text)+',');
         q.SQL.Add(''+Quotedstr(obs)+')');
         try
          q.ExecSQL;
         except
          begin
           showmessage('Erro ao efetuar o lançamento!');
           frm_principal.memo_avisos.Lines := q.SQL;
           exit;
          end;
         end

        end;


       codLancamentoRd:= efetuaLancamentoRD(codContaAPagar,edDataRD.Date  );

   end;


 ////
  q.Active :=false;
  FreeAndNil(q);


  if dm.transacao.Active = false then dm.transacao.Active:=true;
  dm.transacao.Commit;
  dm.transacao.Active := false;
  dm.transacao.Active :=true;

  if ( (evento=1) or (evento=2) ) then
   begin
      try
       begin
        if ( StrToInt(dm.LeIni(1,'CONTAS_A_PAGAR','imprimirProtocolo')) = 1)   then
          begin

           if edNumeroParcelas.Value  = 1 then
            dm.imprimeProtocoloLancamentoRd(evento ,codLancamentoRd)
           else
            begin
              tbParcelas.First;
              while not tbParcelas.Eof do
               begin
                dm.imprimeProtocoloLancamentoRd(evento,  tbParcelasCodLancRD.Value);
                tbParcelas.Next;
               end;
            end;
          end;
       end
      except
         begin
           Showmessage('Erro ao imprimir o protocolo!');
         end;
      end;

      if ( (evento=1) or (evento = 2))  then
        begin
          if (MessageDlg('Deseja imprimir o borderô para esta conta ?',mtConfirmation,[mbYes,mbNo],0) = Mryes) then
           begin
            if (evento = 1) then
              imprimirBorderoContasApagar( codPrimeiroTitulo)
            else
              imprimirBorderoContasApagar(lbCodPrimeiraConta.Caption);
           end;
        end;
  end;

  case evento of
   1:  showmessage('Lançamento efetuado com sucesso!');
   2:  showmessage('Conta alterada com sucesso!');
   3:  showmessage('Exclusão efetuada com suceso!');
  end;

  if (edDataVencimento.Date = data_do_sistema) then
   begin
      if (MessageDlg('Deseja baixar (pagar) esta conta agora ?',mtConfirmation,[mbYes,mbNo],0) = Mryes) then
       begin
         Application.CreateForm(TfrmBaixaTituloContasApagar, frmBaixaTituloContasApagar);
         frmBaixaTituloContasApagar.edNumeroTitulo.Text := codPrimeiroTitulo;
         frmBaixaTituloContasApagar.showmodal;
         frmBaixaTituloContasApagar.Free;
       end;
   end;

end;










procedure TfrmLancamentoContasApagar.limpaComponentes();
begin
  ed_cod_fornecedor.Clear;
  ed_razao_social_fornecedor.Clear;

  edNumeroNotaFiscal.Clear;
  ed_cod_centro_custo.Clear;
  ed_desc_c_custo.Clear;
  edDescricaoConta.Clear;
  edTotalConta.Value :=0;
  edMulta.Value := 0;
  ckbMulta.Checked :=false;
  edMora.Value :=0;
  ckbMora.Checked :=false;
  edDesconto.Value :=0;
  ckbDesconto.Checked := false;
  edDiasDesconto.Value :=0;
  edNumeroParcelas.Value := 1;
  memoObs.Clear;


end;

procedure TfrmLancamentoContasApagar.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  limpaComponentes();
  tbParcelas.EmptyTable;
  edTotalRD.Value :=0;
  tbParcelas.Active :=true;
  dm.tbLancamentosRDTEMP.Active := false;
  dm.tbLancamentosRDTEMP.EmptyTable;
  dm.tbLancamentosRDTEMP.Active := true;


   Close;


end;

procedure TfrmLancamentoContasApagar.retornaInformacoes(codConta : string);
var
 q : TIBquery;

begin



  q := TIBquery.create(self);
  q.database:= dm.dbrestaurante;
  q.transaction:= dm.transacao;
  q.active:=false;

  q.SQL.Clear;
  q.SQL.add('    select cp.*, cc.descricao descricaoPlanoConta, f.razao_social, f.cgc_cpf as cnpjFornecedor, emp.descricao as descLoja from contas_a_pagar cp');
  q.SQL.add('   inner join fornecedor f on (f.cod_fornecedor = cp.cod_fornecedor) ');
  q.SQL.add('   inner join plano_contas_financeiro cc on (cc.cod_conta = cp.cod_conta) ');
  q.sql.add('   inner join empresas_grupo emp on (emp.codigo = cp.cod_emp_grupo) ');
  q.SQL.add('    where cp.codigo='+Quotedstr(codConta));
  dm.adicionaLog(q.SQL.Text);
  q.Active :=true;


  ed_cod_fornecedor.Text              := q.FieldByName('cod_fornecedor').value;
  edCodLoja.Text                      := q.FieldByName('cod_emp_grupo').value;
  edDescLoja .Text                      := q.FieldByName('descLoja').value;
  ed_razao_social_fornecedor.Text     := q.FieldByName('razao_social').value;
//  ed_cnpj_fornecedor.Text             := q.FieldByName('CNPJFORNECEDOR').value;
  edNumeroNotaFiscal.Text             := q.FieldByName('NUMERO_NOTA_FISCAL').value;
  ed_cod_centro_custo.Text            := q.FieldByName('cod_conta').value;
  ed_desc_c_custo.Text                := q.FieldByName('descricaoplanoconta').value;
  edDescricaoConta.Text               := q.FieldByName('descricao_conta').value;
  edTotalConta.Value                  := q.FieldByName('valor').value;
  edDataVencimento.Date               := q.FieldByName('data_vencimento').value;
  edDataDocumento.Date                := q.FieldByName('data_entrada').value;
  memoObs.Lines.add                   (q.FieldByName('obs').value);
  edMulta.Value                       := q.FieldByName('multa').value;
  lbCodEntrada.Caption                := q.FieldByName('codigo_entrada').value;

  lbCodPrimeiraConta.Caption  := q.FieldByName('COD_PRIMEIRO_TITULO').value;
  if q.FieldByName('flag_multa').value = 0 then
   ckbMulta.Checked := false
  else
   ckbMulta.Checked :=true;

  edMora.Value   := q.FieldByName('mora').value;
  if q.FieldByName('flag_mora').value = 0 then
   ckbMora.Checked := false
  else
   ckbMora.Checked :=true;

  edDesconto.Value   := q.FieldByName('desconto').value;
  if q.FieldByName('flag_desconto').value = 0 then
   ckbDesconto.Checked := false
  else
   ckbDesconto.Checked :=true;

  edDiasDesconto.Value := q.FieldByName('dias_antes_desconto').value;

  q.Active :=false;


  q.Active := false;
  q.SQL.clear;
  q.SQL.add('select * from lancamentos_rd rd where rd.cod_ct_pagar='+QuotedStr(codConta));
  q.Active := true;

  if not q.IsEmpty then
   begin
     edDataRD.Date := q.fieldbyname('data_rd').Value;
     codLancamentoRD := q.fieldbyname('codigo').Value;
     edDataLancamento.Date := q.fieldbyname('data_lancamento').Value;
     dm.tbLancamentosRDTEMP.Active := false;
     dm.tbLancamentosRDTEMP.EmptyTable;
     dm.tbLancamentosRDTEMP.Active := true;
     q.Active := false;
     q.sql.clear;
     q.SQL.add('select rd.*,g.descricao from itens_lancamento_rd rd ');
     q.SQL.add('      inner join grupos g on (g.cod_grupo = rd.cod_grupo) ');
     q.SQL.add('      where cod_lanc_rd='+Quotedstr(codLancamentoRD));
     q.Active := true;

     q.First;
     while not q.Eof do
      begin
       dm.tbLancamentosRDTEMP.Append;
       dm.tbLancamentosRDTEMPCOD_GRUPO.Value := q.fieldbyname('cod_grupo').Value;
       dm.tbLancamentosRDTEMPdescricao.Value := q.fieldbyname('descricao').Value;
       dm.tbLancamentosRDTEMPvalor.Value := q.fieldbyname('valor').Value;
       dm.tbLancamentosRDTEMP.Post;
       q.Next;
      end;
      edTotalRD.Value := getTotalLancamentosRD;
   end
  else
    begin
      q.Active := false;
      q.sql.clear;
      q.SQL.Add('    insert into lancamentos_rd (CODIGO,COD_FORNECEDOR, NUM_DOC,DATA_LANCAMENTO, ');
      q.SQL.Add('                                DATA_DOCUMENTO,DATA_RD,OBSERVACOES,NOME_USUARIO, ');
      q.SQL.Add('                                TOTAL,COD_CT_PAGAR) ');
      q.SQL.Add('               select   udf_strzero ( gen_id(G_LANCAMENTOS_RD,1),8),cp.cod_fornecedor,cp.numero_nota_fiscal,current_date,');
      q.SQL.Add('                          cp.data_entrada,cp.data_vencimento,cp.obs,cp.usuario_inclusao,');
      q.SQL.Add('                          cp.valor,cp.codigo from contas_a_pagar cp ');
      q.SQL.Add('                  where cp.codigo='+Quotedstr(ed_codigo.Text));
      try
        begin
          q.ExecSQL;

          if dm.transacao.Active = false then dm.transacao.Active:=true;
          dm.transacao.Commit;
        end;

      except
         begin
          ShowMessage('Erro ao fazer a inclusão no RD em lançamentos antigos que não possuem referência!');
          FreeAndNil(q);
          Exit;
         end;
      end;

      q.Active := false;
      q.SQL.clear;
      q.SQL.add('select * from lancamentos_rd rd where rd.cod_ct_pagar='+QuotedStr(codConta));
      q.Active := true;

     edDataRD.Date := q.fieldbyname('data_rd').Value;
     codLancamentoRD := q.fieldbyname('codigo').Value;
     edDataLancamento.Date := q.fieldbyname('data_lancamento').Value;




    end;





  FreeAndNil(q);


  
end;


procedure TfrmLancamentoContasApagar.ed_codigoExit(Sender: TObject);
begin
  inherited;
   if  sender is TCustomEdit  and ((sender as TCustomEdit).Name='ed_codigo') then
    begin
     if trim(ed_codigo.text) = '' then
      begin
        exit;
      end;
      try
        begin
          ed_codigo.text := FormatFloat('000000',StrToFloat(ed_codigo.Text));
        end;
      except
        begin
          showmessage('Código inválido!');
          ed_codigo.Clear;
          ed_codigo.SetFocus;
          exit;
        end;
      end;

     if (verificaExistenciaContaApagar(ed_codigo.Text) = true) then
       begin
         retornaInformacoes(ed_codigo.Text);

         if ( (evento = 2) or (evento=3)) then
           begin
             ed_cod_centro_custo.SetFocus;
             bt_gravar.Enabled :=true;

           end
       end
     else
       begin
         ShowMessage('Código conta à pagar inexistente');
         ed_codigo.clear;
         ed_codigo.SetFocus;
         exit;
       end;
    end;



end;

procedure TfrmLancamentoContasApagar.bt_alterarClick(Sender: TObject);
begin

  if dm.verifica_permissao('80001','002',codigo_usuario,true)=true then
   begin
    inherited;
    pn_codigo.Enabled :=true;
    ed_codigo.SetFocus;
   end;

end;

procedure TfrmLancamentoContasApagar.bt_consultarClick(Sender: TObject);
begin

  if dm.verifica_permissao('80001','003',codigo_usuario,true)=true then
   begin
    inherited;
    pn_codigo.Enabled :=true;
    ed_codigo.SetFocus;
   end;
end;

procedure TfrmLancamentoContasApagar.bt_excluirClick(Sender: TObject);
begin

  if dm.verifica_permissao('80001','004',codigo_usuario,true)=true then
   begin
    inherited;
    pn_codigo.Enabled :=true;
    ed_codigo.SetFocus;
   end;

end;






procedure TfrmLancamentoContasApagar.gerarParcelas();
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


  valorParcelas     :=  edTotalConta.Value;
  diferencaParcelas :=0;

  dataInicio := Quotedstr(FormatDateTime('DD.MM.YYY',edDataVencimento.Date));
  diasUteis:=1;

  tbParcelas.EmptyTable;
  tbParcelas.Active :=true;


  q.Active :=false;
  q.sql.clear;

  q.sql.add('select gp.*,udf_dayname(gp.datavencimento) as nomeDia from gera_parcelas('+dataInicio+','+FloatToStr(edNumeroParcelas.Value)+','+FloatToStr(30)+','+IntToStr(diasUteis)+') gp');
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
//   btLancar.Enabled :=true;
end;


procedure TfrmLancamentoContasApagar.FormActivate(Sender: TObject);
begin
  inherited;
//  bt_novo.Click;
  dm.tbLancamentosRDTEMP.Active := false;
  dm.tbLancamentosRDTEMP.EmptyTable;
  if (Trim(ed_codigo.Text) <> '' ) then
   begin
     edNumeroParcelas.Enabled :=false;
     DBGrid1.Visible :=false;
   end;

   case evento of
    2: begin
            Label15.Caption := 'Alteração de título';
            bt_alterar.Click;
           edCodLoja.SetFocus;

       end;
     3: begin
          Label15.Caption := 'Exclusão de título';
         retornaInformacoes(ed_codigo.Text);
        bt_novo.Enabled := false;
        bt_alterar.Enabled := false;
         bt_gravar.Enabled :=true;
         bt_gravar.SetFocus;

        end;
   end;

end;

procedure TfrmLancamentoContasApagar.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmLancamentoContasApagar.btLancarClick(Sender: TObject);
begin
 bt_gravar.Click;
//  inherited;

end;

procedure TfrmLancamentoContasApagar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
if odd(tbParcelas.RecNo) then
DBGrid1.Canvas.Brush.Color:= clwhite
else
DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte


end;

procedure TfrmLancamentoContasApagar.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;

end;

procedure TfrmLancamentoContasApagar.bt_sairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmLancamentoContasApagar.bt_imprimirClick(Sender: TObject);
begin
  inherited;
  imprimirBorderoContasApagar(ed_codigo.Text);
end;

function TfrmLancamentoContasApagar.verificaValidadeItemRD() : boolean;
var
 totalLancamento : string;
begin
  if (verificaExistenciaGrupo(ed_cod_grupo.Text) = false) then
   begin
    ShowMessage('Grupo especificado não existe!');
    ed_cod_grupo.clear;
    ed_desc_grupo.Clear;
    ed_cod_grupo.SetFocus;
    result := false;
   end;

  if length(trim(ed_cod_grupo.text)) < 6 then
  begin
     showmessage('O grupo selecionado não é um grupo-filho. Selecione uma ramificação no menor nível do grupo escolhido');
     ed_cod_grupo.clear;
     ed_desc_grupo.clear;
     ed_cod_grupo.setfocus;
     Result:=false;
     exit;
  end;

  if ( edValor.Value <= 0 ) then
   begin
     showmessage('Valor do lançamento no RD é inválido!');
     edValor.clear;
     edValor.SetFocus;
     Result:=false;
     exit;
   end;

  totalLancamento := FloatToStr(getTotalLancamentosRD + edValor.Value);
  if ( StrToFloat(totalLancamento)  > edTotalConta.Value) then
   begin
     showmessage('Somatório dos lançamentos é superior ao valor do título!');
     edValor.clear;
     edValor.SetFocus;
     Result:=false;
     exit;
   end;


  result := true;

end;

function TfrmLancamentoContasApagar.getTotalLancamentosRD : double;
var
totalLancamentosRD : double;
begin
  totalLancamentosRD := 0;
  dm.tbLancamentosRDTEMP.Active := true;
  dm.tbLancamentosRDTEMP.First;
  while not dm.tbLancamentosRDTEMP.Eof do
   begin
     totalLancamentosRD := totalLancamentosRD + dm.tbLancamentosRDTEMPvalor.Value;
     dm.tbLancamentosRDTEMP.Next;
   end;

   result := totalLancamentosRD;


end;



procedure TfrmLancamentoContasApagar.btAdicionarClick(Sender: TObject);
begin
  inherited;
  if (verificaValidadeItemRD = true) then
   begin
     dm.tbLancamentosRDTEMP.Active := true;
     dm.tbLancamentosRDTEMP.Append;
     dm.tbLancamentosRDTEMPCOD_GRUPO.Value := ed_cod_grupo.Text;
     dm.tbLancamentosRDTEMPdescricao.Value := ed_desc_grupo.Text;
     dm.tbLancamentosRDTEMPvalor.Value := edValor.Value;
     dm.tbLancamentosRDTEMP.Post;

     ed_cod_grupo.clear;
     ed_desc_grupo.clear;
     edValor.Value := 0;
     ed_cod_grupo.SetFocus;
     edTotalRD.Value := getTotalLancamentosRD;
   end;

end;


function TfrmLancamentoContasApagar.efetuaLancamentoRD(codCpag : string; dataRD : TDate  ) : string;
var
  q : Tibquery;
  ct : integer;
  obs : string;
begin

 q := TIBquery.create(self);
 q.database:= dm.dbrestaurante;
 q.transaction:= dm.transacao;
 q.active:=false;
 q.sql.clear;


 for ct:=0 to memoObs.Lines.Count-1 do
  begin
    obs:=obs + memoObs.lines[ct];
  end;


  codLancamentoRD := dm.geraCodigo('G_LANCAMENTOS_RD',8);



 if ( (evento = 1) or (evento = 2) ) then
  begin
        q.Active := false;
        q.SQL.Clear;
        q.sql.add('insert into lancamentos_rd (codigo,cod_ct_pagar,cod_fornecedor,num_doc,data_documento,data_rd,data_lancamento,nome_usuario,total,observacoes) values (');
        q.SQL.add(''+Quotedstr(codLancamentoRD)+',');
        q.SQL.add(''+Quotedstr(codCpag )+',');
        q.SQL.Add(''+Quotedstr(ed_cod_fornecedor.Text)+',');
        q.SQL.Add(''+Quotedstr(edNumeroNotaFiscal.Text)+',');
        q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',edDataDocumento.Date))+',');
        q.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',edDataRd.Date))+',');
        q.sql.add('current_date,');
        q.SQL.Add(''+Quotedstr(nome_usuario)+',');
        q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(edTotalConta.Value))+',');
        q.SQL.add(''+Quotedstr(obs )+')');
        
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
            q.SQL.add(''+Quotedstr(codLancamentoRD)+',');
            q.SQL.add(''+Quotedstr(dm.tbLancamentosRDTEMPCOD_GRUPO.Value )+',');
            q.sql.add(''+dm.TrocaVirgPPto(FloatToStr(dm.tbLancamentosRDTEMPvalor.Value ))+')');

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
  end;


  Result := codLancamentoRD;
end;

procedure TfrmLancamentoContasApagar.Excluir1Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Confirma exclusão ?',mtConfirmation, [mbYes,mbNo],0) = mrYes  then
  dm.tbLancamentosRDTEMP.Delete;
end;





procedure TfrmLancamentoContasApagar.estornarTitulo();
var
msg : string;
codContaAPagar  : string;
codContaSelecionada : string;

codLancamentoRDSelecionado : string;
codNovoLancamentoRD : string;
begin
  inherited;
  codContaSelecionada := ed_codigo.Text;


   dm.qryauxiliar.Active := false;
   dm.qryauxiliar.SQL.clear;
   dm.qryauxiliar.sql.Add('select lr.codigo  from lancamentos_rd lr where lr.cod_ct_pagar='+Quotedstr(codContaSelecionada));
   dm.qryauxiliar.Active :=true;
   codLancamentoRDSelecionado := dm.qryauxiliar.fieldbyname('codigo').Value;



   codContaAPagar :=dm.geraCodigo('G_CONTAS_A_PAGAR',6);
   dm.qryauxiliar.Active :=false;
   dm.qryauxiliar.SQL.clear;
   dm.qryauxiliar.sql.add('           insert into contas_a_pagar ( ');
   dm.qryauxiliar.sql.add('      CODIGO,STATUS,VALOR,COD_LANC_CANCELAMENTO, COD_FORNECEDOR,COD_CONTA,DESCRICAO_CONTA,');
   dm.qryauxiliar.sql.add('      DATA_ENTRADA,DATA_VENCIMENTO,MULTA,FLAG_MULTA,');
   dm.qryauxiliar.sql.add('      MORA,FLAG_MORA,DESCONTO, FLAG_DESCONTO,DIAS_ANTES_DESCONTO,');
   dm.qryauxiliar.sql.add('      USUARIO_INCLUSAO, USUARIO_BAIXA, CODIGO_ENTRADA,');
   dm.qryauxiliar.sql.add('      NUMERO_NOTA_FISCAL, COD_PRIMEIRO_TITULO, ATUALIZAR_PARCELA,');
   dm.qryauxiliar.sql.add('      OBS,DATA_PAGAMENTO,VALOR_PAGO,VALOR_PAGO_MULTA,');
   dm.qryauxiliar.sql.add('      VALOR_PAGO_JUROS,VALOR_PAGO_DESCONTO,COD_EMP_GRUPO,');
   dm.qryauxiliar.sql.add('      PARCELA,COD_FORMA_PAGTO,DATA_LANCAMENTO');
   dm.qryauxiliar.sql.add('  )');
   dm.qryauxiliar.sql.add('    select');
   dm.qryauxiliar.sql.add('');
   dm.qryauxiliar.sql.add('      '+QuotedStr(codContaAPagar)+',');
   dm.qryauxiliar.sql.add('       2,');
   dm.qryauxiliar.sql.add('      cp.valor * (-1),');
   dm.qryauxiliar.sql.add('      '+QuotedStr(codContaSelecionada)+',');
   dm.qryauxiliar.sql.add('      cp.COD_FORNECEDOR,cp.COD_CONTA,cp.DESCRICAO_CONTA,');
   dm.qryauxiliar.sql.add('      cp.DATA_ENTRADA,cp.DATA_VENCIMENTO  ,cp.MULTA,cp.FLAG_MULTA,');
   dm.qryauxiliar.sql.add('      cp.MORA,cp.FLAG_MORA,cp.DESCONTO, cp.FLAG_DESCONTO,cp.DIAS_ANTES_DESCONTO,');
   dm.qryauxiliar.sql.add('      cp.USUARIO_INCLUSAO, cp.USUARIO_BAIXA, cp.CODIGO_ENTRADA,');
   dm.qryauxiliar.sql.add('      cp.NUMERO_NOTA_FISCAL, cp.COD_PRIMEIRO_TITULO, cp.ATUALIZAR_PARCELA,');
   dm.qryauxiliar.sql.add('      cp.OBS,cp.DATA_PAGAMENTO,cp.VALOR_PAGO,cp.VALOR_PAGO_MULTA,');
   dm.qryauxiliar.sql.add('      cp.VALOR_PAGO_JUROS,cp.VALOR_PAGO_DESCONTO,cp.COD_EMP_GRUPO,');
   dm.qryauxiliar.sql.add('      cp.PARCELA,cp.COD_FORMA_PAGTO,cp.DATA_LANCAMENTO');
   dm.qryauxiliar.sql.add('      from contas_a_pagar cp where');
   dm.qryauxiliar.sql.add('        cp.codigo = '+Quotedstr(codContaSelecionada));
   dm.qryauxiliar.ExecSQL;

   codNovoLancamentoRD := dm.geraCodigo('G_LANCAMENTOS_RD',8);
   dm.qryauxiliar.Active :=false;
   dm.qryauxiliar.SQL.clear;
   dm.qryauxiliar.sql.add('        insert into lancamentos_rd (codigo,nome_usuario,status,data_cancelamento,cod_lanc_cancelamento,COD_CT_PAGAR, ');
   dm.qryauxiliar.sql.add('          COD_FORNECEDOR,NUM_DOC,DATA_LANCAMENTO,DATA_DOCUMENTO,');
   dm.qryauxiliar.sql.add('          DATA_RD,OBSERVACOES,');
   dm.qryauxiliar.sql.add('          TOTAL)');
   dm.qryauxiliar.sql.add('             select');
   dm.qryauxiliar.sql.add('          '+Quotedstr(codNovoLancamentoRD)+',');
   dm.qryauxiliar.sql.add('          '+Quotedstr(nome_usuario)+',');
   dm.qryauxiliar.sql.add('          2,');
   dm.qryauxiliar.sql.add('          current_date,');
   dm.qryauxiliar.sql.add('          '+Quotedstr(codLancamentoRDSelecionado)+',');
   dm.qryauxiliar.sql.add('          '+Quotedstr(codContaAPagar)+',');
   dm.qryauxiliar.sql.add('          lr.COD_FORNECEDOR,lr.NUM_DOC,current_date,lr.DATA_DOCUMENTO,');
   dm.qryauxiliar.sql.add('          lr.DATA_RD,');
   dm.qryauxiliar.sql.add('          '+Quotedstr('(ESTORNO LANCTO '+codLancamentoRDSelecionado+')')+',');
   dm.qryauxiliar.sql.add('          (lr.TOTAL * (-1))');
   dm.qryauxiliar.sql.add('              from lancamentos_rd  lr where lr.codigo='+Quotedstr(codLancamentoRDSelecionado));
   dm.qryauxiliar.ExecSQL;



   dm.qryauxiliar.Active :=false;
   dm.qryauxiliar.SQL.clear;
   dm.qryauxiliar.sql.add('       insert into itens_lancamento_rd  (cod_lanc_rd,cod_grupo, valor) ');
   dm.qryauxiliar.sql.add('         select ');
   dm.qryauxiliar.sql.add('              '+Quotedstr(codNovoLancamentoRD)+',');
   dm.qryauxiliar.sql.add('          itr.cod_grupo, (itr.valor * (-1) ) ');
   dm.qryauxiliar.sql.add('          from itens_lancamento_rd itr where itr.cod_lanc_rd='+Quotedstr(codLancamentoRDSelecionado));
   dm.qryauxiliar.ExecSQL;

   dm.qryauxiliar.Active :=false;
   dm.qryauxiliar.SQL.clear;
   dm.qryauxiliar.sql.add('update lancamentos_rd lr set lr.status=2 where lr.codigo='+Quotedstr(codLancamentoRDSelecionado));
   dm.qryauxiliar.ExecSQL;



   dm.qryauxiliar.Active :=false;
   dm.qryauxiliar.SQL.clear;
   dm.qryauxiliar.sql.add('  update contas_a_pagar cp set cp.status=2 where cp.codigo ='+Quotedstr(codContaSelecionada));
   dm.qryauxiliar.ExecSQL;

{
   dm.qryauxiliar.Active :=false;
   IF dm.transacao.Active = FALSE THEN dm.transacao.Active:=TRUE;
   dm.transacao.Commit;
   dm.transacao.Active:=false;
   dm.transacao.Active:=true;
 }

end;

procedure TfrmLancamentoContasApagar.setEvento(ev : smallint);
begin
  evento := ev;

end;


end.
