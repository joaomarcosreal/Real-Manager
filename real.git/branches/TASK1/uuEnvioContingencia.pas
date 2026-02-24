unit uuEnvioContingencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, DB, RxMemDS, StdCtrls, Buttons, pcnConversao, pcnConversaoNFE, Grids, DBGrids,
  ExtCtrls, Menus, ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, IBQuery,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, AcbrUtil, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, CurvyControls,
  IBX.IBScript;

type
  TfrmEnvioContingencia = class(Tfrm_modelo_vazio)
    dsContingencia: TDataSource;
    Panel1: TPanel;
    Label15: TLabel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    lbQtdNotas: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnInutlizacoes: TPanel;
    lbpnInutilizacoes: TLabel;
    lbQtdInut: TLabel;
    Panel4: TPanel;
    Label1: TLabel;
    pgInutilizacoes: TProgressBar;
    OpenDialog1: TOpenDialog;
    tbContingencia: TFDMemTable;
    tbContingenciacod_venda: TStringField;
    tbContingenciachaveNFCE: TStringField;
    tbContingenciavalor: TBCDField;
    tbContingencianumeroNFCE: TIntegerField;
    tbContingenciadata: TDateField;
    tbContingenciaserie: TIntegerField;
    Panel3: TPanel;
    btAtivarModoContingencia: TBitBtn;
    btEnvioContingencia: TBitBtn;
    btExportarXML: TBitBtn;
    btReimprimirCancelarNFCE: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tbContingenciaobs_nfce: TStringField;
    tbContingenciatentativas: TSmallintField;
    img: TImageList;
    PopupMenu2: TPopupMenu;
    VisualizarDANFE1: TMenuItem;
    ReimprimirDanfe1: TMenuItem;


   function  enviaNotaContingencia(codVenda : string; tentativa : integer) : boolean;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btEnvioContingenciaClick(Sender: TObject);
    procedure gerarListaDeNotas();
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btAtivarModoContingenciaClick(Sender: TObject);
    procedure btExportarXMLClick(Sender: TObject);
    procedure btCancelarNFCEClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btReimprimirCancelarNFCEClick(Sender: TObject);
    procedure tbContingenciatentativasGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure VisualizarDANFE1Click(Sender: TObject);
    procedure ReimprimirDanfe1Click(Sender: TObject);
  private
     desabilitarGrid : boolean;
    procedure processarInutilizacoes;
    function enviaNotaNaoLocalizada(codigo: string;
      tentativa: integer; diretorio : string): boolean;
    procedure apagaNotasCorretas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnvioContingencia: TfrmEnvioContingencia;

implementation

uses uu_data_module, uu_frm_principal, uuPainelAguarde, uuExportaXMLNFCE,
  uuCancelamentoNFCEChave, uuReimpressaoDanfeNFCE, uuDmVendas;

{$R *.dfm}

procedure TfrmEnvioContingencia.gerarListaDeNotas();
begin
  inherited;
  desabilitarGrid := false;
  DM.transacao.Active := FALSE;
  DM.transacao.Active := TRUE;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.SQL.Add(' select  v.cod_venda, v.chave_nfce, v.valor_total, v.numero_nfce, ');
  dm.qryauxiliar.SQL.Add(' v.data, v.serie_nfce, coalesce(v.obs_nfce,'+Quotedstr('')+') as obs_nfce , coalesce(v.TENTATIVAS_ENVIO_NFCE,0) as tentativas  ');
  dm.qryauxiliar.SQL.Add('    from vendas v where data >='+Quotedstr('01.12.2014')+' and v.protocolo_nfce='+Quotedstr('CONTINGENCIA'));
  dm.qryauxiliar.SQL.Add(' order by cod_venda');


  dm.adicionaLog(dm.qryauxiliar.SQL.Text);


  dm.qryauxiliar.Active := true;
  dm.qryauxiliar.First;

  tbContingencia.Active := true;
  tbContingencia.EmptyDataSet;
  tbContingencia.Active := false;
  tbContingencia.Active := true;

  while not dm.qryauxiliar.Eof do
   begin
     tbContingencia.Append;
     tbContingenciacod_venda.Value  :=   dm.qryauxiliar.fieldbyname('cod_venda').value;
     tbContingenciachaveNFCE.Value  :=   dm.qryauxiliar.fieldbyname('chave_nfce').Value;
     tbContingenciavalor.Value      :=   dm.qryauxiliar.fieldbyname('valor_total').value;
     tbContingencianumeroNFCE.Value :=   dm.qryauxiliar.fieldbyname('numero_nfce').value;
     tbContingenciadata.Value       :=   dm.qryauxiliar.fieldbyname('data').value;
     tbContingenciaserie.Value      :=   dm.qryauxiliar.fieldbyname('serie_nfce').value;
     tbContingenciaobs_nfce.Value   :=   dm.qryauxiliar.fieldbyname('obs_nfce').value;
     tbContingenciatentativas.Value :=  dm.qryauxiliar.fieldbyname('tentativas').value;
     tbContingencia.Post;
     dm.qryauxiliar.Next;
   end;
   tbContingencia.First;

   lbQtdNotas.Caption := Inttostr(tbContingencia.RecordCount);


end;

function TfrmEnvioContingencia.enviaNotaContingencia(codVenda : string; tentativa : integer) : boolean;
var
  Sincrono : boolean;
  caminhoNFE : string;
  msg : string;
  notaEnviada : Boolean;
  numeroNota : integer;
  xmlVenda : string;



  produtoAtual,ctProdutos : integer;
  totalProduto : Currency;
  BasePis,baseCofins : currency;
  totalPis,totalCofins : currency;
  q : TIBQuery;

  codErroEnvioNota : smallint;
  mensagemErroEnvioNota : string;
  atualizaPisECofins : boolean;

begin
  q :=TIBQuery.Create(self);
  q.Database:=dm.dbrestaurante;
  q.Transaction:=dm.transLog;

  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm.tb_parametros.Active := true;

//  numeroNota := dm.GetNumeroNotaNFCEContingenciaOffline();

  if (  StrToInt(dm.LeIni(2,'NFCE','atualizaPisCofins'))  = 1 ) then
    atualizaPisECofins := true
  else
    atualizaPisECofins := false;


  q.Active := false;
  q.SQL.Clear;
  q.SQL.add('select v.*, coalesce(v.cnpj_cpf_cliente_nf,'+Quotedstr('')+')'+' as cpf_cliente from vendas v where v.cod_venda='+Quotedstr(codVenda)+' order by cod_venda');
  dm.adicionaLog(q.SQL.Text);
  q.Active := true;

  Sincrono := true;

{  caminhoNFE :=dm.LeIni(2,'NFCE','caminhoArquivosXMLContingencia')+'\'+
                 '\'+FormatDateTime('YYYMM', q.fieldbyname('data').Value )+'\'+trim(tbContingenciachaveNFCE.Value)+'.xml';
  }
  dm.parametrizaAcbrNFE(moNFCe,false,true);
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromString(q.FieldByName('xml_doc').Value,false);

//  dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF  := q.fieldbyname('numero_nfce').value;
//  dm.ACBrNFe1.Configuracoes.Geral.IncluirQRCodeXMLNFCe := true;

//  dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi      :=  q.FieldByName('data_so').Value;
////  dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dhCont    :=  q.FieldByName('data_so').Value;
//  dm.ACBrNFe1.NotasFiscais[0].NFe.Dest.CNPJCPF  :=  q.FieldByName('CNPJ_CPF_CLIENTE_NF').Value;
//  dm.ACBrNFe1.NotasFiscais[0].NFe.Dest.xNome    :=  q.FieldByName('NOME_CLIENTE_NF').Value;


  /// corrige identificação do cliente na nota.
    dm.ACBrNFe1.NotasFiscais[0].NFe.Dest.CNPJCPF := q.FieldByName('cpf_cliente').Value;


         totalPis :=0;
         totalCofins :=0;
         totalProduto:=0;

     ctProdutos := dm.ACBrNFe1.NotasFiscais[0].NFe.det.Count;
     produtoAtual :=0;

{
    dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF    := q.FieldByName('numero_nfce').Value;
    dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi    :=now;
    dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dSaiEnt :=now;
    dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.hSaiEnt := now;
 }



    for produtoAtual :=0 to ctProdutos -1 do
           begin
              dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Prod.cEAN := 'SEM GTIN';
              dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Prod.cEANTrib  := 'SEM GTIN';

              // Atualiza o NCM do produto.
              dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Prod.NCM  := dm.getNCMProduto(0,dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Prod.cProd);

              // Atualiza o CST do produto.

              dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Prod.CEST := dm.getCESTProduto(0,dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Prod.cProd);
             {
              dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Prod.CFOP := dm.getCFOPProduto(0,dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Prod.cProd);
               case StrToInt(copy(q.fieldbyname('CST_SAIDA').Value,0,1)) of
                 0 : dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.orig    := oeNacional;
                 1 : dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.orig    := oeEstrangeiraImportacaoDireta;
                 2 : dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.orig    := oeEstrangeiraAdquiridaBrasil;
                 3 : dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.orig    := oeNacionalConteudoImportacaoSuperior40;
                 4 : dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.orig    := oeNacionalProcessosBasicos;
                 5 : dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.orig    := oeNacionalConteudoImportacaoInferiorIgual40;
                 6 : dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.orig    := oeEstrangeiraImportacaoDiretaSemSimilar;
                 7 : dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.orig    := oeEstrangeiraAdquiridaBrasilSemSimilar;
                 8 : dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.orig    := oeNacionalConteudoImportacaoSuperior70;
               end;

               case StrToInt(copy(q.fieldbyname('CST_SAIDA').Value,1,3)) of
                 00 :   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.CST  := cst00;
                 10 :  dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.CST := cst10;
                 20 :  dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.CST  := cst20;
                 30 :  dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.CST:= cst30;
                 40 :  dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.CST:= cst40;
                 50 :  dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.CST:= cst50;
                 60 :  dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.CST:= cst60;
                 70 :  dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.CST:= cst70;
                 80 :  dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.CST:= cst90;
                 81 :  dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.CST:= cst81;
                 90 :  dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.CST:= cst90;
                 41 :  dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.ICMS.CST:= cst41;
               end;


               }

              // Comentário no código que atualiza pis e cofins
              if atualizaPisECofins  then
               begin

                   totalProduto := dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Prod.vProd;
                if dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.PIS.CST = pis01   then
                 begin

                   dm.adicionaLog('INCIDE PIS E COFINS '+dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Prod.xProd);

                   BasePis := totalProduto;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.PIS.CST  := pis01;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.PIS.qBCProd := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[produtoAtual].Prod.qCom;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.PIS.vBC  := totalProduto;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.PIS.pPIS := 0.65;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.PIS.vPIS :=RoundABNT(  (BasePis * ( 0.65 / 100)),2);
                   totalPis := totalPis + dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.PIS.vPIS;
                   DM.adicionaLog('Pis: '+FloatToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.PIS.vPIS));
                   baseCofins := totalProduto;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.COFINS.CST       := cof01;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.COFINS.qBCProd := dm.ACBrNFe1.NotasFiscais[0].NFe.Det[produtoAtual].Prod.qCom;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.COFINS.vBC       := baseCofins;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.COFINS.pCOFINS  := 3;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.COFINS.vCOFINS   :=  RoundABNT(  (baseCofins * ( 3 / 100)),2);
                   totalCofins := totalCofins + dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.COFINS.vCOFINS;
                   DM.adicionaLog('Cofins: '+FloatToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.COFINS.vCOFINS));

                 end
                else
                 begin
                    dm.adicionaLog('**** NAO INCIDE PIS E COFINS '+dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Prod.xProd);
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.PIS.CST := pis06;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.PIS.qBCProd := 0;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.PIS.vBC  :=0;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.PIS.pPIS  := 0;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.PIS.vPIS := 0;

                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.COFINS.CST :=cof06;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.COFINS.qBCProd := 0;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.COFINS.vBC       := 0;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.COFINS.pCOFINS  := 0;
                   dm.ACBrNFe1.NotasFiscais[0].NFe.det[produtoAtual].Imposto.COFINS.vCOFINS   := 0;
                 end;


             end;
           end;

    if atualizaPisECofins  then

     begin
      dm.adicionaLog('Chave numero '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
      DM.adicionaLog('Total Pis: '+FloatToStr(totalPis));
      dm.adicionaLog('Total Cofins: '+FloatToStr(totalCofins));

      dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vCOFINS := totalCofins;
      dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vPIS    := totalPis;
     end;




  DM.adicionaLog(dm.ACBrNFe1.NotasFiscais[0].XML);


  dm.parametrizaAcbrNFE(moNFCe,false,true);

//  dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie := dm.getSerieNFCE ();
//  dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF  := dm.getNumeroNFCE();

  dm.adicionaLog('Pegou o número '+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie)+'/'+Inttostr( dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));

  dm.ACBrNFe1.NotasFiscais.GerarNFe;
  dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.Versao :=4;




  dm.ACBrNFe1.NotasFiscais[0].Assinar;
  dm.adicionaLog('Assinou a nota');
  dm.ACBrNFe1.NotasFiscais[0].Validar;
  dm.adicionaLog('Validou a nota');




  try
   dm.ACBrNFe1.Consultar;
  except
      on E : Exception  do
   begin
       dm.adicionaLog('Deu Erro ao consultar: '+E.Message);
   end

  end;

  dm.adicionaLog('Chave antiga :'+tbContingenciachaveNFCE.Value +' / '+'Chave nova: '+ copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
  notaEnviada := False;

  if (  (dm.ACBrNFe1.WebServices.Consulta.cStat  = 100) or (dm.ACBrNFe1.WebServices.Consulta.cStat  = 150)  )  then
     begin
       dm.adicionaLog('A nota em contingencia '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60) +' já consta na sefaz');
       notaEnviada := True;
     end
  else
   begin
      try
       begin
        dm.adicionaLog('XML da tentiva: '+dm.ACBrNFe1.NotasFiscais[0].XML);
        dm.adicionaLog('Envia em contingencia '+tbContingenciachaveNFCE.Value );
        dm.ACBrNFe1.Enviar(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF ,false, nfceSincrona  ,true);
        notaEnviada := true;
       end;
      except
         on E : Exception  do
          begin
           dm.adicionaLog('Erro ao enviar a nota em contingencia com a chave: '+tbContingenciachaveNFCE.Value);
           dm.adicionaLog('    erro: '+E.Message );

            if nfceSincrona   then
              begin
                dm.adicionaLog('Tipo do envio: Síncrono');
                codErroEnvioNota      := dm.ACBrNFe1.WebServices.Enviar.cStat;
                mensagemErroEnvioNota := dm.ACBrNFe1.WebServices.Enviar.xMotivo;
              end
            else
             begin
               dm.adicionaLog('Tipo do envio: Assíncrono');
               codErroEnvioNota      := dm.ACBrNFe1.WebServices.Retorno.cStat;
               mensagemErroEnvioNota := dm.ACBrNFe1.WebServices.Retorno.xMsg;
             end;


           if (dm.verificaSeErroNFEPermiteContingencia(codErroEnvioNota,mensagemErroEnvioNota) <> 1) then
            dm.atualizaTentativasEnvioNFCE(E.Message , codVenda);

          end;
      end;
   end;

   if notaEnviada = True then
    begin
      xmlVenda := dm.ACBrNFe1.NotasFiscais[0].XML;
      {
      dm.ACBrNFe1.NotasFiscais[0].GravarXML(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'.xml', dm.LeIni(2,'NFCE','caminhoArquivosXML')+
      '\'+FormatDateTime('YYYMM',q.fieldbyname('data').value ));
      }
      q.Active := false;
      q.SQL.clear;
      q.sql.add(' update vendas v set ');
      q.sql.add('    v.serie_nfce='+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie));
      q.sql.add('    ,v.numero_nfce='+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));
      q.sql.add('    ,v.chave_nfce='+QuotedStr(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)  ));
      q.sql.add('   ,v.PROTOCOLO_NFCE='+QuotedStr(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt));
      q.sql.add('   ,v.xml_doc='+QuotedStr(xmlVenda)+'');
      q.sql.add('  where v.cod_venda='+Quotedstr(codVenda ));
      DM.adicionaLog(q.SQL.Text);
      q.ExecSQL;
      Result := true;
    end
   else
    begin
      q.Active := false;
      Result := false;
    end;

//  dm.atualizaTentativasEnvioNFCE(dm.ACBrNFe1.WebServices.Consulta.XMotivo, codVenda);

  if dm.transLog.Active = false then dm.transLog.Active:=true;
  dm.transLog.Commit;
  FreeAndNil(q);
end;





function TfrmEnvioContingencia.enviaNotaNaoLocalizada(codigo : string; tentativa : integer; diretorio : string) : boolean;
var
  Sincrono : boolean;
  caminhoNFE : string;
  msg : string;
  notaEnviada : Boolean;
  numeroNota : integer;
  xmlVenda : string;
begin


  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm.tb_parametros.Active := true;

//  numeroNota := dm.GetNumeroNotaNFCEContingenciaOffline();

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.add('select * from nfce_emitidas where codigo='+Quotedstr(codigo));
  dm.adicionaLog(dm.qryauxiliar.SQL.Text);
  dm.qryauxiliar.Active := true;

  Sincrono := true;

  dm.parametrizaAcbrNFE(moNFCe,false,true);
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromString(dm.qryauxiliar.FieldByName('xml_nota').Value,false);
//  dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF  := dm.qryauxiliar.fieldbyname('numero').value;
//  dm.ACBrNFe1.Configuracoes.Geral.IncluirQRCodeXMLNFCe := true;
//  dm.ACBrNFe1.NotasFiscais.GerarNFe;
//  dm.ACBrNFe1.NotasFiscais[0].Assinar;
//  dm.ACBrNFe1.NotasFiscais[0].Validar;

  try
   dm.adicionaLog('Tenta consultar o xml ');
   dm.ACBrNFe1.Consultar;
   dm.adicionaLog('Consultou e retornou o xml:');
   dm.adicionaLog(dm.ACBrNFe1.NotasFiscais[0].XML);
  except
   on E : Exception  do
   begin
    dm.adicionaLog('Erro ao consultar o XML '+E.Message);
    Result := false;
    Exit;
   end

  end;



  dm.adicionaLog(' RETORNO  ='+iNTTOSTR(dm.ACBrNFe1.WebServices.Consulta.cStat));
  notaEnviada := False;

  if (  (dm.ACBrNFe1.WebServices.Consulta.cStat  = 100) or (dm.ACBrNFe1.WebServices.Consulta.cStat  = 150)  )  then
     begin
       dm.adicionaLog('A nota  '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60) +' já consta na sefaz');
       notaEnviada := True;
     end
  else
   begin

      try
       begin
        dm.adicionaLog('Envia em contingencia '+tbContingenciachaveNFCE.Value );
        dm.ACBrNFe1.Enviar(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF ,false,true,true);
        notaEnviada := true;
       end;
      except
         on E : Exception  do
          begin
           dm.adicionaLog('Erro ao enviar a nota em contingencia com a chave: '+tbContingenciachaveNFCE.Value);
           dm.adicionaLog('    erro: '+E.Message );
          end;
      end;


   end;

   if notaEnviada = True then
    begin
      xmlVenda := dm.ACBrNFe1.NotasFiscais[0].XML;
      dm.ACBrNFe1.NotasFiscais[0].GravarXML(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'.xml', dm.LeIni(2,'NFCE','caminhoArquivosXML')+
      '\'+FormatDateTime('YYYMM',dm.qryauxiliar.fieldbyname('data').value ));
      dm.qryauxiliar.Active := false;
      dm.qryauxiliar.SQL.clear;
      dm.qryauxiliar.sql.add(' update nfce_emitidas v set ');
      dm.qryauxiliar.sql.add('    v.numero='+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));
      dm.qryauxiliar.sql.add('   ,v.chave='+QuotedStr(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)  ));
      dm.qryauxiliar.sql.add('   ,v.protocolo='+QuotedStr(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt));
      dm.qryauxiliar.sql.add('   ,v.xml_nota='+QuotedStr(xmlVenda)+'');
      dm.qryauxiliar.sql.add('  where v.codigo='+Quotedstr(codigo ));
      DM.adicionaLog(dm.qryauxiliar.SQL.Text);
      dm.qryauxiliar.ExecSQL;

      dm.ACBrNFe1.NotasFiscais[0].GravarXML(
          'AUT_'+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'.xml',
          diretorio);


      dm.transacao.Commit;
      dm.transacao.Active := false;
      dm.transacao.Active := true;
      Result := true;
    end
   else
    begin
      Result := false;
    end;

end;


procedure TfrmEnvioContingencia.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;



  if tbContingencia.IsEmpty then
   exit;

  if desabilitarGrid  then
   exit;

      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

   if Column.FieldName = 'tentativas' then
   begin


      if StrToInt(Column.Field.AsString) >= 3 then
         img.Draw(DBGrid1.Canvas,Rect.Left+10,Rect.Top+1,1)
      ELSE
         img.Draw(DBGrid1.Canvas,Rect.Left+10,Rect.Top+1,3)

   end;


     {

if odd(tbContingencia.RecNo) then
DBGrid1.Canvas.Brush.Color:= clwhite
else
DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
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
          }
end;

procedure TfrmEnvioContingencia.btEnvioContingenciaClick(Sender: TObject);
var
 tentivas : smallint;
 enviouComSucesso : boolean;
 totalNotasContingencia,atual : integer;

begin
  inherited;
//  dm.CancelaNotasPendentes();

 if ( StrToInt(dm.LeIni(2,'CAIXA','permiteEnviarContingencia') ) =0 ) then
  begin
    dm.exibe_painel_erro('A contingência não pode ser enviada nesse computador. Verifique o computador autorizado e tente novamente!','Ok');
    exit;
  end;

 if (dm.verificaPermissaoAcao('I20001011') = false) then
  begin
   exit;
  end;

     totalNotasContingencia := tbContingencia.RecordCount;
     atual := 0;
     pnInutlizacoes.Visible := true;
     pgInutilizacoes.Max := totalNotasContingencia;

      lbpnInutilizacoes.Caption := 'Enviando notas em contingência...';

    while not tbContingencia.Eof do
     begin

        if tbContingenciatentativas.Value < 3 then
         begin
          enviaNotaContingencia(tbContingenciacod_venda.Value, tentivas);
         end;



        Application.ProcessMessages();
        lbQtdInut.Caption := Inttostr(atual) +' de '+IntToStr(totalNotasContingencia);
        atual :=  atual +1;
        pgInutilizacoes.Position := atual;
        Application.ProcessMessages;

        tbContingencia.Next;
     end;
    gerarListaDeNotas();
    processarInutilizacoes();



end;

procedure TfrmEnvioContingencia.FormActivate(Sender: TObject);
begin
  inherited;




  btEnvioContingencia.Caption := 'Enviar todas as '+#10+'notas em'+#10+'contingência';
  btExportarXML.Caption    := 'Exportar arquivos '+#10+'XML';
  btReimprimirCancelarNFCE.Caption :='Re-imprimir ou '+#10+'cancelar NFC-E';
//  btCancelarNFCE.Caption := 'Cancelar'+#10+'NFC-e'+#10+'pela chave';

  if (  StrToInt(dm.LeIni(2,'NFCE','forçarContingenciaOffline'))  = 0 ) then
   begin
     btAtivarModoContingencia.Caption := 'SISTEMA ESTÁ '#10+' NO MODO'+#10+'ONLINE';

     btAtivarModoContingencia.Glyph.LoadFromFile(patchAplicacao+'imagens\server_ok.bmp');
   end
  else
   begin
     btAtivarModoContingencia.Caption := 'SISTEMA ESTÁ'#10+' NO MODO'+#10+' EM CONTINGÊNCIA';
     btAtivarModoContingencia.Glyph.LoadFromFile(patchAplicacao+'imagens\server_error.bmp');
   end;

  gerarListaDeNotas();
end;







procedure TfrmEnvioContingencia.apagaNotasCorretas();
begin

    // Apaga as vendas registradas...
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.SQL.Add(' delete from nfce_emitidas nf where ');
    dm.qryauxiliar.SQL.Add(' exists (   select *  from vendas  v   ');
    dm.qryauxiliar.SQL.Add('  where v.modelo_comprovante = nf.modelo  ');
    dm.qryauxiliar.SQL.Add('        and v.serie_nfce = nf.serie ');
    dm.qryauxiliar.SQL.Add('        and v.numero_nfce = nf.numero) ');
    dm.adicionaLog(dm.qryauxiliar.SQL.Text);
    dm.qryauxiliar.ExecSQL;

    //Apaga vendas canceladas...
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.SQL.Add(' delete from nfce_emitidas nf where ');
    dm.qryauxiliar.SQL.Add(' exists (   select *  from vendas_canceladas  v   ');
    dm.qryauxiliar.SQL.Add(' where v.modelo_comprovante = nf.modelo  ');
    dm.qryauxiliar.SQL.Add('        and v.serie_nfce = nf.serie ');
    dm.qryauxiliar.SQL.Add('        and v.numero_nfce = nf.numero) ');
    dm.adicionaLog(dm.qryauxiliar.SQL.Text);
    dm.qryauxiliar.ExecSQL;

    // Apaga inutilizadas...

    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.clear;
    dm.qryauxiliar.SQL.Add('  delete from nfce_emitidas nf ');
    dm.qryauxiliar.SQL.Add('   where exists ( select * from inutilizacoes_nfce nc ');
    dm.qryauxiliar.SQL.Add('                    where nc.modelo=nf.modelo ');
    dm.qryauxiliar.SQL.Add('                     and  nc.serie= nf.serie ');
    dm.qryauxiliar.SQL.Add('                     and nc.nota = nf.numero ');
    dm.qryauxiliar.SQL.Add('                       and nc.inutilizada=1) ');
    dm.adicionaLog(dm.qryauxiliar.SQL.Text);
    dm.qryauxiliar.ExecSQL;




    dm.transacao.Commit;
    dm.transacao.Active := false;
    dm.transacao.Active := true;


end;


procedure TfrmEnvioContingencia.BitBtn1Click(Sender: TObject);
var
arquivo : string;
diretorio : string;
  MyClass: TComponent;
 tentivas : smallint;
 enviouComSucesso : boolean;
 totalNotasContingencia,atual : integer;

 codCaixa : string;

begin
  inherited;
  btEnvioContingencia.Click;
  desabilitarGrid := true;
  tbContingencia.DisableControls;

      {
 if ( StrToInt(dm.LeIni(2,'CAIXA','permiteEnviarContingencia') ) =0 ) then
  begin
    dm.exibe_painel_erro('A contingência não pode ser enviada nesse computador. Verifique o computador autorizado e tente novamente!','Ok');
    exit;
  end;



  OpenDialog1.InitialDir := patchAplicacao;
  OpenDialog1.Execute();
  arquivo := OpenDialog1.FileName;
  diretorio := ExtractFileDir(arquivo);



  frm_principal.memo_avisos.clear;
  dm.ListarArquivos(diretorio ,false,frm_principal.memo_avisos.Lines);
  for arquivo in frm_principal.memo_avisos.Lines do
   begin

        try
          dm.parametrizaAcbrNFE(moNFCe);
          dm.ACBrNFe1.NotasFiscais.Clear;
          dm.ACBrNFe1.NotasFiscais.LoadFromFile(arquivo,true);
          dm.ACBrNFe1.Consultar();

        if (  (dm.ACBrNFe1.WebServices.Consulta.cStat  = 100) or (dm.ACBrNFe1.WebServices.Consulta.cStat  = 150)  )  then
         begin
          diretorio := ExtractFileDir(arquivo);
          dm.ACBrNFe1.NotasFiscais[0].GravarXML(
              'AUT_'+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'.xml',
              diretorio);
//          Showmessage('XML atualizado. Protocolo: '+dm.ACBrNFe1.WebServices.Consulta.Protocolo);
//          DeleteFile(arquivo);
         end;

          except
             on E : Exception  do
              begin
                showmessage('Erro: '+e.Message);
              end;
          end;

    end;
   }



    apagaNotasCorretas();
    dm.transacao.Commit;
    dm.transacao.Active := false;
    dm.transacao.Active := true;


    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.SQL.Clear;
    dm.qryauxiliar.SQL.add(' select * from nfce_emitidas nfc ');
    dm.adicionaLog(dm.qryauxiliar.SQL.Text);
    dm.qryauxiliar.Active := true;
    dm.qryauxiliar.FetchAll;
    dm.qryauxiliar.First;




    tbContingencia.Active := true;
    tbContingencia.EmptyDataSet;
    tbContingencia.Active:= false;
    tbContingencia.Active := true;

    while not dm.qryauxiliar.Eof  do
     begin
       tbContingencia.Append;
       tbContingenciacod_venda.Value  :=  dm.qryauxiliar.fieldbyname('codigo').value;
       tbContingenciachaveNFCE.Value  :=  dm.qryauxiliar.fieldbyname('chave').Value;
       tbContingencianumeroNFCE.Value :=  dm.qryauxiliar.fieldbyname('numero').value;
       tbContingenciadata.Value       :=  dm.qryauxiliar.fieldbyname('data').value;
       tbContingencia.Post;
       dm.qryauxiliar.Next;
     end;


     totalNotasContingencia := tbContingencia.RecordCount;
     atual := 0;
     pnInutlizacoes.Visible := true;
     pgInutilizacoes.Max := totalNotasContingencia;

     lbpnInutilizacoes.Caption := 'Atualizando notas que tiveram erro...';

    tbContingencia.first;
    while not tbContingencia.Eof do
     begin
        enviouComSucesso := false;
        tentivas := 0;
        while ( (tentivas <= 3 ) and (enviouComSucesso = false) ) do
         begin
           if (enviaNotaNaoLocalizada(tbContingenciacod_venda.Value, tentivas,diretorio) = true) then
             begin
               enviouComSucesso := true;
             end
           else
            begin
              tentivas := tentivas +1;
            end;
         end;
        Application.ProcessMessages();
        lbQtdInut.Caption := Inttostr(atual) +' de '+IntToStr(totalNotasContingencia);
        atual :=  atual +1;
        pgInutilizacoes.Position := atual;
        Application.ProcessMessages;

        tbContingencia.Next;
     end;





    dm.qryauxiliar.SQL.Clear;
    dm.qryauxiliar.SQL.Add(' select * from nfce_emitidas nf ');
    dm.qryauxiliar.SQL.Add('  where udf_trim( nf.protocolo)  <> '+Quotedstr(''));
    dm.qryauxiliar.SQL.Add('  and nf.protocolo <> '+Quotedstr('CONTINGENCIA'));
    dm.qryauxiliar.SQL.Add('    and not exists (select v.chave_nfce  from vendas v where v.chave_nfce = nf.chave  )');
    dm.adicionaLog('Adicionando notas com erro ao BD');
    dm.adicionaLog ( dm.qryauxiliar.SQL.Text);
    dm.qryauxiliar.Active := true;

    while not dm.qryauxiliar.Eof  do
     begin

       dm.adicionaLog('Tenta inserir a chave: '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));

       dm.ACBrNFe1.NotasFiscais.Clear;
       dm.ACBrNFe1.NotasFiscais.LoadFromString(dm.qryauxiliar.FieldByName('xml_nota').Value,false);

       dm.qryauxiliar2.SQL.Clear;
       dm.qryauxiliar2.SQL.add('select first 1 v.* from vendas v where v.data_so >= '+Quotedstr(FormatDateTime('DD.MM.YYY', dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi)));
       dm.adicionaLog(dm.qryauxiliar2.SQL.Text);
       DM.qryauxiliar2.Active := true;


       dmVendas.qryVendas.Active := true;
       dmVendas.qryVendas.Append;
       dmVendas.qryVendasCOD_VENDA.Value := dm.geraCodigo('G_VENDAS',8);


       dmVendas.qryVendasCOD_EMPRESA.Value          := codEmpresa;
       dmVendas.qryVendasIMP.Value := 0;
       dmVendas.qryVendasCOD_GARCON_ABRIU.Value     := '000';
       dmVendas.qryVendasDATA.Value                 := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi;
       dmVendas.qryVendasDATA_SO.Value              := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi;
       dmVendas.qryVendasHORA.Value                 := Time;

       if dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.modelo=65 then
         dmVendas.qryVendasMODELO_COMPROVANTE.Value   :=2
       else
         dmVendas.qryVendasMODELO_COMPROVANTE.Value   :=3;

       // Campos Relativos a daodos d ECF (Emissor de cupom fiscal)


       dmVendas.qryVendasDATA_ECF.Value             :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi;
       dmVendas.qryVendasHORA_ECF.Value             := Time;
       dmVendas.qryVendasCCF_CUPOM.Value            := '0';
       dmVendas.qryVendasCOO_CUPOM.Value            := '0';
       dmVendas.qryVendasNUM_SERIE_ECF.Value        := '0';
       dmVendas.qryVendasREDUCAO_Z.Value            := 0;

       //Campos Relativos a NF-e / NFC-e
       dmVendas.qryVendasNUMERO_NFCE.Value          := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF;
       dmVendas.qryVendasSERIE_NFCE.Value           := dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie;
       dmVEndas.qryVendasCHAVE_NFCE.Value           := copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60);
       dmVendas.qryVendasPROTOCOLO_NFCE.Value       := dm.qryauxiliar.FieldByName  ('protocolo').value;
       dmVendas.qryVendasRECIBO_NFCE.value          := '0';

       //Campos Relativos ao SAT
       dmVendas.qryVendasSESSAO_SAT.Value           := 0;
       dmVEndas.qryVendasCNF_SAT.Value              := 0;


       // Campos dos totais de venda
       dmVendas.qryVendasVALOR_BRUTO.Value          :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vProd;
       dmVendas.qryVendasVALOR_DESCONTO.Value       :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vDesc;
       dmVendas.qryVendasVALOR_TXSERV.Value         :=  0;
       dmVendas.qryVendasREPIQUE.Value              :=  0;
       dmVendas.qryVendasVALOR_TX_ENTREGA.Value     := 0;
       dmVendas.qryVendasVALOR_TOTAL.Value          := dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF;
       dmVendas.qryVendasTOTAL_PAGO.Value           := 0;
       dmVendas.qryVendasVALOR_TROCO.Value          := 0;
       dmVendas.qryVendasCOD_USUARIO.Value          := getCodOperadorCaixa(ultimoCaixaAberto);
       dmVendas.qryVendasNUMERO_CAIXA.Value         := numero_caixa;
       dmVendas.qryVendasPROCESSADA.Value           := 0;
       dmVendas.qryVendasMESA.Value                 := '0100';
       dmVendas.qryVendasCOD_CAIXA.Value            := dm.qryauxiliar2.FieldByName('cod_caixa').Value;
       dmVendas.qryVendasTIPO_VENDA.Value           := 1;
       dmVendas.qryVendasQTDE_PESSOAS.Value         := 1;
       dmVendas.qryVendasCOD_PEDIDO_DELIVERY.Value  := '';
       dmVendas.qryVendasXML_DOC.Value              := dm.qryauxiliar.FieldByName('xml_nota').Value;
       dmVendas.qryVendasCNPJ_CPF_CLIENTE_NF.Value  := '';
       dmVendas.qryVendasNOME_CLIENTE_NF.Value      := '';
       dmVendas.qryVendas.Post;



       dm.qryauxiliar.Next;
     end;





    dm.transacao.Commit;

    dm.transacao.Active := false;
    dm.transacao.Active := true;
    dm.procGeraInutilizacoes.ExecProc;

    lbpnInutilizacoes.Caption := 'O sistema está processando as inutilizações...';



    dm.transacao.Commit;

    apagaNotasCorretas();

    gerarListaDeNotas();
    tbContingencia.EnableControls;
    desabilitarGrid := false;
    showmessage('Terminou!');


end;

procedure TfrmEnvioContingencia.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmEnvioContingencia.btAtivarModoContingenciaClick(
  Sender: TObject);
begin
  inherited;

  if (  (StrToInt(dm.LeIni(2,'NFCE','permiteForcarContingencia')) = 1  ) or (Trim(codigo_usuario)='001') ) then
  begin

     if dm.verificaPermissaoAcao('I20001010') = true then
      begin

        if (  StrToInt(dm.LeIni(2,'NFCE','forçarContingenciaOffline'))  = 0 ) then
         begin
           dm.adicionaLog('Usuario: '+nome_usuario+'  ativou o modo de contingência');
           dm.gravaini('NFCE','formaEmissao','2');
           dm.gravaini('NFCE','forçarContingenciaOffline','1');
           btAtivarModoContingencia.Caption := 'SISTEMA ESTÁ'#10+' NO MODO'+#10+' EM CONTINGÊNCIA';
           dm.gravaini('NFCE','dataHoraContingencia',DateToStr(date));
           btAtivarModoContingencia.Glyph.LoadFromFile(patchAplicacao+'imagens\server_error.bmp');
         end
        else
         begin
           dm.adicionaLog('Usuario: '+nome_usuario+'  ativou o modo de contingência');
           dm.gravaini('NFCE','forçarContingenciaOffline','0');
           btAtivarModoContingencia.Caption := 'SISTEMA ESTÁ '#10+' NO MODO'+#10+'ONLINE';
           btAtivarModoContingencia.Glyph.LoadFromFile(patchAplicacao+'imagens\server_ok.bmp');
         end;
      end;
  end
 else
  begin
    exibe_painel_erro('Funcionalidade Desabilitada pelo Administrador!'+LineBreak+LineBreak
                      +' Se estiver tendo problemas de envio, entre em contato com a Real Softwares','Ok');
  end;
end;

procedure TfrmEnvioContingencia.btExportarXMLClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmExportaXMLNfce, frmExportaXMLNfce);
  frmExportaXMLNfce.ShowModal;
  frmExportaXMLNfce.Free;
end;

procedure TfrmEnvioContingencia.btReimprimirCancelarNFCEClick(Sender: TObject);
begin
  inherited;
    Application.CreateForm(TfrmGerenciamentoVendasCaixa, frmGerenciamentoVendasCaixa);
   frmGerenciamentoVendasCaixa.ShowModal;
   frmGerenciamentoVendasCaixa.Free;
end;

procedure TfrmEnvioContingencia.processarInutilizacoes();
var
 qtdInutilizacoes, inutilizacaoAtual : integer;
 modelo : integer;
 xmlInutilizacao : string;

begin
  inherited;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm.procGeraInutilizacoes.ExecProc;

  lbpnInutilizacoes.Caption := 'O sistema está processando as inutilizações...';

  dm.transacao.Commit;
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add('  select first 500 udf_year(current_date) as ano, nf.* from inutilizacoes_nfce  nf');
  dm.qryauxiliar.SQL.Add('  where nf.emitida = 0 and nf.inutilizada =0 ');
  dm.qryauxiliar.SQL.Add('   order by nf.modelo, nf.serie, nf.nota ');
  dm.adicionaLog('SQL da inutilização: '+dm.qryauxiliar.SQL.Text);
  dm.qryauxiliar.Active := true;
  dm.qryauxiliar.FetchAll;

  if dm.qryauxiliar.IsEmpty = false then
   begin
     qtdInutilizacoes := dm.qryauxiliar.RecordCount;
     inutilizacaoAtual := 0;
     pnInutlizacoes.Visible := true;
     pgInutilizacoes.Max := qtdInutilizacoes;

     dm.qryauxiliar.First;
     while not dm.qryauxiliar.Eof do
      begin

       case dm.qryauxiliar.FieldByName('modelo').Value  of
        2: begin
             dm.parametrizaAcbrNFE(moNFCe,false,true);
             modelo := 65;
           end;
        3:
          begin
            dm.parametrizaAcbrNFE(moNFe,false,true);
            modelo:= 55;
          end;
       end;



        try
          begin
            dm.ACBrNFe1.WebServices.Inutiliza(cnpj ,
                                           'PROBLEMAS NO SISTEMA EMISSOR. PULANDO NUMERAÇÃO' ,
                                            dm.qryauxiliar.FieldByName('ano').Value ,
                                            modelo ,
                                            dm.qryauxiliar.FieldByName('serie').Value,
                                            dm.qryauxiliar.FieldByName('nota').Value,
                                            dm.qryauxiliar.FieldByName('nota').Value);


            xmlInutilizacao :=   dm.ACBrNFe1.WebServices.Inutilizacao.XML_ProcInutNFe;
            dm.adicionaLog('XML da inutilização: '+xmlInutilizacao);
            dm.qryauxiliar2.Active := false;
            dm.qryauxiliar2.SQL.clear;
            dm.qryauxiliar2.sql.Add('   update inutilizacoes_nfce nf set nf.inutilizada=1, nf.protocolo ='+QUotedstr(dm.ACBrNFe1.WebServices.Inutilizacao.Protocolo)+', nf.obs='+Quotedstr(dm.ACBrNFe1.WebServices.Inutilizacao.xMotivo)+',');
            dm.qryauxiliar2.sql.Add(' nf.data_hora_inutilizacao='+Quotedstr(FormatDateTime('DD.MM.YYY',date))+',');
            dm.qryauxiliar2.sql.Add(' xml_doc='+Quotedstr(xmlInutilizacao));
            dm.qryauxiliar2.sql.Add(' where nf.modelo='+Inttostr(dm.qryauxiliar.FieldByName('modelo').Value));
            dm.qryauxiliar2.sql.Add(' and nf.serie='+Inttostr(dm.qryauxiliar.FieldByName('serie').Value));
            dm.qryauxiliar2.SQL.add(' and nf.nota='+Inttostr(dm.qryauxiliar.FieldByName('nota').Value));
            dm.qryauxiliar2.ExecSQL;



          end
        except
         on E : Exception  do
           begin
             xmlInutilizacao :=   dm.ACBrNFe1.WebServices.Inutilizacao.XML_ProcInutNFe;
             dm.adicionaLog('XML da inutilização: '+xmlInutilizacao);
             dm.adicionaLog('ERRO ao inutilizar NFCE   '+Inttostr(dm.qryauxiliar.FieldByName('serie').Value) +'/'+ Inttostr(dm.qryauxiliar.FieldByName('nota').Value)+'   '+E.Message);
             dm.qryauxiliar2.Active := false;
             dm.qryauxiliar2.SQL.clear;
             dm.qryauxiliar2.sql.Add('   update inutilizacoes_nfce nf set nf.protocolo ='+QUotedstr(dm.ACBrNFe1.WebServices.Inutilizacao.Protocolo)+', nf.obs='+Quotedstr(dm.ACBrNFe1.WebServices.Inutilizacao.xMotivo));
             dm.qryauxiliar2.sql.Add(' where nf.modelo='+Inttostr(dm.qryauxiliar.FieldByName('modelo').Value));
             dm.qryauxiliar2.sql.Add(' and nf.serie='+Inttostr(dm.qryauxiliar.FieldByName('serie').Value));
             dm.qryauxiliar2.SQL.add(' and nf.nota='+Inttostr(dm.qryauxiliar.FieldByName('nota').Value));
             dm.qryauxiliar2.ExecSQL;
           end;
        end;

        lbQtdInut.Caption := Inttostr(inutilizacaoAtual) +' de '+IntToStr(qtdInutilizacoes);
        inutilizacaoAtual :=  inutilizacaoAtual +1;
        pgInutilizacoes.Position := inutilizacaoAtual;
        Application.ProcessMessages;

        dm.qryauxiliar.Next;
      end;
   end;

   dm.transacao.Commit;
   pnInutlizacoes.Visible := false;
   dm.exibe_painel_erro('Processo de inutilização completado com sucesso!','Ok');
end;



procedure TfrmEnvioContingencia.ReimprimirDanfe1Click(Sender: TObject);
begin
  inherited;
  if dm.verificaPermissaoAcao('I20002017') = false then
    exit
  else
   begin
     dm.reimprimirDanfe(tbContingenciachaveNFCE.Value ,1,false,false );
   end
end;

procedure TfrmEnvioContingencia.tbContingenciatentativasGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  text:='';
end;

procedure TfrmEnvioContingencia.VisualizarDANFE1Click(Sender: TObject);
begin
  inherited;
   if dm.verificaPermissaoAcao('I20002017') = false then
    exit
  else
   begin
     dm.reimprimirDanfe(tbContingenciachaveNFCE.Value ,1,true,false);
//    reimprimirDanfe(false);
   end
end;

procedure TfrmEnvioContingencia.btCancelarNFCEClick(Sender: TObject);
begin
  dm.parametrizaAcbrNFE(moNFe,false,true);

  inherited;
  if codigo_usuario <> '001' then
   begin
     exibe_painel_erro('Apenas o Administrador tem autorização para este recurso!', 'Ok');
   end
  else
   begin
     Application.CreateForm(TfrmCancelamentoNFCEChave, frmCancelamentoNFCEChave);
     frmCancelamentoNFCEChave.ShowModal;
     frmCancelamentoNFCEChave.Free;  
   end;


end;

end.
