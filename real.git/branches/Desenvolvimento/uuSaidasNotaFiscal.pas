 unit uuSaidasNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo,  Grids, DBGrids, StdCtrls, 
  RXDBCtrl, DBCtrls, Buttons, Mask, ExtCtrls, IBquery,db, ComCtrls, RxToolEdit,
  RxCurrEdit;

type
  Tfrm_saidas = class(Tfrm_modelo_cadastro)
    Label7: TLabel;
    Panel8: TPanel;
    Label46: TLabel;
    pnFornecedor: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    Label1: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    Label31: TLabel;
    ed_cod_fornecedor: TDBEdit;
    Panel3: TPanel;
    ed_razao_social_fornecedor: TDBEdit;
    Panel11: TPanel;
    ed_cnpj_fornecedor: TDBEdit;
    Panel12: TPanel;
    ed_cidade_fornecedor: TDBEdit;
    Panel13: TPanel;
    ed_uf_fornecedor: TDBEdit;
    Panel15: TPanel;
    ed_ie_fornecedor: TDBEdit;
    pn_campos: TPanel;
    pnNota: TPanel;
    GroupBox2: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label44: TLabel;
    edValorFrete: TDBEdit;
    edValorSeguro: TDBEdit;
    edValorDesconto: TDBEdit;
    edOutrasDespesas: TDBEdit;
    pnItens: TPanel;
    pnCabecalho: TPanel;
    gpDadosNota: TGroupBox;
    gpOperacao: TGroupBox;
    rdVenda: TRadioButton;
    rdDevolucao: TRadioButton;
    rdTransferencia: TRadioButton;
    gpTipoNota: TGroupBox;
    rdModelo01: TRadioButton;
    rdNotaEletronica: TRadioButton;
    pnChaveNFE: TPanel;
    Label49: TLabel;
    edChaveNFE: TDBEdit;
    pnCupomFiscal: TPanel;
    ckbCupomAnexo: TCheckBox;
    pnNumeroCupom: TPanel;
    Label45: TLabel;
    Label48: TLabel;
    edNumeroCupomFiscal: TDBEdit;
    edNumeroECF: TDBEdit;
    edNumeroNotaFiscal: TDBEdit;
    Label4: TLabel;
    edSerieNotaFiscal: TDBEdit;
    Label16: TLabel;
    edDataEmissaoNotaFiscal: TDBDateEdit;
    Label6: TLabel;
    edDataEntradaNotaFiscal: TDBDateEdit;
    Label30: TLabel;
    Panel2: TPanel;
    edBaseCalculoICMS: TDBEdit;
    Label32: TLabel;
    edValorICMS: TDBEdit;
    Label33: TLabel;
    Label26: TLabel;
    edBaseCalculoICMSSubst: TDBEdit;
    edValorICMSSubst: TDBEdit;
    Label25: TLabel;
    edValorProdutos: TDBEdit;
    Label5: TLabel;
    Panel9: TPanel;
    edTotalNotaFiscal: TDBEdit;
    edValorIPI: TDBEdit;
    Label35: TLabel;
    btPesqSituacaoDocFiscal: TSpeedButton;
    edCodSituacaoDocFiscal: TDBEdit;
    Label3: TLabel;
    Panel10: TPanel;
    Label21: TLabel;
    edDescSituacaoDocFiscal: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    btPesqProdutos: TSpeedButton;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    bt_pesq_un_entrada: TSpeedButton;
    Label18: TLabel;
    Label20: TLabel;
    Label24: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    Label8: TLabel;
    Label19: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label34: TLabel;
    Label47: TLabel;
    Label11: TLabel;
    Label43: TLabel;
    Panel5: TPanel;
    ed_desc_item: TEdit;
    EDIAliquotaICMSSAIDAITEM: TCurrencyEdit;
    EDIAliquotaIPI: TCurrencyEdit;
    Panel7: TPanel;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    ed_desc_un_entrada: TEdit;
    BitBtn1: TBitBtn;
    ed_cod_item_saida: TEdit;
    EDIpreco: TCurrencyEdit;
    EDIdesconto: TCurrencyEdit;
    EDIBaseICMS: TCurrencyEdit;
    EDIVALORICMS: TCurrencyEdit;
    EDIbaseICMSST: TCurrencyEdit;
    ediValorICMSST: TCurrencyEdit;
    EDIvalorIPI: TCurrencyEdit;
    edOutrasDespItem: TCurrencyEdit;
    EDIquantidade: TCurrencyEdit;
    ed_cod_un_entrada: TEdit;
    edNCMITEM: TEdit;
    ed_cfop_saida_item: TEdit;
    ed_cst_saida_item: TEdit;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    DBEdit1: TDBEdit;
    BitBtn2: TBitBtn;
    Label22: TLabel;

    procedure novaNota();
    procedure bt_novoClick(Sender: TObject);
    procedure edNumeroNotaFiscalExit(Sender: TObject);
    procedure retornaInformacoes(cod_saida : string);
    procedure retornaItensSaida(cod_saida : string);
    procedure limpaEditsItem();
    function  ValidaTotaisNota() : boolean;
    procedure recalculaTotaisNota();
    procedure copiaValoresNota();
    procedure retornaValoresNota();
    function  verificaValidadeLancamentoItemSaida() : boolean;

    procedure adicionaItemSaida(              ordem : string;
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
                                           RedbaseICMS : double;
                                           valorICMS : double;
                                           baseICMSST : double;
                                           valorICMSST : double;
                                           valorIPI    : double;
                                           AliquotaICMS : double;
                                           AliquotaIPI : double;
                                           paramUnidade : double;
                                           descUnidade : string) ;
    procedure bt_consultarClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1ColExit(Sender: TObject);
    function verificaValidade() : boolean;
    procedure gravarInformacoes();
    procedure gravarItensSaidas();
    procedure bt_gravarClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure imprimirEspelho(codigo_saida : string);
    procedure bt_imprimirClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckbCupomAnexoClick(Sender: TObject);
    procedure rdVendaClick(Sender: TObject);
    procedure rdDevolucaoClick(Sender: TObject);
    procedure rdTransferenciaClick(Sender: TObject);
    procedure rdModelo01Click(Sender: TObject);
    procedure rdNotaEletronicaClick(Sender: TObject);


  private
    { Private declarations }
    xCodFornecedor,xRazaoSocial, xCNPJ, xInscricaoEstadual, xCidade,xUF : string;
    xNumeroNota, xSeriaNota, xModeloNota,xDescricaoModeloNota,xCFOPNota,xDescricaoCFOPNota   : string;
    xDataEmissao,xDataEntrada : Tdate;
    xBaseCalculoICMS,xBaseCalculoICMSSub,xvalorICMS,xValorICMSST,xValorProdutos,xValorFrete,xValorSeguro,xValorDesconto,xDespesas,xValorIPI,xTotalNota : double;
    flagValidacaoNota : boolean;
    tentativasValidacao : smallint;


  public
    { Public declarations }
  end;

var
  frm_saidas: Tfrm_saidas;

implementation

uses uu_data_module, uu_modelo_vazio, uu_frm_principal, UU_DM_RELATORIOS,
  uu_produtos, uu_cad_fornecedor;

{$R *.dfm}

procedure Tfrm_saidas.novaNota();
begin
   setTipoNotaFiscalSaida(0); 

  flagValidacaoNota :=true;
  tentativasValidacao:=0;
  pn_campos.Enabled:=true;
  pn_codigo.Enabled:=false;
  dm.qry_saidas.Active:=true;
  dm.qry_saidas.Append;
  dm.qry_saidasDATA_EMISSAO.Value:=Date;
  dm.qry_saidasDATA_saida.Value:=Date;
  dm.qry_saidasNUMERO_NOTA.Value:='';
  dm.qry_saidasSERIE_NOTA.Value:='';
  dm.qry_saidasMODELO_NOTA.Value:='';
  dm.qry_saidasBASE_ICMS.Value:=0;
  dm.qry_saidasVALOR_ICMS.Value:=0;
  dm.qry_saidasBASE_ICMS_SUBST.value:=0;
  dm.qry_saidasVALOR_ICMS_SUBST.value:=0;
  dm.qry_saidasVALOR_PRODUTOS.Value:=0;
  dm.qry_saidasFRETE.Value:=0;
  dm.qry_saidasSEGURO.value:=0;
  dm.qry_saidasDESCONTO.value:=0;
  dm.qry_saidasOUTRAS_DESPESAS.Value:=0;
  dm.qry_saidasVALOR_IPI.Value :=0;
  dm.qry_saidasTOTAL_NOTA.value:=0;

  pnNumeroCupom.Visible := false;
  ckbCupomAnexo.Checked := false;
  edNumeroCupomFiscal.Clear;
  edNumeroECF.Clear;
  dm.qry_saidas.fieldbyname('CFOP_NOTA').value := '';



  dm.qry_saidas.fieldbyname('CFOP_NOTA').value := '5102';
  exibeInformacoesCFOPEntrada('5102');

  dm.qry_saidas.fieldbyname('situacao').value := '00';
  exibeInformacoesSituacaoDocumentoFiscal('00');
  dm.qry_saidas.fieldbyname('MODELO_NOTA').value := '01';

  ckbCupomAnexo.Checked := false;
  rdVenda.Checked := true;
  rdModelo01.Checked := true;


  ed_cod_fornecedor.SetFocus;

end;


procedure Tfrm_saidas.bt_novoClick(Sender: TObject);
begin
  inherited;
  novaNota();



  dm.tbComprasTemp.EmptyTable;
  dm.tbComprasTemp.Active:=true;

end;


procedure Tfrm_saidas.retornaItensSaida(cod_saida : string);
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
  q.sql.add('select ite.*, p.cod_barras, p.descricao, u.descricao as desc_unidade from itens_saida ite ');
  q.sql.add('  inner join produtos p on (p.cod_produto = ite.cod_item)');
  q.sql.add('  inner join  unidades u  on (u.cod_unidade  = ite.cod_unidade)');
  q.sql.add('  where ite.cod_saida='+Quotedstr(cod_saida)+' order by ite.ordem');
  q.active:=true;
  q.First;

  while not q.eof do
  begin


     adicionaItemSaida(q.fieldbyname('ordem').value,
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
                       q.fieldbyname('REDUCAO_BASE_ICMS').value,
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



procedure Tfrm_saidas.adicionaItemSaida(ordem  : string;
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
                                           RedbaseICMS : double;
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



procedure Tfrm_saidas.limpaEditsItem();
begin
  ed_desc_item.clear;
  ed_cod_item_saida.clear;
  ed_cst_saida_item.clear;
  ed_cfop_saida_item.clear;
//  ed_sigla_un_item.clear;

  EDIquantidade.value:=0;
  EDIpreco.Value:=0;
  ed_cod_un_entrada.Clear;
  ed_desc_un_entrada.clear;
  EDIdesconto.Value :=0;
  edOutrasDespItem.Value :=0;
  EDIbaseICMS.value:=0;
  EDIvalorICMSST.value:=0;
  EDIbaseICMSST.value:=0;
  EDIvalorIPI.value:=0;
  EDIAliquotaICMSSAIDAITEM.value:=0;
  EDIAliquotaIPI.value:=0;
end;



procedure Tfrm_saidas.recalculaTotaisNota();
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


  dm.qry_saidasBASE_ICMS.Value         := totalBaseICMS;
  dm.qry_saidasVALOR_ICMS.Value        := totalICMS;
  dm.qry_saidasBASE_ICMS_SUBST.value   :=  totalBaseICMSSUB;
  dm.qry_saidasVALOR_ICMS_SUBST.Value  := totalICMSSUB;
  dm.qry_saidasVALOR_PRODUTOS.Value    := totalProdutos;
  dm.qry_saidasVALOR_IPI.Value         := totalIPI;
  dm.qry_saidasDESCONTO.Value          := totalDescontos;
  dm.qry_saidasOUTRAS_DESPESAS.Value   := totalOutrasDespesas;

  dm.qry_saidasTOTAL_NOTA.Value:= (dm.qry_saidasVALOR_PRODUTOS.Value +
                                    + dm.qry_saidasVALOR_ICMS_SUBST.Value + dm.qry_saidasVALOR_IPI.Value +
                                    dm.qry_saidasFRETE.Value + dm.qry_saidasSEGURO.Value +
                                    dm.qry_saidasOUTRAS_DESPESAS.Value) - dm.qry_saidasDESCONTO.value   ;


  // Reposiciona o cursor no registro que  estava em edição.                                    
  dm.tbComprasTemp.First;
  while numeroItem <> dm.tbComprasTemp.RecNo do
     dm.tbComprasTemp.Next;
end;



function Tfrm_saidas.ValidaTotaisNota() : boolean;
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




  if ( dm.qry_saidasBASE_ICMS.value  <>  (totalBaseICMS)  ) then
    if ( dm.qry_saidasBASE_ICMS.value  >  (totalBaseICMS)  ) then
     begin
       showmessage('Base de cálculo total da nota é maior que a soma das bases informadas nos ítens da nota');
       edBaseCalculoICMS.SetFocus;
       result:=false;
       exit;
     end
    else
     begin
       showmessage('Base de cálculo total da nota é menor que a soma das bases informadas nos ítens da nota');
       edBaseCalculoICMS.SetFocus;
       result:=false;
       exit;
     end;


  if ( dm.qry_saidasVALOR_ICMS.Value <> totalICMS  ) then
    if (dm.qry_saidasVALOR_ICMS.Value > totalICMS ) then
     begin
       showmessage('ICMS total da nota é maior que a soma do ICMS  informados nos ítens da nota');
       edValorICMS.SetFocus;
       result:=false;
       exit;
     end
    else
     begin
       showmessage('ICMS total da nota é menor que a soma do ICMS  informados nos ítens da nota');
       edValorICMS.SetFocus;
       result:=false;
       exit;
     end;




  if ( dm.qry_saidasVALOR_PRODUTOS.Value <> totalProdutos ) then
   begin
    if (dm.qry_saidasVALOR_PRODUTOS.Value > totalProdutos ) then
      begin
        showmessage('Valor total dos produtos da nota é maior que a soma  informada nos ítens da nota');
        edValorProdutos.SetFocus;
        result:=false;
        exit;
      end
    else
     begin
      showmessage('Valor total dos produtos da nota é menor que a soma  informada nos ítens da nota');
      edValorProdutos.SetFocus;
      result:=false;
      exit;
    end;
   end;



  if (dm.qry_saidasVALOR_IPI.Value <> totalIPI) then
    if (dm.qry_saidasVALOR_IPI.Value > totalIPI) then
     begin
       showmessage('Valor total do IPI é maior que a soma  informada nos ítens da nota');
       edValorIPI.SetFocus;
       result:=false;
       exit;
     end
    else
     begin
       showmessage('Valor total do IPI  é menor que a soma  informada nos ítens da nota');
       edValorIPI.SetFocus;
       result:=false;
       exit;
     end;



  if ( dm.qry_saidasBASE_ICMS_SUBST.value <>  totalBaseICMSSUB   ) then
   begin
     if (dm.qry_saidasBASE_ICMS_SUBST.value >  totalBaseICMSSUB ) then
       begin
        showmessage('Base do ICMS na Substituição  nota é maior que a soma das bases  informados nos ítens da nota');
         edBaseCalculoICMSSubst.SetFocus;
         result:=false;
         exit;
       end

     else
      begin
        showmessage('Base do ICMS na Substituição  nota é menor que a soma das bases  informados nos ítens da nota');
        edBaseCalculoICMSSubst.SetFocus;
        result:=false;
        exit;
      end;
   end;


  if ( dm.qry_saidasVALOR_ICMS_SUBST.Value <> totalICMSSUB ) then
   begin
      if (dm.qry_saidasVALOR_ICMS_SUBST.Value > totalICMSSUB ) then
       begin
         edValorICMSSubst.SetFocus;
         result:=false;
         exit;
       end
      else
       begin
         showmessage('Valor do ICMS na Substituição  nota é menor que a soma do ICMS Subst. informados nos ítens da nota');
         edValorICMSSubst.SetFocus;
         result:=false;
         exit;
       end;

   end;




  if (dm.qry_saidasDESCONTO.Value  <> totalDescontos ) then
    if (dm.qry_saidasDESCONTO.Value > totalDescontos) then
     begin
       showmessage('Valor total do desconto  é maior que a soma dos descontos  informada nos ítens da nota');
       edValorDesconto.SetFocus;
       result:=false;
       exit;
     end
    else
     begin
       showmessage('Valor total do desconto  é menor que a soma dos descontos  informada nos ítens da nota');
       edValorDesconto.SetFocus;
       result:=false;
       exit;
     end;



  if (dm.qry_saidasOUTRAS_DESPESAS.Value  <> totalOutrasDespesas  ) then
    if (dm.qry_saidasOUTRAS_DESPESAS.Value > totalOutrasDespesas) then
     begin
       showmessage('Valor total de Outras despesas  é maior que a soma de outras despesas  informada nos ítens da nota');
       edOutrasDespesas.SetFocus;
       result:=false;
       exit;
     end
    else
     begin
       showmessage('Valor total Outras despesas é menor que que a soma de outras despesas informada nos ítens da nota');
       edOutrasDespesas.SetFocus;
       result:=false;
       exit;
     end;







 if  dm.qry_saidasTOTAL_NOTA.Value <>  ( (dm.qry_saidasVALOR_PRODUTOS.Value +
                                    + dm.qry_saidasVALOR_ICMS_SUBST.Value + dm.qry_saidasVALOR_IPI.Value +
                                    dm.qry_saidasFRETE.Value + dm.qry_saidasSEGURO.Value +
                                    dm.qry_saidasOUTRAS_DESPESAS.Value) - dm.qry_saidasDESCONTO.Value) then
     begin
        showmessage('Valor total da nota diverge da soma dos valores informados nos totalizadores do cabeçalho da nota !!!');
        edTotalNotaFiscal.SetFocus;
        result:=false;
        exit;
     end;

     


  Result :=true
end;












procedure Tfrm_saidas.retornaInformacoes(cod_saida : string);
begin
  dm.qry_saidas.active:=false;
  dm.qry_saidas.sql.clear;

    dm.qry_saidas.SQL.Add('  select s.*,');
  dm.qry_saidas.SQL.Add('   f.razao_social as XRazaoSocial,');
  dm.qry_saidas.SQL.Add('   f.cgc_cpf as xCnpj,');
  dm.qry_saidas.SQL.Add('   f.inscricao_estadual as xInscricaoEstadual,');
  dm.qry_saidas.SQL.Add('   c.nome as XNomeCidade,');
  dm.qry_saidas.SQL.Add('   es.sigla as xUF,');
  dm.qry_saidas.SQL.Add('   mn.descricao as xModeloNota,');
  dm.qry_saidas.SQL.Add('   cf.descricao as xCfopDescricao,');
  dm.qry_saidas.SQL.Add('     sd.descricao as XdescSituacaoNota ');
  dm.qry_saidas.SQL.Add('  from saidas s');
  dm.qry_saidas.SQL.Add('  inner join fornecedor f on (f.cod_fornecedor = s.cod_fornecedor)');
  dm.qry_saidas.SQL.Add('  inner join cidade c on (c.cod_cidade = f.cod_cidade)');
  dm.qry_saidas.SQL.Add('  inner join estado es on (es.codigo = f.cod_estado)');
  dm.qry_saidas.SQL.Add('  inner join modelos_nf mn on (mn.codigo = s.modelo_nota)');
  dm.qry_saidas.SQL.Add('  inner join situacao_documento sd on ( sd.cod_situacao = s.situacao) ');
  dm.qry_saidas.SQL.Add('  inner join cfop cf on (cf.codigo = s.cfop_nota)');
  dm.qry_saidas.sql.add(' where s.cod_saida='+Quotedstr(ed_codigo.text));


  dm.qry_saidas.active:=true;


  retornaItensSaida(ed_codigo.Text);
  bt_imprimir.Enabled:=true;






      if (evento = 2)then
       begin
        dm.qry_saidas.Edit;
        pn_campos.Enabled:=true;
       end;

      if ((evento=2) or (evento = 3)) then
       begin
         bt_gravar.Enabled:=true;
         pn_codigo.Enabled := false;
       end;


  if ( (dm.qry_saidasNUMERO_CUPOM_FISCAL.Value <> null) and ( triM(dm.qry_saidasNUMERO_CUPOM_FISCAL.Value) <> '') ) then
   begin
     ckbCupomAnexo.Checked := true;
     pnCupomFiscal.Visible := true;
     pnNumeroCupom.Visible := true;
   end
  else
   begin
     ckbCupomAnexo.Checked := false;
     pnCupomFiscal.Visible := false;
   end;

  if (dm.qry_saidasMODELO_NOTA.Value ='55') then
   begin
     pnChaveNFE.Visible := true;
     rdNotaEletronica.Checked := true;
   end
  else
   begin
     pnChaveNFE.Visible := false;
     rdModelo01.Checked := true; 
   end;


   case dm.qry_saidasTIPO_SAIDA.Value of
    1: begin
         rdVenda.Checked := true;
       end;
    2: begin
         rdDevolucao.Checked :=  true;
       end;

    3: begin
         rdTransferencia.Checked := true;
       end;
   end;





end;





procedure Tfrm_saidas.edNumeroNotaFiscalExit(Sender: TObject);
var
 codSaida : string;
 modelo : string;
begin
  inherited;

  if rdModelo01.Checked then
   modelo:='01'
  else
   modelo:='55';


  if (evento  = 1 ) then
   begin
     if (trim(edNumeroNotaFiscal.Text) = '' ) then
        exit;
        
      if verificaNotaFiscalSaidaJaFoiLancada(dm.qry_saidasNUMERO_NOTA.Value,modelo ) then
       begin
           Showmessage('NOTA FISCAL JÁ FOI LANÇADA!! ');
           bt_cancelar.Click;
           exit;

       end
      else
       begin
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
   end
  else
   begin
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




function Tfrm_saidas.verificaValidadeLancamentoItemSaida() : boolean;
var
 cfop : string;
 tipoCfop : integer;

begin


  if verificaExistenciaProduto(ed_cod_item_saida .Text ,1) = false then
   begin
    showmessage('Código de ítem informado não existe!');
    limpaEditsItem();
    ed_cod_item_saida .Clear;
    ed_cod_item_saida.SetFocus;
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





  if (verificaExistenciaCFOP(ed_cfop_saida_item.text) =  false ) then
   begin
     showmessage('Código Fiscal de Operação do ítem não é válido!');
     ed_cfop_saida_item.SetFocus;
     result:=false;
     exit;
   end;







   cfop:= copy(ed_cfop_saida_item.Text,0,1);
   if (cfop <> '5') and (cfop <> '6') and (cfop <> '7') then
    begin
     showmessage('CFOP informado não é um CFOP de saída!');
     ed_cfop_saida_item.SetFocus;
     result:=false;
     exit;
    end
   else
    begin
       if (rdVenda.Checked) then  // Venda
        begin
          if (getTipoCFOP(ed_cfop_saida_item.Text) <> 2) then
           begin
            ShowMessage('CFOP informado no ítem  da nota não corresponde a um CFOP de VENDA');
            ed_cfop_saida_item.SetFocus;
            ed_cfop_saida_item.Clear;
            result:=false;
            exit;
           end;
        end
       else
         begin
           if (rdDevolucao.Checked) then // Devolução
            begin
              if (getTipoCFOP(ed_cfop_saida_item.Text) <> 4) then
               begin
                ShowMessage('CFOP informado no ítem da  da nota não corresponde a um CFOP de DEVOLUÇÃO');
                ed_cfop_saida_item.SetFocus;
                ed_cfop_saida_item.Clear;
                result:=false;
                exit;
               end;
            end
           else  // Transferências
            begin
              if (getTipoCFOP(ed_cfop_saida_item.Text) <> 3) then
               begin
                ShowMessage('CFOP da informado no ítem  da nota não corresponde a um CFOP de DEVOLUÇÃO');
                ed_cfop_saida_item.SetFocus;
                ed_cfop_saida_item.Clear;
                result:=false;
                exit;
               end;
            end;
         end;
    end;



  if (verificaExistenciaCST(ed_cst_saida_item.Text) = false) then
    begin
      showmessage('Código da situação tributária do ítem não é válido!');
      ed_cst_saida_item.SetFocus;
      result:=false;
      exit;
    end;

  Result:=true;


end;






procedure Tfrm_saidas.bt_consultarClick(Sender: TObject);
begin
  pn_codigo.Enabled:=true;
  inherited;


end;

procedure Tfrm_saidas.Edit1Exit(Sender: TObject);
begin
  inherited;
  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='EDIbaseICMS') then
   begin
       EDIVALORICMS.Value   := (EDIbaseICMS.Value )  * (EDIAliquotaICMSSAIDAITEM.Value / 100);
   end;





  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='EDIquantidade') then
   begin
     if EDIquantidade.Value <= 0 then
      begin
       showmessage('Quantidade inválida!');
       EDIquantidade.SetFocus;
       exit;
      end;
   end;



  if  sender is TCustomEdit and (   ((sender as TCustomEdit).Name='edValorProdutos')    or
                                    ((sender as TCustomEdit).Name='edValorFrete')       or
                                    ((sender as TCustomEdit).Name='edValorSeguro')      or
                                    ((sender as TCustomEdit).Name='edOutrasDespesas')   or
                                    ((sender as TCustomEdit).Name='edValorIPI')         or
                                    ((sender as TCustomEdit).Name='edOutrasDespesas')   or
                                    ((sender as TCustomEdit).Name='edValorDesconto') ) then
   begin
      dm.qry_saidasTOTAL_NOTA.value := (dm.qry_saidasVALOR_PRODUTOS.value   +
                                          dm.qry_saidasFRETE.value            +
                                          dm.qry_saidasVALOR_IPI.value        +
                                          dm.qry_saidasOUTRAS_DESPESAS.value  +
                                          dm.qry_saidasSEGURO.value           ) - dm.qry_saidasDESCONTO.Value;

   end;

end;

procedure Tfrm_saidas.Edit1Enter(Sender: TObject);
begin
  inherited;

  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='EDIbaseICMS') then
   begin
     if EDIAliquotaICMSSAIDAITEM.Value > 0 then
       EDIbaseICMS.Value   := (EDIquantidade.Value * EDIpreco.value);
   end;


end;

procedure Tfrm_saidas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    recalculaTotaisNota();

end;

procedure Tfrm_saidas.DBGrid1ColExit(Sender: TObject);
begin
  inherited;
    recalculaTotaisNota();
end;



function Tfrm_saidas.verificaValidade() : boolean;
var
 difAnoReferencia : integer;
begin

 if ( (evento = 1) or (evento=2)) then
  begin


      if ( (dm.qry_saidasDATA_SAIDA.Value) < (dm.qry_saidasDATA_EMISSAO.value) )then
      begin
        showmessage('Data de ´saída não pode ser maior que a data de emissão!!');
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
        ed_cod_item_saida.SetFocus;
        Result:=false;
        exit;
      end;



      if rdNotaEletronica.Checked then
       begin
         if ( (dm.qry_saidasCHAVE_NFE.Text = null) or ( trim(dm.qry_saidasCHAVE_NFE.Text) = '') )  then
           begin
            ShowMessage('Chave da NF-E inválida!');
            edChaveNFE.Clear;
            edChaveNFE.SetFocus;
            Result := false;
            exit;
           end;
       end
      else
       begin
         dm.qry_saidasCHAVE_NFE.Value :='';
       end;




      if ( ckbCupomAnexo.Checked) then
       begin
         if ( (dm.qry_saidasNUMERO_CUPOM_FISCAL.Text = null) or ( trim(dm.qry_saidasNUMERO_CUPOM_FISCAL.Text) = '') )  then
           begin
            ShowMessage('Número do Cupom Fiscal inválido!');
            edNumeroCupomFiscal.Clear;
            edNumeroCupomFiscal.SetFocus;
            Result := false;
            exit;
           end
         else
          begin
           try
             dm.qry_saidasNUMERO_CUPOM_FISCAL.Value := FormatFloat('000000',StrToFloat(dm.qry_saidasNUMERO_CUPOM_FISCAL.value));
           except
            begin
              ShowMessage('Número do Cupom Fiscal inválido!');
              edNumeroCupomFiscal.Clear;
              edNumeroCupomFiscal.SetFocus;
              Result := false;
              exit;
            end;
           end;

           if ( (dm.qry_saidasNUMERO_ECF.Text = null) or ( trim(dm.qry_saidasNUMERO_ECF.Text) = '') )  then
            begin
              ShowMessage('Número DO ECF (EMISSOR DE CUPOM FISCAL) inválido!');
              edNumeroECF.Clear;
              edNumeroECF.SetFocus;
              Result := false;
              exit;
            end
           else
            begin
               try
                 dm.qry_saidasNUMERO_ECF.Value := FormatFloat('000',StrToFloat(dm.qry_saidasNUMERO_ECF.value));
               except
                begin
                  ShowMessage('Número DO ECF (EMISSOR DE CUPOM FISCAL) inválido!');
                  edNumeroECF.Clear;
                  edNumeroECF.SetFocus;
                  Result := false;
                  exit;
                end;
               end;
            end;
          end;
       end
      else
       begin
         dm.qry_saidasNUMERO_CUPOM_FISCAL.Value :='';
         dm.qry_saidasNUMERO_ECF.Value := '';
       end;





      if validaTotaisNota = true then
        result:=true
      else
         result:=false;
  end
 else
  begin
    Result := true;

  end;

end;


procedure Tfrm_saidas.gravarInformacoes();
begin
 if (evento = 1) then
   begin
     ed_codigo.Text:=dm.geraCodigo('G_SAIDAS',8);
     dm.qry_saidasNUMERO_NOTA.Value :=FormatFloat('000000000000000',StrToFloat(edNumeroNotaFiscal.Text));
     dm.qry_saidasCOD_SAIDA.Value:=ed_codigo.Text;
     dm.qry_saidasDATA.Value := data_do_sistema;
     dm.qry_saidasHORA.Value := Time;
     dm.qry_saidasQTDE_ITENS.Value:=dm.tbComprasTemp.RecordCount;
     dm.qry_saidasCOD_USUARIO.Value:=codigo_usuario;
     dm.qry_saidasNOME_USUARIO_SAIDA.Value:=nome_usuario;
   end;

 if ( (evento = 1) or (evento=2) )then
   begin

    if rdModelo01.Checked then
      dm.qry_saidasMODELO_NOTA.Value := '01'
    else
      dm.qry_saidasMODELO_NOTA.Value := '55';


    if rdVenda.Checked then
     begin
       dm.qry_saidasTIPO_SAIDA.Value := 1;
     end
    else
     begin
       if rdDevolucao.Checked  then
         dm.qry_saidasTIPO_SAIDA.Value := 2
       else
         dm.qry_saidasTIPO_SAIDA.Value := 3
     end;

    dm.qry_saidasQTDE_ITENS.Value:=dm.tbComprasTemp.RecordCount;
    dm.qry_saidas.Post;
    gravarItensSaidas();
    dm.dbrestaurante.ApplyUpdates([dm.qry_saidas]);
   end
 else
  begin



    if (MessageBox(0, 'Confirma exclusão desta saída ? ', 'Exclusão de saída', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) in [idYes]) then
      begin
       dm.qry_saidas.Delete;
       dm.dbrestaurante.ApplyUpdates([dm.qry_saidas]);
      end
    else
      bt_cancelar.Click;
  end;
end;


procedure Tfrm_saidas.gravarItensSaidas();
var
 q : TIBQuery;
 ordem : integer;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active:=false;

  q.SQL.Clear;
  q.sql.Add('delete from itens_saida where cod_saida='+Quotedstr(ed_codigo.Text));
  q.ExecSQL;
  q.Active:=false;
  q.SQL.Clear;

  dm.tbComprasTemp.First;
  ordem :=1;
  while not dm.tbComprasTemp.Eof do
  begin
    q.sql.clear;
    q.SQL.Add('insert into itens_saida (ORDEM,');
    q.SQL.Add('    COD_saida,COD_ITEM,descricao_item,QUANTIDADE,COD_UNIDADE,VALOR_UNITARIO,');
    q.SQL.Add('    DESCRICAO_UNIDADE,');
    q.SQL.Add('    CFOP,CST,');
    q.SQL.Add('    SIGLA_UNID,DESCONTO,outras_despesas,');
    q.SQL.Add('    BASE_ICMS,VALOR_ICMS,');
    q.SQL.Add('    BASE_ICMS_ST,VALOR_ICMS_ST,');
    q.SQL.Add('    VALOR_IPI,ALIQUOTA_IPI,ALIQUOTA_ICMS,DATA_SAIDA) values (');
     q.sql.add('' +Quotedstr(IntToStr(ordem))+',');
    q.sql.add('' +Quotedstr(ed_codigo.Text)+',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempcodigo.Value)+',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempdescricao.Value)+',');  
    q.SQL.Add('' +dm.TrocaVirgPPto(dm.tbComprasTempquantidade.AsString)+',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempcodUnidade.Value)+',');
    q.sql.add('' +dm.TrocaVirgPPto(dm.tbComprasTemppreco.AsString)+',');
    q.sql.add('' +Quotedstr(dm.tbComprasTempdescUnidade.Value)+',');
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
    q.sql.add('' +Quotedstr(formatDateTime('DD.MM.YYY',dm.qry_saidasDATA_SAIDA.Value))+')');

    q.ExecSQL;
    ordem := ordem+1;
    dm.tbComprasTemp.next;
  end;
end;



procedure Tfrm_saidas.bt_gravarClick(Sender: TObject);
begin
 if ( verificaValidade() = true ) then

 begin
   gravarInformacoes();



   if ( (evento = 1) or (evento=2)) then
       begin
          if (MessageBox(0, 'Deseja imprimir o espelho da nota de saída  ?', 'Espelho de saída', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
             imprimirEspelho(ed_codigo.Text);
       end;

       inherited;
   end

end;

procedure Tfrm_saidas.ed_codigoExit(Sender: TObject);
begin
  inherited;
  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
    begin
      if Trim(ed_codigo.Text) = '' then exit;

      try
        ed_codigo.Text:=FormatFloat('00000000',StrTOFloat(ed_codigo.text));
      except
       begin
         ShowMessage('Código de saída inválido!');
         ed_codigo.clear;
         ed_codigo.SetFocus;
         exit;
       end;
      end;

      if ( verificaExistenciaSaida(trim(ed_codigo.Text)) = true)
        then
          retornaInformacoes(ed_codigo.text)
        else
          begin
            ShowMessage('Codigo de saída inexistente!!');
            ed_codigo.Clear;
            ed_codigo.SetFocus;
            exit;
          end;
    end;

end;

procedure Tfrm_saidas.bt_cancelarClick(Sender: TObject);
begin
  inherited;
    pn_campos.Enabled:=false;
    dm.qry_entradas.Cancel;
    dm.qry_entradas.Active:=false;
    dm.tbComprasTemp.EmptyTable;
    dm.tbComprasTemp.Close;
    pnNumeroCupom.Visible := false;
    edNumeroCupomFiscal.Clear;
    edNumeroECF.Clear;



    rdVenda.Checked := true;
    rdModelo01.Checked := true;
    ckbCupomAnexo.Checked := false;


end;

procedure Tfrm_saidas.BitBtn1Click(Sender: TObject);
begin
  inherited;

  if (rdVenda.Checked = false) then
  begin
   EDIdesconto.Value := 0;
   EDIbaseICMS.Value := 0;
   EDIVALORICMS.Value :=0;
   EDIbaseICMSST.Value :=0;
   ediValorICMSST.Value :=0;

  end;

  if verificaValidadeLancamentoItemSaida() then
   begin
     adicionaItemSaida(FormatFloat('000',dm.tbComprasTemp.RecordCount+1),
                       ed_cod_item_saida .text,
                       ed_desc_item.text,
                       EDIquantidade.value,
                       ed_cod_un_entrada.text,
                       'UN',
//                       ed_sigla_un_item.Text , //EDIsiglaUnidade.text,
                       EDIpreco.value,
                       ed_cst_saida_item.text,
                       ed_cfop_saida_item.text,
                       EDIdesconto.value,
                       edOutrasDespItem.Value,
                       EDIbaseICMS.value,
                       0,
                       EDIVALORICMS.value,
                       EDIbaseICMSST.value,
                       ediValorICMSST.Value,
                       EDIvalorIPI.value,
                       EDIAliquotaICMSSAIDAITEM .value,
                       EDIAliquotaIPI.value,
                       getParametroUnidade(ed_cod_un_entrada.Text),
                       ed_desc_un_entrada.text
                       );

        recalculaTotaisNota();
        limpaEditsItem;
        ed_cod_item_saida .SetFocus;

   end;
end;





procedure Tfrm_saidas.imprimirEspelho(codigo_saida : string);
begin
  dm_relatorios.qryEspelhoNotaSaida.Active:=false;
  dm_relatorios.qryEspelhoNotaSaida.sql.clear;
  dm_relatorios.qryEspelhoNotaSaida.sql.add('    select s.cod_saida as codigo_saida, s.*,');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('   f.razao_social as RazaoSocial,');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('   f.nome_fantasia,');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('   f.endereco,');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('   f.bairro,');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('   f.cep,');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('   f.cgc_cpf as Cnpj,');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('   f.inscricao_estadual,');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('   c.nome as NomeCidade,');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('   es.sigla as UF,');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('   mn.descricao as ModeloNota,');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('   cf.descricao as CfopDescricao ');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('  from saidas s');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('  inner join fornecedor f on (f.cod_fornecedor = s.cod_fornecedor)');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('  inner join cidade c on (c.cod_cidade = f.cod_cidade)');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('  inner join estado es on (es.codigo = f.cod_estado)');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('  inner join modelos_nf mn on (mn.codigo = s.modelo_nota)');
  dm_relatorios.qryEspelhoNotaSaida.sql.add('  inner join cfop cf on (cf.codigo = s.cfop_nota)');
  dm_relatorios.qryEspelhoNotaSaida.sql.add(' where s.cod_saida='+Quotedstr(codigo_saida));
  dm_relatorios.qryEspelhoNotaSaida.Active :=true;
  dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\espelhoNotaFiscalSaida.fr3',true);
  dm_relatorios.rpt.ShowReport(true);
end;










procedure Tfrm_saidas.bt_imprimirClick(Sender: TObject);
begin
  inherited;
  imprimirEspelho(ed_codigo.Text);
end;

procedure Tfrm_saidas.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaSaidas();
  ed_codigo.Text:=string_auxiliar;
  If verificaExistenciaSaida(ed_codigo.Text) then
    retornaInformacoes(ed_codigo.text);


end;



procedure Tfrm_saidas.copiaValoresNota();
begin
    xCodFornecedor := dm.qry_saidasCOD_FORNECEDOR.value;
    xRazaoSocial   := ed_razao_social_fornecedor.text;
    xCNPJ          := ed_cnpj_fornecedor.text;
    xInscricaoEstadual := ed_ie_fornecedor.Text;
    xCidade := ed_cidade_fornecedor.Text;
    xUF     :=  ed_uf_fornecedor.Text;
    xNumeroNota := dm.qry_saidasNUMERO_NOTA.value;
    xSeriaNota  := dm.qry_saidasSERIE_NOTA.value;
    xModeloNota := dm.qry_saidasMODELO_NOTA.value;
//    xDescricaoModeloNota := ed_descricao_modelo_nota_fiscal.Text;
    xCFOPNota   := dm.qry_saidasCFOP_NOTA.Value;

    xDataEmissao   := dm.qry_saidasDATA_EMISSAO.Value;
    xDataEntrada   := dm.qry_saidasDATA_SAIDA.Value;
    xBaseCalculoICMS := dm.qry_saidasBASE_ICMS.Value;
    xBaseCalculoICMSSub := dm.qry_saidasBASE_ICMS_SUBST.Value;
    xvalorICMS  := dm.qry_saidasVALOR_ICMS.value;
    xValorICMSST := dm.qry_saidasVALOR_ICMS_SUBST.value;
    xValorProdutos := dm.qry_saidasVALOR_PRODUTOS.value;
    xValorFrete  :=  dm.qry_saidasFRETE.value;
    xValorSeguro :=  dm.qry_saidasSEGURO.value;
    xValorDesconto:= dm.qry_saidasDESCONTO.Value;
    xDespesas:=      dm.qry_saidasOUTRAS_DESPESAS.value;
    xValorIPI:=      dm.qry_saidasVALOR_IPI.value;
    xTotalNota:=     dm.qry_saidasTOTAL_NOTA.value;
end;


procedure Tfrm_saidas.retornaValoresNota();
begin
   dm.qry_saidasCOD_FORNECEDOR.value:=    xCodFornecedor;
   dm.qry_saidasXRAZAOSOCIAL.value:=    xRazaoSocial;
   dm.qry_saidasCNPJ.value:=    xCNPJ;
   dm.qry_saidasIE.value:=    xInscricaoEstadual;
   ed_cidade_fornecedor.Text:=    xCidade;
   dm.qry_saidasXUF.value:=    xUF;
   dm.qry_saidasNUMERO_NOTA.value:=    xNumeroNota;
   dm.qry_saidasSERIE_NOTA.value:=    xSeriaNota;
   dm.qry_saidasMODELO_NOTA.value:=    xModeloNota;
//   ed_descricao_modelo_nota_fiscal.Text:=    xDescricaoModeloNota;
   dm.qry_saidasCFOP_NOTA.Value:=    xCFOPNota;

   dm.qry_saidasDATA_EMISSAO.Value:=    xDataEmissao;
   dm.qry_saidasDATA_SAIDA.Value:=    xDataEntrada;
   dm.qry_saidasBASE_ICMS.Value:=    xBaseCalculoICMS;
   dm.qry_saidasBASE_ICMS_SUBST.Value:=    xBaseCalculoICMSSub;
   dm.qry_saidasVALOR_ICMS.value:=    xvalorICMS;
   dm.qry_saidasVALOR_ICMS_SUBST.value:=    xValorICMSST;
   dm.qry_saidasVALOR_PRODUTOS.value:=    xValorProdutos;
   dm.qry_saidasFRETE.value:=    xValorFrete;
   dm.qry_saidasSEGURO.value:=    xValorSeguro;
   dm.qry_saidasDESCONTO.Value:=    xValorDesconto;
   dm.qry_saidasOUTRAS_DESPESAS.value:=    xDespesas;
   dm.qry_saidasVALOR_IPI.value   := xValorIPI;

   dm.qry_saidasTOTAL_NOTA.value := (dm.qry_saidasVALOR_PRODUTOS.value   +
                                       dm.qry_saidasFRETE.value            +
                                       dm.qry_saidasVALOR_IPI.value        +
                                       dm.qry_saidasOUTRAS_DESPESAS.value  +
                                       dm.qry_saidasSEGURO.value           ) - dm.qry_saidasDESCONTO.Value;

end;


procedure Tfrm_saidas.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

 if key = vk_f11 then
  begin
    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_item_saida') then
      begin
        copiaValoresNota();
        Application.CreateForm(Tfrm_produtos, frm_produtos);
        frm_produtos.ShowModal;
        frm_produtos.free;
        dm.transacao.Active:=false;
        dm.transacao.Active:=true;
        dm.qry_entradas.Cancel;
        dm.qry_entradas.Active:=false;
        novaNota();
        evento:=1;
        retornaValoresNota;
        ed_cod_item_saida.Text := string_auxiliar;
        ed_cod_item_saida.SetFocus;

      end;

    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_cod_fornecedor') then
      begin
       copiaValoresNota();
       Application.CreateForm(Tfrm_cad_fornecedor,frm_cad_fornecedor);
       frm_cad_fornecedor.ShowModal;
       frm_cad_fornecedor.free;
       dm.transacao.Active:=false;
       dm.transacao.Active:=true;
        dm.qry_entradas.Cancel;
        dm.qry_entradas.Active:=false;
        novaNota();
        evento:=1;
        retornaValoresNota;
        ed_cod_fornecedor.SetFocus;

      end;
  end;


end;



procedure Tfrm_saidas.ckbCupomAnexoClick(Sender: TObject);
var
 str : string;
begin
  inherited;

  if ckbCupomAnexo.Checked then
    begin

       if ( (dm.qry_saidas.State = dsEdit)  or (dm.qry_saidas.State = dsInsert) ) then
        begin

        end;
       pnNumeroCupom.Visible := true;

    end
  else
   begin
     pnNumeroCupom.Visible := false;
     edNumeroCupomFiscal.Clear;
     edNumeroECF.Clear;
     if ( (dm.qry_saidas.State = dsEdit)  or (dm.qry_saidas.State = dsInsert) ) then
      begin
        if (dm.qry_saidas.State = dsInsert) then
         begin
          dm.qry_saidas.fieldbyname('CFOP_NOTA').value := '';

         end;
      end;



   end;


end;

procedure Tfrm_saidas.rdVendaClick(Sender: TObject);
begin
  inherited;

  setTipoNotaFiscalSaida(0); 

  pnNumeroCupom.Visible := false;
//  ckbCupomAnexo.Checked := false;
  edNumeroCupomFiscal.Clear;
  edNumeroECF.Clear;



  pnCupomFiscal.Visible := true;

  if ( (dm.qry_saidas.State = dsEdit)  or (dm.qry_saidas.State = dsInsert) ) then
   begin
     if   (dm.qry_saidas.State = dsInsert) then
      begin
        dm.qry_saidas.fieldbyname('CFOP_NOTA').value := '5102';
        exibeInformacoesCFOPEntrada('5102');
      end;
   end;

end;

procedure Tfrm_saidas.rdDevolucaoClick(Sender: TObject);
begin
  inherited;
  setTipoNotaFiscalSaida(1);

  if ( (dm.qry_saidas.State = dsEdit)  or (dm.qry_saidas.State = dsInsert) ) then
   begin
     if   (dm.qry_saidas.State = dsInsert) then
      begin



        pnNumeroCupom.Visible := false;
        ckbCupomAnexo.Checked := false;
        edNumeroCupomFiscal.Clear;
        edNumeroECF.Clear;
      end;
   end;



end;

procedure Tfrm_saidas.rdTransferenciaClick(Sender: TObject);
begin
  inherited;
  setTipoNotaFiscalSaida(2);

  if ( (dm.qry_saidas.State = dsEdit)  or (dm.qry_saidas.State = dsInsert) ) then
   begin
     if   (dm.qry_saidas.State = dsInsert) then
      begin

        pnNumeroCupom.Visible := false;
        ckbCupomAnexo.Checked := false;
        edNumeroCupomFiscal.Clear;
        edNumeroECF.Clear;
      end;
   end;




end;

procedure Tfrm_saidas.rdModelo01Click(Sender: TObject);
begin
  inherited;

  if ( (dm.qry_saidas.State = dsEdit)  or (dm.qry_saidas.State = dsInsert) ) then
    begin
       dm.qry_saidas.fieldbyname('MODELO_NOTA').value := '01';
       dm.qry_saidas.fieldbyname('CHAVE_NFE').value := '';
    end;

  pnChaveNFE.Visible := FALSE;

end;

procedure Tfrm_saidas.rdNotaEletronicaClick(Sender: TObject);
begin
  inherited;
  if ( (dm.qry_saidas.State = dsEdit)  or (dm.qry_saidas.State = dsInsert) ) then
    begin
      dm.qry_saidas.fieldbyname('MODELO_NOTA').value := '55';
    end;
  pnChaveNFE.Visible := true;

end;

end.
