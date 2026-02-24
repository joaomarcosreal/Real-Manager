unit uuEntradasNFE;

interface

uses
  Windows, Messages, SysUtils, System.Math, RealFramework, pcnConversaoNFe,
  Variants, Classes, Graphics, Controls, Forms, uu_data_module,
  System.Generics.Collections, ACBrUtil, FireDAC.Comp.Client, Dialogs,
  ibx.ibquery, DBGrids, StdCtrls, DBCtrls, Buttons, ExtCtrls, RXDBCtrl, ComCtrls,
  xmldom, DB, rxcurredit, Menus, RxToolEdit, System.AnsiStrings, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxCore,
  cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles,
  cxDataStorage, cxNavigator, cxDBData, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, uu_modelo_Vazio, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, AdvGlassButton, Vcl.Samples.Spin, RxMemDS,
  cxCustomData, cxFilter, cxData, dxDateRanges, dxScrollbarAnnotations,
  Vcl.Grids, Vcl.Mask;

type
  TfrmEntradasNfe = class(Tfrm_modelo_vazio)
    Panel8: TPanel;
    Label22: TLabel;
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
    edChaveNotaFiscal: TEdit;
    pn_botoes: TPanel;
    btSalvar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    xedDataEntradaNotaFiscal: TLabel;
    edDataEntradaNotaFiscal: TcxDateEdit;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel11: TPanel;
    Panel10: TPanel;
    Label4: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label12: TLabel;
    edNumeroParcelas: TSpinEdit;
    edDiasParcelas: TSpinEdit;
    edDataCompetencia: TcxDateEdit;
    edDataVencimento: TcxDateEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    edTotalFinanceiro: TCurrencyEdit;
    Label19: TLabel;
    edValorAjuste: TCurrencyEdit;
    Label15: TLabel;
    Label13: TLabel;
    CheckBox1: TCheckBox;
    Panel14: TPanel;
    pnICMS: TPanel;
    Panel16: TPanel;
    edValorCustosComplementares: TCurrencyEdit;
    Label14: TLabel;
    Panel15: TPanel;
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
    Label10: TLabel;
    edBaseCalculoICMS: TCurrencyEdit;
    edValorICMS: TCurrencyEdit;
    edBaseCalculoICMSSubst: TCurrencyEdit;
    edValorICMSSubst: TCurrencyEdit;
    edValorProdutos: TCurrencyEdit;
    edValorFrete: TCurrencyEdit;
    edValorSeguro: TCurrencyEdit;
    edValorDesconto: TCurrencyEdit;
    edOutrasDespesas: TCurrencyEdit;
    edValorIPI: TCurrencyEdit;
    edTotalNotaFiscal: TCurrencyEdit;
    pnGlobal: TPanel;
    pnFornecedor: TPanel;
    Panel1: TPanel;
    Panel7: TPanel;
    Label6: TLabel;
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
    panelParcelas: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel20: TPanel;
    DBGrid1: TDBGrid;
    Panel21: TPanel;
    Panel22: TPanel;
    AdvGlassButton1: TAdvGlassButton;
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
    AdvGlassButton2: TAdvGlassButton;
    procedure adicionaItemCompra(ordem: string; codigo: string; descricao: string; quantidade: double; codUnidade: string; siglaUnidade: string; preco: double; CST: string; CFOP: string; desconto: double; outrasDespesasAcessorias: double; baseICMS: double; valorICMS: double; baseICMSST: double; valorICMSST: double; valorIPI: double; AliquotaICMS: double; AliquotaIPI: double; paramUnidade: double; descUnidade: string);

     //

    procedure SalvarInformacoes();
    procedure FormActivate(Sender: TObject);
    procedure recalculaTotaisNota();
    procedure novaNota();
    procedure imprimirEspelho(codigo_entrada: string);
    procedure edNumeroNotaFiscalExit(Sender: TObject);
    procedure edSerieNotaExit(Sender: TObject);
    procedure abrirContasAPagar();
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btSalvarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure cxGrid1DBTableView1precoPropertiesEditValueChanged(Sender: TObject);
    procedure cxGrid1DBTableView1outrasDespAcessoriasPropertiesEditValueChanged(Sender: TObject);
    procedure cxGrid1DBTableView1descontoPropertiesEditValueChanged(Sender: TObject);
    procedure AdvGlassButton2Click(Sender: TObject);
  private
    { Private declarations }
    LCodigoEntrada: string;
    flagValidacaoNota: boolean;
    tentativasValidacao: smallint;
    dataEntradaNota: TDate;
    procedure ExibirXMLNotaCarregada;
    function getCodigosProdutosNota: string;
    procedure processaItensNota;
    procedure NovaEntradaDeNFe;
    procedure SalvarItensEntrada(ACodigoEntrada: string; AListaSQL: TList<string>);
    procedure SalvarEntrada(ACodigoEntrada: string; AListaSQL: TList<string>);
    procedure ConfiguraHints;
    function validarParcelas(testaSomaParcelas: boolean): boolean;
    procedure ValidarTotaisDaNota;
    function ValidarDadosDaEntrada: boolean;
    procedure AtualizarEstoqueDosProdutos(ACodigoEntrada: string; AListaSQL: TList<string>);
  public
    { Public declarations }

    processaXML: boolean;
    GcodFornecedor: string;
    GRazaoSocialFornecedor: string;
    GChaveNFE: string;
    memoInformacoesComplementares: TStringList;
    memoInformacoesfisco: TStringList;
    LXMLNotaCarregada: string;
    procedure SetXMLNFE(AXML: string);
  end;

var
  frmEntradasNfe: TfrmEntradasNfe;
  eventoAuxiliar: integer;
  codNotaAuxiliar: string;

implementation

uses
  uu_frm_principal, UU_DM_RELATORIOS, uuContasAPagarEntradas, uuDmContasAPagar;

{$R *.dfm}

procedure TfrmEntradasNfe.SetXMLNFE(AXML: string);
begin
  LXMLNotaCarregada := AXML;
end;

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

procedure TfrmEntradasNfe.AdvGlassButton2Click(Sender: TObject);
begin
  inherited;
  ExibirXMLNotaCarregada;
end;

procedure TfrmEntradasNfe.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmEntradasNfe.btSalvarClick(Sender: TObject);
begin
  inherited;
  btSalvar.enabled := false;
  try
    try
      ValidarDadosDaEntrada();
      ValidarTotaisDaNota();
      SalvarInformacoes();

      if ((evento = 1)) then
      begin
        abrirContasAPagar();
      end;
      ShowRealDialog(frm_principal, tmSucesso, 'Sucesso!', 'Entrada efetuada com sucesso!', 22, true);
      close;
    except
      on E: Exception do
      begin

        ShowRealDialog(frm_principal, tmErro, 'Erro!', E.message, 18, true);
        btSalvar.enabled := true;
      end;

    end;

  finally

  end;
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
  LMensagemAtencao: string;
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
          LMensagemAtencao := 'O produto ' + LDescricaoItem + ' possui duas unidades de venda na NF-e:';
          LMensagemAtencao := LMensagemAtencao + sLineBreak + 'Quantidade comercial:  ' + FormatFloat('#0.000', dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.qCom) + ' ' + dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.Ucom;
          LMensagemAtencao := LMensagemAtencao + sLineBreak + 'Quantidade tributada:  ' + FormatFloat('#0.000', dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.qTrib) + ' ' + dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.Utrib;
          LMensagemAtencao := LMensagemAtencao + sLineBreak + sLineBreak + 'Deseja usar a quantidade tributada?';
          if (ShowRealDialog(frm_principal, tmConfirmacao, 'Confirme', LMensagemAtencao, 16, true) = teSim) then
          begin
            LQuantidadeItem := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.qTrib;
          end;

//          ShowRealDialog(frm_principal, tmAviso, 'Atenção!', LMensagemAtencao, 18, true);
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

      except
        on E: Exception do
        begin
          dm.exibe_painel_erro('Erro ao buscar informações do produto ' + LCodProdutoFornecedor + dm.ACBrNFe1.NotasFiscais[0].NFe.Det[LitemAtual].Prod.xProd, 'Ok');

          exit
        end;

      end;
    end;

    edValorProdutos.value := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vProd;
    edValorDesconto.value := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vDesc;
    edOutrasDespesas.value := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vOutro + dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vFrete + dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vSeg + dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vIPI + dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vFCPST + dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vST;

    edBaseCalculoICMSSubst.value := 0;
    edValorICMSSubst.Value := 0;
    edBaseCalculoICMS.Value := 0;
    edValorICMS.value := 0;
    edValorIPI.value := 0;

    edTotalNotaFiscal.Value := (edValorProdutos.value + edOutrasDespesas.value) - edValorDesconto.value;

  finally
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
    FreeAndNil(LSQL);

  end;

end;

procedure TfrmEntradasNfe.NovaEntradaDeNFe();
var
  qtdItensNota: integer;
  itemAtual: integer;
  cnpjFornecedor, codProdutoFornecedor: string;
  MyClass: TComponent;
begin
  novaNota();
  memoInformacoesComplementares.Clear;
  memoInformacoesfisco.Clear;

  dm.tbComprasTemp.EmptyTable;
  dm.tbComprasTemp.Active := true;

  if processaXML then
  begin

    memoInformacoesComplementares.Add(dm.ACBrNFe1.NotasFiscais[0].NFe.InfAdic.infCpl);
    memoInformacoesfisco.Add(dm.ACBrNFe1.NotasFiscais[0].NFe.InfAdic.infAdFisco);

    processaItensNota();

  end;
end;

procedure TfrmEntradasNfe.cxGrid1DBTableView1descontoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  recalculaTotaisNota;
end;

procedure TfrmEntradasNfe.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if (dm.tbComprasTemp.State = dsInsert) or (dm.tbComprasTemp.State = dsEdit) then
      dm.tbComprasTemp.Post;
    recalculaTotaisNota;
  end;
end;

procedure TfrmEntradasNfe.cxGrid1DBTableView1outrasDespAcessoriasPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  recalculaTotaisNota;
end;

procedure TfrmEntradasNfe.cxGrid1DBTableView1precoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  recalculaTotaisNota();
end;

procedure TfrmEntradasNfe.novaNota();
begin

  memoInformacoesComplementares.Clear;
  memoInformacoesfisco.Clear;
  flagValidacaoNota := true;
  tentativasValidacao := 0;

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

  edBaseCalculoICMS.Value := totalBaseICMS;
  edValorICMS.value := totalICMS;
  edBaseCalculoICMSSubst.value := totalBaseICMSSUB;
  edValorICMSSubst.Value := totalICMSSUB;
  edValorProdutos.value := totalProdutos;
  edValorIPI.value := totalIPI;
  edValorDesconto.value := totalDescontos;
  edOutrasDespesas.value := totalOutrasDespesas;
  edTotalNotaFiscal.value := (edValorProdutos.value + edOutrasDespesas.value) - edValorDesconto.value;

  // Reposiciona o cursor no registro que  estava em edição.
  dm.tbComprasTemp.First;
  while numeroItem <> dm.tbComprasTemp.RecNo do
    dm.tbComprasTemp.Next;

end;

procedure TfrmEntradasNfe.ValidarTotaisDaNota;
var
  totalBaseICMS, totalICMS, totalBaseICMSSUB, totalICMSSUB, totalProdutos, totalIPI, totalDescontos, totalOutrasDespesas: Extended;
  LMensagemErro: string;
  LDiferencaTotalNota: extended;
begin
  totalProdutos := 0;
  totalBaseICMS := 0;
  totalICMS := 0;
  totalBaseICMSSUB := 0;
  totalICMSSUB := 0;
  totalProdutos := 0;
  totalOutrasDespesas := 0;
  totalIPI := 0;
  totalDescontos := 0;
  try
    dm.tbComprasTemp.First;
    while not dm.tbComprasTemp.Eof do
    begin
      totalProdutos := RoundABNT((totalProdutos + dm.tbComprasTemptotal.value), 3);
      totalBaseICMS := RoundABNT((totalBaseICMS + dm.tbComprasTempbaseICMS.Value), 2);
      totalICMS := RoundABNT((totalICMS + dm.tbComprasTempvalorICMS.Value), 2);
      totalBaseICMSSUB := RoundABNT((totalBaseICMSSUB + dm.tbComprasTempbaseICMSST.Value), 2);
      totalICMSSUB := RoundABNT((totalICMSSUB + dm.tbComprasTempvalorICMSST.Value), 2);
      totalIPI := RoundABNT((totalIPI + dm.tbComprasTempvalorIPI.Value), 2);
      totalDescontos := RoundABNT((totalDescontos + dm.tbComprasTempdesconto.Value), 2);
      totalOutrasDespesas := RoundABNT((totalOutrasDespesas + dm.tbComprasTempoutrasDespAcessorias.Value), 2);
      dm.tbComprasTemp.Next;
    end;

    if (edBaseCalculoICMS.value <> (totalBaseICMS)) then
      raise Exception.Create('Base de cálculo total da nota é maior que a soma das bases informadas nos ítens da nota');

    if (edValorICMS.value <> totalICMS) then
      raise Exception.Create('ICMS total da nota é maior que a soma do ICMS  informados nos ítens da nota');

    if (Abs((RoundABNT(edValorProdutos.value, 3) - RoundABNT(totalProdutos, 5))) > 0.02) then
      raise Exception.Create('Valor total dos produtos é diferente da soma dos ítens da nota. ' + sLineBreak + sLineBreak + 'Total dos produtos na nota: ' + FormatFloat('R$ ###,###,##0.00', edValorProdutos.value) + sLineBreak + 'Total dos produtos (Soma): ' + FormatFloat('R$ ###,###,##0.00', totalProdutos));

    if (edValorIPI.value <> totalIPI) then
      raise Exception.Create('Valor total do IPI é maior que a soma  informada nos ítens da nota');

    if (edBaseCalculoICMSSubst.value <> totalBaseICMSSUB) then
      raise Exception.Create('Base do ICMS na Substituição  nota é maior que a soma das bases  informados nos ítens da nota');

    if (edValorICMSSubst.value <> totalICMSSUB) then
      raise Exception.Create('Valor do ICMS na Substituição  nota é menor que a soma do ICMS Subst. informados nos ítens da nota');

    if (SameValue(edValorDesconto.value, totalDescontos, 0.001) = False) then
      raise Exception.Create('Valor total do desconto difere da soma dos descontos  informada nos ítens da nota');

    if (SameValue(edOutrasDespesas.value, totalOutrasDespesas, 0.001) = false) then
      raise Exception.Create('Valor total de Outras despesas difere da soma de outras despesas  informada nos ítens da nota');

    if (SameValue(edTotalNotaFiscal.value, ((edValorProdutos.value + edValorICMSSubst.value + edValorIPI.value + edValorFrete.value + edValorSeguro.value + edOutrasDespesas.value) - edValorDesconto.value), 0.001) = false) then
      raise Exception.Create('Valor total da nota diverge da soma dos valores informados nos totalizadores do cabeçalho da nota !!!');

    if processaXML then
      if (SameValue(edTotalNotaFiscal.value, dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF, 0.001) = false) then
      begin
        LDiferencaTotalNota := edTotalNotaFiscal.value - dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF;
        LMensagemErro := 'Valor da entrada difere do valor total do Arquivo XML.';
        LMensagemErro := LMensagemErro + ' Verifique a diferença e efetue as correções.';
        LMensagemErro := LMensagemErro + sLineBreak + sLineBreak;
        LMensagemErro := LMensagemErro + 'Total da entrada: R$ ' + FormatFloat('#0.00', edTotalNotaFiscal.value);
        LMensagemErro := LMensagemErro + sLineBreak + 'Total do XML: R$ ' + FormatFloat('#0.00', dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF);
        LMensagemErro := LMensagemErro + sLineBreak + 'Diferença: R$ ' + FormatFloat('#0.00', LDiferencaTotalNota);
        raise Exception.Create(LMensagemErro);
      end;

  finally
    dm.tbComprasTemp.EnableControls;
  end;

end;

procedure TfrmEntradasNfe.ExibirXMLNotaCarregada;
begin
  dm.parametrizaAcbrNFE(moNFe, False, false);
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromString(LXMLNotaCarregada);
  dm.ACBrNFe1.NotasFiscais.Imprimir;
end;

function TfrmEntradasNfe.ValidarDadosDaEntrada(): boolean;
var
  difAnoReferencia: integer;
  cfopItemAtual, cfopPrimeiroItem: string;
begin
  if ((edDataEntradaNotaFiscal.date) < (edDataDoc.date)) then
    raise Exception.Create('Data de entrada não pode ser menor que a data de emissão!!');

  if ((FormatDateTime('YYMM', edDataEntradaNotaFiscal.Date)) <> (copy(GChaveNFE, 3, 4))) then
    if (MessageDlg('Data de entrada informada é diferente da data informada na Chave da NF-E' + '#13#10' + ' Você está escriturando esta nota em um mês diferente do mês em que deveria ser escriturada ?', mtConfirmation, [mbYes, mbNo], 1) = mrNo) then
    begin
      raise Exception.Create('Por favor, informe a data de entrada correta!');
    end;

  dm.tbComprasTemp.first;
  cfopPrimeiroItem := copy(dm.tbComprasTempCFOP.Value, 0, 1);
  while not dm.tbComprasTemp.Eof do
  begin
    cfopItemAtual := copy(dm.tbComprasTempCFOP.Value, 0, 1);

    if (MatchStr(cfopItemAtual, ['1', '2', '3']) = false) then
      raise Exception.Create('CFOP do ítem ' + dm.tbComprasTempdescricao.Value + ' não é um CFOP válido para operações de entrada!');

    if (cfopItemAtual <> cfopPrimeiroItem) then
      raise Exception.Create('Primeiro dígito dos CFOP devem ser iguais para todos os ítens da nota!');

    dm.tbComprasTemp.Next;
  end;

end;

procedure TfrmEntradasNfe.AtualizarEstoqueDosProdutos(ACodigoEntrada: string; AListaSQL: TList<string>);
begin
  try
    try
      AListaSQL.Add('   execute procedure r_atualiza_estoque_entrada(' + Quotedstr(ACodigoEntrada) + ',1);');
      AListaSQL.Add(' update nfe_destinadas set lancada=1,processada=1 where chave_nfe=' + Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe) + ';');
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao atualizar estoque dos ítens!');
      end;
    end;

  finally

  end;
end;

procedure TfrmEntradasNfe.SalvarInformacoes();
var
  LListaSQL: TList<string>;
begin
  LListaSQL := TList<string>.Create;
  LListaSQL.Clear;

  try
    try
      LCodigoEntrada := dm.geraCodigo('G_ENTRADAS', 8);
      SalvarEntrada(LCodigoEntrada, LListaSQL);
      SalvarItensEntrada(LCodigoEntrada, LListaSQL);
      AtualizarEstoqueDosProdutos(LCodigoEntrada, LListaSQL);
      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 150);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;

  finally
    FreeAndNil(LListaSQL);
  end;

end;

procedure TfrmEntradasNfe.SalvarItensEntrada(ACodigoEntrada: string; AListaSQL: TList<string>);
var
  ordem: integer;
  LSQLTemp: TStringList;
begin

  LSQLTemp := TStringList.Create;
  LSQLTemp.Clear;
  dm.tbComprasTemp.DisableControls;
  try
    try

      LSQLTemp.add('delete from itens_entrada where cod_entrada=' + Quotedstr(ACodigoEntrada) + ';');
      AListaSQL.Add(LSQLTemp.Text);
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
        LSQLTemp.add('' + Quotedstr(FormaTdateTime('DD.MM.YYY', edDataEntradaNotaFiscal.date)) + ');');
        AListaSQL.Add(LSQLTemp.Text);
        ordem := ordem + 1;
        dm.tbComprasTemp.next;
      end;

    except
      on E: Exception do
      begin
        raise exception.Create('Erro aos inserir ítens da compra!');
      end;
    end;
  finally
    FreeAndNil(LSQLTemp);
    dm.tbComprasTemp.EnableControls;
  end;
end;

procedure TfrmEntradasNfe.abrirContasAPagar();
begin
  application.createForm(TdmContasAPagar, DmContasAPagar);
  application.createForm(TfrmContasApagarEntradas, frmContasApagarEntradas);

  try
    try

      frmContasApagarEntradas.edNumeroEntrada.Text := LCodigoEntrada;
      frmContasApagarEntradas.edTotalConta.Value := edTotalNotaFiscal.value;
      frmContasApagarEntradas.edNumeroNota.Text := edNumeroNota.text;
      frmContasApagarEntradas.edDataRd.Date := edDataEntradaNotaFiscal.date;
      frmContasApagarEntradas.edDataDoc.Date := edDataDoc.date;
      frmContasApagarEntradas.SetCodigoFornecedor(GcodFornecedor);
      frmContasApagarEntradas.ShowModal;
    except
      on E: exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro!', E.message, 18, true);
      end;
    end;
  finally
    frmContasApagarEntradas.free;
    dmContasAPagar.Free;
  end;
end;

procedure TfrmEntradasNfe.FormActivate(Sender: TObject);
begin
  inherited;
  evento := 1;
  if processaXML then
  begin
    edDataEntradaNotaFiscal.Date := Date;
    edDataVencimento.Date := date;
    edDataCompetencia.date := date;
    NovaEntradaDeNFe;
  end;

end;

procedure TfrmEntradasNfe.SalvarEntrada(ACodigoEntrada: string; AListaSQL: TList<string>);
var
  LSQL: TStringList;
begin
  LSQL := TStringList.create();

  try
    LSQL.add(' insert into entradas(          ');
    LSQL.add('    COD_ENTRADA,                ');
    LSQL.add('    COD_FORNECEDOR,             ');
    LSQL.add('    COD_USUARIO,                ');
    LSQL.add('    QTDE_ITENS,                 ');
    LSQL.add('    DATA,                       ');
    LSQL.add('    HORA,                       ');
    LSQL.add('    NOME_USUARIO_ENTRADA,       ');
    LSQL.add('    DATA_EMISSAO,               ');
    LSQL.add('    DATA_ENTRADA,               ');
    LSQL.add('    NUMERO_NOTA,                ');
    LSQL.add('    SERIE_NOTA,                 ');
    LSQL.add('    MODELO_NOTA,                ');
    LSQL.add('    BASE_ICMS,                  ');
    LSQL.add('    VALOR_ICMS,                 ');
    LSQL.add('    BASE_ICMS_SUBST,            ');
    LSQL.add('    VALOR_ICMS_SUBST,           ');
    LSQL.add('    VALOR_PRODUTOS,             ');
    LSQL.add('    FRETE,                      ');
    LSQL.add('    SEGURO,                     ');
    LSQL.add('    DESCONTO,                   ');
    LSQL.add('    OUTRAS_DESPESAS,            ');
    LSQL.add('    VALOR_IPI,                  ');
    LSQL.add('    TOTAL_NOTA,                 ');
    LSQL.add('    COD_EMP_GRUPO,              ');
    LSQL.add('    CHAVE_NFE,                  ');
    LSQL.add('    TIPO_ENTRADA,               ');
    LSQL.add('    INFORMACOES_COMPLEMENTARES, ');
    LSQL.add('    INFORMACOES_FISCO,          ');
    LSQL.add('    COD_EMPRESA)                ');
    LSQL.add(' values (');
    LSQL.add(Quotedstr(LCodigoEntrada) + ',');
    LSQL.add(Quotedstr(GcodFornecedor) + ',');
    LSQL.add(Quotedstr(codigo_usuario) + ',');
    LSQL.add(Inttostr(dm.tbComprasTemp.RecordCount) + ',');
    LSQL.add('current_date,');
    LSQL.add('current_time,');
    LSQL.add(Quotedstr(nome_usuario) + ',');
    LSQL.add(QUotedstr(FormatDateTime('DD.MM.YYY', edDataDoc.Date)) + ',');
    LSQL.add(QUotedstr(FormatDateTime('DD.MM.YYY', edDataEntradaNotaFiscal.Date)) + ',');
    LSQL.add(Quotedstr(FormatFloat('000000000000000', StrToInt(edNumeroNota.Text))) + ',');
    LSQL.add(Quotedstr(edSerieNota.text) + ',');
    LSQL.add(Quotedstr('55') + ',');
    LSQL.add(dm.TrocaVirgPPto(FloatToStr(edBaseCalculoICMS.value)) + ',');
    LSQL.add(dm.TrocaVirgPPto(FloatToStr(edValorICMS.value)) + ',');
    LSQL.add(dm.TrocaVirgPPto(FloatToStr(edBaseCalculoICMSSubst.value)) + ',');
    LSQL.add(dm.TrocaVirgPPto(FloatToStr(edValorICMSSubst.value)) + ',');
    LSQL.add(dm.TrocaVirgPPto(FloatToStr(edValorProdutos.value)) + ',');
    LSQL.add(dm.TrocaVirgPPto(FloatToStr(edValorFrete.value)) + ',');
    LSQL.add(dm.TrocaVirgPPto(FloatToStr(edValorSeguro.value)) + ',');
    LSQL.add(dm.TrocaVirgPPto(FloatToStr(edValorDesconto.value)) + ',');
    LSQL.add(dm.TrocaVirgPPto(FloatToStr(edOutrasDespesas.Value)) + ',');
    LSQL.add(dm.TrocaVirgPPto(FloatToStr(edValorIPI.Value)) + ',');
    LSQL.add(dm.TrocaVirgPPto(FloatToStr(edTotalNotaFiscal.value)) + ',');
    LSQL.add(Quotedstr(codEmpresa) + ',');
    LSQL.add(Quotedstr(edChaveNotaFiscal.Text) + ',');
    LSQL.add('0,');
    LSQL.add(Quotedstr(memoInformacoesComplementares.text) + ',');
    LSQL.add(Quotedstr(memoInformacoesfisco.text) + ',');
    LSQL.add(Quotedstr(codEmpresa) + ');');
    AListaSQL.add(LSQL.Text);

  finally
    FreeAndNil(LSQL);
  end;

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
    edTotalNotaFiscal.value := (edValorProdutos.value + edValorFrete.value + edValorIPI.value + edOutrasDespesas.value + edValorSeguro.value) - edValorDesconto.value;
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

procedure TfrmEntradasNfe.FormCreate(Sender: TObject);
begin
  inherited;
  ConfiguraHints;
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

procedure TfrmEntradasNfe.ConfiguraHints();
begin
  edValorCustosComplementares.Hint := 'Custos Extras'#13#10#13#10 + 'Este campo representa os custos adicionais que podem ser incorridos na compra de mercadorias de outro estado, além do preço da própria mercadoria. Alguns exemplos desses custos extras incluem:'#13#10#13#10 + '- Frete: O custo de transporte da mercadoria do local de origem até o seu destino.'#13#10 + '- Impostos: Impostos como diferença entre impostos interestaduais.'#13#10 +
    '- Taxas administrativas: Taxas cobradas pela empresa vendedora pelo processamento da compra, emissão de notas fiscais, etc.'#13#10 + '- Seguro de transporte: Custo de um seguro para proteger a mercadoria durante o transporte.'#13#10 + '- Armazenagem: Custos com o aluguel de espaço e manutenção caso seja necessário armazenar a mercadoria antes da entrega.'#13#10 + '- Desembaraço aduaneiro: Taxas e impostos de importação, além de custos com o processo de desembaraço aduaneiro, caso a compra seja de outro país.'#13#10#13#10 + 'Certifique-se de considerar todos esses possíveis custos extras ao orçar uma compra fora do seu estado, para evitar surpresas desagradáveis.';
end;

function TfrmEntradasNfe.validarParcelas(testaSomaParcelas: boolean): boolean;
var
  somaParcelas: real;
  valorConta: real;
begin
    {
  Result := true;
  somaParcelas := 0;
  valorConta := 0;
  valorConta := edTotalFinanceiro.Value;

  if (testaSomaParcelas = true) then
  begin
    tbParcelas.First;
    somaParcelas := 0;
    while not tbParcelas.Eof do
    begin
      somaParcelas := somaParcelas + tbParcelasvalorParcela.Value;
      tbParcelas.Next;
    end;

    if (FloatToCurr(somaParcelas) <> FloatToCurr(valorConta)) then
    begin
      showmessage('Valor da soma das parcelas não é equivalente ao total do lançamento!');
      edTotalConta.SetFocus;
      Result := false;
      exit;
    end;
  end;
  }
end;

end.

