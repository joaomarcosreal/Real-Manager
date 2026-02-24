unit uuCadNotasTransportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, DBCtrls, StdCtrls, Buttons, Mask, ExtCtrls, 
  RXDBCtrl, RxToolEdit;

type
  TfrmCadNotasTransporte = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    gpFornecedor: TGroupBox;
    Label2: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    Label1: TLabel;
    Label27: TLabel;
    ed_cod_fornecedor: TDBEdit;
    Panel3: TPanel;
    ed_razao_social_fornecedor: TDBEdit;
    Panel11: TPanel;
    ed_cnpj_fornecedor: TDBEdit;
    gpDadosNota: TGroupBox;
    Label5: TLabel;
    Label40: TLabel;
    bt_pesq_cst: TSpeedButton;
    bt_pesq_cfop: TSpeedButton;
    Label41: TLabel;
    Panel2: TPanel;
    Panel21: TPanel;
    Label39: TLabel;
    Panel22: TPanel;
    Label42: TLabel;
    ed_descricao_cst: TDBEdit;
    ed_descricao_cfop: TDBEdit;
    Panel4: TPanel;
    edDescSituacaoDocFiscal: TDBEdit;
    Label18: TLabel;
    btPesqSituacaoDocFiscal: TSpeedButton;
    rdTipoDOC: TRadioGroup;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label30: TLabel;
    pnDCTe: TPanel;
    GroupBox3: TGroupBox;
    edChaveCTE: TDBEdit;
    rdTipoDCTE: TRadioGroup;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label16: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    DBEdit7: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    edAliquotaICMS: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit8: TDBEdit;
    edValorMercadorias: TDBEdit;
    edNumeroNotaFiscal: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    edDataEmissaoNotaFiscal: TDBDateEdit;
    edDataEntradaNotaFiscal: TDBDateEdit;
    edCodSituacaoDocFiscal: TDBEdit;
    ed_cst: TDBEdit;
    ed_cfop: TDBEdit;
    rdTipoFrete: TRadioGroup;
    Label4: TLabel;
    procedure bt_novoClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);

    procedure retornaInformacoes(codigo : string);
    procedure gravar_informacoes();
    function  verificaValidade() : boolean;
    procedure bt_gravarClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure copiaValoresNota ();
    procedure retornaValoresNota ();

  private
    { Private declarations }
    xCodFornecedor, xNumero_nota, xSerie, xsub_serie, xSituacao,  xModeloNota, xCFOP, xCST,  xChaveCTE : string;
    xDataEmissao, xDataServico : Tdate;
    xValorServico, xDesconto, xBaseICMS, xREDUCAO, xALIQ_ICMS, xValorICMS, xValorNaoTributado, xValorDoc : Double;
    xTipoCTE, xTipoDOC, xID_FRETE : smallint;


  public
    { Public declarations }
  end;

var
  frmCadNotasTransporte: TfrmCadNotasTransporte;
  eventoAuxiliar : integer;
  codNotaAuxiliar : string;
  

implementation

uses uu_data_module, uu_frm_principal, uu_modelo_vazio, uu_cad_fornecedor;

{$R *.dfm}

procedure TfrmCadNotasTransporte.bt_novoClick(Sender: TObject);
begin
  inherited;
  pn_codigo.Enabled:=false;
  dm.qryNotasTransporte.Active:=false;
  dm.qryNotasTransporte.Active:=true;
  dm.qryNotasTransporte.Append;
  dm.qryNotasTransporteDATA_LANCAMENTO.Value:=Date;
  dm.qryNotasTransporteVALOR_SERVICO.Value :=0;
  dm.qryNotasTransporteDESCONTO.Value :=0;
  dm.qryNotasTransporteVALOR_NAO_TRIBUTADO.Value :=0;
  dm.qryNotasTransporteVALOR_ICMS.Value :=0;
  dm.qryNotasTransporteBASE_ICMS.Value :=0;
  dm.qryNotasTransporteREDUCAO_BASE_ICMS.Value :=0;
  dm.qryNotasTransporteALIQ_ICMS.Value := 0;
  dm.qryNotasTransporteVALOR_DOC.Value := 0;


  exibeInformacoesSituacaoDocumentoFiscal('00');
  dm.qryNotasTransporteSITUACAO.Value := edCodSituacaoDocFiscal.Text;
  exibeInformacoesModeloNotaFiscal('08');

  exibeInformacoesCST('000');
  dm.qryNotasTransporteCST_ICMS.Value := ed_cst.Text;
  exibeInformacoesCFOP('2353');
  dm.qryNotasTransporteCFOP.Value := ed_cfop.Text;
  rdTipoDOC.ItemIndex :=1;
  pnDCTe.Enabled := true;



//  cbMesRefContabil.ItemIndex := 0;
//  cbMesRefContabil.ItemIndex := 0;
//  cbMesRefContabil.ItemIndex :=  StrToInt(FormatDateTime('MM',data_do_sistema)) - 1;
//  edAnoRefContabil.Text      :=  FormatDateTime('YYY',data_do_sistema);
  rdTipoDOC.SetFocus;

end;

procedure TfrmCadNotasTransporte.Edit1Exit(Sender: TObject);
begin
  inherited;


  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edChaveCTE') then
   begin
      if Trim(edChaveCTE.Text) = '' then
       exit;

     if ( Length(trim(edChaveCTE.Text)) <> 44 ) then
      begin
        showmessage('Chave do documento fiscal inválida!');
        edChaveCTE.SetFocus;
        exit;
      end
     else
      begin
        if ( verificaExistenciaFornecedorCNPJ(copy((sender as TCustomEdit).text,7,14)) = true ) then
         begin
           exibeInformacoesFornecedorCNPJ(copy((sender as TCustomEdit).text,7,14));
           dm.qryNotasTransporteNUMERO_NOTA.Value := copy((sender as TCustomEdit).text,26,9);
           dm.qryNotasTransporteSERIE.Value := copy((sender as TCustomEdit).text,23,3);

         end
        else
         begin
             codNotaAuxiliar := ed_codigo.Text ;
             copiaValoresNota();
             Application.CreateForm(Tfrm_cad_fornecedor,frm_cad_fornecedor);
             frm_cad_fornecedor.setCnpjAuxiliar(copy((sender as TCustomEdit).text,7,14));
             frm_cad_fornecedor.ShowModal;
             dm.transacao.Active:=false;
             dm.transacao.Active:=true;

             dm.qryNotasTransporte.Cancel;
             dm.qryNotasTransporte.Active:=false;

            if eventoAuxiliar = 1 then
             begin
               bt_novo.Click;
             end
            else
             begin
              bt_alterar.Click;
              ed_codigo.Text := codNotaAuxiliar;
              retornaInformacoes(codNotaAuxiliar);


             end;


             evento:=eventoAuxiliar;
             retornaValoresNota ;
             edChaveCTE.SetFocus;
             dm.qryNotasTransporteNUMERO_NOTA.Value := copy((sender as TCustomEdit).text,26,9);
             dm.qryNotasTransporteSERIE.Value := copy((sender as TCustomEdit).text,23,3);
             


         end;
      end;


   end;



  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edNumeroNotaFiscal') then
   begin
    if trim(edNumeroNotaFiscal.Text) = '' then exit;

    if (evento  = 1 ) then
     begin
       try
         edNumeroNotaFiscal.Text:= FormatFloat('000000000',StrToFloat(edNumeroNotaFiscal.Text));
       except
         begin
          showmessage('Número da nota fiscal inválido!');
          edNumeroNotaFiscal.SetFocus;
          exit;
         end;
       end;

{
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
 }
     end;
   end;

end;




procedure TfrmCadNotasTransporte.copiaValoresNota ();
begin

 xCodFornecedor := dm.qryNotasTransporteCOD_FORNECEDOR.Value;
 xChaveCTE      := dm.qryNotasTransporteCHAVE_CTE.Value;
 xTipoDOC       := rdTipoDOC.ItemIndex;
 xTipoCTE       := rdTipoDCTE.ItemIndex;

 xNumero_nota   := dm.qryNotasTransporteNUMERO_NOTA.Value;
 xSerie         := dm.qryNotasTransporteSERIE.Value;
 xsub_serie     := dm.qryNotasTransporteSUB_SERIE.Value;
 xDataEmissao   := dm.qryNotasTransporteDATA_EMISSAO.Value;
 xDataServico   := dm.qryNotasTransporteDATA_SERVICO.Value;
 xModeloNota    := dm.qryNotasTransporteMODELO_NOTA.Value;
 xSituacao      := dm.qryNotasTransporteSITUACAO.Value;
 xCST           := dm.qryNotasTransporteCST_ICMS.Value;
 xCFOP          := dm.qryNotasTransporteCFOP.Value;

 xID_FRETE      := rdTipoFrete.ItemIndex;

 xValorServico  := dm.qryNotasTransporteVALOR_SERVICO.Value;
 xDesconto      := dm.qryNotasTransporteDESCONTO.Value;
 xBaseICMS      := dm.qryNotasTransporteBASE_ICMS.Value;
 xREDUCAO       := dm.qryNotasTransporteREDUCAO_BASE_ICMS.Value;
 xALIQ_ICMS     := dm.qryNotasTransporteALIQ_ICMS.Value;
 xValorICMS     := dm.qryNotasTransporteVALOR_ICMS.Value;
 xValorNaoTributado := dm.qryNotasTransporteVALOR_NAO_TRIBUTADO.Value;
 xValorDoc          := dm.qryNotasTransporteVALOR_DOC.Value;





end;




procedure TfrmCadNotasTransporte.retornaValoresNota ();
begin

 dm.qryNotasTransporteCOD_FORNECEDOR.Value := xCodFornecedor;
 dm.qryNotasTransporteCHAVE_CTE.Value     :=xChaveCTE;
 rdTipoDOC.ItemIndex                      := xTipoDOC;
 rdTipoDCTE.ItemIndex                     := xTipoCTE;

 dm.qryNotasTransporteNUMERO_NOTA.Value   := xNumero_nota;
 dm.qryNotasTransporteSERIE.Value         := xSerie;
 dm.qryNotasTransporteSUB_SERIE.Value     := xsub_serie;
 dm.qryNotasTransporteDATA_EMISSAO.Value  := xDataEmissao;
 dm.qryNotasTransporteDATA_SERVICO.Value  := xDataServico;
 dm.qryNotasTransporteMODELO_NOTA.Value   := xModeloNota;
 dm.qryNotasTransporteSITUACAO.Value      := xSituacao;
 dm.qryNotasTransporteCST_ICMS.Value      := xCST;
 dm.qryNotasTransporteCFOP.Value          := xCFOP;

 rdTipoFrete.ItemIndex                    := xID_FRETE;

 dm.qryNotasTransporteVALOR_SERVICO.Value := xValorServico;
 dm.qryNotasTransporteDESCONTO.Value      := xDesconto;
 dm.qryNotasTransporteBASE_ICMS.Value       	:= xBaseICMS;
 dm.qryNotasTransporteREDUCAO_BASE_ICMS.Value :=xREDUCAO;
 dm.qryNotasTransporteALIQ_ICMS.Value           := xALIQ_ICMS;
 dm.qryNotasTransporteVALOR_ICMS.Value          :=xValorICMS;
 dm.qryNotasTransporteVALOR_NAO_TRIBUTADO.Value := xValorNaoTributado;
 dm.qryNotasTransporteVALOR_DOC.Value           := xValorDoc;





end ;


procedure TfrmCadNotasTransporte.gravar_informacoes();
begin
   if (evento = 1) then
   begin
     dm.qryNotasTransporteCODIGO.Value := dm.geraCodigo('G_NOTAS_TRANSPORTE',6);
     dm.qryNotasTransporteNUMERO_NOTA.Value :=FormatFloat('000000000',StrToFloat(dm.qryNotasTransporteNUMERO_NOTA.Value));
   end;
                                                                    
 if ( (evento = 1) or (evento=2) ) then
   begin

    dm.qryNotasTransporteID_FRETE.Value := rdTipoFrete.ItemIndex;
    dm.qryNotasTransporteDATA_LANCAMENTO.Value :=  data_do_sistema;

    if rdTipoDOC.ItemIndex  = 0 then
     begin
         dm.qryNotasTransporteMODELO_NOTA.Value := '08';      
         dm.qryNotasTransporteTIPODOC.Value :=0;
     end
    else
     begin
         dm.qryNotasTransporteMODELO_NOTA.Value := '57';
         dm.qryNotasTransporteTIPODOC.Value :=1;         
     end;


    dm.qryNotasTransporteTIPO_CTE.Value := formatFloat('0',rdTipoDCTE.ItemIndex);

    dm.qryNotasTransporte.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryNotasTransporte]);
   end
 else
  begin
    if (MessageBox(0, 'Confirma exclusão desta nota ? ', 'Exclusão de nota', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) in [idYes]) then
      begin
       dm.qryNotasTransporte.Delete;
       dm.dbrestaurante.ApplyUpdates([dm.qryNotasTransporte]);
      end
    else
      bt_cancelar.Click;
  end;
end;



function TfrmCadNotasTransporte.verificaValidade() : boolean;
begin



  try
    edNumeroNotaFiscal.Text:= FormatFloat('000000000',StrToFloat(edNumeroNotaFiscal.Text));
  except
    begin
     showmessage('Número da nota fiscal inválido!');
     edNumeroNotaFiscal.SetFocus;
     Result := false;
     exit;
    end;
  end;



  if  ( verificaExistenciaSituacaoDocumentoFiscal(edCodSituacaoDocFiscal.Text) = false) then
   begin
     showmessage('Situação do documento fiscal inválida!');
     edCodSituacaoDocFiscal.SetFocus;
     Result := false;
     exit;
   end;



  if (verificaExistenciaCFOP(ed_cfop.Text) = false ) then
   begin
     ShowMessage('CFOP inválido!');
     ed_cfop.SetFocus;
     Result := false;
     exit;
   end;

  if (verificaExistenciaCST(ed_cst.Text) = false) then
   begin
     ShowMessage('CST inválido!');
     ed_cst.SetFocus;
     Result := false;
     exit;
   end;






  if  ( (dm.qryNotasTransporte.FieldByName('VALOR_SERVICO').Value = null) or (dm.qryNotasTransporte.FieldByName('VALOR_SERVICO').Value <= 0) ) then
   begin
    ShowMessage('Valor do serviço é inválido!');
    DBEdit7.SetFocus;
    result:=false;
    exit;
   end;

  if  ( (dm.qryNotasTransporte.FieldByName('DESCONTO').Value = null) or (dm.qryNotasTransporte.FieldByName('DESCONTO').Value < 0) ) then
   begin
    ShowMessage('Valor do desconto inválido!');
    DBEdit4.SetFocus;
    result:=false;
    exit;
   end;


  if  ( (dm.qryNotasTransporte.FieldByName('BASE_ICMS').Value = null) or (dm.qryNotasTransporte.FieldByName('BASE_ICMS').Value < 0) ) then
   begin
    ShowMessage('Base do ICMS inválida!');
    DBEdit5.SetFocus;
    result:=false;
    exit;
   end;


  if  ( (dm.qryNotasTransporte.FieldByName('REDUCAO_BASE_ICMS').Value = null) or (dm.qryNotasTransporte.FieldByName('REDUCAO_BASE_ICMS').Value < 0) ) then
   begin
    ShowMessage('Redução da Base do ICMS inválida!');
    DBEdit6.SetFocus;
    result:=false;
    exit;
   end;

  if  ( (dm.qryNotasTransporte.FieldByName('ALIQ_ICMS').Value = null) or (dm.qryNotasTransporte.FieldByName('ALIQ_ICMS').Value < 0) ) then
   begin
    ShowMessage('Alíquota do ICMS inválida!');
    edAliquotaICMS.SetFocus;
    result:=false;
    exit;
   end;


  if  ( (dm.qryNotasTransporte.FieldByName('VALOR_NAO_TRIBUTADO').Value = null) or (dm.qryNotasTransporte.FieldByName('VALOR_NAO_TRIBUTADO').Value < 0) ) then
   begin
    ShowMessage('Valor não tributado inválido!');
    DBEdit8.SetFocus;
    result:=false;
    exit;
   end;

  if  ( (dm.qryNotasTransporte.FieldByName('VALOR_ICMS').Value = null) or (dm.qryNotasTransporte.FieldByName('VALOR_ICMS').Value < 0) ) then
   begin
    ShowMessage('Valor do ICMS inválido!');
    DBEdit10.SetFocus;
    result:=false;
    exit;
   end;



  if  ( (dm.qryNotasTransporte.FieldByName('VALOR_DOC').Value = null) or (dm.qryNotasTransporte.FieldByName('VALOR_DOC').Value < 0) ) then
   begin
    ShowMessage('Valor do documento inválido!');
    edValorMercadorias.SetFocus;
    result:=false;
    exit;
   end;


   result := true;
end;


procedure TfrmCadNotasTransporte.bt_gravarClick(Sender: TObject);
begin
if verificaValidade then
 begin
  gravar_informacoes();
  inherited;
 end;

end;

procedure TfrmCadNotasTransporte.ed_codigoExit(Sender: TObject);
begin
  inherited;
  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
    begin
      if Trim(ed_codigo.Text) = '' then exit;
      try
        ed_codigo.Text:=FormatFloat('000000',StrTOFloat(ed_codigo.text));
      except
       begin
         ShowMessage('Código inválido!');
         ed_codigo.clear;
         ed_codigo.SetFocus;
         exit;
       end;
      end;

      if ( verificaExistenciaNotaTransportadora (trim(ed_codigo.Text)) = true)
        then
          retornaInformacoes(ed_codigo.text)
        else
          begin
           ShowMessage('Entrada inexistente!');
           ed_codigo.clear;
           ed_codigo.SetFocus;
           exit;
          end;
    end;
end;


procedure TfrmCadNotasTransporte.retornaInformacoes(codigo : string);
begin
  dm.transacao.Active :=false;
  dm.transacao.Active :=true;
  dm.qryNotasTransporte.SQL.Clear;

  dm.qryNotasTransporte.SQL.add('      select nt.*, f.razao_social, f.cgc_cpf,');
  dm.qryNotasTransporte.SQL.add('           cf.descricao as desc_cfop,');
  dm.qryNotasTransporte.SQL.add('           cs.descricao as desc_cst,');
  dm.qryNotasTransporte.SQL.add('           m.descricao as desc_modelo,');
  dm.qryNotasTransporte.SQL.add('           s.descricao as desc_situacao');
  dm.qryNotasTransporte.SQL.add('     from notas_transporte nt');
  dm.qryNotasTransporte.SQL.add('      inner join fornecedor f on (f.cod_fornecedor = nt.cod_fornecedor)');
  dm.qryNotasTransporte.SQL.add('      inner join cfop cf on (cf.codigo = nt.cfop)');
  dm.qryNotasTransporte.SQL.add('      inner join cst cs on (cs.cst = nt.cst_icms)');
  dm.qryNotasTransporte.SQL.add('      inner join modelos_nf m on (m.codigo = nt.modelo_nota)');
  dm.qryNotasTransporte.SQL.add('      inner join situacao_documento s on (s.cod_situacao = nt.situacao)');
  dm.qryNotasTransporte.sql.add(' where nt.codigo='+Quotedstr(codigo));

//  frm_principal.memo_avisos.Visible := true;
 // frm_principal.memo_avisos.Lines  := dm.qryNotasTransporte.SQL;

  dm.qryNotasTransporte.Active := true;
  rdTipoFrete.ItemIndex := dm.qryNotasTransporteID_FRETE.Value;
  rdTipoDOC.ItemIndex :=  dm.qryNotasTransporteTIPODOC.Value;
  rdTipoDCTE.ItemIndex := StrToInt(dm.qryNotasTransporteTIPO_CTE.Value);

  if (evento = 2)then
   begin
    dm.qryNotasTransporte.Edit;
   end;

  if ((evento=2) or (evento = 3)) then
     bt_gravar.Enabled:=true;


end;

end.
