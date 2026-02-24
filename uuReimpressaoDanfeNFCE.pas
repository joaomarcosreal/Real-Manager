unit uuReimpressaoDanfeNFCE;

interface

uses
  Windows, uu_frm_principal, Messages, SysUtils, uu_data_module, Variants,
  ACBrXmlBase, ACBrXMLDocument, uuFrmEmissaoNFEReferenciada,
  System.Generics.Collections, RealFramework, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, StdCtrls, ExtCtrls, Buttons, Vcl.Clipbrd, Mask,
  JvExControls, JvTransparentButton, pcnConversaoNFe, Data.DB, RxToolEdit,
  Vcl.ImgList, CurvyControls, Vcl.Menus, uufrmCartaCorrecao, JvPageList,
  cxGraphics, cxControls, cxLookAndFeelPainters, cxCheckComboBox, cxCheckBox,
  cxLookAndFeels, cxContainer, cxEdit, System.ImageList, JvButton, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, cxStyles, cxCustomData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit, PngSpeedButton,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSFillPatterns, dxPSEdgePatterns, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, dxPSCompsProvider, dxPSPDFExportCore, dxPSPDFExport,
  cxFilter, cxData, dxDateRanges, dxScrollbarAnnotations;

type
  TfrmGerenciamentoVendasCaixa = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    img: TImageList;
    img2: TImageList;
    popGridVendas: TPopupMenu;
    VisualizarDanfe1: TMenuItem;
    ReimprimirDanfe1: TMenuItem;
    Cartadecorreo1: TMenuItem;
    CancelarNFENFCe1: TMenuItem;
    Label1: TLabel;
    E1: TMenuItem;
    C1: TMenuItem;
    C2: TMenuItem;
    E2: TMenuItem;
    pgList: TJvPageList;
    pgPrincipal: TJvStandardPage;
    pgEmail: TJvStandardPage;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    GroupBox2: TGroupBox;
    Panel5: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    ed_data_inicial: TDateEdit;
    ed_data_final: TDateEdit;
    edNotaInicial: TEdit;
    edNotaFinal: TEdit;
    rdgPDV: TRadioGroup;
    edNumeroPDV: TEdit;
    rdgTipoVenda: TRadioGroup;
    rdgDocumento: TRadioGroup;
    edMesa: TEdit;
    edValor: TEdit;
    pnl1: TPanel;
    D1: TMenuItem;
    GroupBox1: TGroupBox;
    cbFormasPagamento: TcxCheckComboBox;
    ckbDataMovimento: TRadioButton;
    ckbDataRelogio: TRadioButton;
    GroupBox3: TGroupBox;
    cbEmpresas: TcxCheckComboBox;
    rdDesconto: TRadioGroup;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    cxGrid1DBTableView1Column8: TcxGridDBColumn;
    cxGrid1DBTableView1Column9: TcxGridDBColumn;
    cxGrid1DBTableView1Column10: TcxGridDBColumn;
    cxGrid1DBTableView1Column11: TcxGridDBColumn;
    cxGrid1DBTableView1Column12: TcxGridDBColumn;
    cxGrid1DBTableView1Column13: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    stlRegistro: TcxStyle;
    stConfirmada: TcxStyle;
    stCancelada: TcxStyle;
    stCiencia: TcxStyle;
    stSemManifesto: TcxStyle;
    stNaoRealizada: TcxStyle;
    btPesquisar: TPngSpeedButton;
    PngSpeedButton5: TPngSpeedButton;
    cxGrid1DBTableView1Column14: TcxGridDBColumn;
    GroupBox4: TGroupBox;
    cbFornecedores: TcxCheckComboBox;
    rdFiltroFornecedor: TRadioGroup;
    ExportarXMLePDFTodasasnotas1: TMenuItem;
    Copiartodasaschavesdalista1: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    btImprimir: TPngSpeedButton;
    dxComponentPrinter1Link1: TdxGridReportLink;
    N1: TMenuItem;
    N2: TMenuItem;
    E3: TMenuItem;
    C3: TMenuItem;
    N3: TMenuItem;
    d2: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure rdgPDVClick(Sender: TObject);
    procedure edNumeroPDVExit(Sender: TObject);
    procedure Cartadecorreo1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbFormasPagamentoPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
    procedure cbEmpresasPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
    procedure PngSpeedButton5Click(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure VisualizarDanfe1Click(Sender: TObject);
    procedure ReimprimirDanfe1Click(Sender: TObject);
    procedure CancelarNFENFCe1Click(Sender: TObject);
    procedure ExportarXMLePDFTodasasnotas1Click(Sender: TObject);
    procedure Copiartodasaschavesdalista1Click(Sender: TObject);
    procedure cxGrid1DBTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems5GetText(Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var AText: string);
    procedure btImprimirClick(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure d2Click(Sender: TObject);
    procedure E3Click(Sender: TObject);
  private
    procedure reimprimirDanfe(visualizar: boolean);
    function isNotaFiscal: Boolean;
    function verificaTempoEmissaoNota(AModelo: SmallInt; ATempoEmissao: integer): Boolean;
    function CancelaDocumentoFiscal(AXML: TStringList): Boolean;
    procedure GravarVendaCancelada(ACodVenda: string; AXML: TStringList; AModelo, ASerie, ANumero: integer; AContingencia: Boolean);
    procedure CancelamentoVenda;
    procedure ExibirPesquisa;
    procedure ExportarXML(ASalvarDisco, Atodas: Boolean);
    procedure DesabilitaVisualizacaoRodapes;
    procedure DesativarFiltrosDeData;
    procedure CancelarNFEPorXML;




    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerenciamentoVendasCaixa: TfrmGerenciamentoVendasCaixa;

implementation

uses
  uuFrmEmail;



{$R *.dfm}

procedure TfrmGerenciamentoVendasCaixa.D1Click(Sender: TObject);
var
  LCodEmpresa, LCodVenda: string;
begin
  inherited;
  LCodEmpresa := dm.qryVendasCaixa.fieldbyname('cod_empresa').value;
  LCodVenda := dm.qryVendasCaixa.fieldbyname('cod_venda').value;
  dm.VisualizarDetalhamentoDaVenda(LCodEmpresa, LCodVenda);
end;

procedure TfrmGerenciamentoVendasCaixa.E1Click(Sender: TObject);
begin
  inherited;
  ExportarXML(True, false);
end;

procedure TfrmGerenciamentoVendasCaixa.E2Click(Sender: TObject);
var
  LEmail: string;
begin
  inherited;
  if isNotaFiscal then
  begin
    string_auxiliar := '';
    Application.CreateForm(TfrmEmail, frmEmail);
    frmEmail.ShowModal;
    frmEmail.Free;
    LEmail := string_auxiliar;

    if (Trim(string_auxiliar) <> '') then
    begin
      dm.carregarXMLVenda(dm.qryVendasCaixa.FieldByName('CHAVE_NFCE').Value, false);
      dm.enviaNFEPorEmail(LEmail);
    end;
  end;

end;

function TfrmGerenciamentoVendasCaixa.isNotaFiscal: Boolean;
begin
  Result := False;
  if dm.qryVendasCaixa.FieldByName('MODELO_COMPROVANTE').Value < 2 then
    dm.exibe_painel_erro('O documento desta venda não é um documento fiscal válido!', 'Ok')
  else
    Result := true;

end;

procedure TfrmGerenciamentoVendasCaixa.btPesquisarClick(Sender: TObject);
begin
  inherited;
  ExibirPesquisa();

end;

procedure TfrmGerenciamentoVendasCaixa.btImprimirClick(Sender: TObject);
begin
  inherited;
  dxComponentPrinter1Link1.Preview();
end;

procedure TfrmGerenciamentoVendasCaixa.PngSpeedButton5Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmGerenciamentoVendasCaixa.ExportarXML(ASalvarDisco: boolean; Atodas: Boolean);
var
  LCaminho: string;
begin
  if isNotaFiscal then
  begin

    if ASalvarDisco then
    begin
      dm.folderDialog.Execute;
      LCaminho := dm.folderDialog.Directory + '\';
    end;

    if Atodas then
    begin
      dm.qryvendascaixa.first;
      while not dm.qryvendascaixa.eof do
      begin
        try
          dm.ExportarXMLVenda(dm.qryVendasCaixa.FieldByName('CHAVE_NFCE').Value, false, LCaminho);
        except
          on E: Exception do
          begin
            dm.exibe_painel_erro('Não foi possível exportar o XML deste documento!', 'Ok');
          end;
        end;

        dm.qryvendascaixa.Next;
      end;

      ShowRealDialog(frm_principal, tmSucesso, 'Sucesso!', 'Arquivos exportados com sucesso!' + sLineBreak + sLineBreak + 'Local: ' + LCaminho);
    end
    else
    begin
      try
        dm.ExportarXMLVenda(dm.qryVendasCaixa.FieldByName('CHAVE_NFCE').Value, false, LCaminho);
        ShowRealDialog(frm_principal, tmSucesso, 'Sucesso!', 'Arquivos exportados com sucesso!' + sLineBreak + sLineBreak + 'Local: ' + LCaminho);
      except
        on E: Exception do
        begin
          dm.exibe_painel_erro('Não foi possível exportar o XML deste documento!', 'Ok');
        end;
      end;
    end;

  end;

end;

procedure TfrmGerenciamentoVendasCaixa.ExportarXMLePDFTodasasnotas1Click(Sender: TObject);
begin
  inherited;
  ExportarXML(True, true);
end;

procedure TfrmGerenciamentoVendasCaixa.edNumeroPDVExit(Sender: TObject);
begin
  inherited;
  try
    edNumeroPDV.Text := FormatFloat('000', StrToFloat(edNumeroPDV.Text));
  except
    begin
      ShowMessage('Número do PDV inválido!');
      edNumeroPDV.Clear;
      edNumeroPDV.Visible := false;
      rdgPDV.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmGerenciamentoVendasCaixa.reimprimirDanfe(visualizar: boolean);
var
  localArquivoXML: string;
begin
  inherited;
  if dm.verificaPermissaoAcao('I20002017', true, true) = false then
    exit;

  if ((dm.qryVendasCaixa.FieldByName('MODELO_COMPROVANTE').Value = 2) or (dm.qryVendasCaixa.FieldByName('MODELO_COMPROVANTE').Value) = 3) then
  begin
    dm.ACBrNFe1.NotasFiscais.Clear;
    dm.ACBrNFe1.NotasFiscais.LoadFromString(dm.qryVendasCaixa.FieldByName('XML_DOC').Value);

    if (dm.qryVendasCaixa.FieldByName('MODELO_COMPROVANTE').Value = 2) then  // Se for NFC-e
    begin
      dm.parametrizaAcbrNFE(moNFCe, visualizar, true);

      if visualizar = false then
      begin
        try
          dm.configuraImpressoraNFCE();
          dm.ACBrNFe1.NotasFiscais[0].Imprimir;
        except
          begin
            dm.exibe_painel_erro('Erro ao comunicar com a impressora de NFC-e!', 'fechar');
            exit;
          end;
        end;
      end;
    end
    else    // Se for NF-e
    begin
      dm.ACBrNFe1.NotasFiscais.LoadFromString(dm.qryVendasCaixa.FieldByName('XML_DOC').Value);
      dm.ACBrNFe1.NotasFiscais[0].Imprimir;
    end;

  end
  else
  begin
    if (dm.qryVendasCaixa.FieldByName('MODELO_COMPROVANTE').Value = 4) then
    begin
      dm.parametrizaAcbrNFE(moNFCe, visualizar, true);
      try
        dm.configuraImpressoraNFCE();
      except
        begin
          dm.exibe_painel_erro('Erro ao comunicar com a impressora de NFC-e!', 'fechar');
          exit;
        end;
      end;

//
      localArquivoXML := dm.LeIni(2, 'SAT', 'caminhoArquivosXML') + '\' + FormatDateTime('YYYMM', dm.qryVendasCaixa.FieldByName('DATA_SO').Value);
      localArquivoXML := localArquivoXML + '\' + 'AD' + dm.qryVendasCaixa.FieldByName('CHAVE_NFCE').Value + '.xml';
      ;

//        dm.sat.CFe.LoadFromString(dm.qryVendasCaixaXML_DOC.Value);
      dm.sat.ImprimirExtrato();
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
  if dm.verificaPermissaoAcao('I20002017', true, true) = false then
    exit
  else
  begin
    dm.reimprimirDanfe(dm.qryVendasCaixa.FieldByName('CHAVE_NFCE').Value, 1, false, false);
  end;
end;

procedure TfrmGerenciamentoVendasCaixa.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qryVendasCaixa.Active := false;
  ed_data_inicial.Date := data_do_sistema;
  ed_data_final.Date := data_do_sistema;
  edNotaInicial.Text := '0';
  edNotaFinal.Text := '999999999';
  ExibirPesquisa;

  if dm.verificaPermissaoAcao('I20001016', false, false) = false then
    DesabilitaVisualizacaoRodapes;

  if dm.verificaPermissaoAcao('I20001017', false, false) = false then
    DesativarFiltrosDeData;

end;

function TfrmGerenciamentoVendasCaixa.verificaTempoEmissaoNota(AModelo: SmallInt; ATempoEmissao: integer): Boolean;
begin
  result := True;
  case AModelo of
    2:
      if ATempoEmissao >= 30 then
        Result := false;
    3:
      if ATempoEmissao >= 24 then
        Result := False;
  end;
end;

procedure TfrmGerenciamentoVendasCaixa.VisualizarDanfe1Click(Sender: TObject);
begin
  inherited;
  if dm.verificaPermissaoAcao('I20002017', true, true) = false then
    exit
  else
  begin
    dm.reimprimirDanfe(dm.qryVendasCaixa.FieldByName('CHAVE_NFCE').Value, 1, true, false);
  end
end;

procedure TfrmGerenciamentoVendasCaixa.FormCreate(Sender: TObject);
begin
  inherited;
  carregaDadosCombo(cbFormasPagamento, tiFormasPagamento);
  carregaDadosCombo(cbEmpresas, tiEmpresas);
  carregaDadosCombo(cbFornecedores, tiFornecedoresNomeFantasia);

end;

procedure TfrmGerenciamentoVendasCaixa.CancelarNFEPorXML;
var
  OpenDialog: TOpenDialog;
  ACBrXML: TACBrXMLDocument;
  XMLString: TStringList;
  LCancelouDocumento: boolean;
begin
  OpenDialog := TOpenDialog.Create(nil);
  ACBrXML := TACBrXMLDocument.Create;
  XMLString := TStringList.Create;

  try
    XMLString.clear;
    OpenDialog.Filter := 'Arquivos XML|*.xml';

    if OpenDialog.Execute then
    begin
      ACBrXML.LoadFromFile(OpenDialog.FileName);
      XMLString.add(ACBrXML.XML);

      LCancelouDocumento := CancelaDocumentoFiscal(XMLString);
      if LCancelouDocumento = False then
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro!', 'O sistema não conseguiu cancelar a nota!');
      end
      else
      begin
        ShowRealDialog(frm_principal, tmSucesso, 'Sucesso!', 'Documento cancelado corretamente!');
      end;

    end;
  finally
    OpenDialog.Free;
    ACBrXML.Free;
  end;
end;

function TfrmGerenciamentoVendasCaixa.CancelaDocumentoFiscal(AXML: TStringList): Boolean;
var
  LRetorno: Integer;
begin
  Result := false;
  try
    try
      dm.ACBrNFe1.NotasFiscais.Clear;
      dm.ACBrNFe1.NotasFiscais.Clear;
      dm.ACBrNFe1.NotasFiscais.LoadFromString(AXML.Text);
      dm.ACBrNFe1.Consultar;
      LRetorno := DM.ACBrNFe1.WebServices.Consulta.cStat;
      dm.adicionalog('Resultado da consulta da NF-e: ' + Inttostr(LRetorno));

      if (LRetorno = 217) then
      begin
        ShowRealDialog(frm_principal, tmAviso, 'Erro!', 'A nota fiscal ainda não está disponível na sefaz autorizadora, portanto não não está disponível para cancelamento. Tente novamente mais tarde!');
      end
      else
      begin
        if LRetorno in [100, 150, 101, 151] then
        begin
          dm.cancelaNFCE(dm.qryVendasCaixa.FieldByName('CHAVE_NFCE').Value, dm.qryVendasCaixa.FieldByName('PROTOCOLO_NFCE').Value, dm.qryVendasCaixa.FieldByName('serie_nfce').Value, dm.qryVendasCaixa.FieldByName('NUMERO_NFCE').value, 'ERRO NA EMISSÃO DA NFC-e');
          dm.ACBrNFe1.Consultar;
          LRetorno := DM.ACBrNFe1.WebServices.Consulta.cStat;

          if LRetorno in [101, 151] then
          begin
            dm.ACBrNFe1.Consultar;
            AXML.Clear;
            AXML.Add(dm.ACBrNFe1.NotasFiscais[0].XML);
            Result := True;
          end;
        end;
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message + slineBreak + 'Retorno da consulta: ' + Inttostr(LRetorno));
      end;

    end;
  finally

  end;
end;

procedure TfrmGerenciamentoVendasCaixa.GravarVendaCancelada(ACodVenda: string; AXML: TStringList; AModelo: integer; ASerie: integer; ANumero: integer; AContingencia: Boolean);
var
  LSQL: TStringList;
  LListaSQL: TList<string>;
begin
  LSQL := TStringList.Create;
  LListaSQL := TList<string>.Create;
  try
    try
      LSQL.Clear;
      LSQL.Add('insert into vendas_canceladas (                                                                                                            ');
      LSQL.Add('COD_VENDA,DATA,HORA,DATA_SO,DATA_ECF,HORA_ECF,VALOR_BRUTO,VALOR_DESCONTO,VALOR_TXSERV,                                                     ');
      LSQL.Add('VALOR_TOTAL,TOTAL_PAGO,VALOR_TROCO,COD_USUARIO,NUMERO_CAIXA,MESA,COD_CAIXA,TIPO_VENDA,COD_PEDIDO_DELIVERY,                                 ');
      LSQL.Add('COO_CUPOM,QTDE_PESSOAS,VALOR_TX_ENTREGA,REDUCAO_Z,SELECIONADO,DESCONTO_TAXAS,CHAVE_NFCE,NUMERO_NFCE,SERIE_NFCE,                            ');
      LSQL.Add('PROTOCOLO_NFCE,RECIBO_NFCE,OBS_NFCE,CONSULTA_OK,LOTE_EXPORTACAO_WEB,COD_EMPRESA,PERCENTUAL_DESCONTO,COD_GARCON_ABRIU,                      ');
      LSQL.Add('MODELO_COMPROVANTE,COD_FORNECEDOR,SESSAO_SAT,CNF_SAT,IMP,XML_DOC,CNPJ_CPF_CLIENTE_NF,NOME_CLIENTE_NF,TENTATIVAS_ENVIO_NFCE,                ');
      LSQL.Add('TEMPO_EMISSAO_NFCE)                                                                                                                        ');
      LSQL.Add(' select v.COD_VENDA,v.DATA,v.HORA,v.DATA_SO,v.DATA_ECF,v.HORA_ECF,v.VALOR_BRUTO,v.VALOR_DESCONTO,v.VALOR_TXSERV,                           ');
      LSQL.Add('v.VALOR_TOTAL,v.TOTAL_PAGO,v.VALOR_TROCO,v.COD_USUARIO,v.NUMERO_CAIXA,v.MESA,v.COD_CAIXA,v.TIPO_VENDA,v.COD_PEDIDO_DELIVERY,               ');
      LSQL.Add('v.COO_CUPOM,v.QTDE_PESSOAS,v.VALOR_TX_ENTREGA,v.REDUCAO_Z,v.SELECIONADO,v.DESCONTO_TAXAS,v.CHAVE_NFCE,v.NUMERO_NFCE,v.SERIE_NFCE,          ');
      LSQL.Add('v.PROTOCOLO_NFCE,v.RECIBO_NFCE,v.OBS_NFCE,v.CONSULTA_OK,v.LOTE_EXPORTACAO_WEB,v.COD_EMPRESA,v.PERCENTUAL_DESCONTO,v.COD_GARCON_ABRIU,      ');
      LSQL.Add('v.MODELO_COMPROVANTE,v.COD_FORNECEDOR,v.SESSAO_SAT,v.CNF_SAT,v.IMP,v.XML_DOC,v.CNPJ_CPF_CLIENTE_NF,v.NOME_CLIENTE_NF,v.TENTATIVAS_ENVIO_NFCE,');
      LSQL.Add('v.TEMPO_EMISSAO_NFCE from vendas v where v.cod_venda=' + Quotedstr(ACodVenda));
      LListaSQL.Add(LSQL.Text + ';');

      LSQL.Clear;
      LSQL.Add(' insert into movimento_venda_cancelada (COD_VENDA,COD_MESA,COD_PRODUTO,COMANDA,COD_GARCON,DATA,HORA,COD_USUARIO,');
      LSQL.Add('NUMERO_CAIXA,PROCESSADA,QUANTIDADE,VALOR_UNITARIO,IMP,COD_METRE,DATA_ECF,COD_ALIQUOTA,');
      LSQL.Add('COD_CAIXA,ACRESIMO,DESCONTO,HORA_ECF,NUM_SERIE_ECF,REDUCAO_Z,HORA_LANCAMENTO,ID,');
      LSQL.Add(' COD_EMPRESA,LOTE_EXPORTACAO_WEB,CFOP,CST,BASE_ICMS_UNIT,ID_CHAVE)');
      LSQL.Add('  select mv.COD_VENDA,mv.COD_MESA,mv.COD_PRODUTO,mv.COMANDA,mv.COD_GARCON,mv.DATA,mv.HORA,mv.COD_USUARIO,');
      LSQL.Add('mv.NUMERO_CAIXA,mv.PROCESSADA,mv.QUANTIDADE,mv.VALOR_UNITARIO,mv.IMP,mv.COD_METRE,mv.DATA_ECF,mv.COD_ALIQUOTA,');
      LSQL.Add('mv.COD_CAIXA,mv.ACRESIMO,mv.DESCONTO,mv.HORA_ECF,mv.NUM_SERIE_ECF,mv.REDUCAO_Z,mv.HORA_LANCAMENTO,mv.ID,');
      LSQL.Add('mv.COD_EMPRESA,mv.LOTE_EXPORTACAO_WEB,mv.CFOP,mv.CST,mv.BASE_ICMS_UNIT,mv.ID_CHAVE ');
      LSQL.Add(' from movimento_venda mv where mv.cod_venda=' + QuotedstR(ACodVenda));
      LListaSQL.Add(LSQL.Text + ';');

      LSQL.Clear;
      LSQL.Add(' insert into recebimentos_cancelados(COD_VENDA,COD_FORMA,VALOR,DATA,COD_USUARIO,NUMERO_CAIXA,PROCESSADO, ');
      LSQL.Add(' IMP,COD_CAIXA,COD_CLIENTE,COD_EMPRESA,LOTE_EXPORTACAO_WEB,ID,');
      LSQL.Add(' NSU,REDE,AUTORIZACAO_TEF) ');
      LSQL.Add(' select r.COD_VENDA,r.COD_FORMA,r.VALOR,r.DATA,r.COD_USUARIO,r.NUMERO_CAIXA,r.PROCESSADO,');
      LSQL.Add(' r.IMP,r.COD_CAIXA,r.COD_CLIENTE,r.COD_EMPRESA,r.LOTE_EXPORTACAO_WEB,r.ID,');
      LSQL.Add(' r.NSU,r.REDE,r.AUTORIZACAO_TEF');
      LSQL.Add(' from recebimentos r where r.cod_venda=' + QuotedstR(ACodVenda));
      LListaSQL.Add(LSQL.Text + ';');

      LSQL.clear;
      LSQL.Add('delete from pedidos_delivery p where p.cod_venda =' + QuotedstR(ACodVenda));
      LListaSQL.Add(LSQL.Text + ';');

      LSQL.Clear;
      LSQL.Add(' delete   from itens_pedido_delivery it ');
      LSQL.Add(' where it.cod_pedido not in ( select p.codigo from pedidos_delivery p) ');
      LListaSQL.Add(LSQL.Text + ';');

      LSQL.Clear;
      LSQL.Add(' execute procedure retorna_estoque_venda(' + QuotedStr(ACodVenda) + ')');
      LListaSQL.Add(LSQL.Text + ';');

      LSQL.Clear;
      LSQL.Add('delete from vendas where cod_venda=' + Quotedstr(ACodVenda));
      LListaSQL.Add(LSQL.Text + ';');

      if AModelo in [1, 2, 3] then
      begin
        if (trim(AXML.Text) <> '') then
        begin
          LSQL.Clear;
          LSQL.Add(' update vendas_canceladas set xml_doc=' + Quotedstr(AXML.Text));
          LSQL.Add('  where cod_venda=' + Quotedstr(ACodVenda));
          LListaSQL.Add(LSQL.Text + ';');
        end;

        if AContingencia = true then
        begin
          LSQL.Clear;
          LSQL.Add('  update inutilizacoes_nfce nf set nf.emitida=0, nf.cancelada=0, nf.inutilizada=0 where nf.modelo=' + Inttostr(AModelo) + ' and nf.nota=' + IntToStr(ANumero));
          LListaSQL.Add(LSQL.Text + ';');
        end;
      end;

      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 100);

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao gravar os dados da venda cancelada! ' + sLineBreak + E.Message);
      end;

    end;
  finally
    FreeAndNil(LSQL);
    FreeAndNil(LListaSQL);
  end;
end;

procedure TfrmGerenciamentoVendasCaixa.CancelamentoVenda();
var
  LCodVenda: string;
  LXMLDocumento: TStringList;
  LModeloDocumento: SmallInt;
  LNumeroNota, LSerie: integer;
  LDocumentoEmContingencia: Boolean;
  LTempoEmissao: integer;
  LIsDocumentoFiscal: Boolean;
  LCancelouDocumento: Boolean;
begin
  inherited;
  LDocumentoEmContingencia := false;
  LIsDocumentoFiscal := false;
  LXMLDocumento := TStringList.Create;
  dm.ACBrNFe1.NotasFiscais.Clear;
  LCancelouDocumento := false;

  try
    try
      if dm.verificaPermissaoAcao('I20002018', true, true) = false then
        exit;

      if (ShowRealDialog(Self, tmConfirmacao, 'Atenção', 'Confirma o cancelamento desta venda ? ' + sLineBreak + sLineBreak + 'Deseja continuar ?', 22, true) = teNao) then
        Exit;

      LModeloDocumento := dm.qryVendasCaixa.FieldByName('MODELO_COMPROVANTE').Value;
      LTempoEmissao := dm.qryVendasCaixa.FieldByName('tempoEmissao').Value;
      LCodVenda := dm.qryVendasCaixa.FieldByName('cod_venda').Value;
      LNumeroNota := dm.qryVendasCaixa.FieldByName('numero_nfce').Value;
      LSerie := dm.qryVendasCaixa.FieldByName('serie_nfce').Value;

      if LModeloDocumento in [1, 2, 3] then
        LIsDocumentoFiscal := true;

      if LIsDocumentoFiscal then
      begin

        LXMLDocumento.Add(dm.GetXMLFromVendasByChave(dm.qryVendasCaixa.FieldByName('chave_nfce').Value));

        if (dm.qryVendasCaixa.FieldByName('PROTOCOLO_NFCE').Value = 'CONTINGENCIA') then
        begin
          LDocumentoEmContingencia := true;
          LCancelouDocumento := true;
        end
        else
        begin
          if verificaTempoEmissaoNota(LModeloDocumento, LTempoEmissao) then
          begin
            LCancelouDocumento := CancelaDocumentoFiscal(LXMLDocumento);
            if LCancelouDocumento = False then
            begin
              ShowRealDialog(frm_principal, tmErro, 'Erro!', 'O sistema não conseguiu cancelar a nota!');
            end;

          end
          else
            showRealDialog(frm_principal, tmErro, 'Impossível cancelar!', 'Não é possível cancelar a nota pois o tempo de cancelamento já expirou!' + sLineBreak + sLineBreak + 'Tempo da NFC-e  = 30 min' + sLineBreak + 'Tempo da NF-e  = 24h', 22, false);
        end;

      end;

      if ((LIsDocumentoFiscal = false) or ((LIsDocumentoFiscal = True) and (LCancelouDocumento = true))) then
      begin
        GravarVendaCancelada(LCodVenda, LXMLDocumento, LModeloDocumento, LSerie, LNumeroNota, LDocumentoEmContingencia);
        ShowRealDialog(frm_principal, tmSucesso, 'Sucesso!', 'A venda foi cancelada com sucesso!');
        ExibirPesquisa;
      end;

    except
      on E: Exception do
      begin
        ShowRealDialog(frm_principal, tmErro, 'Erro!', 'Erro ao cancelar: ' + sLineBreak + sLineBreak + E.Message);
      end;

    end;
  finally
    FreeAndNil(LXMLDocumento);
  end;

end;

procedure TfrmGerenciamentoVendasCaixa.CancelarNFENFCe1Click(Sender: TObject);
begin
  inherited;
  CancelamentoVenda();
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

procedure TfrmGerenciamentoVendasCaixa.ExibirPesquisa();
var
  LFormasSelecionadas: TSelecaoComboPesquisa;
  LEmpresasSelecionadas: TSelecaoComboPesquisa;
  LFornecedoresSelecionados: TSelecaoComboPesquisa;
  LFiltroVendas: TStringList;
  I: integer;
begin
  inherited;
  LFormasSelecionadas := TSelecaoComboPesquisa.Create;
  LFiltroVendas := TStringList.Create;
  LEmpresasSelecionadas := TSelecaoComboPesquisa.Create;
  LFornecedoresSelecionados := TSelecaoComboPesquisa.Create;
  LFiltroVendas.Clear;

  try
    try

      if cbEmpresas.States[0] = cbsChecked then
      begin
        for I := 0 to cbEmpresas.Properties.Items.Count - 1 do
          cbEmpresas.States[I] := cbsChecked;
      end;
      getSelecaoCombo(cbEmpresas, LEmpresasSelecionadas, tiEmpresas);
      getSelecaoCombo(cbFormasPagamento, LFormasSelecionadas, tiFormasPagamento);
      case rdFiltroFornecedor.ItemIndex of
        0:
          getSelecaoCombo(cbFornecedores, LFornecedoresSelecionados, tiFornecedoresRazao);
        1:
          getSelecaoCombo(cbFornecedores, LFornecedoresSelecionados, tiFornecedoresNomeFantasia);
      end;

      dm.qryVendasCaixa.Active := false;
      dm.qryVendasCaixa.SQL.clear;
      dm.qryVendasCaixa.SQL.Add(' select  v.cod_empresa, v.cod_venda,v.data_so, v.hora, v.mesa, v.coo_cupom, v.numero_nfce, v.serie_nfce,  v.valor_bruto, v.valor_txserv,');
      dm.qryVendasCaixa.SQL.Add('         v.valor_tx_entrega, v.valor_desconto , v.valor_total, v.modelo_comprovante,');
      dm.qryVendasCaixa.SQL.Add('         v.chave_nfce, v.protocolo_nfce, v.numero_caixa, tipo_venda, ');

      dm.qryVendasCaixa.SQL.Add('         case    ');
      dm.qryVendasCaixa.SQL.Add('           when  v.tipo_venda =1 then ' + Quotedstr('Mesa'));
      dm.qryVendasCaixa.SQL.Add('           when  v.tipo_venda =2 then ' + Quotedstr('Balcão'));
      dm.qryVendasCaixa.SQL.Add('           when  v.tipo_venda =3 then ' + Quotedstr('Deliv.'));
      dm.qryVendasCaixa.SQL.Add('         end  as tipo, ');
      dm.qryVendasCaixa.SQL.Add('         case ');
      dm.qryVendasCaixa.SQL.Add('           when v.modelo_comprovante = 0 then ' + Quotedstr('AVULSO'));
      dm.qryVendasCaixa.SQL.Add('           when v.modelo_comprovante = 1 then ' + Quotedstr('ECF'));
      dm.qryVendasCaixa.SQL.Add('           when v.modelo_comprovante = 2 then ' + Quotedstr('NFC-e'));
      dm.qryVendasCaixa.SQL.Add('           when v.modelo_comprovante = 3 then ' + Quotedstr('NF-e'));
      dm.qryVendasCaixa.SQL.Add('           when v.modelo_comprovante = 3 then ' + Quotedstr('SAT'));
      dm.qryVendasCaixa.SQL.Add('         end as desc_modelo_comprovante, ');

      dm.qryVendasCaixa.SQL.Add('case ');
      dm.qryVendasCaixa.SQL.Add('     when modelo_comprovante = 0 then 0 ');
      dm.qryVendasCaixa.SQL.Add('     when modelo_comprovante = 2 then udf_minutesbetween(CAST(v.data_so||' + QuotedStr(' ') + '||v.hora AS TIMESTAMP), current_timestamp)');
      dm.qryVendasCaixa.SQL.Add('     when modelo_comprovante = 3 then udf_hoursbetween(CAST(v.data_so||' + QuotedStr(' ') + '||v.hora AS TIMESTAMP), current_timestamp)');
      dm.qryVendasCaixa.SQL.Add('   end as tempoEmissao,coalesce(f.nome_fantasia,f.razao_social) as nomeFornecedor');
      LFiltroVendas.Add('  from vendas v');

      if ckbDataMovimento.Checked then
      begin

        LFiltroVendas.Add(' left join fornecedor f on (f.cod_fornecedor = v.cod_fornecedor)');
        LFiltroVendas.Add(' where  v.data')
      end
      else
      begin

        LFiltroVendas.Add(' left join fornecedor f on (f.cod_fornecedor = v.cod_fornecedor)');
        LFiltroVendas.Add(' where  v.data_so')
      end;

      LFiltroVendas.Add(' between ' + Quotedstr(FormatDateTime('DD.MM.YYYY', ed_data_inicial.Date)));
      LFiltroVendas.Add(' and ' + Quotedstr(FormatDateTime('DD.MM.YYYY', ed_data_final.date)));

      if cbEmpresas.States[0] = cbsUnchecked then
      begin
        LFiltroVendas.add('								and v.cod_empresa in (' + LEmpresasSelecionadas.selecionadas + ')                                                                                       ');
      end;

      case rdDesconto.ItemIndex of
        1:
          LFiltroVendas.Add(' and v.valor_desconto > 0');
        2:
          LFiltroVendas.Add(' and v.valor_desconto = 0');
      end;

      if (Trim(edNotaInicial.Text) <> '') then
      begin
        LFiltroVendas.Add(' and v.numero_nfce  between ' + edNotaInicial.Text + ' and ' + edNotaFinal.Text);
      end;

      case rdgPDV.ItemIndex of
        0:
          begin

          end;

        1:
          begin
            LFiltroVendas.Add(' and v.numero_caixa=' + Quotedstr(numero_caixa));
          end;

        2:
          begin
            LFiltroVendas.Add(' and v.numero_caixa=' + Quotedstr(edNumeroPDV.Text));
          end;
      end;

      case rdgTipoVenda.ItemIndex of
        0:
          begin

          end;

        1:
          begin
            LFiltroVendas.Add(' and v.tipo_venda = 1 ');
          end;

        2:
          begin
            LFiltroVendas.Add(' and v.tipo_venda = 2 ');
          end;

        3:
          begin
            LFiltroVendas.Add(' and v.tipo_venda = 3 ');
          end;

      end;

      case rdgDocumento.ItemIndex of
        0:
          begin

          end;

        1:
          begin
            LFiltroVendas.Add(' and v.modelo_comprovante = 0 ');
          end;

        2:
          begin
            LFiltroVendas.Add(' and v.modelo_comprovante = 1 ');
          end;

        3:
          begin
            LFiltroVendas.Add(' and v.modelo_comprovante = 2 ');
          end;

        4:
          begin
            LFiltroVendas.Add(' and v.modelo_comprovante = 3 ');
          end;

        5:
          begin
            LFiltroVendas.Add(' and v.modelo_comprovante = 4 ');
          end;

      end;

      if Trim(edMesa.Text) <> '' then
      begin
        try
          edMesa.Text := FormatFloat('0000', StrToFloat(edMesa.Text));
        except
          showmessage('Mesa inválida!');
          edMesa.SetFocus;
          exit;
        end;
        LFiltroVendas.Add(' and v.mesa=' + Quotedstr(edMesa.Text));
      end;

      if Trim(edValor.Text) <> '' then
      begin
        try
          edValor.Text := FormatFloat('#0.00', StrToFloat(edValor.Text));

        except
          showmessage('Valor inválido!');
          edValor.SetFocus;
          exit;
        end;
        LFiltroVendas.Add(' and v.valor_total=' + dm.TrocaVirgPPto(edValor.Text));
      end;

      dm.qryVendasCaixa.SQL.Add(LFiltroVendas.Text);

      if cbFornecedores.States[0] = cbsUnchecked then
      begin
        dm.qryVendasCaixa.SQL.Add('								and v.cod_fornecedor in (' + LFornecedoresSelecionados.selecionadas + ')                                                                                       ');
      end;
      if cbFormasPagamento.States[0] = cbsUnchecked then
      begin
        dm.qryVendasCaixa.SQL.Add(' and v.cod_venda in  (');
        dm.qryVendasCaixa.SQL.Add('    select distinct cod_venda from ');
        dm.qryVendasCaixa.SQL.Add('     ( ');
        dm.qryVendasCaixa.SQL.Add('       select v1.cod_venda, cod_forma ');
        dm.qryVendasCaixa.SQL.Add('        from recebimentos r ');
        dm.qryVendasCaixa.SQL.Add('           inner join vendas v1 on (v1.cod_venda = r.cod_venda) ');
        if ckbDataMovimento.Checked then
          dm.qryVendasCaixa.SQL.Add('where v1.data ')
        else
          dm.qryVendasCaixa.SQL.Add('where v1.data_so ');
        dm.qryVendasCaixa.SQL.Add(' between ' + Quotedstr(FormatDateTime('DD.MM.YYYY', ed_data_inicial.Date)));
        dm.qryVendasCaixa.SQL.Add(' and ' + Quotedstr(FormatDateTime('DD.MM.YYYY', ed_data_final.date)));
        dm.qryVendasCaixa.SQL.Add('     ) r2');
        dm.qryVendasCaixa.SQL.Add('     where  ');
        dm.qryVendasCaixa.SQL.Add('        r2.cod_forma  in (' + LFormasSelecionadas.selecionadas + ')');
        dm.qryVendasCaixa.SQL.Add(')');
      end;

      dm.qryVendasCaixa.SQL.Add('  order by cod_venda desc');

      dm.adicionalog(dm.qryVendasCaixa.SQL.Text);

      dm.qryVendasCaixa.Active := true;
      dm.qryVendasCaixa.First;

    except
      on E: Exception do
      begin
        dm.adicionalog(dm.qryVendasCaixa.SQL.Text);
        dm.exibe_painel_erro('Erro ao gerar a consulta!' + sLineBreak + sLineBreak + E.Message, 'Ok');
      end;
    end;
  finally
    FreeAndNil(LFormasSelecionadas);
    FreeAndNil(LEmpresasSelecionadas);
    FreeAndNil(LFiltroVendas);
    FreeAndNil(LFornecedoresSelecionados);

  end;

end;

procedure TfrmGerenciamentoVendasCaixa.C1Click(Sender: TObject);
begin
  inherited;
  ExportarXML(false, false);
end;

procedure TfrmGerenciamentoVendasCaixa.C2Click(Sender: TObject);
begin
  inherited;
  Clipboard.AsText := dm.qryVendasCaixa.FieldByName('CHAVE_NFCE').Value;
  ShowMessage('Conteúdo da chave copiado para a área de transferência.');
end;

procedure TfrmGerenciamentoVendasCaixa.C3Click(Sender: TObject);
begin
  inherited;
  CancelarNFEPorXML;
end;

procedure TfrmGerenciamentoVendasCaixa.Cartadecorreo1Click(Sender: TObject);
begin
  inherited;
  if (dm.qryVendasCaixa.FieldByName('MODELO_COMPROVANTE').Value = 3) then
  begin
    dm.ACBrNFe1.NotasFiscais.Clear;
    Application.CreateForm(TfrmCartaCorrecao, frmCartaCorrecao);
    frmCartaCorrecao.SetChaveParaCorrigir(dm.qryVendasCaixa.FieldByName('CHAVE_NFCE').Value);
    frmCartaCorrecao.ShowModal;
    frmCartaCorrecao.Free;
  end
  else
  begin
    ShowRealDialog(frm_principal, tmAviso, 'Informativo', 'Apenas as notas fiscais modelo 55 podem ter carta de correção!', 22, true);
    exit;
  end;
end;

procedure TfrmGerenciamentoVendasCaixa.cbEmpresasPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
var
  opcao: TCxCheckBoxState;
  i: integer;
begin
  inherited;
  if ItemIndex = 0 then
  begin
    if cbEmpresas.States[0] = cbsUnchecked then
      opcao := cbsChecked
    else
      opcao := cbsUnchecked;

    for i := 1 to cbEmpresas.Properties.Items.Count - 1 do
      cbEmpresas.States[i] := opcao;
  end;
  cbEmpresas.Refresh;
  cbEmpresas.Repaint;
end;

procedure TfrmGerenciamentoVendasCaixa.cbFormasPagamentoPropertiesClickCheck(Sender: TObject; ItemIndex: Integer; var AllowToggle: Boolean);
begin
  inherited;

  if ItemIndex <> 0 then
    cbFormasPagamento.States[0] := cbsUnchecked;

end;

procedure TfrmGerenciamentoVendasCaixa.Copiartodasaschavesdalista1Click(Sender: TObject);
var
  LChaves: string;
begin
  inherited;

  try

    dm.qryvendascaixa.first;
    while not dm.qryVendasCaixa.eof do
    begin
      LChaves := LChaves + dm.qryVendasCaixa.FieldByName('CHAVE_NFCE').Value + sLineBreak;
      dm.qryVendasCaixa.Next;
    end;
    Clipboard.AsText := LChaves;
    ShowRealDialog(frm_principal, tmSucesso, 'Sucesso', 'Chaves copiadas para a área de transferência!');
  finally

  end;

end;

procedure TfrmGerenciamentoVendasCaixa.cxGrid1DBTableView1TcxGridDBDataControllerTcxDataSummaryFooterSummaryItems5GetText(Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var AText: string);
var
  LColumn: TcxGridDBColumn;
  LSummaryItem: TcxDataSummaryItem;
  LTotal, LTicketMedio, LTicketPessoa: string;
  LSummaryIndex: Integer;
begin
  inherited;
  LTotal := '0';
  LTicketMedio := '0';

  if dm.qryVendasCaixa.IsEmpty = false then
  begin

    LColumn := cxGrid1DBTableView1.GetColumnByFieldName('VALOR_TOTAL');
    if LColumn <> nil then
    begin
      LSummaryItem := cxGrid1DBTableView1.DataController.Summary.FooterSummaryItems.GetDataItem(LColumn.Index, spFooter);
      if LSummaryItem <> nil then
      begin
        LSummaryIndex := LSummaryItem.Index;
        LTotal := VarToStr(cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[LSummaryIndex]);
      end;

      if trim(LTotal) <> '' then
      begin
        LTicketMedio := Floattostr(StrToFloat(LTotal) / dm.qryVendasCaixa.RecordCount);
        AText := 'TC=' + Inttostr(dm.qryVendasCaixa.RecordCount) + '  TM=' + FormatFloat('R$ ###,###,##0.00 ', StrToFloat(LTicketMedio));
      end;
    end;

  end;
end;

procedure TfrmGerenciamentoVendasCaixa.d2Click(Sender: TObject);
var
  LChave: string;
begin
  inherited;
  LChave := dm.qryVendasCaixa.FieldByName('CHAVE_NFCE').Value;
  Application.createform(TfrmEmissaoNFReferenciada, frmEmissaoNFReferenciada);
//  frmEmissaoNFReferenciada.setTipoDocumento(TopDevolucaoDeVenda);
  frmEmissaoNFReferenciada.setChaveNFE(LChave);
  frmEmissaoNFReferenciada.showmodal;
  frmEmissaoNFReferenciada.free;

end;

procedure TfrmGerenciamentoVendasCaixa.DesabilitaVisualizacaoRodapes();
begin
  cxGrid1DBTableView1.OptionsView.Footer := false;
end;

procedure TfrmGerenciamentoVendasCaixa.DesativarFiltrosDeData();
begin
  ed_data_inicial.Enabled := false;
  ed_data_final.Enabled := false;
  btImprimir.Enabled := false;
  btPesquisar.Enabled := false;

end;

procedure TfrmGerenciamentoVendasCaixa.E3Click(Sender: TObject);
var
  LChave: string;
begin
  inherited;
  LChave := dm.qryVendasCaixa.FieldByName('CHAVE_NFCE').Value;
  Application.createform(TfrmEmissaoNFReferenciada, frmEmissaoNFReferenciada);
//  frmEmissaoNFReferenciada.setTipoDocumento(TOpNotaReferenciada);
  frmEmissaoNFReferenciada.setChaveNFE(LChave);
  frmEmissaoNFReferenciada.showmodal;
  frmEmissaoNFReferenciada.free;

end;

end.

