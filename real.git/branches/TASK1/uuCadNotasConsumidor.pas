unit uuCadNotasConsumidor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, 
  RXDBCtrl,  dateutils;

type
  TfrmCadNotasConsumidor = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    bt_pesq_cfop_entrada: TSpeedButton;
    Label23: TLabel;
    Panel4: TPanel;
    ed_descricao_cfop_entradas: TDBEdit;
    Label22: TLabel;
    Panel21: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    bt_pesq_cst: TSpeedButton;
    Label14: TLabel;
    ckbCancelada: TCheckBox;
    edNumeroNotaFiscal: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    edDataEmissaoNotaFiscal: TDBDateEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edNumeroCupomFiscal: TDBEdit;
    edNumeroECF: TDBEdit;
    ed_cefop_entradas: TDBEdit;
    DBEdit12: TDBEdit;
    ed_cst: TDBEdit;
    ed_descricao_cst: TDBEdit;
    edValorDoc: TDBEdit;
    Label1: TLabel;
    procedure bt_novoClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure gravar_informacoes();
    procedure retorna_informacoes(numeroNota : string);
    procedure bt_gravarClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    function verificaValidade : boolean;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadNotasConsumidor: TfrmCadNotasConsumidor;

implementation

uses uu_data_module, uu_frm_principal, DB, uu_modelo_vazio, Math;

{$R *.dfm}

procedure TfrmCadNotasConsumidor.bt_novoClick(Sender: TObject);
var
 codigoMax : string;
begin
  inherited;
  pn_codigo.Enabled:=false;
  dm.qryNotasConsumidor.Active:=false;
  dm.qryNotasConsumidor.Active:=true;
  dm.qryNotasConsumidor.Append;
  dm.qryNotasConsumidorDATA_DOC.Value:=Date;
  dm.qryNotasConsumidorNUMERO_NOTA.Value:='';
  dm.qryNotasConsumidorNUMERO_NOTA.Value:='';
  dm.qryNotasConsumidorVALOR_MERCADORIAS.Value:=0;
  dm.qryNotasConsumidorBASE_ICMS.Value:=0;
  dm.qryNotasConsumidorREDUCAO_BASE_ICMS.Value:=0;
  dm.qryNotasConsumidorALIQ_ICMS.Value:=0;
  dm.qryNotasConsumidorVALOR_ICMS.Value:=0;
  dm.qryNotasConsumidorVALOR_DOC.Value:=0;
  dm.qryNotasConsumidorSERIE.Value :='D1';

  dm.qryNotasConsumidorCFOP.Value := '5102';
  exibeInformacoesCFOPEntrada(dm.qryNotasConsumidorCFOP.Value);
  dm.qryNotasConsumidorCST_ICMS.Value :='000';
  exibeInformacoesCST(dm.qryNotasConsumidorCST_ICMS.Value);

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select max(codigo) from notas_consumidor');
  dm.qryauxiliar.Active := true;
  if (dm.qryauxiliar.Fields[0].value <> null) then
   begin
     codigoMax := dm.qryauxiliar.Fields[0].Value;
   end
  else
   begin
     codigoMax := '0';
   end;


  dm.qryNotasConsumidorNUMERO_NOTA.Value := FormatFloat('000000',StrToFloat(codigoMax)+ 1);
  edNumeroNotaFiscal.SetFocus;

end;

procedure TfrmCadNotasConsumidor.Edit1Exit(Sender: TObject);
var
 numeroNota : string;
begin
  inherited;

 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edNumeroCupomFiscal') then
   begin
    if ( trim(edNumeroCupomFiscal.Text) <> '') then
     begin
       dm.qryNotasConsumidorCFOP.Value :='5929';
       dm.qryNotasConsumidorCST_ICMS.Value :='000';
       exibeInformacoesCFOPEntrada(dm.qryNotasConsumidorCFOP.Value);
       exibeInformacoesCST(dm.qryNotasConsumidorCST_ICMS.Value);
     end;
   end;

 if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edNumeroECF') then
   begin
    if  (trim(edNumeroCupomFiscal.Text) <> '') then
     begin
       dm.qryNotasConsumidorCFOP.Value :='5929';
       dm.qryNotasConsumidorCST_ICMS.Value :='000';
       exibeInformacoesCFOPEntrada(dm.qryNotasConsumidorCFOP.Value);
       exibeInformacoesCST(dm.qryNotasConsumidorCST_ICMS.Value);
     end;
   end;




  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edNumeroNotaFiscal') then
   begin
    if trim(edNumeroNotaFiscal.Text) = '' then exit;

    if (evento  = 1 ) then
     begin
       try
         edNumeroNotaFiscal.Text:= FormatFloat('000000',StrToFloat(edNumeroNotaFiscal.Text));
       except
         begin
          showmessage('Número da nota fiscal inválido!');
          edNumeroNotaFiscal.SetFocus;
          exit;
         end;
       end;


        if verificaNotaFiscalConsumidorJaFoiLancada(FormatFloat('000000', StrToFloat(dm.qryNotasConsumidorNUMERO_NOTA.Value))) then
         begin
           edNumeroNotaFiscal.SetFocus;
           IF MessageDlg('NOTA FISCAL JÁ FOI LANÇADA, DESEJA CONSULTA-LA ? ',mtConfirmation,[mbYes,mbNo],1) = mrYes then
            begin
               NumeroNota:=  FormatFloat('000000', StrToFloat(dm.qryNotasConsumidorNUMERO_NOTA.Value));
               bt_cancelar.Click;
               bt_consultar.Click;
               ed_codigo.Text:=numeroNota;
               retorna_informacoes(numeroNota);
            end
           else
             bt_cancelar.Click;
         end
     end;
   end;





  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edDataEmissaoNotaFiscal') then
   begin
   end;


                     {
   if  sender is TCustomEdit and ((sender as TCustomEdit).Name <> 'edValorDoc') then
    begin
     if ( (evento = 1) or (evento =2)) then
     dm.qryNotasConsumidorVALOR_DOC.Value := dm.qryNotasConsumidorVALOR_MERCADORIAS.Value;
    end;

                      }
  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edNumeroCupomFiscal') then
   begin
     if (edNumeroCupomFiscal.Text  <> '') then
       begin
         try
          begin
           edNumeroCupomFiscal.Text:= FormatFloat('000000',StrToFloat(edNumeroCupomFiscal.Text));
           edNumeroECF.Text := '001';
          end;
         except
           begin
             showmessage('Número do cupom fiscal inválido!');
             edNumeroCupomFiscal.SetFocus;
            exit;
           end;
         end;
       end
     else
      begin
        edNumeroECF.Text :='';
      end;

   end;



  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edNumeroECF') then
   begin
     if (edNumeroCupomFiscal.Text  <> '') then
       begin
         try
           edNumeroECF.Text:= FormatFloat('000',StrToFloat(edNumeroECF.Text));
         except
           begin
             showmessage('Número do ECF inválido');
             edNumeroECF.SetFocus;
            exit;
           end;
         end;
       end;
   end;




end;



procedure TfrmCadNotasConsumidor.retorna_informacoes(numeroNota : string);
begin
  dm.qryNotasConsumidor.Active :=false;
  dm.qryNotasConsumidor.SQL.clear;
  dm.qryNotasConsumidor.SQL.Add(' select nc.*,cf.descricao as desc_cfop,cs.descricao as desc_cst ');
  dm.qryNotasConsumidor.SQL.Add('  from notas_consumidor nc');
  dm.qryNotasConsumidor.SQL.Add('     inner join cfop cf on (cf.codigo = nc.cfop)');
  dm.qryNotasConsumidor.SQL.Add('     inner join cst cs on (cs.cst = nc.cst_icms)');
  dm.qryNotasConsumidor.SQL.add(' where nc.numero_nota='+Quotedstr(numeroNota));
  dm.qryNotasConsumidor.Active :=true;

  if dm.qryNotasConsumidorCANCELADO.Value = 1 then
    ckbCancelada.Checked :=true
  else
   ckbCancelada.Checked := false;



  if (evento = 2)then
   begin
    dm.qryNotasConsumidor.Edit;
   end;

  if ((evento=2) or (evento = 3)) then
     bt_gravar.Enabled:=true;
end;

procedure TfrmCadNotasConsumidor.gravar_informacoes();
begin
   if (evento = 1) then
   begin

   end;

 if ( (evento = 1) or (evento=2) )then
   begin
    dm.qryNotasConsumidorCODIGO.Value :=FormatFloat('000000',StrToFloat(dm.qryNotasConsumidorNUMERO_NOTA.Value));
    if ckbCancelada.Checked = true then
      dm.qryNotasConsumidorCANCELADO.value := 1
    else

    dm.qryNotasConsumidorCANCELADO.value :=0;
    dm.qryNotasConsumidorDATA_LANCAMENTO.Value :=  data_do_sistema;
    dm.qryNotasConsumidor.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryNotasConsumidor]);
   end
 else
  begin
    if (MessageBox(0, 'Confirma exclusão desta nota ? ', 'Exclusão de nota', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) in [idYes]) then
      begin
       dm.qryNotasConsumidor.Delete;
       dm.dbrestaurante.ApplyUpdates([dm.qryNotasConsumidor]);
      end
    else
      bt_cancelar.Click;
  end;
end;












procedure TfrmCadNotasConsumidor.bt_gravarClick(Sender: TObject);
begin
 if verificaValidade then
  begin
    gravar_informacoes;
    inherited;
    bt_novo.Click;
  end;

end;



function TfrmCadNotasConsumidor.verificaValidade() : boolean;
var
 codigoMax : string;
 notasFaltam : integer;
 difDias : integer;
begin
   if (evento = 3) then
    begin
     result := true;
     exit;
    end;

  if (ckbCancelada.Checked = true) then
   begin
     dm.qryNotasConsumidorVALOR_MERCADORIAS.Value:=0;
     dm.qryNotasConsumidorBASE_ICMS.Value:=0;
     dm.qryNotasConsumidorREDUCAO_BASE_ICMS.Value:=0;
     dm.qryNotasConsumidorALIQ_ICMS.Value:=0;
     dm.qryNotasConsumidorVALOR_ICMS.Value:=0;
     dm.qryNotasConsumidorVALOR_DOC.Value:=0;
   end;

   If (trim(dm.qryNotasConsumidorNUMERO_CUPOM_FISCAL.Value) <> '') or (trim(dm.qryNotasConsumidorNUMERO_ECF .Value) <> '')  then
   begin
     dm.qryNotasConsumidorVALOR_MERCADORIAS.Value:=0;
     dm.qryNotasConsumidorBASE_ICMS.Value:=0;
     dm.qryNotasConsumidorREDUCAO_BASE_ICMS.Value:=0;
     dm.qryNotasConsumidorALIQ_ICMS.Value:=0;
     dm.qryNotasConsumidorVALOR_ICMS.Value:=0;
//     dm.qryNotasConsumidorVALOR_DOC.Value:=0;
     dm.qryNotasConsumidorCFOP.Value :='5929';
     dm.qryNotasConsumidorCST_ICMS.Value :='000';
   end;



  if (dm.qryNotasConsumidorVALOR_DOC.Value > 0) then
   begin
     dm.tb_parametros.Active := true;

     dm.qryNotasConsumidorVALOR_MERCADORIAS.Value:= dm.qryNotasConsumidorVALOR_DOC.Value;
     dm.qryNotasConsumidorBASE_ICMS.Value:=dm.qryNotasConsumidorVALOR_DOC.Value;
     dm.qryNotasConsumidorREDUCAO_BASE_ICMS.Value:=0;
     dm.qryNotasConsumidorALIQ_ICMS.Value:= dm.tb_parametrosALIQUOTA_ICMS.Value;
     dm.qryNotasConsumidorVALOR_ICMS.Value:= dm.qryNotasConsumidorVALOR_DOC.Value * (dm.tb_parametrosALIQUOTA_ICMS.Value/100);
   end;




  if (evento = 1) then
   begin
      if verificaNotaFiscalConsumidorJaFoiLancada(FormatFloat('000000', StrToFloat(dm.qryNotasConsumidorNUMERO_NOTA.Value))) then
       begin
         showmessage('Esta nota já foi cadastrada!');
         Result := false;
         edNumeroNotaFiscal.SetFocus;
         exit;
       end;
   end;


  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select max(codigo) from notas_consumidor');
  dm.qryauxiliar.Active := true;

  if ( (dm.qryauxiliar.Fields[0].value <> null) and (evento =1 )) then
   begin
    codigoMax := dm.qryauxiliar.Fields[0].Value;
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.sql.clear;
    dm.qryauxiliar.sql.add('select * from notas_consumidor where codigo='+Quotedstr(codigoMax));
    dm.qryauxiliar.Active := true;

    if dm.qryauxiliar.FieldByName('data_doc').Value > edDataEmissaoNotaFiscal.Date then
     begin
      dm.exibe_painel_erro('Não é possível cadastrar uma nota de data inferior à última nota cadastrada!'+#13#10
      +'Nº da última nota: '+dm.qryauxiliar.fieldbyname('numero_nota').value+#13#10
      +'Data da última nota: '+ FormatDateTime('DD/MM/YY',dm.qryauxiliar.FieldByName('data_doc').Value),'');
      Result := false;
      exit;
     end;


    if StrToInt(dm.qryauxiliar.FieldByName('numero_nota').Value) > strToInt(dm.qryNotasConsumidorNUMERO_NOTA.Value)  then
     begin
      dm.exibe_painel_erro('Não é possível cadastrar uma nota de numeração inferior à última nota cadastrada!'+#13#10
      +'Nº da última nota: '+dm.qryauxiliar.fieldbyname('numero_nota').value+#13#10
      +'Data da última nota: '+ FormatDateTime('DD/MM/YY',dm.qryauxiliar.FieldByName('data_doc').Value),'');
      Result := false;
      exit;
     end;

     notasFaltam := strToInt(dm.qryNotasConsumidorNUMERO_NOTA.Value) -  StrToInt(dm.qryauxiliar.FieldByName('numero_nota').Value);

     if (notasFaltam  > 1) then
      begin
        dm.exibe_painel_erro('Não é possível saltar a numeração das notas. Falta(m) '+Inttostr(notasFaltam-1)+' nota(s) no cadastro, para chegar na numeração informada.'+#13#10
        +' É necessário cadastrar as notas que faltam, antes de atingir esta numeração.'+#13#10#13#10
        +'Nº da última nota: '+dm.qryauxiliar.fieldbyname('numero_nota').value+#13#10
        +'Data da última nota: '+ FormatDateTime('DD/MM/YY',dm.qryauxiliar.FieldByName('data_doc').Value),'');
        Result := false;
        exit;
      end;


     difDias := DaysBetween(dm.qryNotasConsumidorDATA_DOC.Value,dm.qryauxiliar.FieldByName('data_doc').Value);

     if (difDias > 1) then
      begin
        dm.exibe_painel_erro('Data informada é '+Inttostr(difDias )+' dia(s) maior do que a última nota(s) cadastrada.'+#13#10#13#10
  //      +' É necessário cadastrar as notas que faltam, antes de atingir esta numeração.'+#13#10#13#10
        +'Nº da última nota: '+dm.qryauxiliar.fieldbyname('numero_nota').value+#13#10
        +'Data da última nota: '+ FormatDateTime('DD/MM/YY',dm.qryauxiliar.FieldByName('data_doc').Value),'');

       if dm.painelDePergunta(#13#10+' CONFIRMA ESTA OPERAÇÃO ?',20) then
         begin
           Result :=true;
         end
       else
        begin
          result:= false;
          exit;
        end;
      end;
   end;





    if ckbCancelada.Checked = false then
     begin
      If (trim(dm.qryNotasConsumidorNUMERO_CUPOM_FISCAL.Value) = '') or (trim(dm.qryNotasConsumidorNUMERO_ECF .Value) =  '')  then
        begin
          if (dm.qryNotasConsumidorVALOR_DOC.Value <=0) then
           begin
              ShowMessage('Informe o valor do documento!');
              edValorDoc.SetFocus;
              Result := false;
              exit;
           end;
        end;
     end;


 result:= true;


end;



procedure TfrmCadNotasConsumidor.ed_codigoExit(Sender: TObject);
begin
  inherited;
  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
    begin
      if Trim(ed_codigo.Text) = '' then exit;
      try
        ed_codigo.Text:=FormatFloat('000000',StrTOFloat(ed_codigo.text));
      except
       begin
         ShowMessage('Número da Nota fiscal inválido!');
         ed_codigo.clear;
         ed_codigo.SetFocus;
         exit;
       end;
      end;

      if ( verificaNotaFiscalConsumidorJaFoiLancada (trim(ed_codigo.Text)) = true)
        then
          retorna_informacoes(ed_codigo.text)
        else
          begin
           ShowMessage('Número da Nota fiscal não existe!');
           ed_codigo.clear;
           ed_codigo.SetFocus;
           exit;
          end;
    end;

end;

end.
