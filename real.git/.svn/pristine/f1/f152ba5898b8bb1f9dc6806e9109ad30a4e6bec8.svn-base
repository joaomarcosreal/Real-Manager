unit uuReimpressaoDanfeNFCE;

interface

uses
  Windows, uu_frm_principal, Messages, SysUtils, uu_data_module, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
   Mask,  JvExControls, JvButton, JvTransparentButton, pcnConversaoNFe, Data.DB,
  RxToolEdit, System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList,
  CurvyControls, uuCancelaNFCEChave, IBX.IBScript, Vcl.Menus, uufrmCartaCorrecao;

type
  TfrmGerenciamentoVendasCaixa = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    pnl1: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    JvTransparentButton1: TJvTransparentButton;
    btConsultarProdutos: TJvTransparentButton;
    JvTransparentButton2: TJvTransparentButton;
    JvTransparentButton3: TJvTransparentButton;
    JvTransparentButton4: TJvTransparentButton;
    GroupBox2: TGroupBox;
    Panel5: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    ed_data_inicial: TDateEdit;
    ed_data_final: TDateEdit;
    edNotaInicial: TEdit;
    Label4: TLabel;
    edNotaFinal: TEdit;
    Label5: TLabel;
    btPesquisar: TBitBtn;
    Label2: TLabel;
    rdgPDV: TRadioGroup;
    edNumeroPDV: TEdit;
    rdgTipoVenda: TRadioGroup;
    rdgDocumento: TRadioGroup;
    img: TImageList;
    img2: TImageList;
    edMesa: TEdit;
    Label6: TLabel;
    Label8: TLabel;
    edValor: TEdit;
    JvTransparentButton5: TJvTransparentButton;
    JvTransparentButton6: TJvTransparentButton;
    PopupMenu1: TPopupMenu;
    VisualizarDanfe1: TMenuItem;
    ReimprimirDanfe1: TMenuItem;
    Cartadecorreo1: TMenuItem;
    CancelarNFENFCe1: TMenuItem;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btConsultarProdutosClick(Sender: TObject);
    procedure JvTransparentButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvTransparentButton3Click(Sender: TObject);
    procedure JvTransparentButton4Click(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure rdgPDVClick(Sender: TObject);
    procedure edNumeroPDVExit(Sender: TObject);
    procedure JvTransparentButton2Click(Sender: TObject);
    procedure JvTransparentButton5Click(Sender: TObject);
    procedure JvTransparentButton6Click(Sender: TObject);
    procedure VisualizarDanfe1Click(Sender: TObject);
    procedure ReimprimirDanfe1Click(Sender: TObject);
    procedure CancelarNFENFCe1Click(Sender: TObject);
    procedure Cartadecorreo1Click(Sender: TObject);
  private
    procedure reimprimirDanfe(visualizar: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerenciamentoVendasCaixa: TfrmGerenciamentoVendasCaixa;

implementation



{$R *.dfm}

procedure TfrmGerenciamentoVendasCaixa.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  {
  if odd(dm.qryVendasCaixa.RecNo) then
DBGrid1.Canvas.Brush.Color:= clwhite
else
DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
   }

   if dm.qryVendasCaixa.IsEmpty  then
    exit;


   if Column.FieldName = 'TIPO_VENDA' then
   begin
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);       

      case StrToInt(Column.Field.AsString) of
        1: img.Draw(DBGrid1.Canvas,Rect.Left+10,Rect.Top+1,0);
        2: img.Draw(DBGrid1.Canvas,Rect.Left+10,Rect.Top+1,1);
        3: img.Draw(DBGrid1.Canvas,Rect.Left+10,Rect.Top+1,2);
      end;


   end;
        {

if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin

  Font.Color := clBlack;
//  Font.Size :=   Font.Size + 2;
//  Font.Style:= [fsbold];

//  TDbGrid(Sender).Canvas.font.Color:= clb;
  Brush.Color:=4099549;
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
       }

end;

procedure TfrmGerenciamentoVendasCaixa.edNumeroPDVExit(Sender: TObject);
begin
  inherited;
  try
    edNumeroPDV.Text := FormatFloat('000',StrToFloat(edNumeroPDV.Text));
  except
   begin
     ShowMessage('Número do PDV inválido!');
     edNumeroPDV.Clear;
     edNumeroPDV.Visible := false;
      rdgPDV.ItemIndex :=0;
   end;
  end;
end;

procedure TfrmGerenciamentoVendasCaixa.btConsultarProdutosClick(Sender: TObject);
begin
  inherited;
  dm.qryVendasCaixa.Prior;
end;

procedure TfrmGerenciamentoVendasCaixa.JvTransparentButton1Click(Sender: TObject);
begin
  inherited;
  dm.qryVendasCaixa.Next;
end;

procedure TfrmGerenciamentoVendasCaixa.JvTransparentButton2Click(
  Sender: TObject);
begin
  inherited;
   if dm.verificaPermissaoAcao('I20002017') = false then
    exit
  else
   begin
     dm.reimprimirDanfe(dm.qryVendasCaixaCHAVE_NFCE.Value,1,false,false);
//    reimprimirDanfe(false);
   end;
end;

procedure TfrmGerenciamentoVendasCaixa.reimprimirDanfe(visualizar : boolean);
var
 localArquivoXML : string;
begin
  inherited;
   if dm.verificaPermissaoAcao('I20002017') = false then
    exit;

  if ( (dm.qryVendasCaixaMODELO_COMPROVANTE.Value = 2 ) or (dm.qryVendasCaixaMODELO_COMPROVANTE.Value = 3 ) ) then
   begin
     dm.ACBrNFe1.NotasFiscais.Clear;

     if (dm.qryVendasCaixaMODELO_COMPROVANTE.Value = 2 ) then  // Se for NFC-e
      begin
        dm.parametrizaAcbrNFE(moNFCe,visualizar,true);


        if visualizar = false then
         begin
            try
              dm.configuraImpressoraNFCE();
            except
               begin
                dm.exibe_painel_erro('Erro ao comunicar com a impressora de NFC-e!','fechar');
                exit;
               end;
            end;
         end;

           dm.ACBrNFe1.NotasFiscais.LoadFromString (dm.qryVendasCaixaXML_DOC.Value);
           dm.ACBrNFe1.NotasFiscais[0].Imprimir;
           dm.ACBrPosPrinter1.CortarPapel(true);
//         end;
      end

     else    // Se for NF-e
      begin
           dm.ACBrNFe1.NotasFiscais.LoadFromString(dm.qryVendasCaixaXML_DOC.Value);
           dm.ACBrNFe1.NotasFiscais[0].Imprimir;
      end;


   end
  else
   begin
     if (dm.qryVendasCaixaMODELO_COMPROVANTE.Value = 4) then
      begin
        dm.parametrizaAcbrNFE(moNFCe,visualizar,true);
        try
          dm.configuraImpressoraNFCE();
        except
           begin
            dm.exibe_painel_erro('Erro ao comunicar com a impressora de NFC-e!','fechar');
            exit;
           end;
        end;

//
        localArquivoXML := dm.LeIni(2,'SAT','caminhoArquivosXML')+'\'+FormatDateTime('YYYMM',dm.qryVendasCaixaDATA_SO.Value  );
        localArquivoXML := localArquivoXML +'\'+'AD'+dm.qryVendasCaixaCHAVE_NFCE.Value+'.xml';                                       ;

//        dm.sat.CFe.LoadFromString(dm.qryVendasCaixaXML_DOC.Value);
        dm.sat.ImprimirExtrato();
        dm.ACBrPosPrinter1.CortarPapel(true);
      end

     else
      begin
       exibe_painel_erro('O Documento de encerramento desta venda não foi uma NFE ou NFC-e!', 'Ok');
       exit;
      end;
   end;

end;

procedure TfrmGerenciamentoVendasCaixa.ReimprimirDanfe1Click(Sender: TObject);
begin
  inherited;
JvTransparentButton2.Click;
end;

procedure TfrmGerenciamentoVendasCaixa.VisualizarDanfe1Click(Sender: TObject);
begin
  inherited;
JvTransparentButton5.Click;
end;

procedure TfrmGerenciamentoVendasCaixa.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qryVendasCaixa.Active := false;
  ed_data_inicial.Date := data_do_sistema;
  ed_data_final.Date := data_do_sistema;
  edNotaInicial.Text  := '0';
  edNotaFinal.Text    := '999999999';
  btPesquisar.Click;




end;

procedure TfrmGerenciamentoVendasCaixa.JvTransparentButton3Click(
  Sender: TObject);
var
 localArquivoXML : string;
 localArquivoCancelamento : string;
 codVenda : string;
 XMLDocumentoFiscal : WideString;
 resposta : string;

 retConsultaNFCE : smallint;
 retCancelamento : smallint;

begin
  inherited;
   if dm.verificaPermissaoAcao('I20002018') = false then
    exit;

//  resposta :='';
//  InputQuery('Confirmação o cancelamento desta nota ?','Digite SIM em letras MAÍSCULAS.'+#10+#10+' Deseja mesmo continuar ? ',resposta);
//  if trim(resposta) ='SIM' then
//  begin
     if MessageDlg('Tem certeza que deseja cancelar  ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
      begin

      end
     else
      begin
        exit;
      end;
//
//  end
//   else
//    begin
//      exit;
//    end;



  codVenda := DM.qryVendasCaixaCOD_VENDA.Value;
  if ( (dm.qryVendasCaixaMODELO_COMPROVANTE.Value = 2 ) or (dm.qryVendasCaixaMODELO_COMPROVANTE.Value = 3 ) ) then
   begin
     dm.ACBrNFe1.NotasFiscais.Clear;


        if ( dm.qryVendasCaixaPROTOCOLO_NFCE.Value ='CONTINGENCIA') then
          begin
            exibe_painel_erro('Venda emitida em contingência. É necessário enviar as notas em contingência antes de realizar o seu cancelamento!','Ok');
            exit;
          end
        else
          begin

            XMLDocumentoFiscal := dm.qryVendasCaixaXML_DOC.Value;

            if (dm.qryVendasCaixaMODELO_COMPROVANTE.Value = 2) then
             dm.parametrizaAcbrNFE(moNFCe,false,true)
            else
             dm.parametrizaAcbrNFE(moNFe,false,true);




            dm.adicionaLog('consulta a nota para ver o estado na sefaz');
            dm.adicionaLog('XML DA NOTA: ');
            dm.adicionaLog(XMLDocumentoFiscal);
            dm.ACBrNFe1.NotasFiscais.Clear;
            dm.ACBrNFe1.NotasFiscais.LoadFromString(XMLDocumentoFiscal);
            dm.ACBrNFe1.Consultar;
            dm.adicionaLog('Retorno do método de consulta : '+IntToStr(retConsultaNFCE));

            retConsultaNFCE :=  DM.ACBrNFe1.WebServices.Consulta.cStat;

            if (retConsultaNFCE = 100) or (retConsultaNFCE =150) then
             begin
              dm.adicionaLog('a nota não está cancelada, Chama o método de cancelamento!');
              dm.cancelaNFCE(dm.qryVendasCaixaCHAVE_NFCE.Value,
              dm.qryVendasCaixaPROTOCOLO_NFCE.Value,dm.qryVendasCaixa.FieldByName('serie_nfce').Value,
                             dm.qryVendasCaixaNUMERO_NFCE.value, 'ERRO NA EMISSÃO DA NFC-e');

              Sleep(1000);

              dm.ACBrNFe1.NotasFiscais.Clear;
              dm.ACBrNFe1.NotasFiscais.LoadFromString(XMLDocumentoFiscal);
              dm.ACBrNFe1.Consultar;
              retConsultaNFCE := DM.ACBrNFe1.WebServices.Consulta.cStat;
              dm.adicionaLog('Retorno do método de consulta : '+IntToStr(retConsultaNFCE));
             end;




            if (retConsultaNFCE = 101) or (retConsultaNFCE =151) then
             begin

                XMLDocumentoFiscal := dm.ACBrNFe1.NotasFiscais[0].XML;
                dm.qryauxiliar.Active := false;
                dm.qryauxiliar.SQL.Clear;


                dm.qryauxiliar.SQL.Add(' insert into vendas_canceladas(');
                dm.qryauxiliar.SQL.Add('             COD_VENDA,DATA,HORA,DATA_SO,DATA_ECF,HORA_ECF,VALOR_BRUTO,VALOR_DESCONTO,');
                dm.qryauxiliar.SQL.Add('             VALOR_TXSERV,REPIQUE,VALOR_TOTAL,TOTAL_PAGO,VALOR_TROCO,COD_USUARIO,NUMERO_CAIXA,');
                dm.qryauxiliar.SQL.Add('             PROCESSADA,NV,MESA,IMP,COD_CAIXA,TIPO_VENDA,COD_PEDIDO_DELIVERY,CCF_CUPOM,COO_CUPOM,');
                dm.qryauxiliar.SQL.Add('             NUM_SERIE_ECF,QTDE_PESSOAS,VALOR_TX_ENTREGA,REDUCAO_Z,SELECIONADO,DESCONTO_TAXAS,CHAVE_NFCE,');
                dm.qryauxiliar.SQL.Add('             NUMERO_NFCE,SERIE_NFCE,PROTOCOLO_NFCE,RECIBO_NFCE,OBS_NFCE,CONSULTA_OK,ARQ,COD_EMPRESA,');
                dm.qryauxiliar.SQL.Add('             PERCENTUAL_DESCONTO,LOTE_EXPORTACAO_WEB,COD_GARCON_ABRIU,MODELO_COMPROVANTE,COD_FORNECEDOR,');
                dm.qryauxiliar.SQL.Add('             SESSAO_SAT,CNF_SAT,XML_DOC,COD_USUARIO_CANCELAMENTO)');
                dm.qryauxiliar.SQL.Add('    select ');
                dm.qryauxiliar.SQL.Add('             COD_VENDA,DATA,HORA,DATA_SO,DATA_ECF,HORA_ECF,VALOR_BRUTO,VALOR_DESCONTO,');
                dm.qryauxiliar.SQL.Add('             VALOR_TXSERV,REPIQUE,VALOR_TOTAL,TOTAL_PAGO,VALOR_TROCO,COD_USUARIO,NUMERO_CAIXA,');
                dm.qryauxiliar.SQL.Add('             PROCESSADA,NV,MESA,IMP,COD_CAIXA,TIPO_VENDA,COD_PEDIDO_DELIVERY,CCF_CUPOM,COO_CUPOM,');
                dm.qryauxiliar.SQL.Add('             NUM_SERIE_ECF,QTDE_PESSOAS,VALOR_TX_ENTREGA,REDUCAO_Z,SELECIONADO,DESCONTO_TAXAS,CHAVE_NFCE,');
                dm.qryauxiliar.SQL.Add('             NUMERO_NFCE,SERIE_NFCE,PROTOCOLO_NFCE,RECIBO_NFCE,OBS_NFCE,CONSULTA_OK,ARQ,COD_EMPRESA,');
                dm.qryauxiliar.SQL.Add('             PERCENTUAL_DESCONTO,LOTE_EXPORTACAO_WEB,COD_GARCON_ABRIU,MODELO_COMPROVANTE,COD_FORNECEDOR,');
                dm.qryauxiliar.SQL.Add('             SESSAO_SAT,CNF_SAT,XML_DOC,'+Quotedstr(codigo_usuario_responsavel));
                dm.qryauxiliar.SQL.Add(' from vendas where cod_venda='+Quotedstr(codVenda));
                dm.adicionaLog(dm.qryauxiliar.SQL.Text);
                dm.qryauxiliar.ExecSQL;

                dm.qryauxiliar.Active := false;
                dm.qryauxiliar.SQL.Clear;
                dm.qryauxiliar.SQL.Clear;
                dm.qryauxiliar.SQL.Add('   insert into movimento_venda_cancelada  ( ');
                dm.qryauxiliar.SQL.Add('        COD_VENDA,COD_MESA,COD_PRODUTO,COMANDA,COD_GARCON,DATA,');
                dm.qryauxiliar.SQL.Add('        HORA,COD_USUARIO,NUMERO_CAIXA,PROCESSADA,QUANTIDADE,VALOR_UNITARIO,');
                dm.qryauxiliar.SQL.Add('        IMP,COD_METRE,DATA_ECF,COD_ALIQUOTA,COD_CAIXA,ACRESIMO,DESCONTO,HORA_ECF,');
                dm.qryauxiliar.SQL.Add('        COO_CUPOM,CCF_CUPOM,NUM_SERIE_ECF,REDUCAO_Z,HORA_LANCAMENTO,ID,LOTE_EXPORTACAO_WEB,');
                dm.qryauxiliar.SQL.Add('        COD_EMPRESA,CFOP,CST,BASE_ICMS_UNIT,ID_CHAVE)');
                dm.qryauxiliar.SQL.Add('       select');
                dm.qryauxiliar.SQL.Add('        COD_VENDA,COD_MESA,COD_PRODUTO,COMANDA,COD_GARCON,DATA,');
                dm.qryauxiliar.SQL.Add('        HORA,COD_USUARIO,NUMERO_CAIXA,PROCESSADA,QUANTIDADE,VALOR_UNITARIO,');
                dm.qryauxiliar.SQL.Add('        IMP,COD_METRE,DATA_ECF,COD_ALIQUOTA,COD_CAIXA,ACRESIMO,DESCONTO,HORA_ECF,');
                dm.qryauxiliar.SQL.Add('        COO_CUPOM,CCF_CUPOM,NUM_SERIE_ECF,REDUCAO_Z,HORA_LANCAMENTO,ID,LOTE_EXPORTACAO_WEB,');
                dm.qryauxiliar.SQL.Add('        COD_EMPRESA,CFOP,CST,BASE_ICMS_UNIT,ID_CHAVE');
                dm.qryauxiliar.SQL.Add(' from movimento_venda where cod_venda='+Quotedstr(codVenda));
                dm.adicionaLog(dm.qryauxiliar.SQL.Text);
                dm.qryauxiliar.ExecSQL;



                dm.qryauxiliar.Active := false;
                dm.qryauxiliar.SQL.Clear;
                dm.qryauxiliar.SQL.Add(' insert into recebimentos_cancelados ( ');
                dm.qryauxiliar.SQL.Add('   COD_VENDA,COD_FORMA,VALOR,DATA,COD_USUARIO,NUMERO_CAIXA, ');
                dm.qryauxiliar.SQL.Add('    PROCESSADO,IMP,COD_CAIXA,COD_CLIENTE,COD_EMPRESA,LOTE_EXPORTACAO_WEB,ID)');
                dm.qryauxiliar.SQL.Add('    select   COD_VENDA,COD_FORMA,VALOR,DATA,COD_USUARIO,NUMERO_CAIXA,');
                dm.qryauxiliar.SQL.Add('    PROCESSADO,IMP,COD_CAIXA,COD_CLIENTE,COD_EMPRESA,LOTE_EXPORTACAO_WEB,ID');
                dm.qryauxiliar.SQL.Add(' from recebimentos where cod_venda='+Quotedstr(codVenda));
                dm.adicionaLog(dm.qryauxiliar.SQL.Text);
                dm.qryauxiliar.ExecSQL;

                dm.qryauxiliar.Active := false;
                dm.qryauxiliar.SQL.Clear;
                dm.qryauxiliar.SQL.Add('delete from vendas where cod_venda='+Quotedstr(codVenda));
                dm.adicionaLog(dm.qryauxiliar.SQL.Text);
                dm.qryauxiliar.ExecSQL;

                dm.qryauxiliar.Active := false;
                dm.qryauxiliar.SQL.Clear;
                dm.qryauxiliar.SQL.Add(' update vendas_canceladas set xml_doc='+Quotedstr(XMLDocumentoFiscal));
                dm.qryauxiliar.SQL.Add('  where cod_venda='+Quotedstr(codVenda));
                dm.adicionaLog(dm.qryauxiliar.SQL.Text);
                dm.qryauxiliar.ExecSQL;
                dm.transacao.Commit;

                dm.ACBrNFe1.NotasFiscais[0].GravarXML('CANC_'+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'.xml',localArquivoCancelamento);
                DeleteFile(localArquivoXML);


                Showmessage('Nota cancelada!');
             end
            else
             begin
               showmessage('Erro ao cancelar a nota!');
             end;


           end;



   end
  else
   begin
    exibe_painel_erro('O Documento de encerramento desta venda não foi uma NFE ou NFC-e!', 'Ok');
    exit;
   end;



end;

procedure TfrmGerenciamentoVendasCaixa.JvTransparentButton4Click(
  Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmGerenciamentoVendasCaixa.JvTransparentButton5Click(
  Sender: TObject);
begin

 inherited;
   if dm.verificaPermissaoAcao('I20002017') = false then
    exit
  else
   begin
     dm.reimprimirDanfe(dm.qryVendasCaixaCHAVE_NFCE.Value,1,true,false);
//    reimprimirDanfe(false);
   end
end;

procedure TfrmGerenciamentoVendasCaixa.JvTransparentButton6Click(
  Sender: TObject);
begin
  inherited;
   if codigo_usuario = '001' then
    begin
     Application.CreateForm(TfrmCancelaNFCEChave, frmCancelaNFCEChave);
     frmCancelaNFCEChave.ShowModal;
     frmCancelaNFCEChave.Free;
    end
   else
    dm.exibe_painel_erro('Apenas o administrador tem acesso a este recurso!','Ok');
end;

procedure TfrmGerenciamentoVendasCaixa.rdgPDVClick(Sender: TObject);
begin
  inherited;
  if rdgPDV.ItemIndex = 2 then
   begin
    edNumeroPDV.Clear;
    edNumeroPDV.Visible := true;
   end
  else
   begin
    edNumeroPDV.Clear;
    edNumeroPDV.Visible := false;

   end;

end;

procedure TfrmGerenciamentoVendasCaixa.btPesquisarClick(Sender: TObject);
begin
  inherited;

  dm.qryVendasCaixa.Active := false;
  dm.qryVendasCaixa.SQL.clear;
  dm.qryVendasCaixa.SQL.Add(' select  v.cod_venda,v.data_so, v.hora, v.mesa, v.coo_cupom, v.numero_nfce, v.serie_nfce,  v.valor_bruto, v.valor_txserv, v.xml_doc, ');
  dm.qryVendasCaixa.SQL.Add('         v.valor_tx_entrega, v.valor_desconto , v.valor_total, v.modelo_comprovante,');
  dm.qryVendasCaixa.SQL.Add('         v.chave_nfce, v.protocolo_nfce, v.numero_caixa, tipo_venda, ');

  dm.qryVendasCaixa.SQL.Add('         case    ');
  dm.qryVendasCaixa.SQL.Add('           when  v.tipo_venda =1 then '+Quotedstr('Mesa'));
  dm.qryVendasCaixa.SQL.Add('           when  v.tipo_venda =2 then '+Quotedstr('Balcão'));
  dm.qryVendasCaixa.SQL.Add('           when  v.tipo_venda =3 then '+Quotedstr('Deliv.'));
  dm.qryVendasCaixa.SQL.Add('         end  as tipo, ');
  dm.qryVendasCaixa.SQL.Add('         case ');
  dm.qryVendasCaixa.SQL.Add('           when v.modelo_comprovante = 0 then '+Quotedstr('AVULSO'));
  dm.qryVendasCaixa.SQL.Add('           when v.modelo_comprovante = 1 then '+Quotedstr('ECF'));
  dm.qryVendasCaixa.SQL.Add('           when v.modelo_comprovante = 2 then '+Quotedstr('NFC-e'));
  dm.qryVendasCaixa.SQL.Add('           when v.modelo_comprovante = 3 then '+Quotedstr('NF-e'));
  dm.qryVendasCaixa.SQL.Add('           when v.modelo_comprovante = 3 then '+Quotedstr('SAT'));
  dm.qryVendasCaixa.SQL.Add('         end as desc_modelo_comprovante ');


  dm.qryVendasCaixa.SQL.Add('  from vendas v where  v.data_so between '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_inicial.Date  )));
  dm.qryVendasCaixa.sql.add(' and '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_final.date )));


  if ( Trim(edNotaInicial.Text) <> '') then
   begin
      dm.qryVendasCaixa.sql.Add(' and v.numero_nfce  between '+edNotaInicial.Text+' and '+edNotaFinal.Text);
   end;



  case rdgPDV.ItemIndex of
    0: begin

      end;

    1: begin
         dm.qryVendasCaixa.SQL.Add(' and v.numero_caixa='+Quotedstr(numero_caixa));
       end;

    2: begin
         dm.qryVendasCaixa.SQL.Add(' and v.numero_caixa='+Quotedstr(edNumeroPDV.Text));
       end;
  end;




  case rdgTipoVenda.ItemIndex of
    0: begin

      end;

    1: begin
         dm.qryVendasCaixa.SQL.Add(' and v.tipo_venda = 1 ');
       end;

    2: begin
         dm.qryVendasCaixa.SQL.Add(' and v.tipo_venda = 2 ');
       end;

    3: begin
         dm.qryVendasCaixa.SQL.Add(' and v.tipo_venda = 3 ');
       end;

  end;


  case rdgDocumento.ItemIndex of
    0: begin

      end;

    1: begin
         dm.qryVendasCaixa.SQL.Add(' and v.modelo_comprovante = 0 ');
       end;

    2: begin
         dm.qryVendasCaixa.SQL.Add(' and v.modelo_comprovante = 1 ');
       end;

    3: begin
         dm.qryVendasCaixa.SQL.Add(' and v.modelo_comprovante = 2 ');
       end;

    4: begin
         dm.qryVendasCaixa.SQL.Add(' and v.modelo_comprovante = 3 ');
       end;


    5: begin
         dm.qryVendasCaixa.SQL.Add(' and v.modelo_comprovante = 4 ');
       end;



  end;


  if Trim (edMesa.Text) <> '' then
   begin
    try
     edMesa.Text := FormatFloat('0000',StrToFloat(edMesa.Text));
    except
      showmessage('Mesa inválida!');
      edMesa.SetFocus;
      exit;
    end;
     dm.qryVendasCaixa.SQL.Add(' and v.mesa='+Quotedstr(edMesa.Text));
   end;


  if Trim (edValor.Text ) <>''  then
   begin
    try
     edValor.Text := FormatFloat('#0.00', StrToFloat( edValor.Text));

    except
      showmessage('Valor inválido!');
      edValor.SetFocus;
      exit;
    end;
     dm.qryVendasCaixa.SQL.Add(' and v.valor_total='+dm.TrocaVirgPPto(edValor.Text));
   end;










  //dm.qryVendasCaixa.SQL.Add('  from vendas v where v.cod_caixa='+QuotedStr(ultimoCaixaAberto));

  dm.qryVendasCaixa.SQL.Add('  order by cod_venda desc');
  dm.adicionaLog(dm.qryVendasCaixa.SQL.Text);
  dm.qryVendasCaixa.Active := true;
  dm.qryVendasCaixa.First;
         {
  while not dm.qryVendasCaixa.Eof do
   begin


   end;

          }
end;

procedure TfrmGerenciamentoVendasCaixa.CancelarNFENFCe1Click(Sender: TObject);
begin
  inherited;
  JvTransparentButton3.Click;
end;

procedure TfrmGerenciamentoVendasCaixa.Cartadecorreo1Click(Sender: TObject);
begin
  inherited;

  if ( dm.qryVendasCaixaMODELO_COMPROVANTE.Value = 3 ) then
   begin
    string_auxiliar := '';
    Application.CreateForm(TfrmCartaCorrecao, frmCartaCorrecao);
    frmCartaCorrecao.ShowModal;
    frmCartaCorrecao.Free;

    if ( trim(string_auxiliar) <> '' ) then
     begin
       dm.emitirCartaCorrecao( dm.qryVendasCaixaCHAVE_NFCE.Value,string_auxiliar);
     end;

   end
  else
   begin
     exibe_painel_erro('Carta de correção disponível apenas para NF-e (Modelo 55)','Ok');
     exit;
   end;
end;

end.
