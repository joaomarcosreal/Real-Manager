unit uuManifestacaoNFE;

interface

uses
  Windows, Messages, strutils, ibx.ibdatabase, SysUtils, Variants, RealFramework,
  IOUtils, cxGridCustomTableView, System.Generics.Collections, activex, Graphics,
  Controls, Forms, WinInet, FireDAC.Comp.DataSet, Dialogs, uu_modelo_Vazio,
  StdCtrls, Buttons, ExtCtrls, ShellApi, data.db, ACBrNFe, pcnConversaoNFE,
  pcnConversao, xmldom, pcteConversaoCTe, System.Zip, FireDAC.Comp.client, Menus,
  RxMenus, ImgList, ibx.ibquery, System.DateUtils, OleCtrls, SHDocVw,
  AdvCircularProgress, JvExControls, RxToolEdit, PngSpeedButton, JvPageList,
  AdvGlassButton, cxGraphics, cxControls, cxStyles, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridDBTableView, cxGrid, cxImageList, cxTextEdit,
  Vcl.ComCtrls, System.Classes, AdvDateTimePicker, JvValidateEdit,
  cxLookAndFeels, cxLookAndFeelPainters, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxCheckBox, cxCurrencyEdit, System.ImageList, JvExStdCtrls, JvEdit,
  cxGridTableView, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, JvDialogs, FolderDialog, cxCustomData, cxFilter, cxData,
  dxDateRanges, dxScrollbarAnnotations;

type
  TcxViewInfoAcess = class(TcxGridTableDataCellViewInfo);

  TcxPainterAccess = class(TcxGridTableDataCellPainter);

  TTextosXML = record
    Chave: string;
    Xml: string;
  end;

type
  TfrmManifestacao = class(Tfrm_modelo_vazio)
    WebBrowser1: TWebBrowser;
    Memo2: TMemo;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle2: TcxStyle;
    stlRegistro: TcxStyle;
    stConfirmada: TcxStyle;
    stCancelada: TcxStyle;
    stCiencia: TcxStyle;
    cxImageList1: TcxImageList;
    stSemManifesto: TcxStyle;
    stNaoRealizada: TcxStyle;
    tmAguarde: TTimer;
    Panel3: TPanel;
    pgControle: TJvPageList;
    pgManifestacao: TJvStandardPage;
    Panel4: TPanel;
    Label5: TLabel;
    pnPegarXML: TPanel;
    Label3: TLabel;
    Label9: TLabel;
    btPesquisar: TPngSpeedButton;
    PngSpeedButton4: TPngSpeedButton;
    PngSpeedButton5: TPngSpeedButton;
    PngSpeedButton6: TPngSpeedButton;
    btAssociar: TPngSpeedButton;
    PngSpeedButton8: TPngSpeedButton;
    btConsultarSefaz: TPngSpeedButton;
    btnNovaConsulta: TBitBtn;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    edRazaoSocial: TEdit;
    edNumeroNota: TEdit;
    rdTipoDocumento: TRadioGroup;
    pnOpcoesGrid: TPanel;
    Label4: TLabel;
    pglistOpcoesGrid: TJvPageList;
    pgOpcoesManifestacao: TJvStandardPage;
    PngSpeedButton12: TPngSpeedButton;
    PngSpeedButton13: TPngSpeedButton;
    PngSpeedButton11: TPngSpeedButton;
    PngSpeedButton10: TPngSpeedButton;
    PngSpeedButton9: TPngSpeedButton;
    Panel1: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    pgLancamentoFrete: TJvStandardPage;
    btDesistirLancamentoCTE: TPngSpeedButton;
    btConfirmaLancamentoCTE: TPngSpeedButton;
    Panel7: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    rdTipoFrete: TRadioGroup;
    pnlGrid: TPanel;
    lbMensagens: TLabel;
    memoRespWS: TMemo;
    pgListGrid: TJvPageList;
    pgGridNotas: TJvStandardPage;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column12: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column8: TcxGridDBColumn;
    cxGrid1DBTableView1Column7: TcxGridDBColumn;
    cxGrid1DBTableView1Column10: TcxGridDBColumn;
    cxGrid1DBTableView1Column11: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    pnAguarde: TPanel;
    pgConsulta: TJvPageList;
    pgDadosConsulta: TJvStandardPage;
    Panel9: TPanel;
    Label6: TLabel;
    ckbConsultarNFE: TCheckBox;
    ckbConsultarCTES: TCheckBox;
    btImprimirInventario: TAdvGlassButton;
    AdvGlassButton1: TAdvGlassButton;
    rdUltNSU: TRadioGroup;
    pnUltNSUNFE: TPanel;
    lbUltNsuNFE: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    RadioGroup1: TRadioGroup;
    Panel5: TPanel;
    PngSpeedButton2: TPngSpeedButton;
    lbUltNsuCTE: TLabel;
    pgConsultando: TJvStandardPage;
    prog: TAdvCircularProgress;
    Image1: TImage;
    Label17: TLabel;
    Label18: TLabel;
    lbTempoDecorrido: TLabel;
    Panel10: TPanel;
    Label7: TLabel;
    RadioGroup3: TRadioGroup;
    Panel11: TPanel;
    lbNsuNfeAtual: TLabel;
    Panel12: TPanel;
    Label10: TLabel;
    PngSpeedButton3: TPngSpeedButton;
    RadioGroup4: TRadioGroup;
    Panel13: TPanel;
    lbNsucteAtual: TLabel;
    lbNotaAtual: TLabel;
    Panel14: TPanel;
    Label8: TLabel;
    progProcessando: TProgressBar;
    pgExportando: TJvStandardPage;
    Panel6: TPanel;
    Label12: TLabel;
    pgExporta: TProgressBar;
    pgLancamentoNota: TJvStandardPage;
    Panel21: TPanel;
    Label36: TLabel;
    lbRazaoSocialFornecedor: TLabel;
    Label38: TLabel;
    lbNumeroNotaFiscal: TLabel;
    Label19: TLabel;
    lbSerieNotaFiscal: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    lbChaveNotaFiscal: TLabel;
    lbDataEmissaoNFE: TLabel;
    pnProdutosNFE: TPanel;
    pgItensNota: TJvPageList;
    pgGridItensNota: TJvStandardPage;
    Panel16: TPanel;
    Label23: TLabel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1ordem: TcxGridDBColumn;
    cxGridDBTableView1codProduto: TcxGridDBColumn;
    cxGridDBTableView1descricaoProduto: TcxGridDBColumn;
    cxGridDBTableView1Quantidade: TcxGridDBColumn;
    cxGridDBTableView1Preco: TcxGridDBColumn;
    cxGridDBTableView1DescricaoUnidade: TcxGridDBColumn;
    cxGridDBTableView1SiglaUnidade: TcxGridDBColumn;
    cxGridDBTableView1ParametroUnidade: TcxGridDBColumn;
    cxGridDBTableView1CST: TcxGridDBColumn;
    cxGridDBTableView1CFOP: TcxGridDBColumn;
    cxGridDBTableView1Desconto: TcxGridDBColumn;
    cxGridDBTableView1OutrasDespesas: TcxGridDBColumn;
    cxGridDBTableView1BaseICMS: TcxGridDBColumn;
    cxGridDBTableView1ValorICMS: TcxGridDBColumn;
    cxGridDBTableView1AliquotaICMS: TcxGridDBColumn;
    cxGridDBTableView1BaseICMSST: TcxGridDBColumn;
    cxGridDBTableView1ValorICMSST: TcxGridDBColumn;
    cxGridDBTableView1AliquotaICMSST: TcxGridDBColumn;
    cxGridDBTableView1ValorIPI: TcxGridDBColumn;
    cxGridDBTableView1AliquotaIPI: TcxGridDBColumn;
    Panel17: TPanel;
    Panel18: TPanel;
    pnTotaisNFE: TPanel;
    pnOutrasDesp: TPanel;
    Label32: TLabel;
    edTotalOutrasDespesasNFE: TJvValidateEdit;
    pnTotalBaseICMSNFE: TPanel;
    Label26: TLabel;
    edTotalBaseICMSNFE: TJvValidateEdit;
    pnTotalBaseICMSST: TPanel;
    Label27: TLabel;
    edTotalBaseICMSSTNFE: TJvValidateEdit;
    pnTotalDesconto: TPanel;
    Label33: TLabel;
    edTotalDescontoNFE: TJvValidateEdit;
    pnTotalIPI: TPanel;
    Label30: TLabel;
    edTotalIPINFE: TJvValidateEdit;
    pnTotalProdutosNFE: TPanel;
    Label24: TLabel;
    edTotalProdutosNFE: TJvValidateEdit;
    pnTotalSeguro: TPanel;
    Label31: TLabel;
    edTotalSeguroNFE: TJvValidateEdit;
    pnValorICMSNFE: TPanel;
    Label29: TLabel;
    edTotalICMSNFE: TJvValidateEdit;
    PNValorICMSST: TPanel;
    Label28: TLabel;
    edTotalICMSSTNFE: TJvValidateEdit;
    pnTotalFreteNFE: TPanel;
    Label25: TLabel;
    edTotalFreteNFE: TJvValidateEdit;
    pnTotalNota: TPanel;
    Label20: TLabel;
    edTotalNFE: TJvValidateEdit;
    Panel23: TPanel;
    PngSpeedButton14: TPngSpeedButton;
    PngSpeedButton7: TPngSpeedButton;
    Panel24: TPanel;
    Label35: TLabel;
    Panel25: TPanel;
    Label22: TLabel;
    edDataEntradaNFE: TAdvDateTimePicker;
    pnFiltros: TPanel;
    Panel15: TPanel;
    Label11: TLabel;
    rdManifestacao: TRadioGroup;
    rdXML: TRadioGroup;
    rdLancada: TRadioGroup;
    rdOrdem: TRadioGroup;
    btPequisaInventarios: TAdvGlassButton;
    CheckBox1: TCheckBox;
    rdMesAtual: TRadioButton;
    rdAnoAtual: TRadioButton;
    rdEscolherPeriodo: TRadioButton;
    pglSelecaoDatas: TJvPageList;
    pgSelecaoPeriodo: TJvStandardPage;
    Label2: TLabel;
    Label1: TLabel;
    pgSelecaoMes: TJvStandardPage;
    rdMesSelecionado: TRadioButton;
    cbMes: TComboBox;
    cbAno: TComboBox;
    Label21: TLabel;
    rdMesAnterior: TRadioButton;
    pgSelecaoDatasNaoExibir: TJvStandardPage;
    pgNaoExibir: TJvStandardPage;
    lbDescricaoEmpresa: TLabel;
    memoRestornoConsulta: TMemo;
    Label34: TLabel;
    btFecharConsulta: TBitBtn;
    AdvGlassButton2: TAdvGlassButton;
    FolderDialog1: TFolderDialog;
    edDe: TAdvDateTimePicker;
    edAte: TAdvDateTimePicker;
    popMenu: TPopupMenu;
    menuManifestacao: TMenuItem;
    itVisualizarDanfe: TMenuItem;
    itLancarNotasEntrada: TMenuItem;
    itLancarCTE: TMenuItem;
    itCancelarEntrada: TMenuItem;
    N1: TMenuItem;
    Copiarchave1: TMenuItem;
    S1: TMenuItem;
    C1: TMenuItem;
    N2: TMenuItem;
    S2: TMenuItem;
    R1: TMenuItem;
    N3: TMenuItem;
    E1: TMenuItem;
    N4: TMenuItem;
    edChaveNFE: TEdit;
    Label37: TLabel;
    procedure consultaNotasFiscais(agrupar: boolean);
    procedure enviaManifestacao(evento: TpcnTpEvento; tipoManifestacao: smallint; chaveNfe: string);
    function DownloadFile(SourceFile, DestFile: string): Boolean;
    procedure FormActivate(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    function ReplaceString(Str: string; SearchStr: string; NewStr: string): string;
    procedure ProcessarNotas();
    procedure itLancarNotasEntradaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Atua1Click(Sender: TObject);
    procedure itCancelarEntradaClick(Sender: TObject);
    procedure Copiarchave1Click(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
    procedure btImprimirInventarioClick(Sender: TObject);
    procedure AdvGlassButton1Click(Sender: TObject);
    procedure PngSpeedButton2Click(Sender: TObject);
    procedure cxGrid1DBTableView1Column5CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1Column5GetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxGrid1DBTableView1Column12CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1Column2CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGrid1DBTableView1Column3StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure PngSpeedButton4Click(Sender: TObject);
    procedure btPequisaInventariosClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PngSpeedButton5Click(Sender: TObject);
    procedure PngSpeedButton6Click(Sender: TObject);
    procedure PngSpeedButton8Click(Sender: TObject);
    procedure btConsultarSefazClick(Sender: TObject);
    procedure btAssociarClick(Sender: TObject);
    procedure cxGrid1DBTableView1StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure itVisualizarDanfeClick(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure PngSpeedButton13Click(Sender: TObject);
    procedure PngSpeedButton12Click(Sender: TObject);
    procedure PngSpeedButton11Click(Sender: TObject);
    procedure PngSpeedButton10Click(Sender: TObject);
    procedure PngSpeedButton9Click(Sender: TObject);
    procedure menuManifestacaoClick(Sender: TObject);
    procedure btDesistirLancamentoCTEClick(Sender: TObject);
    procedure btConfirmaLancamentoCTEClick(Sender: TObject);
    procedure itLancarCTEClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure S2Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure PngSpeedButton14Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure rdMesAtualClick(Sender: TObject);
    procedure cbMesSelect(Sender: TObject);
    procedure cbAnoSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFecharConsultaClick(Sender: TObject);
    procedure AdvGlassButton2Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
  private
    LListaArquivosXML: TList<TTextosXML>;
    LXMLNotaCarregada: string;
    TBFornecedores: TFDMemTable;
    finalizouInicializacao: Boolean;
    procedure ExportarArquivosXMLEntradas(DataInicial, DataFinal: Tdate);
    procedure ConsultaNotasFiscaisDFE;
    procedure ConsultaCTEDFE;
    function VerificaSeExistemAssociacoesPendentes(AXMLNota: string): boolean;
    procedure visualizarDocumento(ATipoDocumento: integer; AChaveDocumento: string);
    function carregarXMLDcocumento(ATipoDocumento: integer; AChaveDocumento: string): Boolean;
    procedure exportarXML(ASalvarEmDisco: Boolean; ATipoDocumento: integer; AChaveDoc: string);
    procedure SalvarDocumento(ATipoDocumento: integer; AlocalArquivo: string);
    procedure abrirOpcoesDeManifestacao;
    procedure abrirOpcoesLancamentoCTE;
    procedure LancarCTE(AChaveCTE: string);
    function verificaRegistroEhCTE: Boolean;
    procedure SelecaoDeNotas(ASelecionar: boolean);
    procedure selecionaNota;
    procedure processaFornecedorNota(ATBFornecedores: TFDMemTable; xml_nota: string; AListaSQL: TList<string>);
    procedure processaItensNota(xml_nota: string; AListaSQL: TList<string>);
    procedure registraEventoNFEDestinada(AListaSQL: TList<string>; chave: string; evento: TpcnTpEvento; descricao: string; dataHora: TDateTime);
    procedure abrirLancamentoDeNFE;
    procedure carregaDadosLancamentoNFE;
    procedure abreTelaDeEntradas;
    procedure processaFornecedorCTE(ATBFornecedores: TFDMemTable; xml_nota: string; AListaSQL: TList<string>);
    procedure inicia;
    procedure ImportarXMLNFEntrada(AXMLNota: string; AListaSQL: TList<string>);
    procedure geraListaArquivos(LPasta: string; LListaArquivos: Tstringlist);
    procedure ExcluirNotaDestinada(AChave: string);

    procedure GravarArquivosXML;
















    { Private declarations }
  public
    { Public declarations }
    FPath: string;
    codigosProdutosNfeSelecionada: string;
  end;

var
  frmManifestacao: TfrmManifestacao;

implementation

uses
  uu_data_module, uu_frm_principal, uuObsManifestacao, uuComparaProdutosNFE,
  uuEntradasNFE, pcnRetDistDFeInt, Vcl.Clipbrd, uuDmManifestacaoNFE;

{$R *.dfm}

function TfrmManifestacao.ReplaceString(Str: string; SearchStr: string; NewStr: string): string;
var
  s: string;
  place: integer;
begin
  s := Str;
  repeat
    place := pos(SearchStr, s);
    if place > 0 then
    begin
      Delete(s, place, Length(SearchStr));
      Insert(NewStr, s, place);
    end;
  until place = 0;
  Result := s;
end;

function TfrmManifestacao.DownloadFile(SourceFile, DestFile: string): Boolean;
const
  BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  f: file;
  sAppName: string;
begin
  sAppName := ExtractFileName(Application.ExeName);
  hSession := InternetOpen(PChar(sAppName), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    hURL := InternetOpenURL(hSession, PChar(SourceFile), nil, 0, 0, 0);
    try
      AssignFile(f, DestFile);
      Rewrite(f, 1);
      repeat
        InternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen);
        BlockWrite(f, Buffer, BufferLen)
      until BufferLen = 0;
      CloseFile(f);
      Result := True;
    finally
      InternetCloseHandle(hURL)
    end
  finally
    InternetCloseHandle(hSession)
  end;
end;

procedure TfrmManifestacao.FormActivate(Sender: TObject);
var
  ThreadInicia: TThread;
begin
  inherited;
  edDe.Date := StartOfTheMonth(now);
  edAte.Date := Today;
  btAssociar.Caption := dm.BuscaTroca(btAssociar.Caption, ' ', sLineBreak);
  CoInitialize(nil);
  btPesquisar.Enabled := false;
  carregaComboAnos(cbAno);
  carregaComboMeses(cbMes);
  configuraOpcoesData(rdMesAtual, edDe, edAte, cbMes, cbAno);

  finalizouInicializacao := false;

  ThreadInicia := TThread.CreateAnonymousThread(
    procedure()
    begin
      try
        try
          inicia;
        except
          on E: Exception do
          begin
            dm.exibe_painel_erro('Ocorreu um erro ao executar a thread de inicialilzação! ' + sLineBreak + e.Message, 'Ok');
            dm.adicionalog('Erro ao inicializar móduo de Manifestação. ' + E.Message);
          end;
        end;
        inicia;
      finally
        FinalizouInicializacao := True;
      end;
    end);

  ThreadInicia.FreeOnTerminate := true;
  ThreadInicia.Start;

end;

procedure TfrmManifestacao.inicia();
begin
  btConsultarSefaz.Caption := dm.BuscaTroca(btConsultarSefaz.Caption, ' ', sLineBreak);
  dm.parametrizaAcbrNFE(moNFe, false, false);
  dm.parametrizaAcbrCTE();

  dm.tb_parametros.Active := false;
  dm.tb_parametros.Active := True;

  lbUltNsuNFE.Caption := '';
  lbUltNsuCTE.Caption := '';

  try
    lbUltNsuNFE.Caption := Inttostr(StrToInt(dm.tb_parametrosULT_NSU_NFE_DEST.Value));
    lbUltNsuCTE.Caption := Inttostr(StrToInt(dm.tb_parametrosULT_NSU_CTE.Value));
  except
  end;

  ProcessarNotas();
  btPesquisar.Enabled := True;
end;

procedure TfrmManifestacao.consultaNotasFiscais(agrupar: boolean);
var
  LSQL: TStringList;
  LSegundos: Integer;
begin
  LSQL := TStringList.Create;
  LSQL.Clear;

  try
    try

      LSQL.add('	 select sel, lancada, processada, XML_BAIXADO,                                                                      ');
      LSQL.add('			numNota, valor_nota,chave_nfe,numero_nota,serie_nota,                                                                  ');
      LSQL.add('			valor_nota, tipo_doc,MANIFESTO,tipoDocumento,                                                               ');
      LSQL.add('			data_emissao, nf.nome_fornecedor,coalesce(f.cod_fornecedor,' + Quotedstr('') + ') codFornecedor                                        ');
      LSQL.add('	from (                                                                                                              ');
      LSQL.add('                                                                                                                      ');
      LSQL.add('	 select 0 as sel, nf.lancada,nf.processada, nf.data_emissao,                                                        ');
      LSQL.add('			 nf.nome_fornecedor, nf.cnpj,coalesce(serie_nota,1) as serie_nota,                                                                               ');
      LSQL.add('			 cast(nf.numero_nota as bigint) as numNota,                                                                 ');
      LSQL.add('			 udf_copy(nf.chave_nfe,26,9) as numero_nota,                                                                ');
      LSQL.add('			 nf.valor_nota,NF.chave_nfe,coalesce(nf.tipo_doc,1) as tipo_doc,                                            ');
      LSQL.add('        case                                                                                               ');
      LSQL.add('             when ( (coalesce(nf.tipo_doc,1) = 2) )  then  ' + Quotedstr('NÃO SE APLICA'));
      LSQL.add('             when ( (nf.tipo_manifestacao = 0) and (coalesce(nf.tipo_doc,1) = 1) )  then ' + Quotedstr('SEM MANIFESTO'));
      LSQL.add('             when ( (nf.tipo_manifestacao = 1) and (coalesce(nf.tipo_doc,1) = 1) )  then ' + Quotedstr('CONFIRMADA'));
      LSQL.add('             when ( (nf.tipo_manifestacao = 2) and (coalesce(nf.tipo_doc,1) = 1) )  then ' + Quotedstr('NÃO REALIZADA'));
      LSQL.add('             when ( (nf.tipo_manifestacao = 3) and (coalesce(nf.tipo_doc,1) = 1) )  then ' + Quotedstr('CIÊNCIA DA OP.'));
      LSQL.add('             when ( (nf.tipo_manifestacao = 4) and (coalesce(nf.tipo_doc,1) = 1) )  then ' + Quotedstr('OP. DESCONHECIDA'));
      LSQL.add('             when ( (nf.tipo_manifestacao = 5) and (coalesce(nf.tipo_doc,1) = 1) )  then ' + Quotedstr('CANCELADA'));
      LSQL.add('        end as MANIFESTO ,                                                                                   ');
      LSQL.add('       case                                                                                                ');
      LSQL.add('           when coalesce(nf.tipo_doc,1) = 1 then ' + QuotedStr('NF-e'));
      LSQL.add('           when coalesce(nf.tipo_doc,1) = 2 then ' + QuotedStr('CT-e'));
      LSQL.add('         end as tipoDocumento,');

      LSQL.add('			 case when trim(coalesce(nf.xml_nota,' + Quotedstr('') + '))  =' + QUotedstr('') + ' then 0                                                       ');
      LSQL.add('			   when trim(coalesce(nf.xml_nota,' + Quotedstr('') + '))  <> ' + Quotedstr('') + ' then 1                                                         ');
      LSQL.add('			 end as XML_BAIXADO                                                                                         ');
      LSQL.add('                                                                                                                      ');
      LSQL.add('			  from nfe_destinadas nf                                                                                    ');
      LSQL.Add('    where  nf.cod_empresa=' + QuotedStr(codEmpresa));
      LSQL.add('    and nf.data_emissao is not null ');

      LSQL.add('  and nf.data_emissao  between ' + Quotedstr(FormatDateTime('DD.MM.YYY', edDe.Date)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', edAte.Date)));

      if (trim(edChaveNFE.Text) <> '') then
      begin
        LSQL.add(' and nf.chave_nfe=' + Quotedstr(trim(edChavenfe.text)));
      end;

      if (rdManifestacao.ItemIndex <> 0) then
      begin
        case rdManifestacao.ItemIndex of
          1:
            LSQL.add(' and nf.tipo_manifestacao=0');
          2:
            LSQL.add(' and nf.tipo_manifestacao=3');
          3:
            LSQL.add(' and nf.tipo_manifestacao=4');
          4:
            LSQL.add(' and nf.tipo_manifestacao=1');
          5:
            LSQL.add(' and nf.tipo_manifestacao=2');
          6:
            LSQL.add(' and nf.tipo_manifestacao=5');

        end;
      end;

      case rdTipoDocumento.ItemIndex of
        1:
          LSQL.add(' and nf.tipo_doc=1');
        2:
          LSQL.add(' and nf.tipo_doc=2');
      end;

      if (rdLancada.ItemIndex <> 0) then
      begin
        case rdLancada.ItemIndex of
          1:
            LSQL.add(' and nf.lancada=1');
          2:
            LSQL.add(' and nf.lancada=0');
        end;
      end;

      if (rdXML.ItemIndex <> 0) then
      begin
        case rdXML.ItemIndex of
          1:
            LSQL.add(' and nf.xml_nota is not null ');
          2:
            LSQL.add(' and nf.xml_nota is  null ');
        end;
      end;

      if (trim(edNumeroNota.Text) <> '') then
      begin
        LSQL.add(' and nf.numero_nota like ' + QuotedStr('%' + edNumeroNota.Text + '%') + ' ');
      end;

      if (trim(edRazaoSocial.Text) <> '') then
      begin
        LSQL.add(' and nf.nome_fornecedor like ' + QuotedStr('%' + edRazaoSocial.Text + '%') + ' ');
      end;

      if agrupar = false then
      begin
        case rdOrdem.ItemIndex of
          0:
            LSQL.add('   order by nf.data_emissao desc ');
          1:
            LSQL.add('   order by nf.valor_nota asc');
          2:
            LSQL.add('   order by nf.nome_fornecedor asc ');
          3:
            LSQL.add('   order by nf.tipo_manifestacao asc ');
        end;
      end
      else
      begin
        case rdOrdem.ItemIndex of
          0:
            LSQL.add('   order by nf.tipo_manifestacao,nf.data_emissao desc ');
          1:
            LSQL.add('   order by  nf.tipo_manifestacao,nf.valor_nota asc');
          2:
            LSQL.add('   order by  nf.tipo_manifestacao,nf.nome_fornecedor asc ');
          3:
            LSQL.add('   order by  nf.tipo_manifestacao,nf.tipo_manifestacao asc ');
        end;
      end;

      LSQL.add('	  ) nf                                                                                                              ');
      LSQL.add('                                                                                                                      ');
      LSQL.add('	  left join fornecedor f on (f.cgc_cpf = nf.cnpj)                                                                   ');
      LSQL.add('	   order by data_emissao desc                                                                                       ');
      LSQL.add('                                                                                                                      ');

      dmManifestacaoNFE.tbManifestacaoNFE.Active := false;
      dm.adicionalog(LSQL.Text);
      dm.getMemTable(dmManifestacaoNFE.tbManifestacaoNFE, LSQL.Text);
      dmManifestacaoNFE.tbManifestacaoNFE.FetchAll;

    except
      ////dm.adicionalog(LSQL.Text);
      dm.exibe_painel_erro('Erro ao processar consulta das notas destinadas.', 'Ok');
    end;
  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmManifestacao.Copiarchave1Click(Sender: TObject);
begin
  inherited;
  Clipboard.AsText := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value;
  dm.exibe_painel_erro('Chave da NF-e copiada para a área de transferência.', 'Ok');
end;

procedure TfrmManifestacao.cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  case dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('tipo_doc').Value of
    1:
      begin
        menuManifestacao.Visible := true;
        itLancarNotasEntrada.Visible := true;
        itCancelarEntrada.Visible := false;

        itVisualizarDanfe.Caption := 'Visualizar NF-e';
        Copiarchave1.Caption := 'Copiar chave da NF-e';
        itLancarNotasEntrada.Caption := 'Lançar nota';
        if (dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('lancada').Value = 1) then
        begin
          itLancarNotasEntrada.Visible := false;
          itCancelarEntrada.Visible := true;
        end;

        itLancarCTE.Visible := false;

      end;
    2:
      begin
        menuManifestacao.Visible := false;
        itLancarNotasEntrada.Visible := false;
        itLancarNotasEntrada.Caption := 'Lançar CT-e';
        itCancelarEntrada.Visible := false;

        itVisualizarDanfe.Caption := 'Visualizar Conhecimento de frete';
        Copiarchave1.Caption := 'Copiar chave do CT-e';
        if (dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('lancada').Value = 0) then
        begin
          itLancarCTE.Visible := True;
        end;

      end;

  end;
end;

procedure TfrmManifestacao.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  selecionaNota;
end;

procedure TfrmManifestacao.cxGrid1DBTableView1Column12CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
begin
  inherited;

  if dmManifestacaoNFE.tbManifestacaoNFE.IsEmpty then
    exit;

  if not (AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo) then
    Exit;

  APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
  with APainter do
  begin
    try
      with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
        Left := Left + cxImageList1.Width + 1;

      DrawContent;
      DrawBorders;

      case AnsiIndexStr(UpperCase((AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column4.Index])), ['0', '1']) of
        0:
          begin
            with AViewInfo.ClientBounds do


          end;
        1:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 0);
          end;
      end;

    finally
      Free;
    end;
  end;
  ADone := True;
end;

procedure TfrmManifestacao.cxGrid1DBTableView1Column2CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
begin
  inherited;

  if dmManifestacaoNFE.tbManifestacaoNFE.IsEmpty then
    exit;

  if not (AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo) then
    Exit;

  APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
  with APainter do
  begin
    try
      with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
        Left := Left + cxImageList1.Width + 1;

      DrawContent;
      DrawBorders;

      case AnsiIndexStr(UpperCase((AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column2.Index])), ['NF-E', 'CT-E']) of
        0:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 2);

          end;
        1:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 1);

          end;

      end;

    finally
      Free;
    end;
  end;
  ADone := True;
end;

procedure TfrmManifestacao.cxGrid1DBTableView1Column3StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  AColumn: TcxGridDBColumn;
begin
  if dmManifestacaoNFE.tbManifestacaoNFE.IsEmpty = false then
  begin
    if (AItem as TcxGridDBColumn).DataBinding.FieldName = 'MANIFESTO' then
    begin

      case AnsiIndexStr(UpperCase((ARecord.Values[2])), ['NÃO SE APLICA', 'SEM MANIFESTO', 'CONFIRMADA', 'NÃO REALIZADA', 'CIÊNCIA DA OP.', 'OP. DESCONHECIDA', 'CANCELADA']) of

        0:
          AStyle := AStyle;
        1:
          AStyle := stSemManifesto;
        2:
          AStyle := stConfirmada;
        3:
          AStyle := stNaoRealizada;
        4:
          AStyle := stCiencia;
        5:
          AStyle := stNaoRealizada;
        6:
          AStyle := stCancelada;

      end;

    end;
  end;

end;

procedure TfrmManifestacao.cxGrid1DBTableView1Column5CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  APainter: TcxPainterAccess;
begin
  inherited;

  if dmManifestacaoNFE.tbManifestacaoNFE.IsEmpty then
    exit;

  if not (AViewInfo.EditViewInfo is TcxCustomTextEditViewInfo) then
    Exit;

  APainter := TcxPainterAccess(TcxViewInfoAcess(AViewInfo).GetPainterClass.Create(ACanvas, AViewInfo));
  with APainter do
  begin
    try
      with TcxCustomTextEditViewInfo(AViewInfo.EditViewInfo).TextRect do
        Left := Left + cxImageList1.Width + 1;

      DrawContent;
      DrawBorders;

      case AnsiIndexStr(UpperCase((AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column5.Index])), ['0', '1']) of
        0:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 3);
//            AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column5.Index] := '.';

          end;
        1:
          begin
            with AViewInfo.ClientBounds do
              cxImageList1.Draw(ACanvas.Canvas, Left + 1, Top + 1, 0);
  //        AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column5.Index] := '.';
          end;

      end;

   //   if AViewInfo.GridRecord.Values[cxGrid1DBTableView1Column5.Index] then


    finally
      Free;
    end;
  end;
  ADone := True;
end;

procedure TfrmManifestacao.cxGrid1DBTableView1Column5GetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  Text := '';
end;

procedure TfrmManifestacao.cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = 32 then
  begin
    selecionaNota();
  end;
end;

procedure TfrmManifestacao.selecionaNota;
begin
  dmManifestacaoNFE.tbManifestacaoNFE.Edit;
  if dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('sel').Value = 0 then
    dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('sel').Value := 1
  else
    dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('sel').Value := 0;
  dmManifestacaoNFE.tbManifestacaoNFE.Post;
end;

procedure TfrmManifestacao.cxGrid1DBTableView1StylesGetContentStyle(Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if dmManifestacaoNFE.tbManifestacaoNFE.IsEmpty = false then
  begin

    case AnsiIndexStr(UpperCase((ARecord.Values[2])), ['CANCELADA']) of
      0:
        AStyle := stCancelada;
    end;

  end;

end;

procedure TfrmManifestacao.ExportarArquivosXMLEntradas(DataInicial: Tdate; DataFinal: Tdate);
var
  localArquivoNota: string;
  pastaDestino: string;
  CaminhoArquivo: string;
  CaminhoArquivoXMLAtual: string;
  ArquivoNotas: TZipFile;
  TotalDeNotas: integer;
  intervaloExportacao: integer;
  LSQL: TStringList;
begin
  inherited;

  LSQL := TStringList.Create;
  intervaloExportacao := StrToInt(dm.LeIni(2, 'NFCE', 'intervaloExportacao'));
  ArquivoNotas := TZipFile.Create;

  try

    LSQL.Clear;
    LSQL.Add('select coalesce(tipo_doc,1) as tipo_doc, xml_nota from nfe_destinadas nf where nf.data_emissao  between ' + Quotedstr(FormatDateTime('DD.MM.YYY', DataInicial)) + ' and ' + Quotedstr(FormatDateTime('DD.MM.YYY', DataFinal)));
    LSQL.Add(' and xml_nota is not null and trim(xml_nota) <>' + QUotedstr(''));
    dm.getMemTable(dmManifestacaoNFE.TBExportacao, LSQL.Text);

    pgExporta.Position := 0;
    pgExporta.Max := dmManifestacaoNFE.TBExportacao.RecordCount;

    if dmManifestacaoNFE.tbExportacao.IsEmpty then
    begin
      Showmessage('Nenhuma nota de entrada encontrada para este período!');
    end
    else
    begin

      pastaDestino := patchAplicacao + 'EXPORTACOES\ENTRADAS';
      if DirectoryExists(pastaDestino, true) = false then
        forcedirectories(Pchar(pastaDestino));

      CaminhoArquivo := pastaDestino + '\' + 'XML ENTRADAS ' + UpperCase(FormatDateTime('MMM', DataInicial)) + ' ' + FormatDateTime('YYY', DataFinal) + '.zip';
      DeleteFile(CaminhoArquivo);

      try
        ArquivoNotas.Open(CaminhoArquivo, zmWrite);

      except
        dm.exibe_painel_erro('Erro ao criar o arquivo compactado. Verifique a pasta e escolhida e se você possui permissões para gravar na mesma!', 'Continuar');
        ArquivoNotas.DisposeOf;
        exit;
      end;

      dm.parametrizaAcbrNFE(moNFe, false, true);
      if DirectoryExists(pastaDestino) then
      begin
        while not dmManifestacaoNFE.tbExportacao.Eof do
        begin
          pnAguarde.Visible := true;
          pgExportando.Show;

          case dmManifestacaoNFE.tbExportacao.FieldByName('tipo_doc').Value of
            1:
              begin
                dm.ACBrNFe1.NotasFiscais.Clear;
                dm.ACBrNFe1.NotasFiscais.LoadFromString(dmManifestacaoNFE.tbExportacao.FieldByName('xml_nota').Value, false);
                CaminhoArquivoXMLAtual := copy('NFe' + dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60) + '.xml';
                dm.ACBrNFe1.NotasFiscais.GravarXML(dm.GetTempDirectory + '\' + CaminhoArquivoXMLAtual);

              end;
            2:
              begin

                dm.acbrCTE.conhecimentos.Clear;
                dm.acbrCTE.conhecimentos.LoadFromString(dmManifestacaoNFE.tbExportacao.FieldByName('xml_nota').Value, false);
                CaminhoArquivoXMLAtual := copy('CTe' + dm.acbrCTE.conhecimentos[0].cte.infcte.ID, 4, 60) + '.xml';
                dm.ACBrCTe.Conhecimentos.GravarXML(dm.GetTempDirectory + '\' + CaminhoArquivoXMLAtual);
              end;

          end;

          ArquivoNotas.Add(dm.GetTempDirectory + '\' + CaminhoArquivoXMLAtual);
          Sleep(intervaloExportacao);
          DeleteFile(dm.GetTempDirectory + '\' + CaminhoArquivoXMLAtual);
          Application.ProcessMessages;
          pgExporta.Position := pgExporta.Position + 1;
          Application.ProcessMessages;
          dmManifestacaoNFE.tbExportacao.Next;
        end;

        pnAguarde.Visible := false;
        dm.exibe_painel_erro('Exportação concluída. A seguir o sistema abrirá a janela com a pasta e o arquivo gerado selecionado! ' + sLineBreak + sLineBreak + 'Pasta: ' + pastaDestino, 'Ok');

        ShellExecute(0, 'open', PChar('explorer.exe'), PChar('/n, /select,' + CaminhoArquivo), nil, SW_SHOWMAXIMIZED);

      end
      else
      begin
        showmessage('A pasta informada não existe!');
      end;
    end;
  finally

    dmManifestacaoNFE.TBExportacao.Active := false;
    FreeAndNil(LSQL);
    ArquivoNotas.Close;
    ArquivoNotas.DisposeOf;
  end;
end;

procedure TfrmManifestacao.enviaManifestacao(evento: TpcnTpEvento; tipoManifestacao: smallint; chaveNfe: string);
var
  lmsg: string;
  recno: integer;
  LSQL: TStringList;
  LListaSQL: TList<string>;
begin
  LSQL := TStringList.Create;
  LListaSQL := TList<string>.Create;

  LSQL.Clear;
  LListaSQL.Clear;

  try
    try
      string_auxiliar := '';
      if (evento = teManifDestDesconhecimento) or (evento = teManifDestOperNaoRealizada) then
      begin
        Application.CreateForm(TfrmObservacaoManifesto, frmObservacaoManifesto);
        frmObservacaoManifesto.ShowModal;
        frmObservacaoManifesto.Free;
      end;

      if (trim(string_auxiliar) = 'sair') then
        exit;

      dmManifestacaoNFE.tbManifestacaoNFE.Filtered := false;
      dmManifestacaoNFE.tbManifestacaoNFE.Filter := 'sel = 1';
      dmManifestacaoNFE.tbManifestacaoNFE.Filtered := true;
      dmManifestacaoNFE.tbManifestacaoNFE.First;

      if dmManifestacaoNFE.tbManifestacaoNFE.RecordCount = 0 then
      begin
        exibe_painel_erro('Nenhuma nota selecionada para manifestar! Selecione a(s) notas desejada(s) marcando na listagem das notas', 'Ok');
        exit;
      end;

      while not dmManifestacaoNFE.tbManifestacaoNFE.Eof do
      begin
        chaveNfe := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value;
        dm.tb_parametros.Active := false;
        dm.tb_parametros.Active := true;
        dm.ACBrNFe1.NotasFiscais.Clear;
        dm.ACBrNFe1.EventoNFe.Evento.Clear;

        with dm.ACBrNFe1.EventoNFe.Evento.Add do
        begin
          InfEvento.cOrgao := 91;
          infEvento.chNFe := chaveNfe;
          infEvento.CNPJ := dm.tb_parametrosCNPJ.Value;
          infEvento.dhEvento := now;
          infEvento.tpEvento := evento;
          InfEvento.detEvento.xJust := string_auxiliar;
        end;

        try
          begin
            dm.ACBrNFe1.EnviarEvento(StrToInt('1'));
            if (trim(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt) <> '') then
            begin
              dm.transacao.Active := false;
              dm.transacao.Active := true;

              ////dm.adicionalog('XML DO EVENTO DE MANIFESTAÇÃO');
              ////dm.adicionalog(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XML);

              LSQL.Clear;
              LSQL.add('update nfe_destinadas nf set nf.protocolo_manifestacao=' + Quotedstr(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt) + ',');
              LSQL.add('nf.id_manifestacao=' + Quotedstr(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.Id) + ',');
              LSQL.add('nf.tipo_manifestacao=' + Inttostr(tipoManifestacao));
              LSQL.add(',nf.obs_manifestacao=' + QuotedStr(string_auxiliar));
              LSQL.add(' where nf.chave_nfe=' + Quotedstr(chaveNfe) + ';');
              LListaSQL.Add(LSQL.Text);

              with dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento do
              begin
                if cStat > 200 then
                begin
                  lmsg := 'Erro ao manifestar' + sLineBreak + 'chNFe: ' + chNFe + sLineBreak + 'cStat: ' + IntToStr(cStat) + sLineBreak + 'xMotivo: ' + xMotivo + sLineBreak;
                  exibe_painel_erro(lmsg, 'Ok');
                end;
              end;
            end;
          end;
        except
          on E: Exception do
          begin
            dm.exibe_painel_erro('Erro ao enviar manifestação da chave ' + chaveNfe + sLineBreak + sLineBreak + E.Message, 'Ok');
          end;

        end;

        dmManifestacaoNFE.tbManifestacaoNFE.Next;
      end;

      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 150);
    except
      on E: Exception do
      begin

        ShowRealDialog(frm_principal, tmSucesso, 'Erro', 'Erro ao realizar manifestação!');
      end;
    end;

  finally
    FreeAndNil(LSQL);
    FreeAndNil(LListaSQL);
    dmManifestacaoNFE.tbManifestacaoNFE.Filtered := false;
    dmManifestacaoNFE.tbManifestacaonfe.Filter := '';

    ShowRealDialog(frm_principal, tmSucesso, 'Manifestação realizada!', 'Manifestação realizada com sucesso!');
  end;

end;

procedure TfrmManifestacao.AdvGlassButton1Click(Sender: TObject);
begin
  inherited;
  pnAguarde.Visible := false;
end;

procedure TfrmManifestacao.AdvGlassButton2Click(Sender: TObject);
var
  LListaArquivos: TStringList;
  LCaminhoPasta: string;
  LCaminhoImportadas: string;
  LConteudoXML: TStringList;
  LNomeArquivo: string;
  LCaminhoCopiaArquivo: string;
  LListaSQL: TList<string>;
  LCtArquivos: integer;
begin
  inherited;
  LListaArquivos := Tstringlist.Create;
  LListaSQL := TList<string>.Create;
  LConteudoXML := Tstringlist.Create;
  LCtArquivos := 0;

  try

    try
      LListaArquivosXML.Clear;
      FolderDialog1.Title := 'Selecione a pasta dos arquivos';
      FolderDialog1.Execute;
      LCaminhoPasta := FolderDialog1.Directory;
      geraListaArquivos(LCaminhoPasta, LListaArquivos);
      LCaminhoImportadas := LCaminhoPasta + '\importadas';

      if not TDirectory.Exists(LCaminhoImportadas) then
        TDirectory.CreateDirectory(LCaminhoImportadas);

      for LNomeArquivo in LListaArquivos do
      begin
        LConteudoXML.clear;
        LConteudoXML.LoadFromFile(LNomeArquivo);
        ImportarXMLNFEntrada(LConteudoXML.Text, LListaSQL);
        LCaminhoCopiaArquivo := LCaminhoImportadas + '\' + 'IMP_' + extractFileName(LNomeArquivo);
        LConteudoXML.SaveToFile(LCaminhoCopiaArquivo);
        DeleteFile(LNomeArquivo);
        LCtArquivos := LCtArquivos + 1;
      end;

      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 25);
      GravarArquivosXML;
      ShowRealDialog(frm_principal, tmSucesso, 'Importação efetuada!', Inttostr(LCtArquivos) + ' arquivo(s) importado(s)!');
    except
      on E: Exception do
      begin
        showRealDialog(frm_principal, tmErro, 'Erro', 'Ocorreu o seguinte erro na importação dos arquivos: ' + sLineBreak + LNomeArquivo + sLineBreak + e.Message, 22, false);
      end;

    end;
  finally
    FreeAndNil(LListaArquivos);
    FreeAndNil(LListaSQL);
    FreeAndNil(LConteudoXML);
    ProcessarNotas();
    pnAguarde.Visible := false;

  end;

end;

procedure TfrmManifestacao.geraListaArquivos(LPasta: string; LListaArquivos: Tstringlist);
var
  LNomeArquivo: string;
begin
  if DirectoryExists(LPasta) then
  begin
    for LNomeArquivo in TDirectory.GetFiles(LPasta) do
    begin
      if ExtractFileExt(LNomeArquivo) = '.xml' then
      begin
        LListaArquivos.Add(LNomeArquivo);
      end;
    end;

  end;

end;

procedure TfrmManifestacao.Atua1Click(Sender: TObject);
var
  chave: string;
begin
  inherited;
  chave := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add(' update nfe_destinadas nf ');
  dm.qryauxiliar.SQL.Add(' set nf.tipo_manifestacao=1 where nf.chave_nfe=' + Quotedstr(chave));
  dm.qryauxiliar.ExecSQL;
  dm.transacao.Commit;
  showmessage('Nota atualizada!');

end;

procedure TfrmManifestacao.btFecharConsultaClick(Sender: TObject);
begin
  inherited;
  btFecharConsulta.Visible := false;
  pnAguarde.Visible := false;
end;

procedure TfrmManifestacao.PngSpeedButton10Click(Sender: TObject);
begin
  inherited;

  try
    if (dm.verificaPermissaoAcao('B40006006', true, true) = false) then
      Exit;

    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Você tem certeza ? Esta operação envia uma negação da operação. Após isto, não é mais possível realizar outras opções de manifestação', 15) = teSim) then
    begin
      enviaManifestacao(teManifDestOperNaoRealizada, 2, dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value);

    end;

  finally
    SelecaoDeNotas(false);

  end;

end;

procedure TfrmManifestacao.PngSpeedButton11Click(Sender: TObject);
begin
  inherited;

  try

    if (dm.verificaPermissaoAcao('B40006005', true, true) = false) then
      Exit;
    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Você tem certeza ? Esta operação envia uma negação da operação. Após isto, não é mais possível realizar outras opções de manifestação', 15) = teSim) then
    begin
      enviaManifestacao(teManifDestConfirmacao, 1, dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value);

    end;

  finally
    SelecaoDeNotas(false);
  end;

end;

procedure TfrmManifestacao.PngSpeedButton12Click(Sender: TObject);
begin
  inherited;
  try
    if (dm.verificaPermissaoAcao('B40006004', true, true) = false) then
      Exit;
    enviaManifestacao(teManifDestDesconhecimento, 4, dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value);

  finally
    SelecaoDeNotas(false);
  end;

end;

procedure TfrmManifestacao.PngSpeedButton13Click(Sender: TObject);
begin
  try
    if (dm.verificaPermissaoAcao('B40006003', true, true) = false) then
      Exit;
    enviaManifestacao(teManifDestCiencia, 3, dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value);
  finally
    SelecaoDeNotas(false);
  end;

end;

procedure TfrmManifestacao.PngSpeedButton14Click(Sender: TObject);
begin
  inherited;
  pgManifestacao.Show;
end;

procedure TfrmManifestacao.SelecaoDeNotas(ASelecionar: boolean);
var
  LTipo: Integer;
begin
  LTipo := 0;

  if ASelecionar then
    LTipo := 1;

  dmManifestacaoNFE.tbManifestacaoNFE.DisableControls;
  dmManifestacaoNFE.tbManifestacaoNFE.First;

  while not dmManifestacaoNFE.tbManifestacaoNFE.Eof do
  begin
    dmManifestacaoNFE.tbManifestacaoNFE.Edit;
    dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('sel').Value := LTipo;
    dmManifestacaoNFE.tbManifestacaoNFE.Post;
    dmManifestacaoNFE.tbManifestacaoNFE.Next;
  end;

  dmManifestacaoNFE.tbManifestacaoNFE.EnableControls;

end;

procedure TfrmManifestacao.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  dm.tb_parametros.Active := true;
  dm.tb_parametros.Edit;
  dm.tb_parametrosULT_NSU_NFE_DEST.Value := '0';
  lbUltNsuNFE.Caption := '0';
  dm.tb_parametros.Post;
  dm.transacao.Commit;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
end;

procedure TfrmManifestacao.PngSpeedButton2Click(Sender: TObject);
begin
  inherited;
  dm.tb_parametros.Active := true;
  dm.tb_parametros.Edit;
  dm.tb_parametrosULT_NSU_CTE.Value := '0';
  lbUltNsuCTE.Caption := '0';
  dm.tb_parametros.Post;
  dm.transacao.Commit;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
end;

procedure TfrmManifestacao.PngSpeedButton4Click(Sender: TObject);
begin
  inherited;
  pnFiltros.Visible := true;
  pnFiltros.Height := 307;
//   pnFiltros.Repaint;


end;

procedure TfrmManifestacao.PngSpeedButton5Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmManifestacao.PngSpeedButton6Click(Sender: TObject);
begin
  inherited;
  ExportarArquivosXMLEntradas(edDe.Date, edAte.Date);
end;

procedure TfrmManifestacao.PngSpeedButton8Click(Sender: TObject);
begin
  inherited;
  consultaNotasFiscais(true);

  if dmManifestacaoNFE.tbManifestacaoNFE.IsEmpty then
  begin
    showmessage('Não há notas para imprimir!');
  end
  else
  begin
    dmManifestacaoNFE.rpt.LoadFromFile(patchAplicacao + 'relatorios\relManifestacao.fr3', true);
    dmManifestacaoNFE.setPeriodoRelatorio('De  ' + DateTimeToStr(edDe.date) + '  até  ' + DateTimeToStr(edAte.date));
    dmManifestacaoNFE.rpt.ShowReport(true);
    consultaNotasFiscais(false);
  end;
end;

procedure TfrmManifestacao.PngSpeedButton9Click(Sender: TObject);
begin
  inherited;
  pnOpcoesGrid.Visible := false;
end;

procedure TfrmManifestacao.btAssociarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmComparaProdutosNFEFornecedor, frmComparaProdutosNFEFornecedor);
  frmComparaProdutosNFEFornecedor.ShowModal;
  frmComparaProdutosNFEFornecedor.Free;

end;

procedure TfrmManifestacao.btConfirmaLancamentoCTEClick(Sender: TObject);
begin
  inherited;
  if verificaRegistroEhCTE then
  begin
    if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma lançamento do CT-e ?') = teSim) then
    begin
      LancarCTE(dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value);
      pnOpcoesGrid.Visible := false;
      btPesquisar.Click;
    end;
  end;

end;

procedure TfrmManifestacao.btConsultarSefazClick(Sender: TObject);
begin
  inherited;
  pnAguarde.Visible := true;
  pgDadosConsulta.Show;
end;

procedure TfrmManifestacao.btDesistirLancamentoCTEClick(Sender: TObject);
begin
  inherited;
  pnOpcoesGrid.Visible := false;
end;

procedure TfrmManifestacao.btImprimirInventarioClick(Sender: TObject);
var
  LMinutos: integer;
  LHoraUltimaConsulta: TDateTime;
begin
  inherited;
  try

    if dm.tb_parametrosULTIMA_CONSULTA_DFE.value = null then
      LHoraUltimaConsulta := IncHour(now, -4)
    else
      LHoraUltimaConsulta := dm.tb_parametrosULTIMA_CONSULTA_DFE.value;

    LMinutos := MinutesBetween(now, LHoraUltimaConsulta);

    if (LMinutos >= 70) then
    begin

      cxGrid1.Visible := false;
      if ckbConsultarNFE.Checked then
      begin
        pgConsultando.show;
        ConsultaNotasFiscaisDFE();
      end;

      if ckbConsultarCTES.Checked then
      begin
        pgConsultando.Show;
        ConsultaCTEDFE;
      end;

      cxGrid1.Visible := true;
    end
    else
    begin
      showRealDialog(frm_principal, tmaviso, 'Aviso', 'A consulta foi realizada há menos de uma hora.' + sLineBreak + 'Tente novamente em  ' + Inttostr(70 - LMinutos) + ' minuto(s)', 16, false);
    end;

  finally
    pnAguarde.Visible := false;
    btPesquisar.Click;
  end;
end;

procedure TfrmManifestacao.btPequisaInventariosClick(Sender: TObject);
begin
  inherited;
  pnFiltros.Visible := false;
  btPesquisar.Click;
end;

procedure TfrmManifestacao.btPesquisarClick(Sender: TObject);
begin
  inherited;

  if edAte.Date < edDe.Date then
  begin
    showmessage('Período Inválido');
    edDe.SetFocus;
  end;

  consultaNotasFiscais(false);
end;

procedure TfrmManifestacao.C1Click(Sender: TObject);
var
  LTipoDoc: integer;
  LChaveDoc: string;
begin
  inherited;
  LTipoDoc := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('tipo_doc').Value;
  LChaveDoc := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value;
  exportarXML(False, LTipoDoc, LChaveDoc);
end;

procedure TfrmManifestacao.visualizarDocumento(ATipoDocumento: integer; AChaveDocumento: string);
begin
  try

    try
      if carregarXMLDcocumento(ATipoDocumento, AChaveDocumento) then
      begin
        case ATipoDocumento of
          1:
            dm.ACBrNFe1.NotasFiscais.Imprimir;
          2:
            dm.acbrCTE.Conhecimentos.Imprimir;
        end;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao visualizar o documento ' + sLineBreak + sLineBreak + 'Erro: ' + E.Message, 'Ok');
      end;

    end;

  finally

  end;

end;

function TfrmManifestacao.carregarXMLDcocumento(ATipoDocumento: integer; AChaveDocumento: string): Boolean;
var
  LXMLDocumento: string;
begin
  Result := false;
  try
    try
      if (dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('xml_baixado').Value <> 1) then
      begin
        dm.exibe_painel_erro('NFE não possui XML baixado', 'Ok');
        Result := false;
        exit;
      end;

      LXMLDocumento := dm.getXMLNFEDestinada(AChaveDocumento);

      case ATipoDocumento of
        1:
          begin
            dm.parametrizaAcbrNFE(moNFe, true, false);

            dm.ACBrNFe1.NotasFiscais.Clear;
            dm.ACBrNFe1.NotasFiscais.LoadFromString(LXMLDocumento, false);

          end;
        2:
          begin

            dm.acbrCTE.conhecimentos.Clear;
            dm.acbrCTE.conhecimentos.LoadFromString(LXMLDocumento, false);
          end;
      end;

      Result := true;

    except
      on E: exception do
      begin
        dm.exibe_painel_erro('Erro ao carregar documento no ACBR!', 'Ok');
      end;

    end;

  finally

  end;
end;

procedure TfrmManifestacao.cbAnoSelect(Sender: TObject);
begin
  inherited;
  configuraDataSelecaoPorMes(cbMes, cbAno, edDe, edAte);
end;

procedure TfrmManifestacao.cbMesSelect(Sender: TObject);
begin
  inherited;
  configuraDataSelecaoPorMes(cbMes, cbAno, edDe, edAte);
end;

procedure TfrmManifestacao.S1Click(Sender: TObject);
var
  LTipoDoc: integer;
  LChaveDoc: string;
begin
  inherited;
  LTipoDoc := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('tipo_doc').Value;
  LChaveDoc := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value;
  exportarXML(true, LTipoDoc, LChaveDoc);

end;

procedure TfrmManifestacao.S2Click(Sender: TObject);
begin
  inherited;
  SelecaoDeNotas(True);
end;

procedure TfrmManifestacao.SalvarDocumento(ATipoDocumento: integer; AlocalArquivo: string);
begin
  try
    try
      case ATipoDocumento of
        1:
          dm.ACBrNFe1.NotasFiscais.GravarXML(AlocalArquivo);
        2:
          dm.acbrCTE.conhecimentos.GravarXML(AlocalArquivo);
      end;

      dm.exibe_painel_erro('Documento salvo com sucesso em ' + AlocalArquivo, 'Ok');

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao gravar documento ' + E.Message, 'Ok');

      end;

    end;
  finally

  end;
end;

procedure TfrmManifestacao.exportarXML(ASalvarEmDisco: Boolean; ATipoDocumento: integer; AChaveDoc: string);
var
  LnomeArquivo: string;
begin

  try
    try
      if carregarXMLDcocumento(ATipoDocumento, AChaveDoc) then
      begin
        LnomeArquivo := AChaveDoc + '.xml';
        case ATipoDocumento of
          1:
            LnomeArquivo := 'NFE_' + LnomeArquivo;
          2:
            LnomeArquivo := 'CTE_' + LnomeArquivo;
        end;

        if ASalvarEmDisco then
        begin
          dm.folderDialog.Execute;
          SalvarDocumento(ATipoDocumento, dm.folderDialog.Directory + '\' + LnomeArquivo);
        end
        else
        begin

          Clipboard.AsText := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('xml').Value;

          dm.exibe_painel_erro('Conteúdo do XML copiado para a área de transferência!', 'Ok');
        end;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro exportar documento ' + sLineBreak + sLineBreak + 'Erro: ' + E.Message, 'Ok');
      end;

    end;

  finally

  end;

end;

procedure TfrmManifestacao.menuManifestacaoClick(Sender: TObject);
begin
  inherited;
  abrirOpcoesDeManifestacao();
end;

procedure TfrmManifestacao.abrirOpcoesDeManifestacao;
begin
  pnOpcoesGrid.Visible := True;
  pgOpcoesManifestacao.Show;
end;

procedure TfrmManifestacao.abrirOpcoesLancamentoCTE;
begin
  pnOpcoesGrid.Visible := True;
  rdTipoFrete.ItemIndex := 2;
  pgLancamentoFrete.Show;
end;

function TfrmManifestacao.verificaRegistroEhCTE(): Boolean;
begin
  Result := true;

  if dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('tipo_doc').Value <> 2 then
  begin
    exibe_painel_erro('O documento selecionado não é um CT-e', 'Ok');
    Result := False;
  end;

end;

procedure TfrmManifestacao.LancarCTE(AChaveCTE: string);
var
  LSQL: TStringList;
  LTbAux: TFDMemTable;
begin
  LTbAux := TFDMemTable.Create(Self);
  LSQL := TstringList.create;

  try
    try
      LSQL.add(' insert into notas_transporte                                                                                                              ');
      LSQL.add('   (CODIGO, COD_FORNECEDOR, NUMERO_NOTA, SERIE,                                                                                 ');
      LSQL.add('    SITUACAO, DATA_EMISSAO, DATA_SERVICO, DATA_LANCAMENTO,                                                                                 ');
      LSQL.add('    MODELO_NOTA, CFOP, CST_ICMS,                                                                                         ');
      LSQL.add('    VALOR_SERVICO, DESCONTO, BASE_ICMS, REDUCAO_BASE_ICMS,                                                                                 ');
      LSQL.add('    ALIQ_ICMS, VALOR_ICMS, VALOR_NAO_TRIBUTADO, VALOR_DOC,                                                                                 ');
      LSQL.add('    TIPO_CTE, ID_FRETE, CHAVE_CTE, TIPODOC, MUNICIPIO_REMETENTE)                                                                           ');
      LSQL.add('    select                                                                                                                                 ');
      LSQL.add('       udf_strzero( gen_id(g_notas_transporte,1),6) ,f.cod_fornecedor,udf_strzero(cast(nf.numero_nota as integer),9),nf.serie_nota,' + Quotedstr('00') + ',');
      LSQL.add('           nf.data_emissao,nf.data_emissao,current_date,' + Quotedstr('57') + ',');
      LSQL.add(QUotedstr('2353') + ',' + Quotedstr('000') + ',nf.valor_nota,0,0,0,0,0,0,nf.valor_nota,');
      LSQL.add('           nf.tipo_cte,' + Inttostr(rdTipoFrete.ItemIndex) + ',nf.chave_nfe,1,nf.municipio_origem_cte                                                                            ');
      LSQL.add('     from nfe_destinadas nf                                                                                                                ');
      LSQL.add('      inner join fornecedor f on (f.cgc_cpf = nf.cnpj)                                                                                     ');
      LSQL.add('       where nf.chave_nfe=' + QuotedStr(AChaveCTE));
      LSQL.add('     and nf.tipo_doc=2                                                                                                                           ');
      dm.executaSQL(LSQL.Text);

      LSQL.Clear;
      LSQL.Add('update nfe_destinadas set lancada=1 where chave_nfe=' + Quotedstr(AChaveCTE));
      dm.executaSQL(LSQL.Text);

      dm.exibe_painel_erro('Lancamento efetuado com sucesso!', 'Ok');

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao lançar CTE ' + sLineBreak + sLineBreak + E.Message, 'Ok');
        raise Exception.Create('Erro ao lançar CTE');
      end;
    end;
  finally
    FreeAndNil(LSQL);
    LTbAux.Active := false;
    FreeAndNil(LTbAux);
  end;
end;

procedure TfrmManifestacao.processaItensNota(xml_nota: string; AListaSQL: TList<string>);
var
  qtdItensNota: integer;
  itemAtual: integer;
  cnpjFornecedor: string;
  codProdutoFornecedor: string;
  cstFornecedor: string;
  LSQL: TStringList;
begin
  LSQL := TStringList.Create;

  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromString(xml_nota, False);

  try
    try
      qtdItensNota := dm.ACBrNFe1.NotasFiscais[0].NFe.Det.Count;
      itemAtual := 0;
      cnpjFornecedor := dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF;

      for itemAtual := 0 to qtdItensNota - 1 do
      begin
        codProdutoFornecedor := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.cProd;

        case dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Imposto.ICMS.CST of
          cst00:
            cstFornecedor := '00';
          cst10:
            cstFornecedor := '10';
          cst20:
            cstFornecedor := '20';
          cst30:
            cstFornecedor := '30';
          cst40:
            cstFornecedor := '40';
          cst41:
            cstFornecedor := '41';
          cst45:
            cstFornecedor := '45';
          cst50:
            cstFornecedor := '50';
          cst51:
            cstFornecedor := '51';
          cst60:
            cstFornecedor := '60';
          cst70:
            cstFornecedor := '70';
          cst80:
            cstFornecedor := '80';
          cst81:
            cstFornecedor := '81';
          cst90:
            cstFornecedor := '90';
          cstVazio:
            cstFornecedor := '00';
        else
          cstFornecedor := '00';
        end;

        case dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Imposto.ICMS.orig of
          oeNacional:
            cstFornecedor := '0' + cstFornecedor;
          oeEstrangeiraImportacaoDireta:
            cstFornecedor := '1' + cstFornecedor;
          oeEstrangeiraAdquiridaBrasil:
            cstFornecedor := '2' + cstFornecedor;
          oeNacionalConteudoImportacaoSuperior40:
            cstFornecedor := '3' + cstFornecedor;
          oeNacionalProcessosBasicos:
            cstFornecedor := '4' + cstFornecedor;
          oeNacionalConteudoImportacaoInferiorIgual40:
            cstFornecedor := '5' + cstFornecedor;
          oeEstrangeiraImportacaoDiretaSemSimilar:
            cstFornecedor := '6' + cstFornecedor;
          oeEstrangeiraAdquiridaBrasilSemSimilar:
            cstFornecedor := '7' + cstFornecedor;
          oeNacionalConteudoImportacaoSuperior70:
            cstFornecedor := '8' + cstFornecedor;
        end;

        LSQL.clear;
        LSQL.add('update or insert into compara_produtos_nfe (cnpj_fornecedor,cod_prod_fornecedor');
        LSQL.add(',descricao_fornecedor,unidade_comercializada,  cfop_fornecedor,cst_fornecedor, ncm,ultima_chave) values (');
        LSQL.add('' + Quotedstr(cnpjFornecedor) + ',');
        LSQL.add('' + Quotedstr(codProdutoFornecedor) + ',');
        LSQL.add('' + Quotedstr(AnsiUpperCase(dm.AcbrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.xProd)) + ',');
        LSQL.add('' + Quotedstr(AnsiUpperCase(dm.AcbrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.uTrib)) + ',');
        LSQL.add('' + Quotedstr(dm.AcbrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.CFOP) + ',');
        LSQL.add('' + Quotedstr(cstFornecedor) + ',');
        LSQL.add('' + Quotedstr(dm.AcbrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.NCM) + ',');
        LSQL.add('' + Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe) + ') matching (cnpj_fornecedor,cod_prod_fornecedor);');
        AListaSQL.Add(LSQL.Text);

      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao processar  o produto ' + dm.AcbrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.xProd + sLineBreak + sLineBreak + 'Nota fiscal ' + dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe + sLineBreak + sLineBreak + E.Message, 'Ok');
      end;

    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmManifestacao.ConsultaNotasFiscaisDFE();
var
  docAtual: integer;
  qtdeDocumentosRetornados: Integer;
  DFe: TdocZipCollectionItem;
  cUFAutor, ultNSU, ANSU: string;
  achouDocumentos: boolean;
  incluirEvento: boolean;
  tipoEvento: integer;
  LXMLNotaCarregada: string;
  tentativasConsulta: integer;
  consultouComSucesso: boolean;
  LListaSQL: TList<string>;
  LInsertTemp: TStringList;
  inicio: TDateTime;
  LSplittedXML: TStringList;
  I: Integer;
  LChaveDocumento: string;
  LAchouDocumentosGeral: boolean;
  LQtdDocumentosGeral: integer;
begin
  inherited;

  pnAguarde.Visible := true;
  dm.tb_parametros.Active := false;
  dm.tb_parametros.Active := true;
  LListaSQL := TList<string>.Create;
  LInsertTemp := TStringList.Create;
  LSplittedXML := TStringList.Create;

  LListaSQL.Clear;
  LInsertTemp.Clear;
  LQtdDocumentosGeral := 0;

  try
    LListaArquivosXML.Clear;
    inicio := now;
    cUFAutor := '29';
    ultNSU := dm.tb_parametrosULT_NSU_NFE_DEST.Value;
    LAchouDocumentosGeral := False;

    if ultNSU = '0' then
      ultNSU := '';

    ANSU := '';
    achouDocumentos := true;

    while achouDocumentos do
    begin

      tentativasConsulta := 0;
      consultouComSucesso := true;
      qtdeDocumentosRetornados := 0;
      while (consultouComSucesso = true) do
      begin

        Application.ProcessMessages;
        lbTempoDecorrido.caption := Inttostr(SecondsBetween(inicio, Now)) + ' Segundos';
        try

          try
            dm.ACBrNFe1.Configuracoes.WebServices.TimeOut := 10000;
            dm.ACBrNFe1.DistribuicaoDFePorUltNSU(StrToInt(cUFAutor), CNPJ, ultNSU);
//          dm.ACBrNFe1.DistribuicaoDFe(StrToInt(cUFAutor), CNPJ, ultNSU, ANSU);
            qtdeDocumentosRetornados := dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count;
            dm.adicionalog('Retornou ' + Inttostr(qtdeDocumentosRetornados));
          except
            on E: Exception do
            begin
              dm.adicionalog('Erro ao consultar DFE' + e.Message);
              qtdeDocumentosRetornados := 0;
              tentativasConsulta := tentativasConsulta + 1;
              dm.adicionalog('Tentativa nº ' + IntToStr(tentativasConsulta) + ' de DFE');
              sleep(800);
            end;
          end;

        finally
          case dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat of
            137:
              consultouComSucesso := false;
            656:
              consultouComSucesso := false;
          else
            consultouComSucesso := true;
          end;

          if consultouComSucesso then
            LAchouDocumentosGeral := true;

          memoRestornoConsulta.Lines.Text := dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo;

        end;

        prog.Position := 0;

        if qtdeDocumentosRetornados > 0 then
        begin
          LQtdDocumentosGeral := LQtdDocumentosGeral + qtdeDocumentosRetornados;
          achouDocumentos := true;
          ultNSU := dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU;
          lbUltNsuNFE.Caption := ultNSU;
          lbNsuNfeAtual.Caption := ultNSU;
          lbTempoDecorrido.caption := Inttostr(SecondsBetween(inicio, Now)) + ' Segundos';
          pgConsultando.Repaint;

          docAtual := 0;
          prog.Max := qtdeDocumentosRetornados;
          for docAtual := 0 to qtdeDocumentosRetornados - 1 do
          begin
            Application.ProcessMessages;
            DFe := DM.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual];
            case DFe.schema of
              schprocNFe:
                ;  // NFe completa
              schresNFe:
                ;  // NFe resumo


              schresEvento:
                begin

                ////dm.adicionalog('Evento pego em schresEvento');
                ////dm.adicionalog(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual].XML)
                end; // Evento completo

              schprocEventoNFe:
                begin
                  registraEventoNFEDestinada(LListaSQL, dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual].procEvento.chDFe, dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual].procEvento.tpEvento, dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual].procEvento.detEvento.xJust, dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual].procEvento.dhEvento);

                ////dm.adicionalog('Evento pego em schprocEventoNFe ');
                ////dm.adicionalog(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual].XML)
                end; // Evento completo
            end;

            if (trim(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.chDFe) <> '') then
            begin

              if ((DFe.schema = schprocNFe) or (DFe.schema = schresNFe)) then
              begin
                if (DFe.schema = schresNFe) then
                begin
                  LInsertTemp.clear;
                  LInsertTemp.add('update or insert into NFE_DESTINADAS (tipo_doc,chave_nfe,cnpj,ie,nome_fornecedor,data_emissao,numero_nota,status_nfe,tipo_manifestacao,valor_nota,cod_empresa) values (1,');
                  LInsertTemp.add('' + Quotedstr(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.chDFe) + ',');
                  LInsertTemp.add('' + Quotedstr(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.CNPJCPF) + ',');
                  LInsertTemp.add('' + Quotedstr(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.IE) + ',');
                  LInsertTemp.add('' + Quotedstr(UpperCase(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.xNome)) + ',');
                  LInsertTemp.add('' + Quotedstr(FormatDateTime('DD.MM.YY', dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.dhEmi)) + ',');
                  LInsertTemp.add('' + Quotedstr(FormatFloat('000000000000000', StrToFloat(copy(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.chDFe, 26, 9)))) + ',');
                  LInsertTemp.add('' + Quotedstr('0') + ',');
                  LInsertTemp.add(Inttostr(0) + ',');
                  LInsertTemp.add('' + dm.TrocaVirgPPto(FloatToStr(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.vNF)) + ',' + Quotedstr(codEmpresa) + ') matching(chave_nfe);');
                  LListaSQL.Add(LInsertTemp.Text);

                end
                else
                begin
                  LXMLNotaCarregada := '';
                  LXMLNotaCarregada := dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].XML;
                  ImportarXMLNFEntrada(LXMLNotaCarregada, LListaSQL);
                end;

              end
              else
              begin
              end;
            end;

            prog.Position := prog.Position + 1;
          end;

        end
        else
        begin
          achouDocumentos := false;
        end;
      end;

      dm.tb_parametros.edit;
      dm.tb_parametrosULTIMA_CONSULTA_DFE.Value := now;
      dm.tb_parametros.Post;
    end;

  finally
    btFecharConsulta.Visible := true;
    dm.ExecutaBlocoDeInstrucoes(LListaSQL, 25);
    GravarArquivosXML;

    ProcessarNotas();
    dm.transacao.Active := true;
    dm.tb_parametros.Active := true;
    dm.tb_parametros.edit;
    if trim(ultNSU) = '' then
      ultNSU := '0';
    dm.tb_parametrosULT_NSU_NFE_DEST.Value := ultNSU;
    dm.tb_parametros.Post;
    dm.transacao.Commit;

    FreeAndNil(LListaSQL);
    FreeAndNil(LInsertTemp);

    if (LAchouDocumentosGeral = false) then
      memoRestornoConsulta.Lines.Text := 'Nenhum documento foi retornado.'
    else
      memoRestornoConsulta.Lines.Text := Inttostr(LQtdDocumentosGeral) + ' documento(s) foram retornado(s)';
    dm.exibe_painel_erro('Consulta concluída em ' + Inttostr(SecondsBetween(inicio, Now)) + ' Segundos!', 'Ok');
  end;
end;

procedure TfrmManifestacao.GravarArquivosXML();
var
  I: Integer;
begin
  if LListaArquivosXML.Count > 0 then
  begin
    for I := 0 to LListaArquivosXML.Count - 1 do
    begin
      dm.GravarXMLGrandeNotasDestinadas(LListaArquivosXML[I].chave, LListaArquivosXML[I].Xml);
    end;
  end;

end;

procedure TfrmManifestacao.ImportarXMLNFEntrada(AXMLNota: string; AListaSQL: TList<string>);
var
  I: integer;
  LInsertTemp: TStringlist;
  LChaveDocumento: string;
  LXMLNota: string;
  LItemXML: TTextosXML;
begin

  LInsertTemp := TStringList.Create;

  try
    dm.ACBrNFe1.NotasFiscais.Clear;
    dm.ACBrNFe1.NotasFiscais.LoadFromString(AXMLNota, false);

    if dm.ACBrNFe1.NotasFiscais.Count > 0 then
    begin

      if dm.ACBrNFe1.NotasFiscais[0].NFe.Dest.CNPJCPF = cnpj then
      begin
        LChaveDocumento := copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID, 4, 60);
        LItemXML.Chave := LChaveDocumento;
        LItemXML.Xml := AXMLNota;
        LListaArquivosXML.Add(LItemXML);

        LInsertTemp.clear;
        LInsertTemp.add('update or insert into NFE_DESTINADAS (tipo_doc,chave_nfe,cnpj,ie,nome_fornecedor,serie_nota,data_emissao,numero_nota,status_nfe,valor_nota,cod_empresa) values (1,');
        LInsertTemp.add('' + Quotedstr(LChaveDocumento) + ',');
        LInsertTemp.add('' + Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF) + ',');
        LInsertTemp.add('' + Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.IE) + ',');
        LInsertTemp.add('' + Quotedstr(UpperCase(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.xNome)) + ',');
        LInsertTemp.add('' + Inttostr((dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie)) + ',');
        LInsertTemp.add('' + Quotedstr(FormatDateTime('DD.MM.YY', dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi)) + ',');
        LInsertTemp.add('' + Quotedstr(FormatFloat('000000000000000', dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF)) + ',');
        LInsertTemp.add('' + Quotedstr('0') + ',');
        LInsertTemp.add('' + dm.TrocaVirgPPto(FloatToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF)) + ',');
        LInsertTemp.add('' + QuotedStr(codEmpresa) + ') matching (chave_nfe); ');
        AListaSQL.Add(LInsertTemp.Text);

      end;
    end
    else
    begin
      raise Exception.Create('O XML não foi carregado corretamente!');
    end;
  finally

    FreeAndNil(LInsertTemp);
  end;
end;

procedure TfrmManifestacao.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
    dm.ConexaoRest := True
  else
    dm.ConexaoRest := false;
end;

procedure TfrmManifestacao.ConsultaCTEDFE();
var
  docAtual: integer;
  qtdeDocumentosRetornados: Integer;
  DFe: TdocZipCollectionItem;
  cUFAutor, ultNSU, ANSU: string;
  achouDocumentos: boolean;
  incluirEvento: boolean;
  tipoEvento: integer;
  tentativasConsulta: integer;
  consultouComSucesso: boolean;
  LListaSQL: TList<string>;
  LInsertTemp: TStringList;
begin
  inherited;

  LListaSQL := TList<string>.Create;
  LInsertTemp := TStringList.Create;

  pnAguarde.Visible := true;
  dm.tb_parametros.Active := false;
  dm.tb_parametros.Active := true;
  cUFAutor := '29';
  ultNSU := dm.tb_parametrosULT_NSU_CTE.Value;
  if trim(ultNSU) = '0' then
    ultNSU := '';

  ANSU := '';
  achouDocumentos := true;
  try

    while achouDocumentos do
    begin
      tentativasConsulta := 0;
      consultouComSucesso := false;
      qtdeDocumentosRetornados := 0;
      while ((tentativasConsulta <= 10) and (consultouComSucesso = false)) do
      begin

        Application.ProcessMessages;

        try
          dm.acbrCTE.Configuracoes.WebServices.TimeOut := 10000;
          dm.acbrCTE.DistribuicaoDFePorUltNSU(StrToInt(cUFAutor), CNPJ, ultNSU);
          qtdeDocumentosRetornados := dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count;
          ////dm.adicionalog('Retornou ' + Inttostr(qtdeDocumentosRetornados));
          consultouComSucesso := true;
        except
          on E: Exception do
          begin
            ////dm.adicionalog('Erro ao consultar DFE' + e.Message);
            qtdeDocumentosRetornados := 0;
            tentativasConsulta := tentativasConsulta + 1;
            ////dm.adicionalog('Tentativa nº ' + IntToStr(tentativasConsulta) + ' de DFE');
            sleep(800);
          end;
        end;

      end;

      if (tentativasConsulta >= 10) and (consultouComSucesso = false) then
      begin
        pnAguarde.Visible := false;
        dm.exibe_painel_erro('Foram feitas 10 tentativas de consulta sem sucesso ao webservice de distribuição.' + #13 + 'É possível que a rede da SEFAZ esteja congestionada ou a sua conexão com a internet esteja ruim. Aguarde alguns minutos e tente novamente.' + #13 + #13 + ' Se o erro persistir, entre em contato com a Real Softwares', 'Ok');
        exit;

      end;

      prog.Position := 0;

      if qtdeDocumentosRetornados > 0 then
      begin
        prog.Max := qtdeDocumentosRetornados;
        achouDocumentos := true;
        ultNSU := dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU;
        lbUltNsuCTE.Caption := Inttostr(StrToInt(dm.tb_parametrosULT_NSU_CTE.Value));
        lbNsucteAtual.Caption := Inttostr(StrToInt(dm.tb_parametrosULT_NSU_CTE.Value));

        ////dm.adicionalog('Ultimo NSU: ' + ultNSU);

        docAtual := 0;

        for docAtual := 0 to qtdeDocumentosRetornados - 1 do
        begin
          Application.ProcessMessages;
          DFe := DM.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual];
          case DFe.schema of
            schprocCTe:
              ;  // NFe completa
            schresCTe:
              ;  // NFe resumo


            schresEvento:
              begin

                ////dm.adicionalog('Evento pego em schresEvento');
                ////dm.adicionalog(dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual].XML)
              end; // Evento completo

            schprocEventoNFe:
              begin
                registraEventoNFEDestinada(LListaSQL, dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual].procEvento.chDFe, dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual].procEvento.tpEvento, dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual].procEvento.detEvento.xJust, dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual].procEvento.dhEvento);

                ////dm.adicionalog('Evento pego em schprocEventoNFe ');
                ////dm.adicionalog(dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual].XML)
              end; // Evento completo
          end;

          if (trim(dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.chDFe) <> '') then
          begin

            if ((DFe.schema = schprocCTe) or (DFe.schema = schresCTe)) then
            begin
              if (DFe.schema = schresNFe) then
              begin
                LInsertTemp.Clear;
                LInsertTemp.add('update or insert into NFE_DESTINADAS (tipo_doc,chave_nfe,cnpj,ie,nome_fornecedor,data_emissao,numero_nota,status_nfe,tipo_manifestacao,valor_nota,cod_empresa) values (2,');
                LInsertTemp.add('' + Quotedstr(dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.chDFe) + ',');
                LInsertTemp.add('' + Quotedstr(dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.CNPJCPF) + ',');
                LInsertTemp.add('' + Quotedstr(dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.IE) + ',');
                LInsertTemp.add('' + Quotedstr(UpperCase(dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.xNome)) + ',');
                LInsertTemp.add('' + Quotedstr(FormatDateTime('DD.MM.YY', dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.dhEmi)) + ',');
                LInsertTemp.add('' + Quotedstr(FormatFloat('000000000000000', StrToFloat(copy(dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.chDFe, 26, 9)))) + ',');
                LInsertTemp.add('' + Quotedstr('0') + ',');
                LInsertTemp.add(Inttostr(0) + ',');
                LInsertTemp.add('' + dm.TrocaVirgPPto(FloatToStr(dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.vNF)) + ',' + QuotedStr(codEmpresa) + ') matching(chave_nfe);');
                LListaSQL.Add(LInsertTemp.Text);
              end
              else
              begin

                dm.acbrcte.conhecimentos.Clear;
                LXMLNotaCarregada := '';

                LXMLNotaCarregada := dm.acbrcte.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].XML;
                try
                  dm.acbrcte.Conhecimentos.LoadFromString(LXMLNotaCarregada, false);
                except
                end;
                if dm.acbrcte.Conhecimentos.Count > 0 then
                begin
                  if dm.acbrcte.Conhecimentos[0].CTe.Dest.CNPJCPF = cnpj then
                  begin
                    LInsertTemp.Clear;
                    LInsertTemp.add('update or insert into NFE_DESTINADAS (tipo_doc,chave_nfe,cnpj,ie,nome_fornecedor,data_emissao,numero_nota,status_nfe,tipo_manifestacao,valor_nota,xml_nota,serie_nota,tipo_cte,MUNICIPIO_ORIGEM_CTE,cod_empresa) values (2,');
                    LInsertTemp.add('' + Quotedstr(copy(dm.acbrcte.conhecimentos[0].cte.infcte.ID, 4, 60)) + ',');
                    LInsertTemp.add('' + Quotedstr(dm.acbrcte.conhecimentos[0].cte.Emit.CNPJ) + ',');
                    LInsertTemp.add('' + Quotedstr(dm.acbrcte.conhecimentos[0].cte.Emit.IE) + ',');
                    LInsertTemp.add('' + Quotedstr(UpperCase(dm.acbrcte.conhecimentos[0].cte.Emit.xNome)) + ',');
                    LInsertTemp.add('' + Quotedstr(FormatDateTime('DD.MM.YY', dm.acbrcte.conhecimentos[0].cte.Ide.dhEmi)) + ',');
                    LInsertTemp.add('' + Quotedstr(FormatFloat('000000000000000', dm.acbrcte.conhecimentos[0].cte.Ide.nCT)) + ',');
                    LInsertTemp.add('' + Quotedstr('0') + ',');
                    LInsertTemp.add(Inttostr(1) + ',');
                    LInsertTemp.add('' + dm.TrocaVirgPPto(FloatToStr(dm.acbrcte.conhecimentos[0].cte.vPrest.vTPrest)) + ',');
                    LInsertTemp.add('' + Quotedstr(LXMLNotaCarregada) + ',');
                    LInsertTemp.add(Inttostr(dm.acbrcte.conhecimentos[0].cte.Ide.serie) + ',');
                    LInsertTemp.add(tpCTToStr(dm.acbrcte.conhecimentos[0].cte.Ide.tpCTe) + ',');
                    LInsertTemp.add(Inttostr(dm.acbrcte.conhecimentos[0].cte.Ide.cMunEnv) + ',' + Quotedstr(codEmpresa) + ')  matching(chave_nfe);');
                    LListaSQL.Add(LInsertTemp.Text);
                  end;
                end;

              end;

            end
            else
            begin

            end;

          end;

        end;
        prog.Position := prog.Position + 1;
      end
      else
      begin
        achouDocumentos := false;
      end;

    end;

    dm.ExecutaBlocoDeInstrucoes(LListaSQL, 25);
    ProcessarNotas;

  finally
    pnAguarde.Visible := false;
    FreeAndNil(LListaSQL);
    FreeAndNil(LInsertTemp);
    dm.transacao.Active := true;
    dm.tb_parametros.Active := true;
    dm.tb_parametros.edit;
    dm.tb_parametrosULT_NSU_CTE.Value := ultNSU;
    dm.tb_parametros.Post;
    dm.transacao.Commit;
  end;

end;

procedure TfrmManifestacao.ProcessarNotas();
var
  tbNaoProcessadas: TFDMemTable;
  LSQL: TStrings;
  TDProcessandoXML: TThread;
  LListaSQL: TList<string>;
begin

  LSQL := TStringList.Create;
  tbNaoProcessadas := TFDMemTable.Create(self);
  LListaSQL := TList<string>.Create;

  try

    LSQL.Add('select CGC_CPF from fornecedor');
    dm.getMemTable(TBFornecedores, LSQL.Text);

    LSQL.Clear;
    LSQL.Add('   select nf.chave_nfe,coalesce(nf.tipo_doc,1) as tipo_doc, nf.xml_nota');
    LSQL.Add('   from nfe_destinadas nf where  nf.xml_nota <> ' + Quotedstr(''));
    LSQL.Add('       and nf.processada=0 ');
    dm.getMemTable(tbNaoProcessadas, LSQL.Text);

    if (tbNaoProcessadas.IsEmpty = false) then
    begin

      tbNaoProcessadas.Active := true;
      tbNaoProcessadas.First;

      try
        try
          while not tbNaoProcessadas.Eof do
          begin
            case tbNaoProcessadas.FieldByName('tipo_doc').Value of
              1:
                begin
                  processaFornecedorNota(TBFornecedores, tbNaoProcessadas.FieldByName('xml_nota').value, LListaSQL);
                  processaItensNota(tbNaoProcessadas.FieldByName('xml_nota').value, LListaSQL);
                end;

              2:
                begin
                  processaFornecedorCTE(TBFornecedores, tbNaoProcessadas.FieldByName('xml_nota').value, LListaSQL);
                end;
            end;

            LListaSQL.Add('update nfe_destinadas nf set nf.processada=1 where chave_nfe=' + Quotedstr(tbNaoProcessadas.fieldbyname('chave_nfe').Value) + ';');
            progProcessando.Position := progProcessando.Position + 1;
            lbNotaAtual.Caption := 'Nota ' + progProcessando.Position.ToString + ' / ' + tbNaoProcessadas.RecordCount.ToString;
            Application.ProcessMessages;
            tbNaoProcessadas.Next;
          end;

          dm.ExecutaBlocoDeInstrucoes(LListaSQL, 150);

        except
          on E: Exception do
          begin
            dm.exibe_painel_erro('Erro ao processar a nota ' + tbNaoProcessadas.fieldbyname('chave_nfe').Value + sLineBreak + 'Erro: ' + E.Message, 'Ok');
          end;

        end;

      finally

      end;

    end;
  finally
    FreeAndNil(LSQL);
    tbNaoProcessadas.Active := false;
    FreeAndNil(tbNaoProcessadas);

    FreeAndNil(LListaSQL);

  end;
end;

procedure TfrmManifestacao.R1Click(Sender: TObject);
begin
  inherited;
  SelecaoDeNotas(false);
end;

procedure TfrmManifestacao.processaFornecedorNota(ATBFornecedores: TFDMemTable; xml_nota: string; AListaSQL: TList<string>);
var
  codFornecedor: string;
  LSQL: TStringList;
begin

  LSQL := TStringList.Create;
  LSQL.Clear;

  try
    try

      dm.ACBrNFe1.NotasFiscais.Clear;
      dm.ACBrNFe1.NotasFiscais.LoadFromString(xml_nota, False);
      if (ATBFornecedores.Locate('CGC_CPF', dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF, [loPartialKey]) = false) then
      begin

        LSQL.clear;
        LSQL.Add('update or insert into fornecedor (cod_fornecedor,razao_social,nome_fantasia,endereco,');
        LSQL.Add('bairro,cep,telefone,cod_cidade,CGC_CPF,inscricao_estadual,cod_estado ) values (');
        LSQL.Add('' + ' udf_strzero(gen_id(g_fornecedores_codigo,1),4),');
        LSQL.Add('' + Quotedstr(AnsiUpperCase(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.xNome)) + ',');
        LSQL.Add('' + Quotedstr(AnsiUpperCase(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.xFant)) + ',');
        LSQL.Add('' + Quotedstr(AnsiUpperCase(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.xLgr + ' ' + dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.xCpl + ' ' + dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.nro)) + ',');
        LSQL.Add('' + Quotedstr(AnsiUpperCase(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.xBairro)) + ',');
        LSQL.Add('' + Quotedstr(Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.CEP)) + ',');
        LSQL.Add('' + Quotedstr(dm.AcbrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.fone) + ',');
        LSQL.Add('' + Quotedstr(Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.cMun)) + ',');
        LSQL.Add('' + Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF) + ',');
        LSQL.Add('' + Quotedstr(dm.AcbrNFe1.NotasFiscais[0].NFe.Emit.IE) + ',');
        LSQL.Add('' + Quotedstr(getCodEstadoUF(dm.AcbrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.UF)) + ') matching(cod_fornecedor,CGC_CPF);');
        AListaSQL.Add(LSQL.Text);
        ATBFornecedores.Append;
        ATBFornecedores.Fields[0].Value := dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF;
        ATBFornecedores.Post;
      end;

    except
      on E: Exception do
      begin
        ////dm.adicionalog('Erro ao processar fornecedor' + sLineBreak + 'Erro: ' + E.Message + sLineBreak + sLineBreak + LSQL.Text);
        exibe_painel_erro('Erro ao processar fornecedor ' + dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.xNome, 'Ok');
      end;
    end;
  finally
    LSQL.Clear;
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmManifestacao.processaFornecedorCTE(ATBFornecedores: TFDMemTable; xml_nota: string; AListaSQL: TList<string>);
var
  codFornecedor: string;
  LSQL: TStringList;
begin

  LSQL := TStringList.Create;
  LSQL.Clear;

  try
    try
      dm.acbrcte.conhecimentos.Clear;
      dm.acbrcte.conhecimentos.LoadFromString(xml_nota, False);

      if (ATBFornecedores.Locate('CGC_CPF', dm.acbrcte.conhecimentos[0].cte.Emit.CNPJ, [loPartialKey]) = false) then
      begin

        codFornecedor := dm.geraCodigo('G_FORNECEDORES_CODIGO', 4);
        LSQL.clear;
        LSQL.Add('insert into fornecedor (cod_fornecedor,razao_social,nome_fantasia,endereco,');
        LSQL.Add('bairro,cep,telefone,cod_cidade,CGC_CPF,inscricao_estadual,cod_estado ) values (');
        LSQL.Add('' + Quotedstr(codFornecedor) + ',');
        LSQL.Add('' + Quotedstr(AnsiUpperCase(dm.acbrcte.conhecimentos[0].cte.Emit.xNome)) + ',');
        LSQL.Add('' + Quotedstr(AnsiUpperCase(dm.acbrcte.conhecimentos[0].cte.Emit.xFant)) + ',');
        LSQL.Add('' + Quotedstr(AnsiUpperCase(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.xLgr + ' ' + dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.xCpl + ' ' + dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.nro)) + ',');
        LSQL.Add('' + Quotedstr(AnsiUpperCase(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.xBairro)) + ',');
        LSQL.Add('' + Quotedstr(Inttostr(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.CEP)) + ',');
        LSQL.Add('' + Quotedstr(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.fone) + ',');
        LSQL.Add('' + Quotedstr(Inttostr(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.cMun)) + ',');
        LSQL.Add('' + Quotedstr(dm.acbrcte.conhecimentos[0].cte.Emit.CNPJ) + ',');
        LSQL.Add('' + Quotedstr(dm.acbrcte.conhecimentos[0].cte.Emit.IE) + ',');
        LSQL.Add('' + Quotedstr(getCodEstadoUF(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.UF)) + ');');

      end
      else
      begin
        LSQL.clear;
        LSQL.Add(' update fornecedor f set   ');
        LSQL.Add('f.razao_social=' + Quotedstr(AnsiUpperCase(dm.acbrcte.conhecimentos[0].cte.Emit.xNome)) + ',');
        LSQL.Add('f.nome_fantasia=' + Quotedstr(AnsiUpperCase(dm.acbrcte.conhecimentos[0].cte.Emit.xFant)) + ',');
        LSQL.Add('f.endereco=' + Quotedstr(AnsiUpperCase(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.xLgr)) + ',');
        LSQL.Add('f.complemento=' + Quotedstr(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.xCpl) + ',');
        LSQL.Add('f.num_endereco=' + Quotedstr(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.nro) + ',');
        LSQL.Add('f.bairro=' + Quotedstr(AnsiUpperCase(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.xBairro)) + ',');
        LSQL.Add('f.cep=' + Quotedstr(Inttostr(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.CEP)) + ',');
        LSQL.Add('f.telefone=' + Quotedstr(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.fone) + ',');
        LSQL.Add('f.cod_cidade=' + Quotedstr(Inttostr(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.cMun)) + ',');
        LSQL.Add('f.CGC_CPF=' + Quotedstr(dm.acbrcte.conhecimentos[0].cte.Emit.CNPJ) + ',');
        LSQL.Add('f.inscricao_estadual=' + Quotedstr(dm.acbrcte.conhecimentos[0].cte.Emit.IE) + ',');
        LSQL.Add('f.cod_estado=' + Quotedstr(getCodEstadoUF(dm.acbrcte.conhecimentos[0].cte.Emit.EnderEmit.UF)) + ' ');
        LSQL.Add(' where f.CGC_CPF=' + Quotedstr(dm.acbrcte.conhecimentos[0].cte.Emit.CNPJ) + ';');
      end;
      AListaSQL.Add(LSQL.Text);

    except
      on E: Exception do
      begin
        exibe_painel_erro('Erro ao processar fornecedor ' + dm.acbrcte.conhecimentos[0].cte.Emit.xNome, 'Ok');
      end;
    end;
  finally
    LSQL.Clear;
    FreeAndNil(LSQL);
  end;
end;

procedure TfrmManifestacao.rdMesAtualClick(Sender: TObject);
begin
  inherited;
  configuraOpcoesData((Sender as TRadioButton), edDe, edAte, cbMes, cbAno);

end;

procedure TfrmManifestacao.registraEventoNFEDestinada(AListaSQL: TList<string>; chave: string; evento: TpcnTpEvento; descricao: string; dataHora: TDateTime);
var
  tipoManifestacao: string;
  statusNota: string;
  LSQL: TStringList;
begin

  LSQL := TStringList.Create;
  statusNota := '1';

  try

//    case AnsiIndexStr(UpperCase(evento), ['210210', '210200','210220','210240','110111']) of
    case evento of

      teManifDestCiencia:
        begin
          tipoManifestacao := '3';
        end;

      teManifDestConfirmacao:
        begin
          tipoManifestacao := '1';
        end;

      teManifDestDesconhecimento:
        begin
          tipoManifestacao := '4';
        end;

      teManifDestOperNaoRealizada:
        begin
          tipoManifestacao := '2';
        end;

      teCancelamento:
        begin
          tipoManifestacao := '5';
          statusNota := '3';
        end;

    else
      begin
        // Ignorar evento
        tipoManifestacao := '0';
      end;

    end;

    if StrToInt(tipoManifestacao) > 0 then
    begin
      try
        LSQL.Clear;
        LSQL.Add('update nfe_destinadas nf set tipo_manifestacao=' + tipoManifestacao + ',');
        LSQL.Add('DATA_EVENTO_RECEBIDO=' + Quotedstr(FormatDateTime('DD.MM.YYY HH:MM:SS', dataHora)) + ',');
        LSQL.Add('descricao_evento=' + Quotedstr(descricao) + ',');
        LSQL.Add('status_nfe=' + Quotedstr(statusNota) + ' ');
        LSQL.Add(' where nf.chave_nfe=' + Quotedstr(chave) + ';');
        AListaSQL.Add(LSQL.Text);
      except
        on e: Exception do
        begin
          dm.exibe_painel_erro('Erro ao registrar evento da nota ' + chave, 'Ok');
        end;
      end;
    end;

  finally
    FreeAndNil(LSQL);
  end;

end;

procedure TfrmManifestacao.itCancelarEntradaClick(Sender: TObject);
var
  LChaveNFE: string;
  LCodigoEntrada: string;
begin
  inherited;

  if (dm.verificaPermissaoAcao('B40006007', true, true) = true) then
  begin
    if MessageDlg('Confirma cancelamento da entrada ?', mtConfirmation, [mbYes, mbno], 0) = mrYes then
    begin
      LChaveNFE := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value;
      LCodigoEntrada := dm.BuscaEntradaPorChaveNFE(LChaveNFE);
      try
        dm.executaSQL(' execute procedure CANCELAR_ENTRADA_POR_CODIGO(' + Quotedstr(LCodigoEntrada) + ',' + Quotedstr(codEmpresa) + ')');
        ShowRealDialog(frm_principal, tmSucesso, 'Sucesso', 'Entrada cancelada com sucesso!');
        btPesquisar.Click;
      except
        on E: Exception do
        begin
          showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao cancelar a entrada: ' + sLineBreak + sLineBreak + sLineBreak + e.Message, 22, false);
        end;

      end;
    end;
  end;

end;

procedure TfrmManifestacao.itLancarCTEClick(Sender: TObject);
begin
  inherited;
  abrirOpcoesLancamentoCTE;
end;

procedure TfrmManifestacao.carregaDadosLancamentoNFE();
var
  LChaveNFE: string;
  LXMLNFE: string;
begin
  LChaveNFE := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value;
  LXMLNFE := dm.getXMLNFEDestinada(LChaveNFE);

  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromString(LXMLNFE, false);

  lbRazaoSocialFornecedor.Caption := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('nome_fornecedor').Value;
  lbNumeroNotaFiscal.Caption := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('numero_nota').AsString;
  lbChaveNotaFiscal.Caption := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value;
  lbSerieNotaFiscal.Caption := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('serie_nota').Value;
  lbDataEmissaoNFE.Caption := FormatDateTime('DD/MM/YYY', dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('data_emissao').Value);
//  edDataEmissaoNFE.Date := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('data_emissao').Value;
  edDataEntradaNFE.Date := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dSaiEnt;
  pgLancamentoNota.Show;

end;

procedure TfrmManifestacao.itLancarNotasEntradaClick(Sender: TObject);
begin
//  carregaDadosLancamentoNFE();
  abrirLancamentoDeNFE;
end;

procedure TfrmManifestacao.abrirLancamentoDeNFE;
var
  LChaveDocumento: string;
  recno: integer;
  produtosNaoAssociados: string;
  itemAtual: Integer;
begin
  inherited;

  if (dm.verificaPermissaoAcao('B40006008', true, true) = false) then
    Exit;

  recno := dmManifestacaoNFE.tbManifestacaoNFE.RecNo;
  LChaveDocumento := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value;

  if (dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('xml_baixado').Value = 1) then
  begin

    if (dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('lancada').Value = 1) then
    begin
      dm.exibe_painel_erro('NFE Já foi lançada!', 'Ok');
      exit;
    end;

    LXMLNotaCarregada := dm.getXMLNFEDestinada(LChaveDocumento);

    if (VerificaSeExistemAssociacoesPendentes(LXMLNotaCarregada) = false) then
    begin
      try
        abreTelaDeEntradas();
      except
        begin
          Showmessage('Erro ao abrir formulário das entradas!');
        end;
      end;
    end
    else
    begin
      dm.exibe_painel_erro('Existem produtos deste fornecedor que ainda não foram asssociados. Faça a associação dos produtos na tela a seguir e tente novamente!', 'Ok');
      Application.CreateForm(TfrmComparaProdutosNFEFornecedor, frmComparaProdutosNFEFornecedor);
      frmComparaProdutosNFEFornecedor.setCodFornecedorAssociar(getCodFornecedorViaCNPJ(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF), codigosProdutosNfeSelecionada);
      frmComparaProdutosNFEFornecedor.ShowModal;
      frmComparaProdutosNFEFornecedor.Free;

      if (VerificaSeExistemAssociacoesPendentes(LXMLNotaCarregada) = false) then
      begin
        try

          abreTelaDeEntradas;

        except
          begin
            Showmessage('Erro ao abrir formulário das entradas!');
          end;
        end;
      end

    end;

  end
  else
  begin
    dm.exibe_painel_erro('NFE não possui XML baixado', 'Ok');
    exit;
  end;

  dmManifestacaoNFE.tbManifestacaoNFE.RecNo := recno;
  btPesquisar.Click;
end;

procedure TfrmManifestacao.abreTelaDeEntradas();
begin

  Application.CreateForm(TfrmEntradasNfe, frmEntradasNfe);
  frmEntradasNfe.processaXML := true;
  frmEntradasNfe.GcodFornecedor := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('codFornecedor').Value;
  frmEntradasNfe.GRazaoSocialFornecedor := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('nome_fornecedor').Value;
  frmEntradasNfe.GChaveNFE := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value;
  frmEntradasNfe.edNomeFornecedor.text := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('nome_fornecedor').Value;
  frmEntradasNfe.edNumeroNota.text := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('numero_nota').AsString;
  frmEntradasNfe.edChaveNotaFiscal.text := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value;
  frmEntradasNfe.edSerieNota.text := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('serie_nota').Value;
  frmEntradasNfe.edDataDoc.date := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('data_emissao').Value;
  frmEntradasNfe.SetXMLNFE(LXMLNotaCarregada);
  frmEntradasNfe.showmodal;
  frmEntradasNfe.Free;

end;

procedure TfrmManifestacao.E1Click(Sender: TObject);
var
  LChave: string;
begin
  inherited;
  LChave := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value;
  if codigo_usuario <> '001' then
  begin
    showRealDialog(frm_principal, tmErro, 'Erro', 'Apenas o administrador possui acesso a este recurso!', 22, false);
  end
  else if (ShowRealDialog(frm_principal, tmConfirmacaoPorPin, 'Confirme', 'Tem certeza que deseja excluir esta nota da lista?') = teSim) then
  begin
    ExcluirNotaDestinada(LChave);
  end;
end;

procedure TfrmManifestacao.ExcluirNotaDestinada(AChave: string);
var
  LSQL: string;
begin
  LSQL := 'delete from nfe_destinadas nf  where nf.chave_nfe =' + Quotedstr(AChave);
  dm.executaSQL(LSQL);
  btPesquisar.click;
end;

procedure TfrmManifestacao.itVisualizarDanfeClick(Sender: TObject);
var
  LChaveDocumento: string;
  LTipoDocumento: integer;
begin
  inherited;

  LTipoDocumento := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('tipo_doc').Value;
  LChaveDocumento := dmManifestacaoNFE.tbManifestacaoNFE.FieldByName('chave_nfe').Value;
  visualizarDocumento(LTipoDocumento, LChaveDocumento);
end;

function TfrmManifestacao.VerificaSeExistemAssociacoesPendentes(AXMLNota: string): boolean;
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
  itemAtual: integer;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(self);
  Result := false;
  codigosProdutosNfeSelecionada := '';

  try

    try
      dm.parametrizaAcbrNFE(moNFe, false, false);
      dm.ACBrNFe1.NotasFiscais.Clear;
      dm.ACBrNFe1.NotasFiscais.LoadFromString(AXMLNota, False);
      codigosProdutosNfeSelecionada := '';

      for itemAtual := 0 to dm.ACBrNFe1.NotasFiscais[0].NFe.det.Count - 1 do
      begin
        codigosProdutosNfeSelecionada := codigosProdutosNfeSelecionada + Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.cProd) + ',';

      end;
      codigosProdutosNfeSelecionada := Copy(codigosProdutosNfeSelecionada, 0, codigosProdutosNfeSelecionada.Length - 1);
      LSQL.clear;
      LSQL.add('select * from compara_produtos_nfe where cnpj_fornecedor=' + Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF) + ' and cod_produto_interno is null');
      LSQL.add(' and cod_prod_fornecedor in (' + codigosProdutosNfeSelecionada + ')');
      ////dm.adicionalog(LSQL.Text);
      dm.getMemTable(tbAux, LSQL.Text);

      if tbAux.IsEmpty = false then
      begin
//        btPesquisar.Click;
        Result := true;
      end
      else
      begin
        Result := false;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao verificar se existem produtos não associados!', 'Ok');
        result := true;
      end
    end;
  finally
    tbAux.Close;
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);

  end

end;

procedure TfrmManifestacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if finalizouInicializacao then
    Action := caFree
  else
  begin
    dm.exibe_painel_erro('Sistema carregando informações. Aguarde...', 'Ok');
    Action := caNone;
  end;

end;

procedure TfrmManifestacao.FormCreate(Sender: TObject);
begin
  inherited;
  LListaArquivosXML := TList<TTextosXML>.Create;

  TBFornecedores := TFDMemTable.Create(self);
  dm.ACBrNFe1.Configuracoes.Geral.ModeloDF := moNFe;
  Application.CreateForm(TdmManifestacaoNFE, dmManifestacaoNFE);
  lbDescricaoEmpresa.Caption := descricaoEmpresa;

end;

procedure TfrmManifestacao.FormDestroy(Sender: TObject);
begin
  inherited;
  dmManifestacaoNFE.tbManifestacaoNFE.Active := false;
  dmManifestacaoNFE.Free;
  TBFornecedores.Active := false;
  FreeAndNil(TBFornecedores);

  FreeAndNil(LListaArquivosXML);
end;

procedure TfrmManifestacao.Edit1Exit(Sender: TObject);
begin
  inherited;
  if (Sender is TCustomEdit and ((Sender as TCustomEdit).Name = 'edNumeroNota')) then
  begin
    if (trim(edNumeroNota.text) <> '') then
    begin
      try
        edNumeroNota.Text := FormatFloat('000000000000000', StrToFloat(edNumeroNota.Text));
      except
        begin
          showmessage('Número da nota fiscal inválido!');
          edNumeroNota.SetFocus;
          exit;
        end;
      end;
    end;
  end;
end;

end.

