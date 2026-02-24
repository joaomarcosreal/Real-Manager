unit uuManutencaoContasApagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,db,
  Dialogs, uu_modelo_Vazio, Grids, DBGrids, StdCtrls, Buttons, Mask,
  ExtCtrls, ImgList, Menus, RXSpin, System.ImageList, RxCurrEdit, RxToolEdit,
  Vcl.ActnList, System.Actions;

type
  TfrmManutencaoContasApagar = class(Tfrm_modelo_vazio)
    Panel3: TPanel;
    Label1: TLabel;
    ed_parametro: TEdit;
    RadioGroup1: TRadioGroup;
    gpFornecedor: TGroupBox;
    Label2: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    Label6: TLabel;
    Panel4: TPanel;
    ed_razao_social_fornecedor: TEdit;
    ed_cod_fornecedor: TEdit;
    rdpContas: TRadioGroup;
    btPesquisar: TBitBtn;
    btImprimir: TBitBtn;
    rdFiltroData: TRadioGroup;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel8: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    edNumeroNota: TEdit;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    gp_loja: TGroupBox;
    Label18: TLabel;
    btPesqLoja: TSpeedButton;
    Label28: TLabel;
    Panel9: TPanel;
    edDescLoja: TEdit;
    edCodLoja: TEdit;
    PopupMenu1: TPopupMenu;
    Alterardados1: TMenuItem;
    BaixarttuloPagar1: TMenuItem;
    ImageList1: TImageList;
    edDias: TRxSpinEdit;
    Label5: TLabel;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel6: TPanel;
    Label8: TLabel;
    Panel7: TPanel;
    Label9: TLabel;
    Panel10: TPanel;
    Label10: TLabel;
    Panel11: TPanel;
    Label11: TLabel;
    Excluirttulo1: TMenuItem;
    edValorNota: TCurrencyEdit;
    Label12: TLabel;
    ckbExibeCancelados: TCheckBox;
    GroupBox2: TGroupBox;
    Panel5: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    ed_data_inicial: TDateEdit;
    ed_data_final: TDateEdit;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure processarConsulta(relatorio : boolean);
    procedure btImprimirClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BaixarttuloPagar1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Alterardados1Click(Sender: TObject);
    procedure Excluirttulo1Click(Sender: TObject);
    procedure edNumeroNotaExit(Sender: TObject);

    procedure EstornarTitulo();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutencaoContasApagar: TfrmManutencaoContasApagar;

implementation

uses uu_data_module, uu_frm_principal, UU_DM_RELATORIOS, 
  uuBaixaTitulosContasApagar, uuLancamentoContasAPagar,
  uu_confirma_extrato;

{$R *.dfm}


procedure TfrmManutencaoContasApagar.processarConsulta(relatorio : boolean);
begin
 if ( trim(edNumeroNota.Text) <> '' ) then
  begin

   try
         edNumeroNota.Text:= FormatFloat('000000000000000',StrToFloat(edNumeroNota.Text));
       except
         begin
           showmessage('Número da nota fiscal inválido!');
           edNumeroNota.SetFocus;
           exit;
         end;
       end;
  end;

  dm.qryCsContasApagar.Active :=false;
  dm.qryCsContasApagar.SQL.clear;
  dm.qryCsContasApagar.SQL.add('   select rc.*,en.data_emissao,lr.data_rd,lr.data_documento, lr.observacoes, f.nome_fantasia, pc.* from r_contas_a_pagar rc ');
  dm.qryCsContasApagar.SQL.add('   inner join fornecedor f on (f.cod_fornecedor = rc.cod_fornecedor) ');
  dm.qryCsContasApagar.SQL.add('   inner join v_plano_contas_financeiro pc on (pc.cod_conta = rc.cod_conta) ');
  dm.qryCsContasApagar.SQL.add('   left join entradas en on (en.cod_entrada = rc.codigo_entrada) ');
  dm.qryCsContasApagar.SQL.add('        left join lancamentos_rd lr on (lr.cod_ct_pagar = rc.codigo) ');

  case rdpContas.ItemIndex of
   0 : dm.qryCsContasApagar.SQL.Add(' where rc.status <> -2');
   1 : dm.qryCsContasApagar.SQL.Add(' where ( (rc.status = -1) or ( (rc.status=0) and (rc.diasatraso <= '+edDias.Text+' )))');
   2 : dm.qryCsContasApagar.SQL.Add(' where rc.status = -1');
   3 : dm.qryCsContasApagar.SQL.Add(' where rc.status = 0');
   4 : dm.qryCsContasApagar.SQL.Add(' where rc.status = 1');
   5 : dm.qryCsContasApagar.SQL.Add(' where rc.status = 2');
  end;

  if ( trim(ed_cod_fornecedor.text) <> '')  then
   begin
     dm.qryCsContasApagar.sql.add(' and rc.cod_fornecedor='+Quotedstr(ed_cod_fornecedor.text));
   end;


  if ( trim(edNumeroNota.text) <> '')  then
   begin
     dm.qryCsContasApagar.sql.add(' and rc.numero_nota_fiscal='+Quotedstr(edNumeroNota.text));
   end;


  if (edValorNota.Value <> 0 )  then
   begin
     dm.qryCsContasApagar.sql.add(' and rc.valorconta='+dm.TrocaVirgPPto (dm.removePonto(FloatToStr(edValorNota.Value) )));
   end;



  if ( (Trim(ed_data_inicial.Text) <> '/  /' ) and   (Trim(ed_data_inicial.Text) <> '' )) then
   begin
    case rdFiltroData.ItemIndex of
      0: begin
           dm.qryCsContasApagar.sql.add(' and rc.data_vencimento between '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_inicial.Date  )));
           dm.qryCsContasApagar.sql.add(' and '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_final.date )));
         end;

      1: begin
           dm.qryCsContasApagar.sql.add(' and rc.datapagamento between '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_inicial.Date  )));
           dm.qryCsContasApagar.sql.add(' and '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_final.date )));
         end;

      2: begin
           dm.qryCsContasApagar.sql.add(' and rc.data_entrada between '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_inicial.Date  )));
           dm.qryCsContasApagar.sql.add(' and '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_final.date )));
         end;

      3: begin
           dm.qryCsContasApagar.sql.add(' and lr.data_rd between '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_inicial.Date  )));
           dm.qryCsContasApagar.sql.add(' and '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_final.date )));
         end;

      4: begin
           dm.qryCsContasApagar.sql.add(' and lr.data_documento between '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_inicial.Date  )));
           dm.qryCsContasApagar.sql.add(' and '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_final.date )));
         end;

    end;
   end;


   

  if relatorio = false then
    dm.qryCsContasApagar.SQL.add('order by rc.status,rc.data_vencimento')
  else
    dm.qryCsContasApagar.SQL.add('order by pc.contaraiz,pc.contapai,pc.cod_conta, rc.data_vencimento ');


  frm_principal.memo_avisos.Lines := dm.qryCsContasApagar.SQL;
  dm.qryCsContasApagar.Active:=true;
  dm.adicionaLog(dm.qryCsContasApagar.SQL.Text);
  TFloatField(dm.qryCsContasApagar.Fields[10]).DisplayFormat := 'R$ ###,###,##0.00';
  TFloatField(dm.qryCsContasApagar.Fields[11]).DisplayFormat := 'R$ ###,###,##0.00';
  TFloatField(dm.qryCsContasApagar.Fields[12]).DisplayFormat := 'R$ ###,###,##0.00';
  TFloatField(dm.qryCsContasApagar.Fields[13]).DisplayFormat := 'R$ ###,###,##0.00';
  TFloatField(dm.qryCsContasApagar.Fields[14]).DisplayFormat := 'R$ ###,###,##0.00';
  TFloatField(dm.qryCsContasApagar.Fields[15]).DisplayFormat := 'R$ ###,###,##0.00';

  if dm.qryCsContasApagar.IsEmpty then
   begin
     btImprimir.Enabled := false;
//     Showmessage('Sem resultados para os filtros aplicados!');
   end
  else
   Begin
     btImprimir.Enabled :=true;
   end;
end;

procedure TfrmManutencaoContasApagar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  if ( dm.qryCsContasApagar.FieldByName('status').Value = 2 ) then
   begin
    DBGrid1.Canvas.Brush.Color:= clRed;
    TDbGrid(Sender).Canvas.font.Color:= clBlack;
    TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
    TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte

   end
  else
   begin
    if odd(dm.qryCsContasApagar.RecNo) then
    DBGrid1.Canvas.Brush.Color:= clwhite
    else
    DBGrid1.Canvas.Brush.Color:= clMoneyGreen;
    TDbGrid(Sender).Canvas.font.Color:= clBlack;
    TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
    TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
   end;


try
 begin


  if (Column.FieldName = 'MSGSTATUS') then
   begin

//      if ( trim(copy(trim(Column.Field.AsString),0,7)) = 'Vencido' ) then
     if ( dm.qryCsContasApagar.FieldByName('status').Value = -1) then
      begin
        DBGrid1.Canvas.Brush.Color:= clRed;
        DBGrid1.Canvas.Font.Color:= clWhite;
        DBGrid1.Canvas.FillRect(Rect);
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;

//      if ( trim(copy(trim(Column.Field.AsString),0,8)) = 'Vencendo' ) then
     if ( ( dm.qryCsContasApagar.FieldByName('status').Value = 0) and ( dm.qryCsContasApagar.FieldByName('DIASATRASO').Value = 0)) then
      begin
        DBGrid1.Canvas.Brush.Color:= clBlack;
        DBGrid1.Canvas.Font.Color:= clLime;
        DBGrid1.Canvas.FillRect(Rect);
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;



     if ( ( dm.qryCsContasApagar.FieldByName('status').Value = 0) and ( dm.qryCsContasApagar.FieldByName('DIASATRASO').Value > 0)) then
      begin
        DBGrid1.Canvas.Brush.Color:= clGreen;
        DBGrid1.Canvas.Font.Color:= clWhite;
        DBGrid1.Canvas.FillRect(Rect);
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;

     if ( dm.qryCsContasApagar.FieldByName('status').Value = 1) then
      begin
        DBGrid1.Canvas.Brush.Color:= clBlue;
        DBGrid1.Canvas.Font.Color:= clWhite;
        DBGrid1.Canvas.FillRect(Rect);
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;


     if ( dm.qryCsContasApagar.FieldByName('status').Value = 2) then
      begin
        DBGrid1.Canvas.Brush.Color:= clBlack;
        DBGrid1.Canvas.Font.Color:= clRed;
        DBGrid1.Canvas.FillRect(Rect);
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;


 end;
 end;
except
end;

end;

procedure TfrmManutencaoContasApagar.btImprimirClick(Sender: TObject);
begin
  inherited;
  processarConsulta(true);
  if ( (dm.qryCsContasApagar.Active = true ) and (dm.qryCsContasApagar.IsEmpty =  false) )
   then
    begin

      dm_relatorios.qryContasApagar.Active :=false;
      dm_relatorios.qryContasApagar.SQL.clear;
      dm_relatorios.qryContasApagar.SQL := dm.qryCsContasApagar.SQL;
      dm_relatorios.qryContasApagar.Active :=true;

      dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\RelContasApagar.fr3',true);
      dm_relatorios.rpt.ShowReport(true);
      dm_relatorios.qryPlanoContas.Active:=false;
    end;


end;

procedure TfrmManutencaoContasApagar.btPesquisarClick(Sender: TObject);
begin
  inherited;
  btImprimir.Enabled := false;
  processarConsulta(false);
end;

procedure TfrmManutencaoContasApagar.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmManutencaoContasApagar.BaixarttuloPagar1Click(Sender: TObject);
begin
  inherited;

 if dm.verificaPermissaoAcao('I80001005') = true then
  begin
    if (dm.qryCsContasApagar.IsEmpty = false) then
     begin
      if ( getStatusContaApagar(dm.qryCsContasApagar.fieldbyname('codigo').Value) <> 0) then
       begin
         showmessage('Não é possível realizar pagamento de um título que já foi pago ou cancelado!');
         exit;
       end
      else
       begin
         Application.CreateForm(TfrmBaixaTituloContasApagar, frmBaixaTituloContasApagar);
         frmBaixaTituloContasApagar.edNumeroTitulo.Text := dm.qryCsContasApagar.fieldbyname('codigo').value;
         frmBaixaTituloContasApagar.showmodal;
         frmBaixaTituloContasApagar.Free;
       end;
     end;
  end;


end;

procedure TfrmManutencaoContasApagar.FormActivate(Sender: TObject);
begin
  inherited;
//  btPesquisar.Click;
end;

procedure TfrmManutencaoContasApagar.Alterardados1Click(Sender: TObject);
begin
  inherited;

 if dm.verificaPermissaoAcao('I80001002') = true then
  begin
    if (dm.qryCsContasApagar.IsEmpty = false) then
     begin
      if ( getStatusContaApagar(dm.qryCsContasApagar.fieldbyname('codigo').Value) <> 0) then
       begin
         showmessage('Não é possível alterar dados de um título que já foi pago ou cancelado!');
         exit;
       end
      else
        begin
          Application.CreateForm(TfrmLancamentoContasApagar,frmLancamentoContasApagar);
          frmLancamentoContasApagar.setEvento(2);
          frmLancamentoContasApagar.ed_codigo.Text := dm.qryCsContasApagar.fieldbyname('codigo').Value;
          frmLancamentoContasApagar.ShowModal;
          frmLancamentoContasApagar.free;
          btPesquisar.Click;

        end;
     end;
  end;


end;

procedure TfrmManutencaoContasApagar.Excluirttulo1Click(Sender: TObject);
var
msg : string;
begin
  inherited;

 if dm.verificaPermissaoAcao('I80001004') = true then
  begin
    if (dm.qryCsContasApagar.IsEmpty = false) then
     begin
      if ( getStatusContaApagar(dm.qryCsContasApagar.fieldbyname('codigo').Value) <> 0) then
       begin
         showmessage('Não é possível alterar dados de um título que já foi pago ou cancelado!');
         exit;
       end
      else
        begin
          Application.CreateForm(TfrmLancamentoContasApagar,frmLancamentoContasApagar);
          frmLancamentoContasApagar.setEvento(3);
          frmLancamentoContasApagar.ed_codigo.Text := dm.qryCsContasApagar.fieldbyname('codigo').Value;
          frmLancamentoContasApagar.ShowModal;
          frmLancamentoContasApagar.free;
          btPesquisar.Click;

        end;
     end;
  end;
  

{
 if dm.verificaPermissaoAcao('I80001004') = true then
  begin
      msg:='  Tem certeza que deseja realizar o estorno deste título ?!! '+#13#10+#13#10;
      if dialogConfirmacao('Confirmação',msg,18) then
       begin
         dm.qryauxiliar.Active :=false;
         dm.qryauxiliar.SQL.clear;
         dm.qryauxiliar.sql.add('delete from contas_a_pagar where codigo='+Quotedstr(dm.qryCsContasApagar.fieldbyname('codigo').Value));
         dm.qryauxiliar.ExecSQL;

         dm.qryauxiliar.Active :=false;
         dm.qryauxiliar.SQL.clear;
         dm.qryauxiliar.sql.add('delete from lancamentos_rd where cod_ct_pagar='+Quotedstr(dm.qryCsContasApagar.fieldbyname('codigo').Value   ));
         dm.qryauxiliar.ExecSQL;






         dm.qryauxiliar.Active :=false;
         dm.qryauxiliar.SQL.Clear;
         dm.qryauxiliar.sql.Add('select * from contas_a_pagar where cod_primeiro_titulo='+Quotedstr(dm.qryCsContasApagar.fieldbyname('codigo').Value));
         dm.qryauxiliar.Active :=true;

         if (dm.qryauxiliar.IsEmpty = false ) then
          begin
           if dialogConfirmacao('Exclusão de clones',' Excluir também os demais títulos-clones deste título ?',18) then
            begin
             dm.qryauxiliar.Active :=false;
             dm.qryauxiliar.SQL.clear;
             dm.qryauxiliar.sql.add('delete from contas_a_pagar where status <> 1 and cod_primeiro_titulo='+Quotedstr(dm.qryCsContasApagar.fieldbyname('codigo').Value));
             dm.qryauxiliar.ExecSQL;
            end;
          end;
         dm.qryauxiliar.Active :=false;
         IF dm.transacao.Active = FALSE THEN dm.transacao.Active:=TRUE;
         dm.transacao.Commit;
         dm.transacao.Active:=false;
         dm.transacao.Active:=true;
         btPesquisar.Click;
       end;
  end;

  }



end;

procedure TfrmManutencaoContasApagar.edNumeroNotaExit(Sender: TObject);
begin
  inherited;
 if trim(edNumeroNota.Text) = '' then exit;

 try
       edNumeroNota.Text:= FormatFloat('000000000000000',StrToFloat(edNumeroNota.Text));
     except
       begin
         showmessage('Número da nota fiscal inválido!');
         edNumeroNota.SetFocus;
         exit;
       end;
     end;



end;

procedure TfrmManutencaoContasApagar.EstornarTitulo();
var
msg : string;
codContaAPagar  : string;
codContaSelecionada : string;

codLancamentoRDSelecionado : string;
codNovoLancamentoRD : string;
begin
  inherited;
  codContaSelecionada := dm.qryCsContasApagar.fieldbyname('codigo').Value;

 //if dm.verificaPermissaoAcao('I80001004') = true then
//  begin
      msg:='  Tem certeza que deseja realizar o estorno deste título ?!! '+#13#10+#13#10;
      if dialogConfirmacao('Confirmação',msg,18) then
       begin

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
         //dm.adicionaLog(dm.qryauxiliar.SQL.Text);
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
         dm.qryauxiliar.sql.add('          lr.COD_FORNECEDOR,lr.NUM_DOC,lr.DATA_LANCAMENTO,lr.DATA_DOCUMENTO,');
         dm.qryauxiliar.sql.add('          lr.DATA_RD,');
         dm.qryauxiliar.sql.add('          '+Quotedstr('(ESTORNO LANCTO '+codLancamentoRDSelecionado+')')+',');
         dm.qryauxiliar.sql.add('          (lr.TOTAL * (-1))');
         dm.qryauxiliar.sql.add('              from lancamentos_rd  lr where lr.codigo='+Quotedstr(codLancamentoRDSelecionado));
         //dm.adicionaLog(dm.qryauxiliar.SQL.Text);
         dm.qryauxiliar.ExecSQL;



         dm.qryauxiliar.Active :=false;
         dm.qryauxiliar.SQL.clear;
         dm.qryauxiliar.sql.add('       insert into itens_lancamento_rd  (cod_lanc_rd,cod_grupo, valor) ');
         dm.qryauxiliar.sql.add('         select ');
         dm.qryauxiliar.sql.add('              '+Quotedstr(codNovoLancamentoRD)+',');
         dm.qryauxiliar.sql.add('          itr.cod_grupo, (itr.valor * (-1) ) ');
         dm.qryauxiliar.sql.add('          from itens_lancamento_rd itr where itr.cod_lanc_rd='+Quotedstr(codLancamentoRDSelecionado));
         //dm.adicionaLog(dm.qryauxiliar.SQL.Text);
         dm.qryauxiliar.ExecSQL;

         dm.qryauxiliar.Active :=false;
         dm.qryauxiliar.SQL.clear;
         dm.qryauxiliar.sql.add('update lancamentos_rd lr set lr.status=2 where lr.codigo='+Quotedstr(codLancamentoRDSelecionado));
         dm.qryauxiliar.ExecSQL;



         dm.qryauxiliar.Active :=false;
         dm.qryauxiliar.SQL.clear;
         dm.qryauxiliar.sql.add('  update contas_a_pagar cp set cp.status=2 where cp.codigo ='+Quotedstr(codContaSelecionada));
         dm.qryauxiliar.ExecSQL;


         dm.qryauxiliar.Active :=false;
         IF dm.transacao.Active = FALSE THEN dm.transacao.Active:=TRUE;
         dm.transacao.Commit;
         dm.transacao.Active:=false;
         dm.transacao.Active:=true;
         btPesquisar.Click;
       end;
end;

end.







