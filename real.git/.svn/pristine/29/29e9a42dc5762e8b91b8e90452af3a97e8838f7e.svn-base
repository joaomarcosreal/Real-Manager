unit uu_entradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibquery, uu_modelo, Grids, DBGrids,  
  StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, RXDBCtrl, ComCtrls, xmldom,
  Provider, Xmlxform, DB, DBClient, rxcurredit,Menus, RxToolEdit,System.AnsiStrings;



type
  Tfrm_entradas = class(Tfrm_modelo_cadastro)
    Label7: TLabel;
    pnFornecedor: TPanel;
    Panel1: TPanel;
    pn_campos: TPanel;
    pnNota: TPanel;
    GroupBox2: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label5: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label44: TLabel;
    edBaseCalculoICMS: TDBEdit;
    edValorICMS: TDBEdit;
    edBaseCalculoICMSSubst: TDBEdit;
    edValorICMSSubst: TDBEdit;
    edValorProdutos: TDBEdit;
    edValorFrete: TDBEdit;
    edValorSeguro: TDBEdit;
    edValorDesconto: TDBEdit;
    edOutrasDespesas: TDBEdit;
    edValorIPI: TDBEdit;
    pnItens: TPanel;
    pnCabecalho: TPanel;
    Panel8: TPanel;
    Label46: TLabel;
    btDistribuir: TSpeedButton;
    gp_loja: TGroupBox;
    Label3: TLabel;
    btPesqLoja: TSpeedButton;
    Label28: TLabel;
    Panel9: TPanel;
    gpFornecedor: TGroupBox;
    Label2: TLabel;
    bt_pesq_fornecedor: TSpeedButton;
    Label1: TLabel;
    ed_cod_fornecedor: TDBEdit;
    Panel3: TPanel;
    ed_razao_social_fornecedor: TDBEdit;
    Panel13: TPanel;
    edCodLoja: TDBEdit;
    edDescLoja: TDBEdit;
    gpChaveNota: TGroupBox;
    edChaveNFE: TDBEdit;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Label16: TLabel;
    bt_pesq_modelo_notaFiscal: TSpeedButton;
    Label21: TLabel;
    Label30: TLabel;
    Label6: TLabel;
    edNumeroNotaFiscal: TDBEdit;
    edSerieNotaFiscal: TDBEdit;
    ed_cod_modelo_nota_fiscal: TDBEdit;
    edDataEntradaNotaFiscal: TDBDateEdit;
    edDataEmissaoNotaFiscal: TDBDateEdit;
    ckbCompra: TRadioButton;
    ckbBonificacao: TRadioButton;
    Label27: TLabel;
    Panel7: TPanel;
    edTotalNotaFiscal: TDBEdit;
    SpeedButton1: TSpeedButton;
    pvdDadosNota: TXMLTransformProvider;
    cdsDadosNota: TClientDataSet;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    Excluirtem1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    bt_pesq_item_estoque_cod: TSpeedButton;
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
    Label11: TLabel;
    Label43: TLabel;
    Label8: TLabel;
    Label19: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label34: TLabel;
    Label41: TLabel;
    Label45: TLabel;
    Label47: TLabel;
    Panel5: TPanel;
    ed_desc_item: TEdit;
    edEstoqueCompletoItem: TEdit;
    Panel6: TPanel;
    ed_desc_un_entrada: TEdit;
    btAdicionaItem: TBitBtn;
    ed_cod_item: TEdit;
    ed_cst_item: TEdit;
    ed_cfop_item: TEdit;
    edNCMITEM: TEdit;
    EDIquantidade: TCurrencyEdit;
    ed_cod_un_entrada: TEdit;
    edTotalItem: TCurrencyEdit;
    EDIdesconto: TCurrencyEdit;
    EDIbaseICMS: TCurrencyEdit;
    EDIAliquotaICMS: TCurrencyEdit;
    EDIVALORICMS: TCurrencyEdit;
    EDIbaseICMSST: TCurrencyEdit;
    ediValorICMSST: TCurrencyEdit;
    EDIvalorIPI: TCurrencyEdit;
    EDIAliquotaIPI: TCurrencyEdit;
    edOutrasDespItem: TCurrencyEdit;
    Panel2: TPanel;
    EDIpreco: TCurrencyEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    memoInformacoesComplementares: TMemo;
    GroupBox5: TGroupBox;
    memoInformacoesfisco: TMemo;


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
    procedure btAdicionaItemClick(Sender: TObject);
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
    procedure EDIbaseICMSExit(Sender: TObject);
    procedure EDIbaseICMSSTExit(Sender: TObject);
    procedure edNumeroNotaFiscalExit(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure edit1Exit(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btDistribuirClick(Sender: TObject);
    procedure abrirContasAPagar();
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Excluirtem1Click(Sender: TObject);

   procedure abrirLancamentosRD();
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

   processaXML : boolean;

  end;

var
  frm_entradas: Tfrm_entradas;
  eventoAuxiliar : integer;
  codNotaAuxiliar : string;

implementation

uses uu_data_module, uu_modelo_vazio, uu_frm_principal, 
  uu_cad_fornecedor,  uu_produtos,
  UU_DM_RELATORIOS, uuContasPagarEntradas, uuCadItemFornecedorEntrada,
  pcnNFe, uuLancamentosRD;

{$R *.dfm}

procedure Tfrm_entradas.adicionaItemCompra(ordem  : string;
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


procedure Tfrm_entradas.btAdicionaItemClick(Sender: TObject);
begin
  inherited;

  if zerarICMSnasEntradas = 1 then
   begin
      EDIVALORICMS.Value :=0;
      EDIAliquotaICMS.value := 0;
      EDIbaseICMS.value :=0;
   end;


  if processaXML = false then
   begin

      if verificaValidadeLancamentoItemCompra() then
       begin
         adicionaItemCompra(FormatFloat('000',dm.tbComprasTemp.RecordCount+1),
                           ed_cod_item.text,
                           ed_desc_item.text,
                           EDIquantidade.value,
                           ed_cod_un_entrada.text,
                           'UN',
    //                       ed_sigla_un_item.Text , //EDIsiglaUnidade.text,
                           EDIpreco.value,
                           ed_cst_item.text,
                           ed_cfop_item.text,
                           EDIdesconto.value,
                           edOutrasDespItem.Value,
                           EDIbaseICMS.value,
                           EDIVALORICMS.value,
                           EDIbaseICMSST.value,
                           ediValorICMSST.Value,
                           EDIvalorIPI.value,
                           EDIAliquotaICMS.value,
                           EDIAliquotaIPI.value,
                           getParametroUnidade(ed_cod_un_entrada.Text),
                           ed_desc_un_entrada.text);
            limpaEditsItem;
       end

    end
    else
     begin
           adicionaItemCompra(FormatFloat('000',dm.tbComprasTemp.RecordCount+1),
                             ed_cod_item.text,
                             ed_desc_item.text,
                             EDIquantidade.value,
                             ed_cod_un_entrada.text,
                             'UN',
      //                       ed_sigla_un_item.Text , //EDIsiglaUnidade.text,
                             EDIpreco.value,
                             ed_cst_item.text,
                             ed_cfop_item.text,
                             EDIdesconto.value,
                             edOutrasDespItem.Value,
                             EDIbaseICMS.value,
                             EDIVALORICMS.value,
                             EDIbaseICMSST.value,
                             ediValorICMSST.Value,
                             EDIvalorIPI.value,
                             EDIAliquotaICMS.value,
                             EDIAliquotaIPI.value,
                             getParametroUnidade(ed_cod_un_entrada.Text),
                             ed_desc_un_entrada.text
                             );
        limpaEditsItem;

     end;

       recalculaTotaisNota();

        ed_cod_item.SetFocus;


end;

procedure Tfrm_entradas.bt_novoClick(Sender: TObject);
var
 qtdItensNota : integer;
 itemAtual : integer;
 cnpjFornecedor,codProdutoFornecedor : string;



begin
  inherited;
  novaNota();
  edCodLoja.Text := codEmpresa;
  exibeInformacoesLoja(codEmpresa);
//  edCodLoja.SelectAll;

  dm.tbComprasTemp.EmptyTable;
  dm.tbComprasTemp.Active:=true;

  if processaXML then
   begin
     dm.qry_entradasCHAVE_NFE.Value     :=  dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe;

     dm.qry_entradasDATA_EMISSAO.Value  :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi;
     dm.qry_entradasDATA_ENTRADA.Value  :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dSaiEnt;
     Edit1.OnExit(edChaveNFE);

     memoInformacoesComplementares.Clear;
     memoInformacoesfisco.Clear;
     memoInformacoesComplementares.Lines.Add(dm.ACBrNFe1.NotasFiscais[0].NFe.InfAdic.infCpl);
     memoInformacoesfisco.Lines.Add(dm.ACBrNFe1.NotasFiscais[0].NFe.InfAdic.infAdFisco);


     qtdItensNota :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Det.Count;
     itemAtual := 0;
     cnpjFornecedor := dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF;

      for itemAtual :=0 to qtdItensNota-1 do
       begin

         codProdutoFornecedor :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Prod.cProd;
         dm.qryauxiliar.Active := false;
         dm.qryauxiliar.SQL.Clear;
         dm.qryauxiliar.SQL.Add('select * from compara_produtos_nfe cp where cp.cnpj_fornecedor='+Quotedstr(cnpjFornecedor));
         dm.qryauxiliar.SQL.add(' and cod_prod_fornecedor='+Quotedstr(codProdutoFornecedor));
         dm.qryauxiliar.Active := true;

         ed_cod_item.Text    := dm.qryauxiliar.fieldbyname('cod_produto_interno').Value;
         Edit1.OnExit(ed_cod_item);
         ed_cst_item.Text    := dm.qryauxiliar.fieldbyname('cst_entrada').Value;
         ed_cfop_item.Text   := dm.qryauxiliar.fieldbyname('cfop_entrada').Value;
         edNCMITEM.Text      := dm.qryauxiliar.fieldbyname('ncm').Value;
         EDIquantidade.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Prod.qCom *  dm.qryauxiliar.fieldbyname('FATOR_CONVERSAO').Value;

         //Alterar estas linhas para empresas que não se creditam de ICMS

         if creditoNasEntradas then
          begin

            edTotalItem.Value                      := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Prod.vProd;
            EDIbaseICMS.Value                      := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Imposto.ICMS.vBC;
            EDIAliquotaICMS.Value                  := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Imposto.ICMS.pICMS;
            EDIVALORICMS.Value                     := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Imposto.ICMS.vICMS;
            EDIbaseICMSST.Value                    := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Imposto.ICMS.vBCST;
            ediValorICMSST.Value                   := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Imposto.ICMS.vICMSST;
            EDIvalorIPI.Value                      := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Imposto.IPI.vIPI;
            EDIAliquotaIPI.Value                   := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Imposto.IPI.pIPI;
            edOutrasDespItem.Value                 := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Prod.vOutro;
            dm.qry_entradasOUTRAS_DESPESAS.Value   := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vOutro;
            dm.qry_entradasBASE_ICMS_SUBST.Value   := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vBCST;
            dm.qry_entradasVALOR_ICMS_SUBST.Value  := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vST;
          end
         else
          begin

            edTotalItem.Value      := (dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Prod.vProd+
                                      dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Imposto.IPI.vIPI    +
                                      dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Imposto.ICMS.vICMSST+
                                      dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Imposto.ICMS.vFCPST +
                                      dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Prod.vOutro);

            EDIvalorIPI.Value      := 0;
            EDIbaseICMS.Value      := 0;
            EDIAliquotaICMS.Value  := 0;
            EDIbaseICMSST.Value    := 0;
            ediValorICMSST.Value   := 0;
            EDIAliquotaIPI.Value   := 0;
            //edOutrasDespItem.Value := 0;
            {
            dm.qry_entradasBASE_ICMS_SUBST.Value   := 0;
            dm.qry_entradasVALOR_ICMS_SUBST.Value  := 0;
            dm.qry_entradasOUTRAS_DESPESAS.Value   := 0;
            dm.qry_entradasVALOR_IPI.Value         := 0;
            }
          end;

          EDIdesconto.Value  := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemATual ].Prod.vDesc;

         Edit1.OnExit(edTotalItem);
         btAdicionaItem.Click;
       end;




       dm.qry_entradasFRETE.Value             := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vFrete;
       dm.qry_entradasDESCONTO.Value          := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vDesc;
       dm.qry_entradasSEGURO.Value            := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vSeg;
//       btDistribuir.Click;


       ed_cod_item.SetFocus;
   end;
end;

procedure Tfrm_entradas.novaNota();
begin
  memoInformacoesComplementares.Clear;
  memoInformacoesfisco.Clear;
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
  edCodLoja.SetFocus;
//ed_cod_fornecedor.SetFocus;


end;


procedure Tfrm_Entradas.limpaEditsItem();
begin
  ed_desc_item.clear;
  ed_cod_item.clear;
  ed_cst_item.clear;
  ed_cfop_item.clear;
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
  EDIAliquotaICMS.value:=0;
  EDIAliquotaIPI.value:=0;
  edTotalItem.Value :=0;
end;

procedure Tfrm_entradas.recalculaTotaisNota();
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


function Tfrm_entradas.ValidaTotaisNota() : boolean;
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




  if ( dm.qry_entradasBASE_ICMS.value  <>  (totalBaseICMS)  ) then
    if ( dm.qry_entradasBASE_ICMS.value  >  (totalBaseICMS)  ) then
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


  if ( dm.qry_entradasVALOR_ICMS.Value <> totalICMS  ) then
    if (dm.qry_entradasVALOR_ICMS.Value > totalICMS ) then
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




  if ( dm.qry_entradasVALOR_PRODUTOS.Value <> totalProdutos ) then
   begin
    if (dm.qry_entradasVALOR_PRODUTOS.Value > totalProdutos ) then
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



  if (dm.qry_entradasVALOR_IPI.Value <> totalIPI) then
    if (dm.qry_entradasVALOR_IPI.Value > totalIPI) then
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



  if ( dm.qry_entradasBASE_ICMS_SUBST.value <>  totalBaseICMSSUB   ) then
   begin
     if (dm.qry_entradasBASE_ICMS_SUBST.value >  totalBaseICMSSUB ) then
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


  if ( dm.qry_entradasVALOR_ICMS_SUBST.Value <> totalICMSSUB ) then
   begin
      if (dm.qry_entradasVALOR_ICMS_SUBST.Value > totalICMSSUB ) then
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




  if (dm.qry_entradasDESCONTO.Value  <> totalDescontos ) then
    if (dm.qry_entradasDESCONTO.Value > totalDescontos) then
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



  if (dm.qry_entradasOUTRAS_DESPESAS.Value  <> totalOutrasDespesas  ) then
    if (dm.qry_entradasOUTRAS_DESPESAS.Value > totalOutrasDespesas) then
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







 if  dm.qry_entradasTOTAL_NOTA.Value <>  ( (dm.qry_entradasVALOR_PRODUTOS.Value +
                                    + dm.qry_entradasVALOR_ICMS_SUBST.Value + dm.qry_entradasVALOR_IPI.Value +
                                    dm.qry_entradasFRETE.Value + dm.qry_entradasSEGURO.Value +
                                    dm.qry_entradasOUTRAS_DESPESAS.Value) - dm.qry_entradasDESCONTO.Value) then
     begin
        showmessage('Valor total da nota diverge da soma dos valores informados nos totalizadores do cabeçalho da nota !!!');
        edTotalNotaFiscal.SetFocus;
        result:=false;
        exit;
     end;



  if processaXML then
   begin
     if  ( StrToFloat( formatFloat('#0.00',  dm.qry_entradasTOTAL_NOTA.Value)) ) <> ( StrToFloat( formatFloat('#0.00',   dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF)) ) then
      begin
        Showmessage('Valor da entrada difere do valor total do Arquivo XML. Verifique o valor do  DANFE da nota e tente a importação novamente!');
//        dm_relatorios.ACBrNFeDANFEFR1.FastFile :=patchAplicacao+'DANFePaisagem.fr3';
        dm.ACBrNFe1.NotasFiscais.Clear;
        dm.ACBrNFe1.NotasFiscais.LoadFromFile(patchXMLEntradas+dm.qryManifestacaoNFECHAVE_NFE.Value+'-nfe.xml',False);
        dm.ACBrNFe1.NotasFiscais.Imprimir;
        result:= false;
        exit;
      end;
   end;




  Result :=true
end;



function Tfrm_entradas.verificaValidadeLancamentoItemCompra() : boolean;
var
 cfopPrimeiroItem : string;


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





  if (verificaExistenciaCFOP(ed_cfop_item.Text) =  false ) then
   begin
     showmessage('Código Fiscal de Operação do ítem não é válido!');
     ed_cfop_item.SetFocus;
     result:=false;
     exit;
   end;

   cfopPrimeiroItem := copy(ed_cfop_item.Text,0,1);
    if ( MatchStr(cfopPrimeiroItem, ['1', '2','3']) = false) then
     begin
       dm.exibe_painel_erro ('CFOP do ítem '+dm.tbComprasTempdescricao.Value+' não é um CFOP válido para operações de entrada!','Ok');
       result:=false;
       exit;
    end;

  if (verificaExistenciaCST(ed_cst_item.Text) = false) then
    begin
      showmessage('Código da situação tributária do ítem não é válido!');
      ed_cst_item.SetFocus;
      result:=false;
      exit;
    end;



   if ( (dm.qry_entradasSERIE_NOTA.Value = null) or (dm.qry_entradasSERIE_NOTA.Value = '') ) then
    begin
     showmessage('Série da nota inválida!');
     edSerieNotaFiscal.SetFocus;
     Result := false;
     exit;
    end;






  Result:=true;
end;

procedure Tfrm_entradas.bt_cancelarClick(Sender: TObject);
begin
    inherited;
    pn_campos.Enabled:=false;
    dm.qry_entradas.Cancel;
    dm.qry_entradas.Active:=false;
    dm.tbComprasTemp.EmptyTable;
    dm.tbComprasTemp.Close;
end;


function Tfrm_entradas.verificaValidade() : boolean;
var
 difAnoReferencia : integer;
 cfopItemAtual,cfopPrimeiroItem : string;
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


  if (verificaExistenciaModeloNotaFiscal(ed_cod_modelo_nota_fiscal.Text)  = false) then
   begin
    ShowMessage('Modelo de documento especifado não existe!');
    ed_cod_modelo_nota_fiscal.setfocus;
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



   if (  (trim(ed_cod_modelo_nota_fiscal.Text) = '55' ) and (edChaveNFE.Text = '') ) then
    begin
     showmessage('Chave da NF-E é obrigatória para Modelo 55');
     edChaveNFE.SetFocus;
     result:=false;
     exit;
    end
   else
    begin
      if (trim(ed_cod_modelo_nota_fiscal.Text) <> '55' ) then
        edChaveNFE.Text := '';
    end;



   if (trim(edChaveNFE.Text) <> '') then
    begin

      if (FormatFloat('000000000000000', StrToFloat( copy(dm.qry_entradasCHAVE_NFE.value,26,9))) <> (FormatFloat('000000000000000',StrToFloat(edNumeroNotaFiscal.Text))) ) then
       begin
         ShowMessage('Número da nota informada é diferente do número da nota que consta na chave da NF-E');
         edNumeroNotaFiscal.SetFocus;
         result := false;
         exit;
       end;

       if ( (FormatDateTime('YYMM',edDataEmissaoNotaFiscal.Date)) <> (copy(edChaveNFE.text,3,4)) ) then
        begin
         if (MessageDlg('Data de emissão informada é diferente da data de emissão informada na Chave da NF-E'+'#13#10'+' Você está escriturando esta nota em um mês diferente do mês em que deveria ser escriturada ?',mtConfirmation,[mbYes,mbNo],1) = mrNo) then
          begin
           edDataEmissaoNotaFiscal.SetFocus;
           Result := false;
           exit;
          end
         else
          begin
            ShowMessage('Por favor, informe a data de emissão correta!');
            edDataEmissaoNotaFiscal.SetFocus;
            Result := false;
            exit;
          end;
        end;

       if ( (FormatDateTime('YYMM',edDataEntradaNotaFiscal.Date)) <> (copy(edChaveNFE.Text ,3,4)) ) then
        begin
         if (MessageDlg('Data de entrada informada é diferente da data informada na Chave da NF-E'+'#13#10'+' Você está escriturando esta nota em um mês diferente do mês em que deveria ser escriturada ?',mtConfirmation,[mbYes,mbNo],1) = mrNo) then
          begin
           ShowMessage('Por favor, informe a data de entrada correta!');
           edDataEntradaNotaFiscal.SetFocus;
           Result := false;
           exit;
          end
         else
          begin

//            edDataEntradaNotaFiscal.SetFocus;
            Result := true;
//            exit;
          end;
        end;

       if ( (getCNPJFornecedor(ed_cod_fornecedor.Text ) <>  (copy(edChaveNFE.Text ,7,14)) ) ) then
        begin
         ShowMessage('CNPJ do fornecedor informado é diferente do CNPJ que consta na chave da NF-E');
         ed_cod_fornecedor.SetFocus;
         Result := false;
         exit;
        end;




       if (  (trim(formatFloat('000',StrToFloat(edSerieNotaFiscal.Text))) ) <>  (FormatFloat('000', StrToFloat(copy(edChaveNFE.Text,23,3))) )  ) then
        begin
         ShowMessage('Série da nota informada  é diferente da série que consta na chave da NF-E');
         edSerieNotaFiscal.SetFocus;
         Result := false;
         exit;
        end;



    end;




  dm.tbComprasTemp.first;
  cfopPrimeiroItem:= copy(dm.tbComprasTempCFOP.Value,0,1);
  while not  dm.tbComprasTemp.Eof do
   begin
     cfopItemAtual :=  copy(dm.tbComprasTempCFOP.Value,0,1);

    if ( MatchStr(cfopItemAtual, ['1', '2','3']) = false) then
     begin
       dm.exibe_painel_erro ('CFOP do ítem '+dm.tbComprasTempdescricao.Value+' não é um CFOP válido para operações de entrada!','Ok');
       result:=false;
       exit;
    end;



  if ( cfopItemAtual  <> cfopPrimeiroItem    ) then
     begin
       dm.exibe_painel_erro ('Primeiro dígito dos CFOP devem ser iguais para todos os ítens da nota!','Ok');
       result:=false;
       exit;
    end;

    dm.tbComprasTemp.Next;
   end;


  if validaTotaisNota = true then
    result:=true
  else
     result:=false;

end;


procedure Tfrm_entradas.gravarInformacoes();
var
 informacoesComplementares : string;
 codEntrada : string;
begin

 if (evento = 1) then
   begin
     ed_codigo.Text:=dm.geraCodigo('G_ENTRADAS',8);
     dm.qry_entradasNUMERO_NOTA.Value :=FormatFloat('000000000000000',StrToFloat(edNumeroNotaFiscal.Text));
     dm.qry_entradasCOD_ENTRADA.Value:=ed_codigo.Text;
     dm.qry_entradasDATA.Value := data_do_sistema;
     dm.qry_entradasHORA.Value := Time;
     dm.qry_entradasQTDE_ITENS.Value:=dm.tbComprasTemp.RecordCount;
     dm.qry_entradasCOD_USUARIO.Value:=codigo_usuario;
     dm.qry_entradasNOME_USUARIO_ENTRADA.Value:=nome_usuario;
     dm.qry_entradasTIPO_ENTRADA.Value := 0;

   end;

 if ( (evento = 1) or (evento=2) )then
   begin
     dm.qry_entradasINFORMACOES_COMPLEMENTARES.Value := memoInformacoesComplementares.Lines.Text;
     dm.qry_entradasINFORMACOES_FISCO.Value := memoInformacoesfisco.Lines.Text;
     dm.qry_entradasQTDE_ITENS.Value:=dm.tbComprasTemp.RecordCount;
     dm.dbrestaurante.ApplyUpdates([dm.qry_entradas]);


    if processaXML then
     begin
       dm.qryauxiliar.Active := false;
       dm.qryauxiliar.sql.clear;
       dm.qryauxiliar.sql.add('update nfe_destinadas set lancada=1 where chave_nfe='+Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe));
       dm.qryauxiliar.ExecSQL;
     end;


    gravarItensEntrada();
    dm.transacao.Commit;

    if processaXML then
     begin
       dm.qryauxiliar.Active := false;
       dm.qryauxiliar.sql.clear;
       dm.qryauxiliar.sql.add('update nfe_destinadas set processada=1 where chave_nfe='+Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe));
       dm.qryauxiliar.ExecSQL;

       dm.transacao.Commit;
       dm.transacao.Active := false;
       dm.transacao.Active := true;
       bt_sair.Click;
     end;


   end
 else
  begin
     codEntrada := ed_codigo.Text;
    if (MessageBox(0, 'Confirma exclusão desta entrada ? ', 'Exclusão de entrada', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) in [idYes]) then
      begin
        try
          dm.transacao.Active := false;
          dm.transacao.Active := true;
          dm.qryauxiliar.SQL.Clear;
          dm.qryauxiliar.SQL.Add(' execute procedure cancelar_entrada('+Quotedstr(codEntrada)+',1)');
          dm.qryauxiliar.ExecSQL;
          dm.transacao.Commit;
          dm.qryauxiliar.Active := false;
        except
          dm.transacao.Rollback;
          showmessage('Ocorreu um erro ao processar o cancelamento!');
        end;
//       dm.qry_entradas.Delete;
       //dm.dbrestaurante.ApplyUpdates([dm.qry_entradas]);

      end
    else
      bt_cancelar.Click;
  end;







end;

procedure Tfrm_entradas.gravarItensEntrada();
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
     q.sql.add('' +Quotedstr(edCodLoja.text)+',');
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
                           dm.tbComprasTempparamUnidade.value,dm.tbComprasTemppreco.value,FormaTdateTime('DD.MM.YYY',dm.qry_entradasDATA_ENTRADA.Value));     end;




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

procedure Tfrm_entradas.atualizaItemEstoque(codItem : string; quantidade : double; parametroUnidCompra : double ; valorUnitario : double; data : string);
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

procedure Tfrm_entradas.bt_gravarClick(Sender: TObject);
begin
if ( verificaValidade() = true ) then
 begin
   codLoja := edCodLoja.Text;
   descricaoLoja := edDescLoja.Text;
   codigoFornecedor := ed_cod_fornecedor.Text;
   valorCompra := dm.qry_entradasTOTAL_NOTA.Value;
   numeroNotaFiscal := edNumeroNotaFiscal.Text;
   dataEntradaNota := dm.qry_entradasDATA_ENTRADA.Value;

   nomeFornecedor := ed_razao_social_fornecedor.Text;
   gravarInformacoes();
   codigoCompra := ed_codigo.Text;


   if ( (evento = 1) or (evento=2)) then
       begin

          if ( (evento=1) and (ckbBonificacao.Checked = false)) then
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

procedure Tfrm_entradas.abrirLancamentosRD();
begin
  Application.CreateForm(TfrmLancamentosRD,frmLancamentosRD);
  frmLancamentosRD.veioDasEntradas := true;
  frmLancamentosRD.codigoEntrada := ed_codigo.text;
  frmLancamentosRD.showmodal;
  frmLancamentosRD.free;


end;


procedure Tfrm_entradas.abrirContasAPagar();
begin
  application.createForm(TfrmContasApagarEntradas,frmContasApagarEntradas);
  frmContasApagarEntradas.ed_cod_fornecedor.Text := codigoFornecedor;
  frmContasApagarEntradas.ed_razao_social_fornecedor.Text :=   nomeFornecedor;
///  frmContasApagarEntradas.ed_cnpj_fornecedor.Text := cnpjFornecedor;
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


procedure Tfrm_entradas.ed_codigoExit(Sender: TObject);
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




procedure Tfrm_entradas.retornaInformacoes(cod_entrada : string);
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




procedure Tfrm_entradas.retornaItensCompra(cod_entrada : string);
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


procedure Tfrm_entradas.bt_consultarClick(Sender: TObject);
begin
  pn_codigo.Enabled:=true;
  inherited;
end;

procedure Tfrm_entradas.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaEntradas();
  ed_codigo.Text:=string_auxiliar;
  If verificaExistenciaEntrada(ed_codigo.Text) then
    retornaInformacoes(ed_codigo.text);
end;

procedure Tfrm_entradas.FormActivate(Sender: TObject);
begin
  inherited;
  frm_entradas.top:=0;
  if alterarUnidadeNasentradas = 0 then
    ed_cod_un_entrada.ReadOnly :=true
  else
  ed_cod_un_entrada.ReadOnly :=false;

  if processaXML then
   begin
     bt_novo.Click;


   end;

end;





procedure Tfrm_entradas.BitBtn3Click(Sender: TObject);
begin
  inherited;
  retornaValoresComponentes();
end;

procedure Tfrm_entradas.edit1KeyDown(Sender: TObject; var Key: Word;
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


        ed_cod_fornecedor.SetFocus;

      end;
  end;
end;


procedure Tfrm_entradas.copiaValoresNota();
begin
    xCodLoja       := dm.qry_entradasCOD_EMP_GRUPO.Value;
    xDescricaoLoja := edDescLoja.Text;
    xCodFornecedor := dm.qry_entradasCOD_FORNECEDOR.value;
    xRazaoSocial   := ed_razao_social_fornecedor.text;
//    xCNPJ          := ed_cnpj_fornecedor.text;
//    xInscricaoEstadual := ed_ie_fornecedor.Text;
//  xCidade := ed_cidade_fornecedor.Text;
//  xUF     :=  ed_uf_fornecedor.Text;
    xNumeroNota := dm.qry_entradasNUMERO_NOTA.value;
    xSeriaNota  := dm.qry_entradasSERIE_NOTA.value;
    xModeloNota := dm.qry_entradasMODELO_NOTA.value;
//    xDescricaoModeloNota := ed_descricao_modelo_nota_fiscal.Text;
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


procedure Tfrm_entradas.retornaValoresNota();
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

procedure Tfrm_entradas.EDIbaseICMSExit(Sender: TObject);
begin
  inherited;

  if zerarICMSnasEntradas = 0 then
   begin
     EDIVALORICMS.Value := (EDIbaseICMS.value * (EDIAliquotaICMS.value/100));
   end
  else
   begin
      EDIVALORICMS.Value :=0;
      EDIAliquotaICMS.value := 0;
      EDIbaseICMS.value :=0;
   end;
end;

procedure Tfrm_entradas.EDIbaseICMSSTExit(Sender: TObject);
begin
  inherited;
    if zerarICMSnasEntradas = 0 then
      ediValorICMSST.Value := ( (EDIbaseICMSST.value - EDIbaseICMS.value) * (EDIAliquotaICMS.value/100));

end;

procedure Tfrm_entradas.edNumeroNotaFiscalExit(Sender: TObject);
var
 codEntrada : string;
begin
  inherited;

  if (evento  = 1 ) then
   begin
      if (trim(edNumeroNotaFiscal.Text) = '' ) then
        exit;
      dm.qry_entradasCOD_FORNECEDOR.Value := ed_cod_fornecedor.Text; 

      if ( (verificaExistenciaFornecedor(ed_cod_fornecedor.Text) = false) )then
       begin
         ShowMessage('Código de fornecedor inválido!');
         ed_cod_fornecedor.SetFocus;
         Exit;
       end;

      if verificaNotaFiscalJaFoiLancada(dm.qry_entradasCOD_FORNECEDOR.Value,dm.qry_entradasNUMERO_NOTA.Value,dm.qry_entradasMODELO_NOTA.Value ) then
       begin
         edNumeroNotaFiscal.SetFocus;
         IF MessageDlg('NOTA FISCAL JÁ FOI LANÇADA, DESEJA CONSULTA-LA ? ',mtConfirmation,[mbYes,mbNo],1) = mrYes then
          begin
             codEntrada:=  getCodEntradaNotaFiscal(dm.qry_entradasCOD_FORNECEDOR.Value,dm.qry_entradasNUMERO_NOTA.Value);
             bt_cancelar.Click;
             bt_consultar.Click;
             ed_codigo.Text:=codEntrada;
             retornaInformacoes(ed_codigo.text)
          end
         else
           begin
                  bt_cancelar.Click;


            end;



       end
      else
       begin
         if ( (trim(edNumeroNotaFiscal.Text) = '' )) then
           exit;
         try
           begin
             edNumeroNotaFiscal.Text:= FormatFloat('000000000000000',StrToFloat(edNumeroNotaFiscal.Text));
             dm.qry_entradasNUMERO_NOTA.value := FormatFloat('000000000000000',StrToFloat(edNumeroNotaFiscal.Text));
           end;
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
    if ( (trim(edNumeroNotaFiscal.Text) <> '' )  or ( evento <> 0 )) then
     try
      begin
       edNumeroNotaFiscal.Text:= FormatFloat('000000000000000',StrToFloat(edNumeroNotaFiscal.Text));
       dm.qry_entradasNUMERO_NOTA.value := FormatFloat('000000000000000',StrToFloat(edNumeroNotaFiscal.Text));
      end;
     except
      begin
        showmessage('Número da nota fiscal inválido!');
        edNumeroNotaFiscal.SetFocus;
        exit;
      end;
     end;
   end;



end;

procedure Tfrm_entradas.DBGrid1ColExit(Sender: TObject);
begin
  inherited;
  recalculaTotaisNota();
end;

procedure Tfrm_entradas.edit1Exit(Sender: TObject);
var
  codEntrada : string;
begin
  inherited;



    if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edChaveNFE') then
   begin
     if((sender is TCustomEdit and ( trim( (sender as TCustomEdit).text)='')) ) then
       begin
          Exit;
       end
     else
      begin
        if (ValidarChaveNFe( (sender as TCustomEdit).text) = true) then
         begin

           if (verificaExistenciaFornecedorCNPJ(copy((sender as TCustomEdit).text,7,14)) = false) then
            begin
             codNotaAuxiliar := ed_codigo.Text ;
             copiaValoresNota();
             Application.CreateForm(Tfrm_cad_fornecedor,frm_cad_fornecedor);
             frm_cad_fornecedor.setCnpjAuxiliar(copy((sender as TCustomEdit).text,7,14));
             frm_cad_fornecedor.ShowModal;
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
             edChaveNFE.SetFocus;
            end;

           exibeInformacoesFornecedorCNPJ(copy((sender as TCustomEdit).text,7,14));
           dm.qry_entradasNUMERO_NOTA.Value :=  FormatFloat('000000000000000', StrToFloat( copy((sender as TCustomEdit).text,26,9)));
           dm.qry_entradasSERIE_NOTA.Value  :=  FormatFloat('000', StrToFloat( copy((sender as TCustomEdit).text,23,3)));
           dm.qry_entradasMODELO_NOTA.Value := '55';
           dm.qry_entradasCOD_FORNECEDOR.Value := ed_cod_fornecedor.Text;

           if (evento = 1) then
            begin
                 if verificaNotaFiscalJaFoiLancada(dm.qry_entradasCOD_FORNECEDOR.Value,dm.qry_entradasNUMERO_NOTA.Value, dm.qry_entradasMODELO_NOTA.Value) then
                  begin
                   edNumeroNotaFiscal.SetFocus;
                   IF MessageDlg('NOTA FISCAL JÁ FOI LANÇADA, DESEJA CONSULTA-LA ? ',mtConfirmation,[mbYes,mbNo],1) = mrYes then
                    begin
                       codEntrada:=  getCodEntradaNotaFiscal(dm.qry_entradasCOD_FORNECEDOR.Value,dm.qry_entradasNUMERO_NOTA.Value);
                       bt_cancelar.Click;
                       bt_consultar.Click;
                       ed_codigo.Text:=codEntrada;
                       retornaInformacoes(ed_codigo.text)
                    end
                   else
                    begin
                         bt_cancelar.Click;

                    end;



                  end
                 else
                  begin
                   ed_cod_modelo_nota_fiscal.Setfocus;
                  end;

            end
           else
            begin
              ed_cod_modelo_nota_fiscal.Setfocus;
            end;


         end;
      end;
   end;   



  if  sender is TCustomEdit  and ((sender as TCustomEdit).Name='ed_cod_fornecedor') then
   begin
     if ( (evento=1) or (evento= 2) ) then
      begin
//        edNumeroNotaFiscal.SetFocus;
      end;
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





  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edTotalItem') then
   begin
     EDIpreco.Value      := (edTotalItem.Value / EDIquantidade.Value);

     if zerarICMSnasEntradas = 0 then
       EDIbaseICMS.Value   := edTotalItem.Value
     else
      begin
        EDIVALORICMS.Value :=0;
        EDIAliquotaICMS.value := 0;
        EDIbaseICMS.value :=0;
      end;

   end;

  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='edOutrasDespItem') then
   begin
     if zerarICMSnasEntradas = 1 then
      begin
         EDIVALORICMS.Value :=0;
         EDIAliquotaICMS.value := 0;
         EDIbaseICMS.value :=0;
         EDIbaseICMSST.SetFocus;
      end;

   end;


  if  sender is TCustomEdit and ((sender as TCustomEdit).Name='EDIVALORICMS') then
   begin
     if zerarICMSnasEntradas = 0 then
      begin
         if ( (EDIVALORICMS.Value <> 0) and (EDIbaseICMS.Value <> 0) ) then
          EDIAliquotaICMS.Value := ( EDIVALORICMS.Value /  EDIbaseICMS.Value) * 100;
      end
     else
      begin
        EDIVALORICMS.Value :=0;
        EDIAliquotaICMS.value := 0;
        EDIbaseICMS.value :=0;
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
      dm.qry_entradasTOTAL_NOTA.value := (dm.qry_entradasVALOR_PRODUTOS.value   +
                                          dm.qry_entradasFRETE.value            +
                                          dm.qry_entradasVALOR_IPI.value        +
                                          dm.qry_entradasOUTRAS_DESPESAS.value  +
                                          dm.qry_entradasSEGURO.value           ) - dm.qry_entradasDESCONTO.Value;
   end;



end;


procedure Tfrm_entradas.imprimirEspelho(codigo_entrada : string);
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
  dm_relatorios.qryEspelhoNotasEntrada.sql.add('   mn.descricao as ModeloNota ');
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


procedure Tfrm_entradas.bt_imprimirClick(Sender: TObject);
begin
  inherited;
  imprimirEspelho(ed_codigo.Text); 

end;

procedure Tfrm_entradas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    recalculaTotaisNota();
end;

procedure Tfrm_entradas.btDistribuirClick(Sender: TObject);
var
 percentualDesconto : real;
 percentualDespesa  : real;
 percentualIpi      : real;
 percentualICMS_ST  : real;
 percentualBaseICMSST : real;


begin
  inherited;
  dm.qry_entradasVALOR_IPI.Value         := StrToFloat(dm.removePonto(dm.retiraCaracter(dm.retiraCaracter(edValorIPI.Text,'R',''),'$','')));
  dm.qry_entradasOUTRAS_DESPESAS.Value   := StrToFloat(dm.removePonto(dm.retiraCaracter(dm.retiraCaracter(edOutrasDespesas.Text,'R',''),'$','')));
  dm.qry_entradasDESCONTO.Value          := StrToFloat(dm.removePonto(dm.retiraCaracter(dm.retiraCaracter(edValorDesconto.Text,'R',''),'$','')));
  dm.qry_entradasVALOR_ICMS_SUBST.Value  := StrToFloat(dm.removePonto(dm.retiraCaracter(dm.retiraCaracter(edValorICMSSubst.Text,'R',''),'$','')));
  dm.qry_entradasBASE_ICMS_SUBST.Value   := StrToFloat(dm.removePonto(dm.retiraCaracter(dm.retiraCaracter(edBaseCalculoICMSSubst.Text,'R',''),'$','')));



  percentualDesconto    := ( (dm.qry_entradasDESCONTO.Value * 100) / (dm.qry_entradasVALOR_PRODUTOS.Value) );
  percentualDespesa     := ( (dm.qry_entradasOUTRAS_DESPESAS.Value * 100) / (dm.qry_entradasVALOR_PRODUTOS.Value) );
  percentualIpi         := ( (dm.qry_entradasVALOR_IPI.Value * 100) / (dm.qry_entradasVALOR_PRODUTOS.Value) );
  percentualICMS_ST     := ( (dm.qry_entradasVALOR_ICMS_SUBST.Value * 100) / (dm.qry_entradasVALOR_PRODUTOS.Value) );
  percentualBaseICMSST  := ( (dm.qry_entradasBASE_ICMS_SUBST.Value * 100) / (dm.qry_entradasVALOR_PRODUTOS.Value) );

  dm.tbComprasTemp.First;
  while not dm.tbComprasTemp.Eof do
   begin
    dm.tbComprasTemp.Edit;
    dm.tbComprasTempdesconto.Value                 := dm.tbComprasTemptotal.Value  * (percentualDesconto   / 100);
    dm.tbComprasTempoutrasDespAcessorias.Value     := dm.tbComprasTemptotal.Value  * (percentualDespesa   / 100);
    dm.tbComprasTempvalorIPI.Value                 := dm.tbComprasTemptotal.Value  * (percentualIpi      / 100);
    dm.tbComprasTempvalorICMSST.Value              := dm.tbComprasTemptotal.Value  * (percentualICMS_ST / 100);
    dm.tbComprasTempbaseICMSST.Value               := dm.tbComprasTemptotal.Value  * (percentualBaseICMSST / 100);
    dm.tbComprasTemp.Post;
    dm.tbComprasTemp.Next;
   end;

   recalculaTotaisNota;

end;

procedure Tfrm_entradas.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure Tfrm_entradas.SpeedButton1Click(Sender: TObject);
var
  dataEmisao : string;
begin
  inherited;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.sql.add('select * from nfe_destinadas   where lancada = 0 order by cnpj');
  dm.qryauxiliar.Active := True;
  dm.qryauxiliar.First;


  if dm.qryauxiliar.IsEmpty  then
   begin
     showmessage('Não existem arquivos XML para serem processados!');
     exit;
   end
  else
   begin
     cdsDadosNota.Active := false;
     dm.qry_entradasCOD_FORNECEDOR.Value :=  getCodFornecedorViaCNPJ(dm.qryauxiliar.fieldbyname('cnpj').Value);
     dm.qry_entradasCHAVE_NFE.Value      := dm.qryauxiliar.fieldbyname('chave_nfe').Value;
     dm.qry_entradasNUMERO_NOTA.Value    := dm.qryauxiliar.FieldByName('numero_nota').Value;
     dm.qry_entradasMODELO_NOTA.Value    := '55';
     dm.qry_entradasDATA_EMISSAO.Value   := dm.qryauxiliar.FieldByName('DATA_EMISSAO').Value;
     dm.qry_entradasDATA_ENTRADA.Value   := dm.qryauxiliar.FieldByName('DATA_EMISSAO').Value;


     edit1Exit(ed_cod_fornecedor);
     pvdDadosNota.TransformRead.TransformationFile := ExtractFilePath( Application.ExeName )+'tdDadosNota.xtr';
     pvdDadosNota.XMLDataFile := dm.qryauxiliar.fieldbyname('caminho_xml').Value;
     cdsDadosNota.Active := true;
     dm.qry_entradasSERIE_NOTA.Value :=    cdsDadosNota.FieldByName('serie').Value;

     cdsDadosNota.Active := false;
     pvdDadosNota.TransformRead.TransformationFile := ExtractFilePath( Application.ExeName )+'tdItensNota.xtr';
     cdsDadosNota.Active := true;
     cdsDadosNota.First;

     while not cdsDadosNota.Eof do
      begin
        while  (verificaExistenciaProdutoCodigosEntrada(ed_cod_fornecedor.Text,cdsDadosNota.FieldByName('xProd').Value) = false) do
         begin
            Application.CreateForm(TfrmCadItemFornecedorEntrada, frmCadItemFornecedorEntrada);
            frmCadItemFornecedorEntrada.edCodFornecedor.Text            := dm.qry_entradasCOD_FORNECEDOR.Value;
            frmCadItemFornecedorEntrada.edNomeFornecedor.Text           := ed_razao_social_fornecedor.Text;
            frmCadItemFornecedorEntrada.edCodProdutoFornecedor.Text     := cdsDadosNota.FieldByName('cProd').Value;
            frmCadItemFornecedorEntrada.edDescProdutoFornecedor.Text    := cdsDadosNota.FieldByName('xProd').Value;
            frmCadItemFornecedorEntrada.edCFOPfornecedor.Text           := cdsDadosNota.FieldByName('CFOP').Value;
            frmCadItemFornecedorEntrada.edNCMfornecedor.Text            := cdsDadosNota.FieldByName('NCM').Value;
            frmCadItemFornecedorEntrada.edUnidFornecedor.Text           := cdsDadosNota.FieldByName('uCom').Value;
            frmCadItemFornecedorEntrada.ShowModal;
            frmCadItemFornecedorEntrada.Free;
         end;


        cdsDadosNota.Next;
      end;









   end;





  dm.qryauxiliar.Active := false;



  










end;

procedure Tfrm_entradas.FormCreate(Sender: TObject);
begin
  inherited;
  processaXML := false;
end;

procedure Tfrm_entradas.Excluirtem1Click(Sender: TObject);
begin
  inherited;
  if dm.painelDePergunta('Confirma exclusão do ítem ?',18) then
   begin
    dm.tbComprasTemp.Delete;
    btDistribuir.click;
  end;
end;

end.












