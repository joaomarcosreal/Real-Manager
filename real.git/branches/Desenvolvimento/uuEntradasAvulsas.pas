unit uuEntradasAvulsas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibquery, uu_modelo, Grids, DBGrids,  
  StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, RXDBCtrl, ComCtrls, xmldom,
  Provider, Xmlxform, DB, DBClient, Menus, RxCurrEdit, RxToolEdit;


type
  TfrmEntradasAvulsas = class(Tfrm_modelo_cadastro)
    Label7: TLabel;
    Panel8: TPanel;
    Label46: TLabel;
    pvdDadosNota: TXMLTransformProvider;
    cdsDadosNota: TClientDataSet;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    Apagartem1: TMenuItem;
    pnFornecedor: TPanel;
    Label6: TLabel;
    Label30: TLabel;
    edDataEmissaoNotaFiscal: TDBDateEdit;
    edDataEntradaNotaFiscal: TDBDateEdit;
    pn_campos: TPanel;
    pnItens: TPanel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    bt_pesq_item_estoque_cod: TSpeedButton;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    bt_pesq_un_entrada: TSpeedButton;
    Label18: TLabel;
    Label45: TLabel;
    Panel5: TPanel;
    ed_desc_item: TEdit;
    Panel6: TPanel;
    ed_desc_un_entrada: TEdit;
    BitBtn1: TBitBtn;
    ed_cod_item: TEdit;
    EDIquantidade: TCurrencyEdit;
    ed_cod_un_entrada: TEdit;
    edTotalItem: TCurrencyEdit;
    Panel2: TPanel;
    EDIpreco: TCurrencyEdit;
    DBGrid1: TDBGrid;
    Panel7: TPanel;
    edTotalNotaFiscal: TDBEdit;
    Label39: TLabel;
    gpFornecedor: TGroupBox;
    Label2: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    Label1: TLabel;
    ed_cod_fornecedor: TDBEdit;
    Panel1: TPanel;
    ed_razao_social_fornecedor: TDBEdit;
    Panel3: TPanel;


procedure adicionaItemCompra(              ordem : string;
                                           codigo : string;
                                           descricao : string;
                                           quantidade : double;
                                           codUnidade : string;
                                           siglaUnidade : string;
                                           preco : double;
                                           CST   : string;
                                           CFOP  : string;
                                           desconto : double;
                                           outrasDespesasAcessorias : double;
                                           baseICMS : double;
                                           valorICMS : double;
                                           baseICMSST : double;
                                           valorICMSST : double;
                                           valorIPI    : double;
                                           AliquotaICMS : double;
                                           AliquotaIPI : double;
                                           paramUnidade : double;
                                           descUnidade : string) ;


    procedure retornaItensCompra(cod_entrada : string);
    procedure BitBtn1Click(Sender: TObject);
    procedure bt_novoClick(Sender: TObject);
    procedure limpaEditsItem();
    function verificaValidadeLancamentoItemCompra() : boolean;
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);

     //
    function   verificaValidade() : boolean;
    procedure  gravarInformacoes();
    procedure  gravarItensEntrada();
    procedure  atualizaItemEstoque(codItem : string; quantidade : double; parametroUnidCompra : double ; valorUnitario : double; data : string);
    procedure  retornaInformacoes(cod_entrada : string);

    procedure ed_codigoExit(Sender: TObject);
    procedure bt_consultarClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure copiaValoresNota();
    procedure retornaValoresNota();
    procedure recalculaTotaisNota();
    function  ValidaTotaisNota() : boolean;
    procedure novaNota();
    procedure imprimirEspelho(codigo_entrada : string);

    procedure abrirLancamentosRD();

    procedure DBGrid1ColExit(Sender: TObject);
    procedure edit1Exit(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure abrirContasAPagar();
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Apagartem1Click(Sender: TObject);



  private
    { Private declarations }

    xCodLoja,xDescricaoLoja,xCodFornecedor,xRazaoSocial, xCNPJ, xInscricaoEstadual, xCidade,xUF : string;
    xNumeroNota, xSeriaNota, xModeloNota,xDescricaoModeloNota,xCFOPNota,xDescricaoCFOPNota   : string;
    xDataEmissao,xDataEntrada : Tdate;
    xBaseCalculoICMS,xBaseCalculoICMSSub,xvalorICMS,xValorICMSST,xValorProdutos,xValorFrete,xValorSeguro,xValorDesconto,xDespesas,xValorIPI,xTotalNota : double;
    xChaveNFE : string;
    flagValidacaoNota : boolean;
    tentativasValidacao : smallint;
    codigoFornecedor, nomeFornecedor, numeroNotaFiscal,cnpjFornecedor,codLoja,descricaoLoja : string;
    dataEntradaNota : TDate;    
    valorCompra : Currency;
    codigoCompra : string;


  public
    { Public declarations }
  end;

var
  frmEntradasAvulsas: TfrmEntradasAvulsas;
  eventoAuxiliar : integer;
  codNotaAuxiliar : string;

implementation

uses uu_data_module, uu_modelo_vazio, uu_frm_principal, 
  uu_cad_fornecedor,  uu_produtos,
  UU_DM_RELATORIOS, uuContasPagarEntradas, uuCadItemFornecedorEntrada,
  uu_entradas, uuLancamentosRD;

{$R *.dfm}

procedure TfrmEntradasAvulsas.adicionaItemCompra(ordem  : string;
                                           codigo : string;
                                           descricao : string;
                                           quantidade : double;
                                           codUnidade : string;
                                           siglaUnidade : string;
                                           preco : double;
                                           CST   : string;
                                           CFOP  : string;
                                           desconto : double;
                                           outrasDespesasAcessorias : double;
                                           baseICMS : double;
                                           valorICMS : double;
                                           baseICMSST : double;
                                           valorICMSST : double;
                                           valorIPI    : double;
                                           AliquotaICMS : double;
                                           AliquotaIPI : double;
                                           paramUnidade : double;
                                           descUnidade : string);

begin

  dm.tbComprasTemp.Append;
  dm.tbComprasTempordem.Value :=ordem;
  dm.tbComprasTempcodigo.value:= codigo;
  dm.tbComprasTempdescricao.value:= descricao;
  dm.tbComprasTempquantidade.value:= quantidade;
  dm.tbComprasTempcodUnidade.value:= codUnidade;
  dm.tbComprasTempsiglaUnidade.value:= siglaUnidade;
  dm.tbComprasTemppreco.value:= preco;
  dm.tbComprasTempCST.value:= CST;
  dm.tbComprasTempCFOP.value:= CFOP;
  dm.tbComprasTempdesconto.value:= desconto;
  dm.tbComprasTempoutrasDespAcessorias.Value := outrasDespesasAcessorias;
  dm.tbComprasTempbaseICMS.value:= baseICMS;
  dm.tbComprasTempvalorICMS.value:= valorICMS;
  dm.tbComprasTempbaseICMSST.value:= baseICMSST;
  dm.tbComprasTempvalorICMSST.value:= valorICMSST;
  dm.tbComprasTempvalorIPI.value:= valorIPI;
  dm.tbComprasTempAliquotaIPI.value:= AliquotaIPI;
  dm.tbComprasTempaliquotaICMS.Value := AliquotaICMS;
  dm.tbComprasTempparamUnidade.value:= paramUnidade;
  dm.tbComprasTempdescUnidade.value:= descUnidade;
  dm.tbComprasTemp.Post;
  DBGrid1.Refresh;
end;


procedure TfrmEntradasAvulsas.BitBtn1Click(Sender: TObject);
begin
  inherited;



  if verificaValidadeLancamentoItemCompra() then
   begin
     adicionaItemCompra(FormatFloat('000',dm.tbComprasTemp.RecordCount+1),
                       ed_cod_item.text,
                       ed_desc_item.text,
                       EDIquantidade.value,
                       ed_cod_un_entrada.text,
                       'UN',
                       EDIpreco.value,
                       '000',
                       '5102',
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       getParametroUnidade(ed_cod_un_entrada.Text),
                       ed_desc_un_entrada.text
                       );

        recalculaTotaisNota();
        limpaEditsItem;
        ed_cod_item.SetFocus;

   end;
end;

procedure TfrmEntradasAvulsas.bt_novoClick(Sender: TObject);
begin
  inherited;
  novaNota();

  dm.tbComprasTemp.EmptyTable;
  dm.tbComprasTemp.Active:=true;
end;

procedure TfrmEntradasAvulsas.novaNota();
begin
  flagValidacaoNota :=true;
  tentativasValidacao:=0;
  pn_campos.Enabled:=true;
  pn_codigo.Enabled:=false;
  dm.qry_entradas.Active:=true;
  dm.qry_entradas.Append;
  dm.qry_entradasDATA_EMISSAO.Value:=Date;
  dm.qry_entradasDATA_ENTRADA.Value:=Date;
  dm.qry_entradasNUMERO_NOTA.Value:='';
  dm.qry_entradasSERIE_NOTA.Value:='';
  dm.qry_entradasMODELO_NOTA.Value:='';
  dm.qry_entradasBASE_ICMS.Value:=0;
  dm.qry_entradasVALOR_ICMS.Value:=0;
  dm.qry_entradasBASE_ICMS_SUBST.value:=0;
  dm.qry_entradasVALOR_ICMS_SUBST.value:=0;
  dm.qry_entradasVALOR_PRODUTOS.Value:=0;
  dm.qry_entradasFRETE.Value:=0;
  dm.qry_entradasSEGURO.value:=0;
  dm.qry_entradasDESCONTO.value:=0;
  dm.qry_entradasOUTRAS_DESPESAS.Value:=0;
  dm.qry_entradasVALOR_IPI.Value :=0;
  dm.qry_entradasTOTAL_NOTA.value:=0;
  dm.qry_entradasTIPO_ENTRADA.Value := 1;
  ed_cod_fornecedor.SetFocus;


end;


procedure TfrmEntradasAvulsas.limpaEditsItem();
begin
  ed_desc_item.clear;
  ed_cod_item.clear;

  EDIquantidade.value:=0;
  EDIpreco.Value:=0;
  ed_cod_un_entrada.Clear;
  ed_desc_un_entrada.clear;
  edTotalItem.Value :=0;
end;

procedure TfrmEntradasAvulsas.recalculaTotaisNota();
var
totalBaseICMS, totalICMS,totalBaseICMSSUB,totalICMSSUB,totalProdutos,totalIPI,totalDescontos,totalOutrasDespesas : currency;
numeroItem : integer;
begin
 totalProdutos:=0; totalBaseICMS:=0; totalICMS:=0; totalBaseICMSSUB:=0; totalICMSSUB:=0; totalProdutos:=0;
 totalIPI :=0; totalDescontos:=0; totalOutrasDespesas:=0;
 numeroItem := dm.tbComprasTemp.RecNo;

 dm.tbComprasTemp.First;
 while not dm.tbComprasTemp.Eof do
  begin
   totalProdutos := totalProdutos + dm.tbComprasTemptotal.value;
   totalBaseICMS := totalBaseICMS + dm.tbComprasTempbaseICMS.Value;
   totalICMS :=  totalICMS + dm.tbComprasTempvalorICMS.Value;
   totalBaseICMSSUB := totalBaseICMSSUB + dm.tbComprasTempbaseICMSST.Value;
   totalICMSSUB := totalICMSSUB + dm.tbComprasTempvalorICMSST.Value;
   totalIPI := totalIPI + dm.tbComprasTempvalorIPI.Value;
   totalDescontos := totalDescontos + dm.tbComprasTempdesconto.Value;
   totalOutrasDespesas := totalOutrasDespesas + dm.tbComprasTempoutrasDespAcessorias.Value;
   dm.tbComprasTemp.Next;
  end;


  dm.qry_entradasBASE_ICMS.Value         := totalBaseICMS;
  dm.qry_entradasVALOR_ICMS.Value        := totalICMS;
  dm.qry_entradasBASE_ICMS_SUBST.value   :=  totalBaseICMSSUB;
  dm.qry_entradasVALOR_ICMS_SUBST.Value  := totalICMSSUB;
  dm.qry_entradasVALOR_PRODUTOS.Value    := totalProdutos;
  dm.qry_entradasVALOR_IPI.Value         := totalIPI;
  dm.qry_entradasDESCONTO.Value          := totalDescontos;
  dm.qry_entradasOUTRAS_DESPESAS.Value   := totalOutrasDespesas;

  dm.qry_entradasTOTAL_NOTA.Value:= (dm.qry_entradasVALOR_PRODUTOS.Value +
                                    + dm.qry_entradasVALOR_ICMS_SUBST.Value + dm.qry_entradasVALOR_IPI.Value +
                                    dm.qry_entradasFRETE.Value + dm.qry_entradasSEGURO.Value +
                                    dm.qry_entradasOUTRAS_DESPESAS.Value) - dm.qry_entradasDESCONTO.value   ;


  // Reposiciona o cursor no registro que  estava em edição.                                    
  dm.tbComprasTemp.First;
  while numeroItem <> dm.tbComprasTemp.RecNo do
     dm.tbComprasTemp.Next;


end;


function TfrmEntradasAvulsas.ValidaTotaisNota() : boolean;
var
totalBaseICMS, totalICMS,totalBaseICMSSUB,totalICMSSUB,totalProdutos,totalIPI,totalDescontos, totalOutrasDespesas : currency;

begin
 totalProdutos:=0; totalBaseICMS:=0; totalICMS:=0; totalBaseICMSSUB:=0; totalICMSSUB:=0; totalProdutos:=0; totalOutrasDespesas:=0 ;
 totalIPI :=0; totalDescontos:=0;

 dm.tbComprasTemp.First;
 while not dm.tbComprasTemp.Eof do
  begin
   totalProdutos := totalProdutos + dm.tbComprasTemptotal.value;
   totalBaseICMS := totalBaseICMS + dm.tbComprasTempbaseICMS.Value;
   totalICMS :=  totalICMS + dm.tbComprasTempvalorICMS.Value;
   totalBaseICMSSUB := totalBaseICMSSUB + dm.tbComprasTempbaseICMSST.Value;
   totalICMSSUB := totalICMSSUB + dm.tbComprasTempvalorICMSST.Value;
   totalIPI := totalIPI + dm.tbComprasTempvalorIPI.Value;
   totalDescontos := totalDescontos + dm.tbComprasTempdesconto.Value;
   totalOutrasDespesas := totalOutrasDespesas + dm.tbComprasTempoutrasDespAcessorias.Value;
   dm.tbComprasTemp.Next;
  end;


















  Result :=true
end;



function TfrmEntradasAvulsas.verificaValidadeLancamentoItemCompra() : boolean;
var
 cfop : string;
begin
  if verificaExistenciaItemEstoque(ed_cod_item.Text ,1) = false then
   begin
    showmessage('Código de ítem informado não existe!');
    limpaEditsItem();
    ed_cod_item.Clear;
    result:=false;
    exit;
   end;


  if (verificaExistenciaUnidade(ed_cod_un_entrada.Text) =  false) then
  begin
    showmessage('A unidade informada não é válida!');
    ed_cod_un_entrada.SetFocus;
    Result:=false;
    exit;
  end;

  if (EDIquantidade.Value  <= 0) then
  begin
    Showmessage('Quantidade deve ser superior a ZERO!');
    EDIquantidade.SetFocus;
    result:=false;
    exit;
  end;


  if (EDIquantidade.Value  <= 0) then
  begin
    Showmessage('Valor unitário deve ser superior a ZERO!');
    EDIquantidade.SetFocus;
    result:=false;
    exit;
  end;




  Result:=true;
end;

procedure TfrmEntradasAvulsas.bt_cancelarClick(Sender: TObject);
begin
    inherited;
    pn_campos.Enabled:=false;
    dm.qry_entradas.Cancel;
    dm.qry_entradas.Active:=false;
    dm.tbComprasTemp.EmptyTable;
    dm.tbComprasTemp.Close;
end;


function TfrmEntradasAvulsas.verificaValidade() : boolean;
var
 difAnoReferencia : integer;
 cfop : string;
begin

  if ( (dm.qry_entradasDATA_ENTRADA.Value) < (dm.qry_entradasDATA_EMISSAO.value) )then
  begin
    showmessage('Data de entrada não pode ser menor que a data de emissão!!');
    edDataEntradaNotaFiscal .SetFocus;
    Result:=false;
    exit;
  end;



  if ( verificaExistenciaFornecedor(ed_cod_fornecedor.text) = false ) then
  begin
    ShowMessage('Fornecedor especifado não existe!');
    ed_cod_fornecedor.setfocus;
    Result:=false;
    exit;
  end;

  if ( dm.tbComprasTemp.IsEmpty ) then
  begin
    showmessage('É necessário no mínimo um ítem de compra!');
    ed_cod_item.SetFocus;
    Result:=false;
    exit;
  end;




  if validaTotaisNota = true then
    result:=true
  else
     result:=false;

end;


procedure TfrmEntradasAvulsas.gravarInformacoes();
begin
 if (evento = 1) then
   begin
     ed_codigo.Text:=dm.geraCodigo('G_ENTRADAS',8);
     dm.qry_entradasNUMERO_NOTA.Value :=FormatFloat('000000000000000',StrToFloat('1'+formatFloat('0000000',StrToFloat(ed_codigo.Text))));
     numeroNotaFiscal := dm.qry_entradasNUMERO_NOTA.Value ;
     dm.qry_entradasCOD_ENTRADA.Value:=ed_codigo.Text;
     dm.qry_entradasDATA.Value := data_do_sistema;
     dm.qry_entradasHORA.Value := Time;
     dm.qry_entradasQTDE_ITENS.Value:=dm.tbComprasTemp.RecordCount;
     dm.qry_entradasCOD_USUARIO.Value:=codigo_usuario;
     dm.qry_entradasNOME_USUARIO_ENTRADA.Value:=nome_usuario;
     dm.qry_entradasCOD_EMP_GRUPO.Value :=codEmpresa;
//     dm.qry_entradasCOD_FORNECEDOR.Value := '0001';
//     dm.qry_entradasCFOP_NOTA.Value :='1102';
     dm.qry_entradasBASE_ICMS.Value :=0;
     dm.qry_entradasVALOR_ICMS.Value :=0;
     dm.qry_entradasBASE_ICMS_SUBST.Value :=0;
     dm.qry_entradasVALOR_ICMS_SUBST.Value :=0;
     dm.qry_entradasFRETE.Value := 0;
     dm.qry_entradasSEGURO.Value := 0;
     dm.qry_entradasDESCONTO.value :=0;
     dm.qry_entradasOUTRAS_DESPESAS.value := 0;
     dm.qry_entradasVALOR_IPI.value := 0;
     dm.qry_entradasMODELO_NOTA.value :='01';
     dm.qry_entradasSERIE_NOTA.Value :='99';

   end;

 if ( (evento = 1) or (evento=2) )then
   begin
    dm.qry_entradasQTDE_ITENS.Value:=dm.tbComprasTemp.RecordCount;
//    dm.qry_entradas.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qry_entradas]);
    gravarItensEntrada();


   end
 else
  begin



    if (MessageBox(0, 'Confirma exclusão desta entrada ? ', 'Exclusão de entrada', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) in [idYes]) then
      begin
       dm.qry_entradas.Delete;
       dm.transacao.Commit;
      // dm.dbrestaurante.ApplyUpdates([dm.qry_entradas]);
      end
    else
      bt_cancelar.Click;
  end;







end;

procedure TfrmEntradasAvulsas.gravarItensEntrada();
var
 q : TIBQuery;
 ordem : integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.SQL.Clear;
  q.sql.Add('delete from itens_entrada where cod_entrada='+Quotedstr(ed_codigo.Text));
  q.ExecSQL;
  q.Active:=false;
  q.SQL.Clear;

  dm.tbComprasTemp.First;
  ordem :=1;
  while not dm.tbComprasTemp.Eof do
  begin
    q.sql.clear;
    q.SQL.Add('insert into itens_entrada (ORDEM,cod_emp_grupo,');
    q.SQL.Add('    COD_ENTRADA,COD_ITEM,QUANTIDADE,COD_UNIDADE,VALOR_UNITARIO,');
    q.SQL.Add('    DESCRICAO_UNIDADE,ESTOQUE_ANTERIOR,COD_UNIDADE_ESTOQUE_ANTERIOR,');
    q.SQL.Add('    ESTOQUE_ATUALIZADO,DESCRICAO_ITEM,CFOP,CST,');
    q.SQL.Add('    SIGLA_UNID,DESCONTO,outras_despesas,');
    q.SQL.Add('    BASE_ICMS,VALOR_ICMS,');
    q.SQL.Add('    BASE_ICMS_ST,VALOR_ICMS_ST,');
    q.SQL.Add('    VALOR_IPI,ALIQUOTA_IPI,ALIQUOTA_ICMS,data_entrada) values (');

     q.sql.add('' +Quotedstr(IntToStr(ordem))+',');
     q.sql.add('' +Quotedstr('0001')+',');
    q.sql.add('' +Quotedstr(ed_codigo.Text)+',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempcodigo.Value)+',');
    q.SQL.Add('' +dm.TrocaVirgPPto(dm.tbComprasTempquantidade.AsString)+',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempcodUnidade.Value)+',');
    q.sql.add('' +dm.TrocaVirgPPto(dm.tbComprasTemppreco.AsString)+',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempdescUnidade.Value)+',');
    q.sql.add('' +dm.TrocaVirgPPto(floattostr(getEstoqueAtualItemEstoque(dm.tbComprasTempcodigo.Value)))+',');
    q.sql.add('' +Quotedstr(getUnidadeEntradaItem(dm.tbComprasTempcodigo.Value)  )+',');

    // Atualiza o estoque e o cadastro do item

    if ( evento = 1 ) then // Só atualiza o  estoque quando é uma nova entrada, alteração não.
     begin
       atualizaItemEstoque(dm.tbComprasTempcodigo.Value,( dm.tbComprasTempquantidade.value * dm.tbComprasTempparamUnidade.value) ,
                           dm.tbComprasTempparamUnidade.value,dm.tbComprasTemppreco.value,FormaTdateTime('DD.MM.YYY',dm.qry_entradasDATA_ENTRADA.Value));
     end;

   //


    q.sql.add('' +dm.TrocaVirgPPto(floattostr(getEstoqueAtualItemEstoque(dm.tbComprasTempcodigo.Value)))  +',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempdescricao.AsString )+',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempCFOP.Value)+',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempCST.Value)+',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempsiglaUnidade.Value)+',');
    q.sql.add('' +dm.TrocaVirgPPto(dm.tbComprasTempdesconto.AsString)+',');
    q.sql.add('' +dm.TrocaVirgPPto(dm.tbComprasTempoutrasDespAcessorias.AsString)+',');
    q.sql.add('' +dm.TrocaVirgPPto(dm.tbComprasTempbaseICMS.AsString)+',');
    q.sql.add('' +dm.TrocaVirgPPto(dm.tbComprasTempvalorICMS.AsString)+',');
    q.sql.add('' +dm.TrocaVirgPPto(dm.tbComprasTempbaseICMSST.AsString)+',');
    q.sql.add('' +dm.TrocaVirgPPto(dm.tbComprasTempvalorICMSST.AsString)+',');
    q.sql.add('' +dm.TrocaVirgPPto(dm.tbComprasTempvalorIPI.AsString)+',');
    q.sql.add('' +dm.TrocaVirgPPto(dm.tbComprasTempAliquotaIPI.AsString)+',');
    q.sql.add('' +dm.TrocaVirgPPto(dm.tbComprasTempaliquotaICMS.AsString)+',');
    q.sql.add('' +Quotedstr(FormaTdateTime('DD.MM.YYY',dm.qry_entradasDATA_ENTRADA.Value))+')');



    q.ExecSQL;
    ordem := ordem+1;
    dm.tbComprasTemp.next;
  end;
end;

procedure TfrmEntradasAvulsas.atualizaItemEstoque(codItem : string; quantidade : double; parametroUnidCompra : double ; valorUnitario : double; data : string);
var
 novoValorUnitario : double;
 parametroPadraoItem : double;
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  parametroPadraoItem:=getParametroUnidade(getUnidadeEntradaItem(codItem));
  novoValorUnitario:= ( ( parametroPadraoItem * valorUnitario) / parametroUnidCompra);

  q.Active:=false;
  q.sql.clear;
  q.sql.add('update produtos set ');
  q.sql.add(' valor_custo            ='+dm.TrocaVirgPPto(FloatToStr(novoValorUnitario))+',');
  q.sql.add(' estoque_liquido        = estoque_liquido + '+dm.TrocaVirgPPto(FloatToStr(quantidade))+',');
  q.sql.add(' data_ultima_reposicao  = '+Quotedstr(data));
  q.sql.add(' where cod_produto         ='+QUotedstr(codItem));
  q.execsql;

end;

procedure TfrmEntradasAvulsas.bt_gravarClick(Sender: TObject);
begin
if ( verificaValidade() = true ) then
 begin
   codLoja := '0001';
   descricaoLoja := 'MATRIZ';

   codigoFornecedor := ed_cod_fornecedor.Text;
   valorCompra := dm.qry_entradasTOTAL_NOTA.Value;
//   numeroNotaFiscal := edNumeroNotaFiscal.Text;
   nomeFornecedor := ed_razao_social_fornecedor.Text;
   valorCompra := dm.qry_entradasTOTAL_NOTA.Value;
   dataEntradaNota := dm.qry_entradasDATA_ENTRADA.Value;

   gravarInformacoes();
   codigoCompra := ed_codigo.Text;


   if ( (evento = 1) or (evento=2)) then
       begin

          if ( (evento=1) ) then
           begin
             abrirContasAPagar();
//             abrirLancamentosRD();


           end;

          if (MessageBox(0, 'Deseja imprimir o espelho da nota de entrada ?', 'Espelho de nota', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
             imprimirEspelho(ed_codigo.Text);



       end;

       inherited;
   end
end;


procedure TfrmEntradasAvulsas.abrirLancamentosRD();
begin
  Application.CreateForm(TfrmLancamentosRD,frmLancamentosRD);
  frmLancamentosRD.veioDasEntradas := true;
  frmLancamentosRD.codigoEntrada := ed_codigo.text;
  frmLancamentosRD.showmodal;
  frmLancamentosRD.free;


end;

procedure TfrmEntradasAvulsas.abrirContasAPagar();
begin
  application.createForm(TfrmContasApagarEntradas,frmContasApagarEntradas);
  frmContasApagarEntradas.ed_cod_fornecedor.Text := codigoFornecedor;
  frmContasApagarEntradas.ed_razao_social_fornecedor.Text :=   nomeFornecedor;
  frmContasApagarEntradas.edNumeroEntrada.Text := codigoCompra;
  frmContasApagarEntradas.edTotalConta.Value := valorCompra;
  frmContasApagarEntradas.edNumeroNota.Text  := numeroNotaFiscal;
  frmContasApagarEntradas.edCodLoja.Text := codLoja;
  frmContasApagarEntradas.edDescLoja.Text := descricaoLoja;
  frmContasApagarEntradas.edDataRd.Date   :=   dataEntradaNota;
  frmContasApagarEntradas.edDataDoc.Date  :=  dataEntradaNota;



  frmContasApagarEntradas.ShowModal;
  frmContasApagarEntradas.free;

end;


procedure TfrmEntradasAvulsas.ed_codigoExit(Sender: TObject);
begin
  inherited;
  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
    begin
      if Trim(ed_codigo.Text) = '' then exit;

      try
        ed_codigo.Text:=FormatFloat('00000000',StrTOFloat(ed_codigo.text));
      except
       begin
         ShowMessage('Código de entrada inválido!');
         ed_codigo.clear;
         ed_codigo.SetFocus;
         exit;
       end;
      end;

      if ( verificaExistenciaEntrada(trim(ed_codigo.Text)) = true)
        then
          retornaInformacoes(ed_codigo.text)
        else
          begin
            ShowMessage('Codigo de entrada inexistente!!');
            ed_codigo.Clear;
            ed_codigo.SetFocus;
            exit;
          end;
    end;




end;




procedure TfrmEntradasAvulsas.retornaInformacoes(cod_entrada : string);
begin
  dm.qry_entradas.active:=false;
  dm.qry_entradas.sql.clear;

  dm.qry_entradas.SQL.Add('  select e.*,');
  dm.qry_entradas.SQL.Add('   f.razao_social as XRazaoSocial,');
  dm.qry_entradas.SQL.Add('   f.cgc_cpf as xCnpj,');
  dm.qry_entradas.SQL.Add('   f.inscricao_estadual as xInscricaoEstadual,');
  dm.qry_entradas.SQL.Add('   c.nome as XNomeCidade,');
  dm.qry_entradas.SQL.Add('   es.sigla as xUF,');
  dm.qry_entradas.SQL.Add('   mn.descricao as xModeloNota,');
  dm.qry_entradas.SQL.Add('    epg.descricao as xDescricaoLoja');
  dm.qry_entradas.SQL.Add('  from entradas e');
  dm.qry_entradas.SQL.Add('  inner join fornecedor f on (f.cod_fornecedor = e.cod_fornecedor)');
  dm.qry_entradas.SQL.Add('  inner join cidade c on (c.cod_cidade = f.cod_cidade)');
  dm.qry_entradas.SQL.Add('  inner join estado es on (es.codigo = f.cod_estado)');
  dm.qry_entradas.SQL.Add('  inner join modelos_nf mn on (mn.codigo = e.modelo_nota)');
    dm.qry_entradas.SQL.Add('  inner join empresas_grupo epg on (epg.codigo = e.cod_emp_grupo) ');
  dm.qry_entradas.sql.add(' where e.cod_entrada='+Quotedstr(ed_codigo.text));
  dm.qry_entradas.active:=true;

  retornaItensCompra(ed_codigo.Text);
    bt_imprimir.Enabled:=true;

      if (evento = 2)then
       begin
        dm.qry_entradas.Edit;
        pn_campos.Enabled:=true;
       end;

      if ((evento=2) or (evento = 3)) then
        bt_gravar.Enabled:=true;
end;




procedure TfrmEntradasAvulsas.retornaItensCompra(cod_entrada : string);
var
 q : TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;
  dm.tbComprasTemp.Active:=true;
  dm.tbComprasTemp.EmptyTable;
  dm.tbComprasTemp.Active:=false;
  dm.tbComprasTemp.Active:=true;

  q.sql.clear;
  q.sql.add('select ite.*, p.cod_barras, p.descricao, u.descricao as desc_unidade from itens_entrada ite ');
  q.sql.add('  inner join produtos p on (p.cod_produto = ite.cod_item)');
  q.sql.add('  inner join  unidades u  on (u.cod_unidade  = ite.cod_unidade)');
  q.sql.add('  where ite.cod_entrada='+Quotedstr(cod_entrada)+' order by ite.ordem');
  q.active:=true;
  q.First;

  while not q.eof do
  begin

     adicionaItemCompra(q.fieldbyname('ordem').value,
                       q.fieldbyname('cod_item').value,
                       q.fieldbyname('descricao').value,
                       q.fieldbyname('quantidade').value,
                       q.fieldbyname('cod_unidade').value,
                       q.fieldbyname('sigla_unid').value,
                       q.fieldbyname('valor_unitario').value,
                       q.fieldbyname('CST').value,
                       q.fieldbyname('cfop').value,
                       q.fieldbyname('desconto').value,
                       q.fieldbyname('outras_despesas').value,
                       q.fieldbyname('base_icms').value,
                       q.fieldbyname('valor_icms').value,
                       q.fieldbyname('base_icms_st').value,
                       q.fieldbyname('valor_icms_st').value,
                       q.fieldbyname('valor_ipi').value,
                       q.fieldbyname('aliquota_icms').value,
                       q.fieldbyname('aliquota_ipi').value,
                       getParametroUnidade(q.fieldbyname('cod_unidade').value),
                       q.fieldbyname('descricao_unidade').value
                       );
      q.Next;
  end;
end;


procedure TfrmEntradasAvulsas.bt_consultarClick(Sender: TObject);
begin
  pn_codigo.Enabled:=true;
  inherited;
end;

procedure TfrmEntradasAvulsas.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaEntradas();
  ed_codigo.Text:=string_auxiliar;
  If verificaExistenciaEntrada(ed_codigo.Text) then
    retornaInformacoes(ed_codigo.text);
end;

procedure TfrmEntradasAvulsas.FormActivate(Sender: TObject);
begin
  inherited;
  frmEntradasAvulsas.top:=0;
  if alterarUnidadeNasentradas = 0 then
    ed_cod_un_entrada.ReadOnly :=true
  else
  ed_cod_un_entrada.ReadOnly :=false;

end;





procedure TfrmEntradasAvulsas.BitBtn3Click(Sender: TObject);
begin
  inherited;
  retornaValoresComponentes();
end;

procedure TfrmEntradasAvulsas.edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if key = vk_f11 then
  begin
    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_item') then
      begin
        eventoAuxiliar := evento;
        codNotaAuxiliar := ed_codigo.Text;
        copiaValoresNota();
        Application.CreateForm(Tfrm_produtos, frm_produtos);
        frm_produtos.ShowModal;
        frm_produtos.free;
        dm.transacao.Active:=false;
        dm.transacao.Active:=true;
        dm.qry_entradas.Cancel;
        dm.qry_entradas.Active:=false;
        if eventoAuxiliar = 1 then
         begin
           novaNota();
         end
        else
         begin
          bt_alterar.Click;
          ed_codigo.Text := codNotaAuxiliar;
          retornaInformacoes(codNotaAuxiliar);
         end;

        evento:=eventoAuxiliar;
        retornaValoresNota;
        ed_cod_item.Text := string_auxiliar;
        ed_cod_item.SetFocus;

      end;

    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_fornecedor') then
      begin
       codNotaAuxiliar := ed_codigo.Text;
       eventoAuxiliar := evento;
       copiaValoresNota();
       Application.CreateForm(Tfrm_cad_fornecedor,frm_cad_fornecedor);
       frm_cad_fornecedor.ShowModal;
       frm_cad_fornecedor.free;
       dm.transacao.Active:=false;
       dm.transacao.Active:=true;
        dm.qry_entradas.Cancel;
        dm.qry_entradas.Active:=false;
        if eventoAuxiliar = 1 then
         begin
           novaNota();
         end
        else
         begin
          bt_alterar.Click;
          ed_codigo.Text := codNotaAuxiliar;
          retornaInformacoes(codNotaAuxiliar);
         end;

        evento:=eventoAuxiliar;
        retornaValoresNota;

      end;
  end;
end;


procedure TfrmEntradasAvulsas.copiaValoresNota();
begin
    xCodLoja       := dm.qry_entradasCOD_EMP_GRUPO.Value;
    xCodFornecedor := dm.qry_entradasCOD_FORNECEDOR.value;
//    xCNPJ          := ed_cnpj_fornecedor.text;
//    xInscricaoEstadual := ed_ie_fornecedor.Text;
//  xCidade := ed_cidade_fornecedor.Text;
//  xUF     :=  ed_uf_fornecedor.Text;
    xNumeroNota := dm.qry_entradasNUMERO_NOTA.value;
    xSeriaNota  := dm.qry_entradasSERIE_NOTA.value;
    xModeloNota := dm.qry_entradasMODELO_NOTA.value;
//    xDescricaoModeloNota := ed_descricao_modelo_nota_fiscal.Text;
//    xCFOPNota   := dm.qry_entradasCFOP_NOTA.Value;

    xDataEmissao   := dm.qry_entradasDATA_EMISSAO.Value;
    xDataEntrada   := dm.qry_entradasDATA_ENTRADA.Value;
    xBaseCalculoICMS := dm.qry_entradasBASE_ICMS.Value;
    xBaseCalculoICMSSub := dm.qry_entradasBASE_ICMS_SUBST.Value;
    xvalorICMS  := dm.qry_entradasVALOR_ICMS.value;
    xValorICMSST := dm.qry_entradasVALOR_ICMS_SUBST.value;
    xValorProdutos := dm.qry_entradasVALOR_PRODUTOS.value;
    xValorFrete  :=  dm.qry_entradasFRETE.value;
    xValorSeguro :=  dm.qry_entradasSEGURO.value;
    xValorDesconto:= dm.qry_entradasDESCONTO.Value;
    xDespesas:=      dm.qry_entradasOUTRAS_DESPESAS.value;
    xValorIPI:=      dm.qry_entradasVALOR_IPI.value;
    xTotalNota:=     dm.qry_entradasTOTAL_NOTA.value;
    xChaveNFE :=     dm.qry_entradasCHAVE_NFE.Value ;

end;


procedure TfrmEntradasAvulsas.retornaValoresNota();
begin
   dm.qry_entradasCOD_EMP_GRUPO.Value :=   xCodLoja  ;
   dm.qry_entradasXDESCRICAOLOJA.value  :=    xDescricaoLoja ;

   dm.qry_entradasCOD_FORNECEDOR.value:=    xCodFornecedor;
   dm.qry_entradasXRAZAOSOCIAL.value:=    xRazaoSocial;
//   dm.qry_entradasCNPJ.value:=    xCNPJ;
//   dm.qry_entradasIE.value:=    xInscricaoEstadual;
// ed_cidade_fornecedor.Text:=    xCidade;
   dm.qry_entradasXUF.value:=    xUF;
   dm.qry_entradasNUMERO_NOTA.value:=    xNumeroNota;
   dm.qry_entradasSERIE_NOTA.value:=    xSeriaNota;
   dm.qry_entradasMODELO_NOTA.value:=    xModeloNota;
//   ed_descricao_modelo_nota_fiscal.Text:=    xDescricaoModeloNota;
//   dm.qry_entradasCFOP_NOTA.Value:=    xCFOPNota;

   dm.qry_entradasDATA_EMISSAO.Value:=    xDataEmissao;
   dm.qry_entradasDATA_ENTRADA.Value:=    xDataEntrada;
   dm.qry_entradasBASE_ICMS.Value:=    xBaseCalculoICMS;
   dm.qry_entradasBASE_ICMS_SUBST.Value:=    xBaseCalculoICMSSub;
   dm.qry_entradasVALOR_ICMS.value:=    xvalorICMS;
   dm.qry_entradasVALOR_ICMS_SUBST.value:=    xValorICMSST;
   dm.qry_entradasVALOR_PRODUTOS.value:=    xValorProdutos;
   dm.qry_entradasFRETE.value:=    xValorFrete;
   dm.qry_entradasSEGURO.value:=    xValorSeguro;
   dm.qry_entradasDESCONTO.Value:=    xValorDesconto;
   dm.qry_entradasOUTRAS_DESPESAS.value:=    xDespesas;
   dm.qry_entradasVALOR_IPI.value   := xValorIPI;
   dm.qry_entradasCHAVE_NFE.Value   := xChaveNFE;

   dm.qry_entradasTOTAL_NOTA.value := (dm.qry_entradasVALOR_PRODUTOS.value   +
                                       dm.qry_entradasFRETE.value            +
                                       dm.qry_entradasVALOR_IPI.value        +
                                       dm.qry_entradasOUTRAS_DESPESAS.value  +
                                       dm.qry_entradasSEGURO.value           ) - dm.qry_entradasDESCONTO.Value;

end;


procedure TfrmEntradasAvulsas.DBGrid1ColExit(Sender: TObject);
begin
  inherited;
  recalculaTotaisNota();
end;

procedure TfrmEntradasAvulsas.edit1Exit(Sender: TObject);
var
  codEntrada : string;
begin
  inherited;






  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='EDIquantidade') then
   begin
     if EDIquantidade.Value < 0 then
      begin
       showmessage('Quantidade inválida!');
       EDIquantidade.SetFocus;
       exit;
      end;
   end;





  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edTotalItem') then
   begin
     EDIpreco.Value      := (edTotalItem.Value / EDIquantidade.Value);


   end;




  if  sender is TCustomEdit and (   ((sender as TCustomEdit).Name='edValorProdutos')    or
                                    ((sender as TCustomEdit).Name='edValorFrete')       or
                                    ((sender as TCustomEdit).Name='edValorSeguro')      or
                                    ((sender as TCustomEdit).Name='edOutrasDespesas')   or
                                    ((sender as TCustomEdit).Name='edValorIPI')         or
                                    ((sender as TCustomEdit).Name='edOutrasDespesas')   or
                                    ((sender as TCustomEdit).Name='edValorDesconto') ) then
   begin
      dm.qry_entradasTOTAL_NOTA.value := (dm.qry_entradasVALOR_PRODUTOS.value   +
                                          dm.qry_entradasFRETE.value            +
                                          dm.qry_entradasVALOR_IPI.value        +
                                          dm.qry_entradasOUTRAS_DESPESAS.value  +
                                          dm.qry_entradasSEGURO.value           ) - dm.qry_entradasDESCONTO.Value;
   end;



end;


procedure TfrmEntradasAvulsas.imprimirEspelho(codigo_entrada : string);
var
 Q : Tibquery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;


  dm_relatorios.qryEspelhoNotasEntrada.Active:=false;
  dm_relatorios.qryEspelhoNotasEntrada.sql.clear;
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('    select e.cod_entrada as codigo_entrada, e.*,');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('   f.razao_social as RazaoSocial,');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('   f.nome_fantasia,');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('   f.endereco,');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('   f.bairro,');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('   f.cep,');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('   f.cgc_cpf as Cnpj,');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('   f.inscricao_estadual,');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('   c.nome as NomeCidade,');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('   es.sigla as UF,');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('   mn.descricao as ModeloNota');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('  from entradas e');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('  inner join fornecedor f on (f.cod_fornecedor = e.cod_fornecedor)');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('  inner join cidade c on (c.cod_cidade = f.cod_cidade)');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('  inner join estado es on (es.codigo = f.cod_estado)');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('  inner join modelos_nf mn on (mn.codigo = e.modelo_nota)');
  dm_relatorios.qryEspelhoNotasEntrada.sql.add(' where e.cod_entrada='+Quotedstr(codigo_entrada));
  dm_relatorios.qryEspelhoNotasEntrada.Active :=true;


  q.Active := false;
  q.sql.clear;
  q.SQL.add('select * from contas_a_pagar where codigo_entrada='+Quotedstr(codigo_entrada));
  q.Active:=true;

 if q.IsEmpty then
  dm_relatorios.setObservacaoRelatorio('Esta entrada não gerou títulos de débito no Contas à pagar ')
 else
  dm_relatorios.setObservacaoRelatorio('Esta entrada gerou os seguintes títulos a serem pagos: ');
  q.Active:=false;
  FreeAndNil(q);

  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\espelhoNotaFiscalEntrada.fr3',true);
  dm_relatorios.rpt.ShowReport(true);
end;


procedure TfrmEntradasAvulsas.bt_imprimirClick(Sender: TObject);
begin
  inherited;
  imprimirEspelho(ed_codigo.Text); 

end;

procedure TfrmEntradasAvulsas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    recalculaTotaisNota();
end;

procedure TfrmEntradasAvulsas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;


  if (Column.FieldName = 'descricao') or (Column.FieldName = 'ordem') or (Column.FieldName = 'codigo') then
   begin
       if odd(dm.tbComprasTemp.RecNo) then
         begin
          DBGrid1.Canvas.Brush.Color:= clWhite;
         end
       else
        begin
         DBGrid1.Canvas.Brush.Color:= clMoneyGreen;
        end
   end;



//TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin
  Brush.Color:=clred; //aqui é definida a cor do fundo
  Font.Color := clWhite;
  Font.Size :=   Font.Size + 2;
  Font.Style:= [fsbold];
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;


procedure TfrmEntradasAvulsas.Apagartem1Click(Sender: TObject);
begin
  inherited;
  dm.tbComprasTemp.Delete;
end;

end.













