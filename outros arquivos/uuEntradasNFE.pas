unit uuEntradasNFE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uu_data_module, System.Generics.Collections, ACBrUtil, FireDAC.Comp.Client,
  Dialogs, ibx.ibquery, uu_modelo, Grids, DBGrids, StdCtrls, DBCtrls, Buttons,
  Mask, ExtCtrls, RXDBCtrl, ComCtrls, xmldom, Provider, Xmlxform, DB, DBClient,
  rxcurredit, Menus, RxToolEdit, System.AnsiStrings, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  cxDBData, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, uu_modelo_Vazio;

type
  TfrmEntradasNfe = class(Tfrm_modelo_vazio)
    Label7: TLabel;
    Panel8: TPanel;
    Label22: TLabel;
    pnFornecedor: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Shape1: TShape;
    Label34: TLabel;
    Panel9: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edNomeFornecedor: TEdit;
    edNumeroNota: TEdit;
    edDataDoc: TcxDateEdit;
    edSerieNota: TEdit;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel10: TPanel;
    edDataEntradaNotaFiscal: TcxDateEdit;
    edChaveNotaFiscal: TEdit;
    Panel2: TPanel;
    Label32: TLabel;
    Label33: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label5: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label44: TLabel;
    Label38: TLabel;
    Label35: TLabel;
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
    Panel7: TPanel;
    Label6: TLabel;
    edTotalNotaFiscal: TDBEdit;
    Label10: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ordem: TcxGridDBColumn;
    cxGrid1DBTableView1codigo: TcxGridDBColumn;
    cxGrid1DBTableView1descricao: TcxGridDBColumn;
    cxGrid1DBTableView1CFOP: TcxGridDBColumn;
    cxGrid1DBTableView1CST: TcxGridDBColumn;
    cxGrid1DBTableView1quantidade: TcxGridDBColumn;
    cxGrid1DBTableView1descUnidade: TcxGridDBColumn;
    cxGrid1DBTableView1preco: TcxGridDBColumn;
    cxGrid1DBTableView1total: TcxGridDBColumn;
    cxGrid1DBTableView1desconto: TcxGridDBColumn;
    cxGrid1DBTableView1valorFrete: TcxGridDBColumn;
    cxGrid1DBTableView1valorIPI: TcxGridDBColumn;
    cxGrid1DBTableView1valorICMS: TcxGridDBColumn;
    cxGrid1DBTableView1valorICMSST: TcxGridDBColumn;
    cxGrid1DBTableView1outrasDespAcessorias: TcxGridDBColumn;
    cxGrid1DBTableView1valorSeguro: TcxGridDBColumn;
    cxGrid1DBTableView1valorTotal: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure adicionaItemCompra(ordem: string; codigo: string; descricao: string; quantidade: double; codUnidade: string; siglaUnidade: string; preco: double; CST: string; CFOP: string; desconto: double; outrasDespesasAcessorias: double; baseICMS: double; valorICMS: double; baseICMSST: double; valorICMSST: double; valorIPI: double; AliquotaICMS: double; AliquotaIPI: double; paramUnidade: double; descUnidade: string);
    procedure bt_novoClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);

     //
    function verificaValidade(): boolean;
    procedure gravarInformacoes();
    procedure atualizaItemEstoque(codItem: string; quantidade: double; parametroUnidCompra: double; valorUnitario: double; data: string);
    procedure retornaInformacoes(cod_entrada: string);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_consultarClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure recalculaTotaisNota();
    function ValidaTotaisNota(): boolean;
    procedure novaNota();
    procedure imprimirEspelho(codigo_entrada: string);
    procedure edNumeroNotaFiscalExit(Sender: TObject);
    procedure edSerieNotaExit(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
    procedure abrirContasAPagar();
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure abrirLancamentosRD();
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }

    xCodLoja, xDescricaoLoja, xCodFornecedor, xRazaoSocial, xCNPJ, xInscricaoEstadual, xCidade, xUF: string;
    xNumeroNota, xSeriaNota, xModeloNota, xDescricaoModeloNota, xCFOPNota, xDescricaoCFOPNota: string;
    xDataEmissao, xDataEntrada: Tdate;
    xBaseCalculoICMS, xBaseCalculoICMSSub, xvalorICMS, xValorICMSST, xValorProdutos, xValorFrete, xValorSeguro, xValorDesconto, xDespesas, xValorIPI, xTotalNota: double;
    xChaveNFE: string;
    flagValidacaoNota: boolean;
    tentativasValidacao: smallint;
    codigoFornecedor, nomeFornecedor, numeroNotaFiscal, cnpjFornecedor, codLoja, descricaoLoja: string;
    dataEntradaNota: TDate;
    valorCompra: Currency;
    codigoCompra: string;
    function getCodigosProdutosNota: string;
    procedure processaItensNota;
    procedure gravarItensEntrada(ACodigoEntrada: string);
  public
    { Public declarations }

    processaXML: boolean;
    GcodFornecedor: string;
    GRazaoSocialFornecedor: string;
    GChaveNFE: string;
    memoInformacoesComplementares: TStringList;
    memoInformacoesfisco: TStringList;
  end;

var
  frmEntradasNfe: TfrmEntradasNfe;
  eventoAuxiliar: integer;
  codNotaAuxiliar: string;

implementation

uses
  uu_modelo_vazio, uu_frm_principal, UU_DM_RELATORIOS, pcnNFe, uuLancamentosRD,
  uuDmManifestacaoNFE, uuContasAPagarEntradas;

{$R *.dfm}

procedure TfrmEntradasNfe.adicionaItemCompra(ordem: string; codigo: string; descricao: string; quantidade: double; codUnidade: string; siglaUnidade: string; preco: double; CST: string; CFOP: string; desconto: double; outrasDespesasAcessorias: double; baseICMS: double; valorICMS: double; baseICMSST: double; valorICMSST: double; valorIPI: double; AliquotaICMS: double; AliquotaIPI: double; paramUnidade: double; descUnidade: string);
begin

  dm.tbComprasTemp.Append;
  dm.tbComprasTempordem.Value := ordem;
  dm.tbComprasTempcodigo.value := codigo;
  dm.tbComprasTempdescricao.value := descricao;
  dm.tbComprasTempquantidade.value := quantidade;
  dm.tbComprasTempcodUnidade.value := codUnidade;
  dm.tbComprasTempsiglaUnidade.value := siglaUnidade;
  dm.tbComprasTemppreco.value := preco;
  dm.tbComprasTempCST.value := CST;
  dm.tbComprasTempCFOP.value := CFOP;
  dm.tbComprasTempdesconto.value := desconto;
  dm.tbComprasTempoutrasDespAcessorias.Value := outrasDespesasAcessorias;
  dm.tbComprasTempbaseICMS.value := baseICMS;
  dm.tbComprasTempvalorICMS.value := valorICMS;
  dm.tbComprasTempbaseICMSST.value := baseICMSST;
  dm.tbComprasTempvalorICMSST.value := valorICMSST;
  dm.tbComprasTempvalorIPI.value := valorIPI;
  dm.tbComprasTempAliquotaIPI.value := AliquotaIPI;
  dm.tbComprasTempaliquotaICMS.Value := AliquotaICMS;
  dm.tbComprasTempparamUnidade.value := paramUnidade;
  dm.tbComprasTempdescUnidade.value := descUnidade;
  dm.tbComprasTemp.Post;
end;

function TfrmEntradasNfe.getCodigosProdutosNota: string;
var
  LQtdItensNota: integer;
  LitemAtual: integer;
  LCodigos: string;
begin

  try
    try
      LQtdItensNota := dm.ACBrNFe1.NotasFiscais[0].NFe.Det.Count;
      LitemAtual := 0;

      LCodigos := Quotedstr('#') + ',';

      for LitemAtual := 0 to LQtdItensNota - 1 do
      begin
        LCodigos := LCodigos + Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.cProd) + ',';
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao ', 'Ok');
        raise Exception.Create('Erro ao coletar os códigos do fornecedor no xml');
      end;
    end;
  finally
    LCodigos := LCodigos + Quotedstr('#');
    Result := LCodigos;
  end;
end;

procedure TfrmEntradasNfe.processaItensNota;
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
  LCodigosProdutosNFE: string;
  LCodigoItem, LNCMItem, LCFOPItem, LCSTItem: string;
  LDescricaoItem, LCodUnidade, LDescricaoUnidade, LSiglaUnidade: string;
  LQtdItensNota: integer;
  LitemAtual: integer;
  LCNPJFornecedor: string;
  LCodProdutoFornecedor: string;
  LTotalItem, LBaseICMSItem, LAliquotaICMSItem: Double;
  LValorICMSItem, LBaseICMSSTItem: Double;
  LValorICMSSTItem, LValorIPIItem: Double;
  LAliquotaIPIItem, LValorFCPTItem, LValorFCPTSTItem: Double;
  LOutrasDespesasItem, LValorDescontoItem, LValorFreteItem, LValorSeguroItem, LParametroUnidade: Double;
  LQuantidadeItem, LPrecoItem: Double;
  LValorImpostoImportacaoItem: double;
  LCustoRealItem: Double;
  achouItem: boolean;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  LQtdItensNota := dm.ACBrNFe1.NotasFiscais[0].NFe.Det.Count;
  LitemAtual := 0;
  LCNPJFornecedor := dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF;

  try
    LCodigosProdutosNFE := getCodigosProdutosNota;
    LSQL.Clear;
    LSQL.Add('  select nf.cnpj_fornecedor, nf.cod_prod_fornecedor, nf.cod_produto_interno, ');
    LSQL.Add('        coalesce(nf.cfop_entrada,' + QuotedStr('1102') + ') as cfop_entrada,');
    LSQL.Add('        coalesce(nf.cst_entrada,' + QuotedStr('000') + ') as cst_entrada,');
    LSQL.Add(' 		 nf.ncm, nf.fator_conversao,p.unidade_entrada as codUnidade, p.descricao as descricaoProduto,');
    LSQL.Add('      u.sigla as SiglaUnidade, u.descricao as DescUnidade, u.parametro as ParametroUnidade ');
    LSQL.Add('        from compara_produtos_nfe nf  ');
    LSQL.Add(' 		  inner join produtos p on (p.cod_produto = nf.cod_produto_interno)                   ');
    LSQL.Add(' 		  inner join unidades u on (u.cod_unidade = p.unidade_entrada)                        ');
    LSQL.Add('          where nf.cnpj_fornecedor =' + Quotedstr(LCNPJFornecedor));
    LSQL.Add('          and nf.cod_prod_fornecedor in (' + LCodigosProdutosNFE + ')');
    ////dm.adicionalog(LSQL.Text);
    dm.getMemTable(LTbAux, LSQL.Text);

    for LitemAtual := 0 to LQtdItensNota - 1 do
    begin
      try
        LCodProdutoFornecedor := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.cProd;
        LTbAux.Locate('cod_prod_fornecedor', VarArrayOf([LCodProdutoFornecedor]), [loCaseInsensitive]);

        LCodigoItem := LTbAux.FieldByName('cod_produto_interno').Value;
        LDescricaoItem := LTbAux.FieldByName('descricaoProduto').Value;
        LCodUnidade := LTbAux.FieldByName('codUnidade').Value;
        LDescricaoUnidade := LTbAux.FieldByName('DescUnidade').Value;
        LParametroUnidade := LTbAux.FieldByName('ParametroUnidade').Value;
        LSiglaUnidade := LTbAux.FieldByName('SiglaUnidade').Value;
        LCSTItem := LTbAux.FieldByName('cst_entrada').Value;
        LCFOPItem := LTbAux.FieldByName('cfop_entrada').Value;
        LNCMItem := dm.AcbrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.NCM;



        // Alteração para quantidade tributada
        LQuantidadeItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.qCom * LTbAux.FieldByName('fator_conversao').Value;

        if dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.qTrib <> dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.qCom then
        begin
          dm.exibe_painel_erro('Atenção: Quantidade tributada para o produto ' + LDescricaoItem + ' é diferente da quantidade comercial. ' + sLineBreak + sLineBreak + ' Atenção maior aos valores deste ítem. Pode ser necessário o ajuste na associação!.' + sLineBreak + ' Utilize sempre a quantidade tributada como base para a conversão.' + sLineBreak + sLineBreak + 'Quantidade comercial:  ' + FormatFloat('#0.000', dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.qCom) + sLineBreak + 'Quantidade tributada:  ' + FormatFloat('#0.000', dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.qTrib) + sLineBreak, 'Ok');
        end;



           //Alterar estas linhas para empresas que não se creditam de ICMS


        LTotalItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.vProd;
        LBaseICMSItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Imposto.ICMS.vBC;
        LAliquotaICMSItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Imposto.ICMS.pICMS;
        LValorICMSItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Imposto.ICMS.vICMS;
        LBaseICMSSTItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Imposto.ICMS.vBCST;
        LValorICMSSTItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Imposto.ICMS.vICMSST;
        LValorIPIItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Imposto.IPI.vIPI;
        LAliquotaIPIItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Imposto.IPI.pIPI;
        LValorFCPTSTItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Imposto.ICMS.vFCPST;
        LValorFCPTItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Imposto.ICMS.vFCP;
        LOutrasDespesasItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.vOutro;
        LValorFreteItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.vFrete;
        LValorSeguroItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.vSeg;
        LValorDescontoItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.vDesc;
        LValorImpostoImportacaoItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Imposto.II.vII;

        LPrecoItem := RoundABNT((LTotalItem / LQuantidadeItem), 5);
        LCustoRealItem := (LTotalItem + LValorIPIItem + LValorICMSSTItem + LOutrasDespesasItem + LValorFreteItem + LValorSeguroItem + LValorFCPTSTItem + LValorImpostoImportacaoItem) - LValorDescontoItem;
        LCustoRealItem := RoundABNT((LCustoRealItem / LQuantidadeItem), 5);

        if (creditoNasEntradas = false) then
        begin
          LOutrasDespesasItem := LValorIPIItem + LValorICMSSTItem + LValorFCPTSTItem + LOutrasDespesasItem + LValorFreteItem + LValorSeguroItem + +LValorImpostoImportacaoItem;

          LValorIPIItem := 0;
          LAliquotaIPIItem := 0;
          LBaseICMSItem := 0;
          LValorICMSItem := 0;
          LAliquotaICMSItem := 0;
          LBaseICMSSTItem := 0;
          LValorICMSSTItem := 0;
          LValorFCPTSTItem := 0;
          LValorFCPTItem := 0;
          LValorFreteItem := 0;
          LValorSeguroItem := 0;
          LValorImpostoImportacaoItem := 0;
        end;

        dm.tbComprasTemp.Append;
        dm.tbComprasTempordem.Value := Inttostr(dm.tbComprasTemp.RecordCount + 1);
        dm.tbComprasTempcodigo.value := LCodigoItem;
        dm.tbComprasTempdescricao.value := LDescricaoItem;
        dm.tbComprasTempquantidade.value := LQuantidadeItem;
        dm.tbComprasTempcodUnidade.value := LCodUnidade;
        dm.tbComprasTempsiglaUnidade.value := LSiglaUnidade;
        dm.tbComprasTemppreco.value := LPrecoItem;
        dm.tbComprasTempCST.value := LCSTItem;
        dm.tbComprasTempCFOP.value := LCFOPItem;
        dm.tbComprasTempdesconto.value := LValorDescontoItem;
        dm.tbComprasTempoutrasDespAcessorias.Value := LOutrasDespesasItem;
        dm.tbComprasTempbaseICMS.value := LBaseICMSItem;
        dm.tbComprasTempvalorICMS.value := LValorICMSItem;
        dm.tbComprasTempbaseICMSST.value := LBaseICMSItem;
        dm.tbComprasTempvalorICMSST.value := LValorICMSItem;
        dm.tbComprasTempvalorIPI.value := LValorIPIItem;
        dm.tbComprasTempAliquotaIPI.value := LAliquotaIPIItem;
        dm.tbComprasTempaliquotaICMS.Value := LAliquotaICMSItem;
        dm.tbComprasTempparamUnidade.value := LParametroUnidade;
        dm.tbComprasTempdescUnidade.value := LDescricaoUnidade;
        dm.tbComprasTempvalorFrete.Value := LValorFreteItem;
        dm.tbComprasTempvalorSeguro.Value := LValorSeguroItem;
        dm.tbComprasTempvalorFCP.Value := LValorFCPTItem;
        dm.tbComprasTempvalorFCPST.Value := LValorFCPTSTItem;
        dm.tbComprasTempvalorImpostoImportacao.Value := LValorImpostoImportacaoItem;
        dm.tbComprasTempValorCustoReal.Value := LCustoRealItem;
        dm.tbComprasTemp.Post;

//        adicionaItemCompra(FormatFloat('000', dm.tbComprasTemp.RecordCount + 1), LCodigoItem, LDescricaoItem, LQuantidadeItem, LCodUnidade, LSiglaUnidade, LPrecoItem, LCSTItem, LCFOPItem, LValorDescontoItem, LOutrasDespesasItem, LBaseICMSItem, LValorICMSItem, LBaseICMSItem, LValorICMSItem, LValorIPIItem, LAliquotaICMSItem, LAliquotaIPIItem, LParametroUnidade, LDescricaoUnidade);

      except
        on E: Exception do
        begin
          dm.exibe_painel_erro('Erro ao buscar informações do produto ' + LCodProdutoFornecedor + dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.xProd, 'Ok');
          ////dm.adicionalog(dm.qryauxiliar.SQL.Text);
          bt_gravar.Enabled := false;
          exit
        end;

      end;
    end;

    dm.qry_entradasVALOR_PRODUTOS.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vProd;
    //dm.qry_entradasOUTRAS_DESPESAS.Value :=   dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vOutro;
//    dm.qry_entradasBASE_ICMS_SUBST.Value :=   dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vBCST;
//    dm.qry_entradasVALOR_ICMS_SUBST.Value :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vST;

    dm.qry_entradasDESCONTO.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vDesc;
    dm.qry_entradasOUTRAS_DESPESAS.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vOutro + dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vFrete + dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vSeg + dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vIPI + dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vFCPST + dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vST;

    dm.qry_entradasBASE_ICMS_SUBST.Value := 0;
    dm.qry_entradasVALOR_ICMS_SUBST.Value := 0;
    dm.qry_entradasBASE_ICMS.Value := 0;
    dm.qry_entradasVALOR_ICMS.Value := 0;
    dm.qry_entradasVALOR_IPI.Value := 0;
    dm.qry_entradasTOTAL_NOTA.Value := (dm.qry_entradasVALOR_PRODUTOS.Value + dm.qry_entradasOUTRAS_DESPESAS.Value) - dm.qry_entradasDESCONTO.value;
  finally
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
    FreeAndNil(LSQL);

  end;

end;

procedure TfrmEntradasNfe.bt_novoClick(Sender: TObject);
var
  qtdItensNota: integer;
  itemAtual: integer;
  cnpjFornecedor, codProdutoFornecedor: string;
  MyClass: TComponent;
begin
//  inherited;
  novaNota();
  memoInformacoesComplementares.Clear;
  memoInformacoesfisco.Clear;

  dm.tbComprasTemp.EmptyTable;
  dm.tbComprasTemp.Active := true;

  if processaXML then
  begin
    dm.qry_entradasCOD_EMP_GRUPO.Value := codEmpresa;
    dm.qry_entradasCOD_EMPRESA.Value := codEmpresa;
    dm.qry_entradasCHAVE_NFE.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe;
    dm.qry_entradasDATA_EMISSAO.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi;
    dm.qry_entradasDATA_ENTRADA.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dSaiEnt;
    dm.qry_entradasNUMERO_NOTA.Value := FormatFloat('000000000000000', dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF);
    dm.qry_entradasSERIE_NOTA.Value := Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie);
    dm.qry_entradasMODELO_NOTA.Value := '55';
    dm.qry_entradasCOD_FORNECEDOR.Value := GCodFornecedor;

    memoInformacoesComplementares.Add(dm.ACBrNFe1.NotasFiscais[0].NFe.InfAdic.infCpl);
    memoInformacoesfisco.Add(dm.ACBrNFe1.NotasFiscais[0].NFe.InfAdic.infAdFisco);

    processaItensNota();

  end;
end;

procedure TfrmEntradasNfe.novaNota();
begin
  memoInformacoesComplementares.Clear;
  memoInformacoesfisco.Clear;
  flagValidacaoNota := true;
  tentativasValidacao := 0;
  pn_codigo.Enabled := false;
  dm.qry_entradas.Active := true;
  dm.qry_entradas.Append;
  dm.qry_entradasDATA_EMISSAO.Value := Date;
  dm.qry_entradasDATA_ENTRADA.Value := Date;
  dm.qry_entradasNUMERO_NOTA.Value := '';
  dm.qry_entradasSERIE_NOTA.Value := '';
  dm.qry_entradasMODELO_NOTA.Value := '';
  dm.qry_entradasBASE_ICMS.Value := 0;
  dm.qry_entradasVALOR_ICMS.Value := 0;
  dm.qry_entradasBASE_ICMS_SUBST.value := 0;
  dm.qry_entradasVALOR_ICMS_SUBST.value := 0;
  dm.qry_entradasVALOR_PRODUTOS.Value := 0;
  dm.qry_entradasFRETE.Value := 0;
  dm.qry_entradasSEGURO.value := 0;
  dm.qry_entradasDESCONTO.value := 0;
  dm.qry_entradasOUTRAS_DESPESAS.Value := 0;
  dm.qry_entradasVALOR_IPI.Value := 0;
  dm.qry_entradasTOTAL_NOTA.value := 0;

//ed_cod_fornecedor.SetFocus;


end;

procedure TfrmEntradasNfe.recalculaTotaisNota();
var
  totalBaseICMS, totalICMS, totalBaseICMSSUB, totalICMSSUB, totalProdutos, totalIPI, totalDescontos, totalOutrasDespesas: currency;
  numeroItem: integer;
begin
  totalProdutos := 0;
  totalBaseICMS := 0;
  totalICMS := 0;
  totalBaseICMSSUB := 0;
  totalICMSSUB := 0;
  totalProdutos := 0;
  totalIPI := 0;
  totalDescontos := 0;
  totalOutrasDespesas := 0;
  numeroItem := dm.tbComprasTemp.RecNo;

  dm.tbComprasTemp.First;
  while not dm.tbComprasTemp.Eof do
  begin
    totalProdutos := totalProdutos + dm.tbComprasTemptotal.value;
    totalBaseICMS := totalBaseICMS + dm.tbComprasTempbaseICMS.Value;
    totalICMS := totalICMS + dm.tbComprasTempvalorICMS.Value;
    totalBaseICMSSUB := totalBaseICMSSUB + dm.tbComprasTempbaseICMSST.Value;
    totalICMSSUB := totalICMSSUB + dm.tbComprasTempvalorICMSST.Value;
    totalIPI := totalIPI + dm.tbComprasTempvalorIPI.Value;
    totalDescontos := totalDescontos + dm.tbComprasTempdesconto.Value;
    totalOutrasDespesas := totalOutrasDespesas + dm.tbComprasTempoutrasDespAcessorias.Value;
    dm.tbComprasTemp.Next;
  end;

  dm.qry_entradasBASE_ICMS.Value := totalBaseICMS;
  dm.qry_entradasVALOR_ICMS.Value := totalICMS;
  dm.qry_entradasBASE_ICMS_SUBST.value := totalBaseICMSSUB;
  dm.qry_entradasVALOR_ICMS_SUBST.Value := totalICMSSUB;
  dm.qry_entradasVALOR_PRODUTOS.Value := totalProdutos;
  dm.qry_entradasVALOR_IPI.Value := totalIPI;
  dm.qry_entradasDESCONTO.Value := totalDescontos;
  dm.qry_entradasOUTRAS_DESPESAS.Value := totalOutrasDespesas;
  dm.qry_entradasTOTAL_NOTA.Value := (dm.qry_entradasVALOR_PRODUTOS.Value + dm.qry_entradasOUTRAS_DESPESAS.Value) - dm.qry_entradasDESCONTO.value;




  // Reposiciona o cursor no registro que  estava em edição.
  dm.tbComprasTemp.First;
  while numeroItem <> dm.tbComprasTemp.RecNo do
    dm.tbComprasTemp.Next;

end;

function TfrmEntradasNfe.ValidaTotaisNota(): boolean;
var
  totalBaseICMS, totalICMS, totalBaseICMSSUB, totalICMSSUB, totalProdutos, totalIPI, totalDescontos, totalOutrasDespesas: currency;
begin

  try

    totalProdutos := 0;
    totalBaseICMS := 0;
    totalICMS := 0;
    totalBaseICMSSUB := 0;
    totalICMSSUB := 0;
    totalProdutos := 0;
    totalOutrasDespesas := 0;
    totalIPI := 0;
    totalDescontos := 0;

    dm.tbComprasTemp.First;
    while not dm.tbComprasTemp.Eof do
    begin
      totalProdutos := RoundABNT((totalProdutos + dm.tbComprasTemptotal.value), 3);
      totalBaseICMS := totalBaseICMS + dm.tbComprasTempbaseICMS.Value;
      totalICMS := totalICMS + dm.tbComprasTempvalorICMS.Value;
      totalBaseICMSSUB := totalBaseICMSSUB + dm.tbComprasTempbaseICMSST.Value;
      totalICMSSUB := totalICMSSUB + dm.tbComprasTempvalorICMSST.Value;
      totalIPI := totalIPI + dm.tbComprasTempvalorIPI.Value;
      totalDescontos := totalDescontos + dm.tbComprasTempdesconto.Value;
      totalOutrasDespesas := totalOutrasDespesas + dm.tbComprasTempoutrasDespAcessorias.Value;
      dm.tbComprasTemp.Next;
    end;

    if (dm.qry_entradasBASE_ICMS.value <> (totalBaseICMS)) then
      if (dm.qry_entradasBASE_ICMS.value > (totalBaseICMS)) then
      begin
        showmessage('Base de cálculo total da nota é maior que a soma das bases informadas nos ítens da nota');
        edBaseCalculoICMS.SetFocus;
        result := false;
        exit;
      end
      else
      begin
        showmessage('Base de cálculo total da nota é menor que a soma das bases informadas nos ítens da nota');
        edBaseCalculoICMS.SetFocus;
        result := false;
        exit;
      end;

    if (dm.qry_entradasVALOR_ICMS.Value <> totalICMS) then
      if (dm.qry_entradasVALOR_ICMS.Value > totalICMS) then
      begin
        showmessage('ICMS total da nota é maior que a soma do ICMS  informados nos ítens da nota');
        edValorICMS.SetFocus;
        result := false;
        exit;
      end
      else
      begin
        showmessage('ICMS total da nota é menor que a soma do ICMS  informados nos ítens da nota');
        edValorICMS.SetFocus;
        result := false;
        exit;
      end;

    if (Abs((RoundABNT(dm.qry_entradasVALOR_PRODUTOS.Value, 3) - RoundABNT(totalProdutos, 5))) > 0.01) then
    begin

      dm.exibe_painel_erro('Valor total dos produtos é diferente da soma dos ítens da nota. ' + sLineBreak + sLineBreak + 'Total dos produtos na nota: ' + FormatFloat('R$ ###,###,##0.00', dm.qry_entradasVALOR_PRODUTOS.Value) + sLineBreak + 'Total dos produtos (Soma): ' + FormatFloat('R$ ###,###,##0.00', totalProdutos), 'Ok');

      edValorProdutos.SetFocus;
      result := false;
      exit;
    end;

    if (dm.qry_entradasVALOR_IPI.Value <> totalIPI) then
      if (dm.qry_entradasVALOR_IPI.Value > totalIPI) then
      begin
        showmessage('Valor total do IPI é maior que a soma  informada nos ítens da nota');
        edValorIPI.SetFocus;
        result := false;
        exit;
      end
      else
      begin
        showmessage('Valor total do IPI  é menor que a soma  informada nos ítens da nota');
        edValorIPI.SetFocus;
        result := false;
        exit;
      end;

    if (dm.qry_entradasBASE_ICMS_SUBST.value <> totalBaseICMSSUB) then
    begin
      if (dm.qry_entradasBASE_ICMS_SUBST.value > totalBaseICMSSUB) then
      begin
        showmessage('Base do ICMS na Substituição  nota é maior que a soma das bases  informados nos ítens da nota');
        edBaseCalculoICMSSubst.SetFocus;
        result := false;
        exit;
      end
      else
      begin
        showmessage('Base do ICMS na Substituição  nota é menor que a soma das bases  informados nos ítens da nota');
        edBaseCalculoICMSSubst.SetFocus;
        result := false;
        exit;
      end;
    end;

    if (dm.qry_entradasVALOR_ICMS_SUBST.Value <> totalICMSSUB) then
    begin
      if (dm.qry_entradasVALOR_ICMS_SUBST.Value > totalICMSSUB) then
      begin
        edValorICMSSubst.SetFocus;
        result := false;
        exit;
      end
      else
      begin
        showmessage('Valor do ICMS na Substituição  nota é menor que a soma do ICMS Subst. informados nos ítens da nota');
        edValorICMSSubst.SetFocus;
        result := false;
        exit;
      end;

    end;

    if (dm.qry_entradasDESCONTO.Value <> totalDescontos) then
      if (dm.qry_entradasDESCONTO.Value > totalDescontos) then
      begin
        showmessage('Valor total do desconto  é maior que a soma dos descontos  informada nos ítens da nota');
        edValorDesconto.SetFocus;
        result := false;
        exit;
      end
      else
      begin
        showmessage('Valor total do desconto  é menor que a soma dos descontos  informada nos ítens da nota');
        edValorDesconto.SetFocus;
        result := false;
        exit;
      end;

    if (dm.qry_entradasOUTRAS_DESPESAS.Value <> totalOutrasDespesas) then
      if (dm.qry_entradasOUTRAS_DESPESAS.Value > totalOutrasDespesas) then
      begin
        showmessage('Valor total de Outras despesas  é maior que a soma de outras despesas  informada nos ítens da nota');
        edOutrasDespesas.SetFocus;
        result := false;
        exit;
      end
      else
      begin
        showmessage('Valor total Outras despesas é menor que que a soma de outras despesas informada nos ítens da nota');
        edOutrasDespesas.SetFocus;
        result := false;
        exit;
      end;

    if dm.qry_entradasTOTAL_NOTA.Value <> ((dm.qry_entradasVALOR_PRODUTOS.Value + +dm.qry_entradasVALOR_ICMS_SUBST.Value + dm.qry_entradasVALOR_IPI.Value + dm.qry_entradasFRETE.Value + dm.qry_entradasSEGURO.Value + dm.qry_entradasOUTRAS_DESPESAS.Value) - dm.qry_entradasDESCONTO.Value) then
    begin
      showmessage('Valor total da nota diverge da soma dos valores informados nos totalizadores do cabeçalho da nota !!!');
      edTotalNotaFiscal.SetFocus;
      result := false;
      exit;
    end;

    if processaXML then
    begin
      if (StrToFloat(formatFloat('#0.00', dm.qry_entradasTOTAL_NOTA.Value))) <> (StrToFloat(formatFloat('#0.00', dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF))) then
      begin
        Showmessage('Valor da entrada difere do valor total do Arquivo XML. Verifique o valor do  DANFE da nota e tente a importação novamente!');
//        dm_relatorios.ACBrNFeDANFEFR1.FastFile :=patchAplicacao+'DANFePaisagem.fr3';
        dm.ACBrNFe1.NotasFiscais.Clear;
        dm.ACBrNFe1.NotasFiscais.LoadFromString(dmManifestacaoNFE.tbManifestacaoNFE.fieldbyname('xml_nota').value, false);
        dm.ACBrNFe1.NotasFiscais.Imprimir;
        result := false;
        exit;
      end;
    end;
    Result := true
  finally
    dm.tbComprasTemp.EnableControls;
  end;

end;

procedure TfrmEntradasNfe.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  dm.qry_entradas.Cancel;
  dm.qry_entradas.Active := false;
  dm.tbComprasTemp.EmptyTable;
  dm.tbComprasTemp.Close;
end;

function TfrmEntradasNfe.verificaValidade(): boolean;
var
  difAnoReferencia: integer;
  cfopItemAtual, cfopPrimeiroItem: string;
begin

  if ((dm.qry_entradasDATA_ENTRADA.Value) < (dm.qry_entradasDATA_EMISSAO.value)) then
  begin
    showmessage('Data de entrada não pode ser menor que a data de emissão!!');

    Result := false;
    exit;
  end;

  if ((FormatDateTime('YYMM', edDataEntradaNotaFiscal.Date )) <> (copy(GChaveNFE, 3, 4))) then
  begin
    if (MessageDlg('Data de entrada informada é diferente da data informada na Chave da NF-E' + '#13#10' + ' Você está escriturando esta nota em um mês diferente do mês em que deveria ser escriturada ?', mtConfirmation, [mbYes, mbNo], 1) = mrNo) then
    begin
      ShowMessage('Por favor, informe a data de entrada correta!');
      edDataEntradaNotaFiscal.SetFocus;
      Result := false;
      exit;
    end
    else
    begin

            edDataEntradaNotaFiscal.SetFocus;
      Result := true;
//            exit;
    end;
  end;

  dm.tbComprasTemp.first;
  cfopPrimeiroItem := copy(dm.tbComprasTempCFOP.Value, 0, 1);
  while not dm.tbComprasTemp.Eof do
  begin
    cfopItemAtual := copy(dm.tbComprasTempCFOP.Value, 0, 1);

    if (MatchStr(cfopItemAtual, ['1', '2', '3']) = false) then
    begin
      dm.exibe_painel_erro('CFOP do ítem ' + dm.tbComprasTempdescricao.Value + ' não é um CFOP válido para operações de entrada!', 'Ok');
      result := false;
      exit;
    end;

    if (cfopItemAtual <> cfopPrimeiroItem) then
    begin
      dm.exibe_painel_erro('Primeiro dígito dos CFOP devem ser iguais para todos os ítens da nota!', 'Ok');
      result := false;
      exit;
    end;

    dm.tbComprasTemp.Next;
  end;

  if validaTotaisNota = true then
    result := true
  else
    result := false;

end;

procedure TfrmEntradasNfe.gravarInformacoes();
var
  informacoesComplementares: string;
  LCodigoEntrada: string;
  inicio: TDateTime;
begin

  ed_codigo.Text := dm.geraCodigo('G_ENTRADAS', 8);
  LCodigoEntrada := ed_codigo.Text;

//  inicio := Now;

  dm.qry_entradasNUMERO_NOTA.Value := FormatFloat('000000000000000', dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF);
  dm.qry_entradasCOD_ENTRADA.Value := LCodigoEntrada;
  dm.qry_entradasDATA.Value := data_do_sistema;
  dm.qry_entradasHORA.Value := Time;
  dm.qry_entradasQTDE_ITENS.Value := dm.tbComprasTemp.RecordCount;
  dm.qry_entradasCOD_USUARIO.Value := codigo_usuario;
  dm.qry_entradasNOME_USUARIO_ENTRADA.Value := nome_usuario;
  dm.qry_entradasTIPO_ENTRADA.Value := 0;

  dm.qry_entradasINFORMACOES_COMPLEMENTARES.Value := memoInformacoesComplementares.Text;
  dm.qry_entradasINFORMACOES_FISCO.Value := memoInformacoesfisco.Text;
  dm.qry_entradasQTDE_ITENS.Value := dm.tbComprasTemp.RecordCount;
  dm.dbrestaurante.ApplyUpdates([dm.qry_entradas]);

//  ShowMessage(IntToStr(SecondsBetween(inicio,Now))+' para gravar a entrada');
//  inicio := now;
  gravarItensEntrada(LCodigoEntrada);
//  ShowMessage(IntToStr(SecondsBetween(inicio,Now))+' para gravar os itens da entrada');

end;

procedure TfrmEntradasNfe.gravarItensEntrada(ACodigoEntrada: string);
var
  ordem: integer;
  LSQLTemp: TStringList;
  LListaSQL: TList<string>;
begin

  LSQLTemp := TStringList.Create;
  LListaSQL := TList<string>.Create;
  LListaSQL.Clear;
  LSQLTemp.Clear;
  dm.tbComprasTemp.DisableControls;
  try
    try

      LSQLTemp.add('delete from itens_entrada where cod_entrada=' + Quotedstr(ACodigoEntrada) + ';');
      LListaSQL.Add(LSQLTemp.Text);

      dm.tbComprasTemp.First;
      ordem := 1;
      while not dm.tbComprasTemp.Eof do
      begin
        LSQLTemp.Clear;
        LSQLTemp.add('insert into itens_entrada (ORDEM,cod_emp_grupo,');
        LSQLTemp.add('    COD_ENTRADA,COD_ITEM,QUANTIDADE,COD_UNIDADE,VALOR_UNITARIO,');
        LSQLTemp.add('    DESCRICAO_UNIDADE,ESTOQUE_ANTERIOR,COD_UNIDADE_ESTOQUE_ANTERIOR,');
        LSQLTemp.add('    ESTOQUE_ATUALIZADO,DESCRICAO_ITEM,CFOP,CST,');
        LSQLTemp.add('    SIGLA_UNID,DESCONTO,outras_despesas,');
        LSQLTemp.add('    BASE_ICMS,VALOR_ICMS,');
        LSQLTemp.add('    BASE_ICMS_ST,VALOR_ICMS_ST,');
        LSQLTemp.add('    VALOR_IPI,ALIQUOTA_IPI,ALIQUOTA_ICMS,valor_frete, valor_seguro,valor_fcp, valor_fcp_st, valor_imposto_importacao,custo_real,  data_entrada) values (');

        LSQLTemp.add('' + Quotedstr(IntToStr(ordem)) + ',');
        LSQLTemp.add('' + Quotedstr(codEmpresa) + ',');
        LSQLTemp.add('' + Quotedstr(ACodigoEntrada) + ',');
        LSQLTemp.add('' + Quotedstr(dm.tbComprasTempcodigo.Value) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempquantidade.AsString) + ',');
        LSQLTemp.add('' + Quotedstr(dm.tbComprasTempcodUnidade.Value) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTemppreco.AsString) + ',');
        LSQLTemp.add('' + Quotedstr(dm.tbComprasTempdescUnidade.Value) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(floattostr(0)) + ',');
        LSQLTemp.add('' + Quotedstr(getUnidadeEntradaItem(dm.tbComprasTempcodigo.Value)) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(floattostr(0)) + ',');
        LSQLTemp.add('' + Quotedstr(dm.tbComprasTempdescricao.AsString) + ',');
        LSQLTemp.add('' + Quotedstr(dm.tbComprasTempCFOP.Value) + ',');
        LSQLTemp.add('' + Quotedstr(dm.tbComprasTempCST.Value) + ',');
        LSQLTemp.add('' + Quotedstr(dm.tbComprasTempsiglaUnidade.Value) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempdesconto.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempoutrasDespAcessorias.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempbaseICMS.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempvalorICMS.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempbaseICMSST.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempvalorICMSST.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempvalorIPI.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempAliquotaIPI.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempaliquotaICMS.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempvalorFrete.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempvalorSeguro.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempvalorFCP.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempvalorFCPST.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempvalorImpostoImportacao.AsString) + ',');
        LSQLTemp.add('' + dm.TrocaVirgPPto(dm.tbComprasTempValorCustoReal.AsString) + ',');
        LSQLTemp.add('' + Quotedstr(FormaTdateTime('DD.MM.YYY', dm.qry_entradasDATA_ENTRADA.Value)) + ');');
        LListaSQL.Add(LSQLTemp.Text);
        ordem := ordem + 1;
        dm.tbComprasTemp.next;
      end;

      LListaSQL.Add('   execute procedure r_atualiza_estoque_entrada(' + Quotedstr(ACodigoEntrada) + ',1);');
      LListaSQL.Add(' update nfe_destinadas set lancada=1,processada=1 where chave_nfe=' + Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe) + ';');
      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 150);

//      if (evento = 1) then // Só atualiza o  estoque quando é uma nova entrada, alteração não.
//      begin
////        atualizaItemEstoque(dm.tbComprasTempcodigo.Value, (dm.tbComprasTempquantidade.value * dm.tbComprasTempparamUnidade.value), dm.tbComprasTempparamUnidade.value, dm.tbComprasTemppreco.value, FormaTdateTime('DD.MM.YYY', dm.qry_entradasDATA_ENTRADA.Value));
//      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao inserir ítens da compra! ' + sLineBreak + sLineBreak + 'Erro: ' + E.Message, 'Ok');
      end;
    end;

  finally
    FreeAndNil(LListaSQL);
    FreeAndNil(LSQLTemp);
    dm.tbComprasTemp.EnableControls;
  end;
end;

procedure TfrmEntradasNfe.atualizaItemEstoque(codItem: string; quantidade: double; parametroUnidCompra: double; valorUnitario: double; data: string);
var
  novoValorUnitario: double;
  parametroPadraoItem: double;
  q: TIBQuery;
begin
  q := TIBQuery.Create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := dm.transacao;
  q.Active := false;

  parametroPadraoItem := getParametroUnidade(getUnidadeEntradaItem(codItem));
  novoValorUnitario := ((parametroPadraoItem * valorUnitario) / parametroUnidCompra);

  q.Active := false;
  q.sql.clear;
  q.sql.add('update produtos set ');
  q.sql.add(' valor_custo            =' + dm.TrocaVirgPPto(FloatToStr(novoValorUnitario)) + ',');
  q.sql.add(' estoque_liquido        = estoque_liquido + ' + dm.TrocaVirgPPto(FloatToStr(quantidade)) + ',');
  q.sql.add(' data_ultima_reposicao  = ' + Quotedstr(data));
  q.sql.add(' where cod_produto         =' + QUotedstr(codItem));
  q.execsql;

end;

procedure TfrmEntradasNfe.bt_gravarClick(Sender: TObject);
begin
  if (verificaValidade() = true) then
  begin
    codLoja := codEmpresa;
    codigoFornecedor := GcodFornecedor;
    valorCompra := dm.qry_entradasTOTAL_NOTA.Value;
    numeroNotaFiscal := FormatFloat('000000000000000', dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF);
    dataEntradaNota := dm.qry_entradasDATA_ENTRADA.Value;

    nomeFornecedor := GRazaoSocialFornecedor;
    gravarInformacoes();
    codigoCompra := ed_codigo.Text;

    if ((evento = 1) or (evento = 2)) then
    begin

      if ((evento = 1)) then
      begin
        abrirContasAPagar();
      end;

      if (MessageBox(0, 'Deseja imprimir o espelho da nota de entrada ?', 'Espelho de nota', MB_ICONINFORMATION or MB_YESNO or MB_DEFBUTTON1) = idYes) then
        imprimirEspelho(ed_codigo.Text);

    end;

    inherited;
  end
end;

procedure TfrmEntradasNfe.abrirLancamentosRD();
begin
  Application.CreateForm(TfrmLancamentosRD, frmLancamentosRD);
  frmLancamentosRD.veioDasEntradas := true;
  frmLancamentosRD.codigoEntrada := ed_codigo.text;
  frmLancamentosRD.showmodal;
  frmLancamentosRD.free;

end;

procedure TfrmEntradasNfe.abrirContasAPagar();
begin
  application.createForm(TfrmContasApagarEntradas, frmContasApagarEntradas);
  frmContasApagarEntradas.ed_razao_social_fornecedor.Text := nomeFornecedor;
  frmContasApagarEntradas.edNumeroEntrada.Text := codigoCompra;
  frmContasApagarEntradas.edTotalConta.Value := valorCompra;
  frmContasApagarEntradas.edNumeroNota.Text := numeroNotaFiscal;
  frmContasApagarEntradas.edDataRd.Date := dataEntradaNota;
  frmContasApagarEntradas.edDataDoc.Date := dataEntradaNota;
  frmContasApagarEntradas.edDataVencimento.Date := now;
  try
    frmContasApagarEntradas.edTotalConta.Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Cobr.fat.vLiq;
    if dm.ACBrNFe1.NotasFiscais[0].NFe.Cobr.Dup.Count > 0 then
      frmContasApagarEntradas.edDataVencimento.Date := dm.ACBrNFe1.NotasFiscais[0].NFe.Cobr.Dup[0].dVenc;

  finally

  end;

  frmContasApagarEntradas.ShowModal;
  frmContasApagarEntradas.free;

end;

procedure TfrmEntradasNfe.ed_codigoExit(Sender: TObject);
begin
  inherited;
  if (Sender is TMaskEdit and ((Sender as TMaskEdit).Name = 'ed_codigo')) then
  begin
    if Trim(ed_codigo.Text) = '' then
      exit;

    try
      ed_codigo.Text := FormatFloat('00000000', StrTOFloat(ed_codigo.text));
    except
      begin
        ShowMessage('Código de entrada inválido!');
        ed_codigo.clear;
        ed_codigo.SetFocus;
        exit;
      end;
    end;

    if (verificaExistenciaEntrada(trim(ed_codigo.Text)) = true) then
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

procedure TfrmEntradasNfe.retornaInformacoes(cod_entrada: string);
begin
  dm.qry_entradas.active := false;
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
  dm.qry_entradas.sql.add(' where e.cod_entrada=' + Quotedstr(ed_codigo.text));
  dm.qry_entradas.active := true;

  bt_imprimir.Enabled := true;

  if (evento = 2) then
  begin
    dm.qry_entradas.Edit;
  end;

  if ((evento = 2) or (evento = 3)) then
    bt_gravar.Enabled := true;
end;

procedure TfrmEntradasNfe.bt_consultarClick(Sender: TObject);
begin
  pn_codigo.Enabled := true;
  inherited;
end;

procedure TfrmEntradasNfe.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaEntradas();
  ed_codigo.Text := string_auxiliar;
  if verificaExistenciaEntrada(ed_codigo.Text) then
    retornaInformacoes(ed_codigo.text);
end;

procedure TfrmEntradasNfe.FormActivate(Sender: TObject);
begin
  inherited;
  if processaXML then
  begin
    bt_novo.Click;

  end;

end;

procedure TfrmEntradasNfe.BitBtn3Click(Sender: TObject);
begin
  inherited;
  retornaValoresComponentes();
end;

procedure TfrmEntradasNfe.edNumeroNotaFiscalExit(Sender: TObject);
var
  codEntrada: string;
begin
  inherited;
end;

procedure TfrmEntradasNfe.edSerieNotaExit(Sender: TObject);
var
  codEntrada: string;
begin
  inherited;

  if Sender is TCustomEdit and (((Sender as TCustomEdit).Name = 'edValorProdutos') or ((Sender as TCustomEdit).Name = 'edValorFrete') or ((Sender as TCustomEdit).Name = 'edValorSeguro') or ((Sender as TCustomEdit).Name = 'edOutrasDespesas') or ((Sender as TCustomEdit).Name = 'edValorIPI') or ((Sender as TCustomEdit).Name = 'edOutrasDespesas') or ((Sender as TCustomEdit).Name = 'edValorDesconto')) then
  begin
    dm.qry_entradasTOTAL_NOTA.value := (dm.qry_entradasVALOR_PRODUTOS.value + dm.qry_entradasFRETE.value + dm.qry_entradasVALOR_IPI.value + dm.qry_entradasOUTRAS_DESPESAS.value + dm.qry_entradasSEGURO.value) - dm.qry_entradasDESCONTO.Value;
  end;

end;

procedure TfrmEntradasNfe.imprimirEspelho(codigo_entrada: string);
var
  Q: Tibquery;
begin
  Q := TIBQuery.Create(self);
  Q.Database := dm.dbrestaurante;
  Q.Transaction := dm.transacao;
  Q.Active := false;

  dm_relatorios.qryEspelhoNotasEntrada.Active := false;
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
  dm_relatorios.qryEspelhoNotasEntrada.sql.add(' where e.cod_entrada=' + Quotedstr(codigo_entrada));
  dm_relatorios.qryEspelhoNotasEntrada.Active := true;

  Q.Active := false;
  Q.sql.clear;
  Q.SQL.add('select * from contas_a_pagar where codigo_entrada=' + Quotedstr(codigo_entrada));
  Q.Active := true;

  if Q.IsEmpty then
    dm_relatorios.setObservacaoRelatorio('Esta entrada não gerou títulos de débito no Contas à pagar ')
  else
    dm_relatorios.setObservacaoRelatorio('Esta entrada gerou os seguintes títulos a serem pagos: ');
  Q.Active := false;
  FreeAndNil(Q);

  dm_relatorios.rpt.LoadFromFile(patchAplicacao + 'relatorios\espelhoNotaFiscalEntrada.fr3', true);
  dm_relatorios.rpt.ShowReport(true);
end;

procedure TfrmEntradasNfe.bt_imprimirClick(Sender: TObject);
begin
  inherited;
  imprimirEspelho(ed_codigo.Text);

end;

procedure TfrmEntradasNfe.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if (Column.FieldName = 'descricao') or (Column.FieldName = 'ordem') or (Column.FieldName = 'codigo') then
  begin
    if odd(dm.tbComprasTemp.RecNo) then
    begin

    end
    else
    begin

    end
  end;



//TDbGrid(Sender).Canvas.font.Color:= clBlack;
  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[DataCol].field, State);

  TDbGrid(Sender).Canvas.font.Color := clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clred; //aqui é definida a cor do fundo
      Font.Color := clWhite;
      Font.Size := Font.Size + 2;
      Font.Style := [fsbold];
      FillRect(Rect);
    end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[DataCol].field, State);

end;

procedure TfrmEntradasNfe.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    if (dm.tbComprasTemp.State = dsInsert) or (dm.tbComprasTemp.State = dsEdit) then
      dm.tbComprasTemp.Post;
    recalculaTotaisNota;
  end;

end;

procedure TfrmEntradasNfe.FormCreate(Sender: TObject);
begin
  inherited;
  memoInformacoesComplementares := TStringList.Create;
  memoInformacoesfisco := TStringList.Create;
  processaXML := false;
end;

procedure TfrmEntradasNfe.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(memoInformacoesComplementares);
  FreeAndNil(memoInformacoesfisco);
end;

end.

