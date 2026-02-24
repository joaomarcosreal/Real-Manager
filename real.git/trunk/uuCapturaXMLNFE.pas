unit uuCapturaXMLNFE;

interface

uses
  Windows, Messages, strutils, ibx.ibdatabase, SysUtils, Variants, Classes,  activex, Graphics, Controls, Forms, WinInet,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask,  ExtCtrls,
  Grids, DBGrids, ACBrNFe, pcnConversaoNFE,pcnConversao, xmldom, xmlDOc,Provider, Xmlxform, DB ,
  IdBaseComponent, IdThreadComponent, pcnAuxiliar,
  ACBrNFeDANFEClass, ACBrNFeDANFEFR, Menus, RxMenus, ImgList, DBClient, ibquery,
  OleCtrls, SHDocVw, AdvCircularProgress, JvExControls, JvChart,
  System.ImageList, RxToolEdit, Vcl.ActnList, System.Actions, IBX.IBScript,
  uu_dm_consultas;

type
  TfrmCapturaXMLNFE = class(Tfrm_modelo_vazio)
    pnPegarXML: TPanel;
    btnNovaConsulta: TBitBtn;
    Panel4: TPanel;
    Label5: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    WebBrowser1: TWebBrowser;
    Memo2: TMemo;
    pvd: TXMLTransformProvider;
    cds: TClientDataSet;
    cdsxLgr: TStringField;
    cdsnro: TStringField;
    cdsxBairro: TStringField;
    cdscMun: TStringField;
    cdsxMun: TStringField;
    cdsUF: TStringField;
    cdsCEP: TStringField;
    cdscPais: TStringField;
    cdsxPais: TStringField;
    cdsfone: TStringField;
    cdsCNPJ: TStringField;
    cdsxNome: TStringField;
    cdsxFant: TStringField;
    cdsIE: TStringField;
    cdsCRT: TStringField;
    img: TImageList;
    RxPopupMenu1: TRxPopupMenu;
    Manifestao2: TMenuItem;
    CinciadaOperao1: TMenuItem;
    Desconhecimentodaoperao1: TMenuItem;
    Operaorealizada1: TMenuItem;
    Operaonorealizda1: TMenuItem;
    GroupBox2: TGroupBox;
    gpChave: TGroupBox;
    Panel8: TPanel;
    rdManifestacao: TRadioGroup;
    rdXML: TRadioGroup;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edDe: TDateEdit;
    edAte: TDateEdit;
    rdOrdem: TRadioGroup;
    edChaveNFE: TEdit;
    btPesquisar: TBitBtn;
    itBaixarXML: TMenuItem;
    itVisualizarDanfe: TMenuItem;
    edRazaoSocial: TEdit;
    Label3: TLabel;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    pnAguarde: TPanel;
    lbAguarde: TPanel;
    AdvCircularProgress1: TAdvCircularProgress;
    qtdSemRetorno: TLabel;
    lbConsultasSemRetorno: TLabel;
    td: TIdThreadComponent;
    tmAguarde: TTimer;
    memoRespWS: TMemo;
    xmlPVD: TXMLTransformProvider;
    cdsNotasConsultadas: TClientDataSet;
    cdsNotasConsultadasNSU: TStringField;
    cdsNotasConsultadaschNFe: TStringField;
    cdsNotasConsultadasCNPJ: TStringField;
    cdsNotasConsultadasxNome: TStringField;
    cdsNotasConsultadasIE: TStringField;
    cdsNotasConsultadasdEmi: TStringField;
    cdsNotasConsultadastpNF: TStringField;
    cdsNotasConsultadasvNF: TStringField;
    cdsNotasConsultadasdigVal: TStringField;
    cdsNotasConsultadasdhRecbto: TStringField;
    cdsNotasConsultadascSitNFe: TStringField;
    cdsNotasConsultadascSitConf: TStringField;
    BitBtn2: TBitBtn;
    pnQtdNotas: TPanel;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    itLancarNotasEntrada: TMenuItem;
    pnProcessando: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    rdLancada: TRadioGroup;
    edNumeroNota: TEdit;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    pnNSU: TPanel;
    lbMensagens: TLabel;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    Atua1: TMenuItem;
    itCancelarEntrada: TMenuItem;
    N1: TMenuItem;
    Copiarchave1: TMenuItem;

    procedure  consultaNotasFiscais(agrupar : boolean);
    procedure  enviaManifestacao(evento : TpcnTpEvento; tipoManifestacao : smallint;   chaveNfe : string);


    function  DownloadFile(SourceFile, DestFile: string): Boolean;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure processaNotasEntrada();
    procedure CinciadaOperao1Click(Sender: TObject);
    procedure Desconhecimentodaoperao1Click(Sender: TObject);
    procedure Operaorealizada1Click(Sender: TObject);
    procedure Operaonorealizda1Click(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
        procedure itVisualizarDanfeClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
        procedure tmAguardeTimer(Sender: TObject);
    function ReplaceString(Str:String; SearchStr:string; NewStr:String):String;
    procedure BitBtn5Click(Sender: TObject);
    
    procedure BitBtn3Click(Sender: TObject);

    procedure  ProcessarNotas();

    procedure itLancarNotasEntradaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Atua1Click(Sender: TObject);
    procedure RxPopupMenu1Popup(Sender: TObject);
    procedure itCancelarEntradaClick(Sender: TObject);
    procedure Copiarchave1Click(Sender: TObject);
  private
    procedure processaFornecedorNota(xml_nota: string);
    procedure processaItensNota(xml_nota: string);
    procedure registraEventoNFEDestinada(chave: string; evento: TpcnTpEvento;
      descricao: string; dataHora: TDateTime);

    { Private declarations }
  public
    { Public declarations }
     FPath: string;
  end;

var
  frmCapturaXMLNFE: TfrmCapturaXMLNFE;

implementation

uses uu_data_module, uu_frm_principal, uuDmRelatorios, uuObsManifestacao,
  pcnNFe, UU_DM_RELATORIOS, uuComparaProdutosNFE, uuAberturaCaixa,
  uu_entradas, uu_encerramento, pcnRetDistDFeInt, uuExportaXMLEntradas,
  Winapi.ShlObj, Vcl.Clipbrd;

{$R *.dfm}


function TfrmCapturaXMLNFE.ReplaceString(Str:String; SearchStr:string; NewStr:String):String;
var
  s : string;
  place : integer;
begin
  s := str;
    Repeat
      Place := pos(SearchStr, s);
      if place > 0 then
      begin
        Delete(s, Place, Length(SearchStr));
        Insert(NewStr, s, Place);
      end;
    until place = 0;
    Result:= s;
end;


procedure TfrmCapturaXMLNFE.RxPopupMenu1Popup(Sender: TObject);
begin
  inherited;
 if  (dm.qryManifestacaoNFELANCADA.value =1 ) then
  begin
    itLancarNotasEntrada.Visible := false;
    itCancelarEntrada.Visible := true;
  end
 else
  begin
    itLancarNotasEntrada.Visible := true;
    itCancelarEntrada.Visible := false;
  end;


end;

function TfrmCapturaXMLNFE.DownloadFile(SourceFile, DestFile: string): Boolean;
const BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  f: File;
  sAppName: string;
begin
 sAppName := ExtractFileName(Application.ExeName);
 hSession := InternetOpen(PChar(sAppName),INTERNET_OPEN_TYPE_PRECONFIG,nil, nil, 0);
 try
   hURL := InternetOpenURL(hSession,PChar(SourceFile),nil,0,0,0);
   try
     AssignFile(f, DestFile);
     Rewrite(f,1);
     repeat
       InternetReadFile(hURL, @Buffer,SizeOf(Buffer), BufferLen);
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







procedure TfrmCapturaXMLNFE.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  if dm.qryManifestacaoNFE.IsEmpty then
   exit;


   if Column.FieldName = 'XML_BAIXADO' then
   begin
     if ( StrToInt(Column.Field.AsString) = 1 ) then
      begin
        img.Draw(DBGrid1.Canvas,Rect.Left+10,Rect.Top+1,0);
      end
     else
      begin
        img.Draw(DBGrid1.Canvas,Rect.Left+10,Rect.Top+1,1);
      end;

   end;



   if Column.FieldName = 'LANCADA' then
   begin
     if ( StrToInt(Column.Field.AsString) = 0 ) then
      begin
        img.Draw(DBGrid1.Canvas,Rect.Left+10,Rect.Top+1,1);
      end
     else
      begin
        img.Draw(DBGrid1.Canvas,Rect.Left+10,Rect.Top+1,9);
      end;

   end;



  if Column.FieldName = 'STATUS_NFE' then
   begin


     if ( trim(Column.Field.AsString) = '1' ) then
      begin
        DBGrid1.Canvas.Brush.Color := clLime;
        DBGrid1.Canvas.Font.Color := clLime;
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;


     if ( trim(Column.Field.AsString) = '3' ) then
      begin
        DBGrid1.Canvas.Brush.Color := ClRed;
        DBGrid1.Canvas.Font.Color := ClRed;

      end;
   end;


  if Column.FieldName = 'MANIFESTO' then
   begin
     if ( trim(Column.Field.AsString) = 'SEM MANIFESTO' ) then
      begin
        DBGrid1 .Canvas.Brush.Color := clBlue;
        DBGrid1.Canvas.Font.Color := clWhite;
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;





     if ( trim(Column.Field.AsString) = 'CONFIRMADA' ) then
      begin
        DBGrid1.Canvas.Brush.Color := clBlack;
        DBGrid1.Canvas.Font.Color := clLime;
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;



     if ( trim(Column.Field.AsString) = 'CIÊNCIA DA OP.' ) then
      begin
        DBGrid1.Canvas.Brush.Color := clBlack ;
        DBGrid1.Canvas.Font.Color := clYellow;
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;


     if ( trim(Column.Field.AsString) = 'NÃO REALIZADA' ) then
      begin
        DBGrid1.Canvas.Brush.Color := clred ;
        DBGrid1.Canvas.Font.Color := clBlack;
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;

     if ( trim(Column.Field.AsString) = 'OP. DESCONHECIDA' ) then
      begin
        DBGrid1.Canvas.Brush.Color := clMoneyGreen ;
        DBGrid1.Canvas.Font.Color := clBlack ;
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;

     if ( trim(Column.Field.AsString) = 'CANCELADA' ) then
      begin
        DBGrid1.Canvas.Brush.Color := clRed;
        DBGrid1.Canvas.Font.Color := clWhite;
        DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;

   END;


end;

procedure TfrmCapturaXMLNFE.FormActivate(Sender: TObject);
begin
  inherited;
  CoInitialize(nil);
  dm.parametrizaAcbrNFE(moNFe,false,false);
  dm.ACBrNFe1.Configuracoes.Arquivos.DownloadNFe.PathDownload   := patchXMLEntradas;

  dm.tb_parametros.Active := false;
  dm.tb_parametros.Active := True;

  pnNSU.Caption := ' NSU: '+Inttostr(StrToInt(dm.tb_parametrosULT_NSU_NFE_DEST.Value));



  pnAguarde.Visible := True;
  pnProcessando.Visible := true;
  tmAguarde.Enabled := true;
  processaNotasEntrada();



end;
procedure TfrmCapturaXMLNFE.consultaNotasFiscais(agrupar : boolean);
begin

  if dm.transacao.Active = false then dm.transacao.Active := true;
  dm.qryManifestacaoNFE.Active := false;
  dm.qryManifestacaoNFE.sql.clear;
  dm.qryManifestacaoNFE.sql.add('select nf.*,udf_copy(nf.chave_nfe,26,9) as numero_nota,  ');
  dm.qryManifestacaoNFE.sql.add('    case when (nf.caminho_xml is null) then 0 ');
  dm.qryManifestacaoNFE.sql.add('         when (nf.caminho_xml is not null) then 1 ');
  dm.qryManifestacaoNFE.sql.add('    end as XML_BAIXADO , ');
  dm.qryManifestacaoNFE.sql.add('   case when (nf.tipo_manifestacao = 1) then '+Quotedstr('CONFIRMADA'));
  dm.qryManifestacaoNFE.sql.add('        when (nf.tipo_manifestacao = 2) then '+Quotedstr('NÃO REALIZADA'));
  dm.qryManifestacaoNFE.sql.add('        when (nf.tipo_manifestacao = 3) then '+QuotedStr('CIÊNCIA DA OP.'));
  dm.qryManifestacaoNFE.sql.add('        when (nf.tipo_manifestacao = 4) then '+Quotedstr('OP. DESCONHECIDA'));
  dm.qryManifestacaoNFE.sql.add('        when (nf.tipo_manifestacao = 5) then '+Quotedstr('CANCELADA'));
  dm.qryManifestacaoNFE.sql.add('    ELSE ');
  dm.qryManifestacaoNFE.sql.add('      '+Quotedstr('SEM MANIFESTO'));
  dm.qryManifestacaoNFE.sql.add('   end as MANIFESTO ');
  dm.qryManifestacaoNFE.sql.add('     from nfe_destinadas nf ');
  dm.qryManifestacaoNFE.sql.add('    where nf.data_emissao is not null ');

  if  ( trim(edDe.text) <>  '/  /') then
     dm.qryManifestacaoNFE.sql.add('  and nf.data_emissao  between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte.Date)));

  if (trim ( edChaveNFE.Text) <>'' ) then
   begin
     dm.qryManifestacaoNFE.sql.add(' and nf.chave_nfe='+Quotedstr(trim(edChavenfe.text)));
   end;

  if (rdManifestacao.ItemIndex <> 0) then
   begin
     case rdManifestacao.ItemIndex of
      1: dm.qryManifestacaoNFE.sql.add(' and nf.tipo_manifestacao=0');
      2: dm.qryManifestacaoNFE.sql.add(' and nf.tipo_manifestacao=3');
      3: dm.qryManifestacaoNFE.sql.add(' and nf.tipo_manifestacao=4');
      4: dm.qryManifestacaoNFE.sql.add(' and nf.tipo_manifestacao=1');
      5: dm.qryManifestacaoNFE.sql.add(' and nf.tipo_manifestacao=2');
      6: dm.qryManifestacaoNFE.sql.add(' and nf.tipo_manifestacao=5');

   end;
  end;


  if (rdLancada  .ItemIndex <> 0) then
   begin
     case rdLancada.ItemIndex of
      1: dm.qryManifestacaoNFE.sql.add(' and nf.lancada=1');
      2: dm.qryManifestacaoNFE.sql.add(' and nf.lancada=0');
   end;
  end;


  if (rdXML.ItemIndex <> 0) then
   begin
     case rdXML.ItemIndex of
       1: dm.qryManifestacaoNFE.sql.add(' and nf.caminho_xml is not null ');
       2: dm.qryManifestacaoNFE.sql.add(' and nf.caminho_xml is  null ');
     end;
   end;

  if ( trim(edNumeroNota.Text) <> '' ) then
   begin
    dm.qryManifestacaoNFE.SQL.add(' and nf.numero_nota like '+QuotedStr('%'+edNumeroNota.Text+'%')+' ');
   end;

  if ( trim(edRazaoSocial.Text) <> '') then
   begin
    dm.qryManifestacaoNFE.SQL.add(' and nf.nome_fornecedor like '+QuotedStr('%'+edRazaoSocial.Text+'%')+' ');
   end;

  if  agrupar = false then
    begin
      case rdOrdem.ItemIndex of
       0: dm.qryManifestacaoNFE.sql.add('   order by nf.data_emissao desc ');
       1: dm.qryManifestacaoNFE.sql.add('   order by nf.valor_nota asc');
       2: dm.qryManifestacaoNFE.sql.add('   order by nf.nome_fornecedor asc ');
       3: dm.qryManifestacaoNFE.sql.add('   order by nf.tipo_manifestacao asc ');
      end;
    end
  else
   begin
      case rdOrdem.ItemIndex of
       0: dm.qryManifestacaoNFE.sql.add('   order by nf.tipo_manifestacao,nf.data_emissao desc ');
       1: dm.qryManifestacaoNFE.sql.add('   order by  nf.tipo_manifestacao,nf.valor_nota asc');
       2: dm.qryManifestacaoNFE.sql.add('   order by  nf.tipo_manifestacao,nf.nome_fornecedor asc ');
       3: dm.qryManifestacaoNFE.sql.add('   order by  nf.tipo_manifestacao,nf.tipo_manifestacao asc ');
      end;

   end;

  dm.adicionaLog(dm.qryManifestacaoNFE.SQL.Text);
  dm.qryManifestacaoNFE.Active := true;
  dm.qryManifestacaoNFE.First;
  dm.qryManifestacaoNFE.FetchAll;


  pnQtdNotas.Caption := 'Quantidade de notas: '+IntToStr( dm.qryManifestacaoNFE.RecordCount); 


end;

procedure TfrmCapturaXMLNFE.Copiarchave1Click(Sender: TObject);
begin
  inherited;
  Clipboard.AsText := dm.qryManifestacaoNFECHAVE_NFE.Value;
end;

procedure TfrmCapturaXMLNFE.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmExportaXMLEntradas,frmExportaXMLEntradas);
  frmExportaXMLEntradas.ShowModal;
  frmExportaXMLEntradas.Free;
end;

procedure TfrmCapturaXMLNFE.BitBtn2Click(Sender: TObject);

begin
  inherited;
  Application.CreateForm(TfrmComparaProdutosNFEFornecedor, frmComparaProdutosNFEFornecedor);
  frmComparaProdutosNFEFornecedor.ShowModal;
  frmComparaProdutosNFEFornecedor.Free;


end;

procedure TfrmCapturaXMLNFE.enviaManifestacao(evento : TpcnTpEvento; tipoManifestacao : smallint;   chaveNfe : string);
var
   lmsg : string;
begin

  string_auxiliar:='';
  Application.CreateForm(TfrmObservacaoManifesto,frmObservacaoManifesto);
  frmObservacaoManifesto.ShowModal;
  frmObservacaoManifesto.Free;


  dm.tb_parametros.Active := false;
  dm.tb_parametros.Active := true;
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.EventoNFe.Evento.Clear;
  chaveNfe := dm.qryManifestacaoNFE.fieldbyname('CHAVE_NFE').Value;

  with dm.ACBrNFe1.EventoNFe.Evento.Add do
   begin
     InfEvento.cOrgao   := 91;
     infEvento.chNFe    := dm.qryManifestacaoNFE.fieldbyname('CHAVE_NFE').Value;
     infEvento.CNPJ     := dm.tb_parametrosCNPJ.Value;
     infEvento.dhEvento := now;
     infEvento.tpEvento := evento;
   end;

//   try
//     begin
       dm.ACBrNFe1.EnviarEvento(StrToInt('1'));
//       showmessage('Passou pelo enviar evento');
       if ( trim(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt) <> '') then
         begin
            dm.transacao.Active := false;
          dm.transacao.Active := true;

          dm.adicionaLog('XML DO EVENTO DE MANIFESTAÇÃO');
          dm.adicionaLog(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.XML);

          dm.qryauxiliar.SQL.Clear;
          dm.qryauxiliar.SQL.Add('update nfe_destinadas nf set nf.protocolo_manifestacao='+Quotedstr(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt)+',');
          dm.qryauxiliar.SQL.Add('nf.id_manifestacao='+Quotedstr(dm.AcbrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.Id)+',' );
          dm.qryauxiliar.SQL.add('nf.tipo_manifestacao='+Inttostr(tipoManifestacao));
          dm.qryauxiliar.SQL.add(',nf.obs_manifestacao='+QuotedStr(string_auxiliar));
          dm.qryauxiliar.SQL.add(' where nf.chave_nfe='+Quotedstr(chaveNfe));
//          frm_principal.memo_avisos.Lines := dm.qryauxiliar.sql;
//          frm_principal.memo_avisos.Visible := true;
          dm.qryauxiliar.ExecSQL;

          dm.transacao.Commit;
          dm.transacao.Active := false;
          dm.transacao.Active :=true;
          dm.qryManifestacaoNFE.Active := true;


         end;

//
//     end;
//   except
//    begin
//      Showmessage('Erro ao enviar manifestação!');
//
//    end;
//   end;


  with dm.ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento do
  begin
    lMsg:=
    'Id: '+Id+#13+
    'tpAmb: '+TpAmbToStr(tpAmb)+#13+
    'verAplic: '+verAplic+#13+
    'cOrgao: '+IntToStr(cOrgao)+#13+
    'cStat: '+IntToStr(cStat)+#13+
    'xMotivo: '+xMotivo+#13+
    'chNFe: '+chNFe+#13+
    'tpEvento: '+TpEventoToStr(tpEvento)+#13+
    'xEvento: '+xEvento+#13+
    'nSeqEvento: '+IntToStr(nSeqEvento)+#13+
    'CNPJDest: '+CNPJDest+#13+
    'emailDest: '+emailDest+#13+
    'dhRegEvento: '+DateTimeToStr(dhRegEvento)+#13+
    'nProt: '+nProt;
  end;

  ShowMessage(lmsg);



end;

procedure TfrmCapturaXMLNFE.Atua1Click(Sender: TObject);
var
 chave : string;
begin
  inherited;
  chave := dm.qryManifestacaoNFE.fieldbyname('chave_nfe').Value;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.Add(' update nfe_destinadas nf ');
  dm.qryauxiliar.SQL.Add(' set nf.tipo_manifestacao=1 where nf.chave_nfe='+Quotedstr(chave));
  dm.qryauxiliar.ExecSQL;
  dm.transacao.Commit;
  showmessage('Nota atualizada!');

end;


procedure TfrmCapturaXMLNFE.CinciadaOperao1Click(Sender: TObject);
begin
  inherited;
  if (dm.verificaPermissaoAcao('B40006003') =false) then
   Exit;


   enviaManifestacao(teManifDestCiencia,3,dm.qryManifestacaoNFE.fieldbyname('chave_nfe').Value);

end;

procedure TfrmCapturaXMLNFE.Desconhecimentodaoperao1Click(Sender: TObject);
begin
  inherited;
  if (dm.verificaPermissaoAcao('B40006004') =false) then
   Exit;


  enviaManifestacao(teManifDestDesconhecimento,4,dm.qryManifestacaoNFE.fieldbyname('chave_nfe').Value);
end;

procedure TfrmCapturaXMLNFE.Operaorealizada1Click(Sender: TObject);
begin
  inherited;
  if (dm.verificaPermissaoAcao('B40006005') =false) then
   Exit;


  enviaManifestacao(teManifDestConfirmacao ,1,dm.qryManifestacaoNFE.fieldbyname('chave_nfe').Value);
end;

procedure TfrmCapturaXMLNFE.Operaonorealizda1Click(Sender: TObject);
begin
  inherited;
  if (dm.verificaPermissaoAcao('B40006006') =false) then
   Exit;


  enviaManifestacao(teManifDestOperNaoRealizada ,2,dm.qryManifestacaoNFE.fieldbyname('chave_nfe').Value);
end;

procedure TfrmCapturaXMLNFE.btPesquisarClick(Sender: TObject);
begin
  inherited;

  

  if edAte.Date < edDe.Date then
   begin
    showmessage('Período Inválido');
    edDe.SetFocus;
   end;


  consultaNotasFiscais(false);
end;


procedure TfrmCapturaXMLNFE.itVisualizarDanfeClick(Sender: TObject);
begin
  inherited;

 if  ((dm.qryManifestacaoNFEXML_NOTA.Value = null ) or (dm.qryManifestacaoNFEXML_NOTA.Value ='') ) then
  begin
    dm.exibe_painel_erro('NFE não possui XML baixado','Ok');
    exit;
  end;

  
  dm.ACBrNFe1.NotasFiscais.Clear;
//  dm_relatorios.ACBrNFeDANFEFR1  .FastFile :=patchAplicacao+'DANFePaisagem.fr3';
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromString(dm.qryManifestacaoNFEXML_NOTA.Value ,False);
  dm.ACBrNFe1.NotasFiscais.Imprimir;





end;




procedure TfrmCapturaXMLNFE.processaItensNota(xml_nota : string);
var
 qtdItensNota : integer;
 itemAtual : integer;
 cnpjFornecedor : string;
 codProdutoFornecedor : string;
 cstFornecedor : string;
begin
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromString  (xml_nota,False);

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

     if dm.qryauxiliar.IsEmpty then
      begin

        case   dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual  ].Imposto.ICMS.CST of

         cst00 : cstFornecedor :='00';
         cst10 : cstFornecedor:='10';
         cst20 : cstFornecedor :='20';
         cst30 : cstFornecedor :='30';
         cst40 : cstFornecedor :='40';
         cst41 : cstFornecedor :='41';
         cst45 : cstFornecedor :='45';
         cst50 : cstFornecedor :='50';
         cst51 : cstFornecedor :='51';
         cst60 : cstFornecedor :='60';
         cst70 : cstFornecedor :='70';
         cst80 : cstFornecedor :='80';
         cst81 : cstFornecedor :='81';
         cst90 : cstFornecedor := '90';
         cstVazio : cstFornecedor  :='';
       end;



        case dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual  ].Imposto.ICMS.orig of
         oeNacional :                      cstFornecedor      := '0'+cstFornecedor;
         oeEstrangeiraImportacaoDireta     : cstFornecedor      := '1'+cstFornecedor;
         oeEstrangeiraAdquiridaBrasil      : cstFornecedor      := '2'+cstFornecedor;
         oeNacionalConteudoImportacaoSuperior40      : cstFornecedor      := '3'+cstFornecedor;
         oeNacionalProcessosBasicos      : cstFornecedor      := '4'+cstFornecedor;
         oeNacionalConteudoImportacaoInferiorIgual40      : cstFornecedor      := '5'+cstFornecedor;
         oeEstrangeiraImportacaoDiretaSemSimilar      : cstFornecedor      := '6'+cstFornecedor;
         oeEstrangeiraAdquiridaBrasilSemSimilar      : cstFornecedor      := '7'+cstFornecedor;
         oeNacionalConteudoImportacaoSuperior70      : cstFornecedor      := '8'+cstFornecedor;
        end;

        dm.qryauxiliar.Active := false;
        dm.qryauxiliar.sql.clear;
        dm.qryauxiliar.sql.add('insert into compara_produtos_nfe (cnpj_fornecedor,cod_prod_fornecedor');
        dm.qryauxiliar.sql.add(',descricao_fornecedor,unidade_comercializada,  cfop_fornecedor,cst_fornecedor, ncm,ultima_chave) values (');
        dm.qryauxiliar.sql.add(''+Quotedstr(cnpjFornecedor)+',');
        dm.qryauxiliar.sql.add(''+Quotedstr(codProdutoFornecedor)+',');
        dm.qryauxiliar.sql.add(''+Quotedstr( AnsiUpperCase (dm.AcbrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.xProd))+',');
        dm.qryauxiliar.sql.add(''+Quotedstr(AnsiUpperCase (dm.AcbrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.uTrib) )+',');
        dm.qryauxiliar.sql.add(''+Quotedstr(dm.AcbrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.CFOP)+',');
        dm.qryauxiliar.sql.add(''+Quotedstr(cstFornecedor)+',');
        dm.qryauxiliar.sql.add(''+Quotedstr(dm.AcbrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.NCM )+',');
        dm.qryauxiliar.sql.add(''+Quotedstr( dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe)+')');

  //      frm_principal.memo_avisos.Lines.clear;
        dm.qryauxiliar.ExecSQL;
      end
     else
      begin
        dm.qryauxiliar.Active := false;
        dm.qryauxiliar.sql.clear;
        dm.qryauxiliar.sql.add('update compara_produtos_nfe cp set ultima_chave='+Quotedstr( dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.chNFe));
        dm.qryauxiliar.sql.add(' where cp.cnpj_fornecedor='+Quotedstr(cnpjFornecedor));
        dm.qryauxiliar.SQL.add('   and cod_prod_fornecedor='+Quotedstr(codProdutoFornecedor));
        dm.qryauxiliar.ExecSQL;

      end;

   end;


end;


procedure TfrmCapturaXMLNFE.BitBtn4Click(Sender: TObject);
var

 docAtual : integer;
 qtdeDocumentosRetornados : Integer;
  DFe: TdocZipCollectionItem;
   cUFAutor,  ultNSU, ANSU: string;
  achouDocumentos : boolean;
  caminhoArquivo : string;
  incluirEvento : boolean;
  tipoEvento : integer;
  xmlNota : string;

  tentativasConsulta : integer;
  consultouComSucesso : boolean;
begin                                                                                             inherited;
pnAguarde.Visible := true;
//
//  cdsDistDFE.CreateDataSet;
//  cdsDistDFE.Active := true;
//  cdsDistDFE.EmptyDataSet;

 dm.tb_parametros.Active := false;
 dm.tb_parametros.Active := true;
 cUFAutor := '29';
 ultNSU := dm.tb_parametrosULT_NSU_NFE_DEST.Value;
 ANSU := '';
 achouDocumentos := true;

 while achouDocumentos  do
 begin
     tentativasConsulta :=0;
     consultouComSucesso := false;
     qtdeDocumentosRetornados :=0;
     while ( (tentativasConsulta <= 10 ) and (consultouComSucesso = false) )   do
      begin

          Application.ProcessMessages;

         try
          dm.ACBrNFe1.Configuracoes.WebServices.TimeOut := 6000;
          dm.ACBrNFe1.DistribuicaoDFe(StrToInt(cUFAutor),CNPJ,ultNSU,ANSU);
          qtdeDocumentosRetornados := dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count;
          dm.adicionaLog('Retornou '+Inttostr(qtdeDocumentosRetornados));
          consultouComSucesso := true;
         except
             on E : Exception  do
              begin
                dm.adicionaLog('Erro ao consultar DFE' +e.Message);
                qtdeDocumentosRetornados :=0;
                tentativasConsulta := tentativasConsulta +1;
                dm.adicionaLog('Tentativa nº '+IntToStr(tentativasConsulta)+' de DFE');
                sleep(800);
              end;
         end;


      end;

      if (tentativasConsulta >= 10) and (consultouComSucesso = false) then
       begin
        pnAguarde.Visible := false;
        dm.exibe_painel_erro('Foram feitas 10 tentativas de consulta sem sucesso ao webservice de distribuição.'+#13+'É possível que a rede da SEFAZ esteja congestionada ou a sua conexão com a internet esteja ruim. Aguarde alguns minutos e tente novamente.'+#13
                             +#13+' Se o erro persistir, entre em contato com a Real Softwares','Ok');
                             exit;

       end;



      if qtdeDocumentosRetornados > 0 then
       begin
         achouDocumentos :=true;
         ultNSU := dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU;
         dm.adicionaLog('Ultimo NSU: '+ultNSU);


          docAtual :=0;

          for docAtual :=0 to qtdeDocumentosRetornados -1 do
           begin
             Application.ProcessMessages;
                DFe := DM.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[docAtual];
                             case DFe.schema of
                  schprocNFe: ;  // NFe completa
                  schresNFe: ;  // NFe resumo


                  schresEvento: begin



                                      dm.adicionaLog('Evento pego em schresEvento');
                                      dm.adicionaLog(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[ docAtual ].XML)
                                end; // Evento completo

                  schprocEventoNFe: begin
                                      registraEventoNFEDestinada(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[ docAtual ].procEvento.chDFe,
                                                                 dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[ docAtual ].procEvento.tpEvento,
                                                                 dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[ docAtual ].procEvento.detEvento.xJust,
                                                                 dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[ docAtual ].procEvento.dhEvento);



                                      dm.adicionaLog('Evento pego em schprocEventoNFe ');
                                      dm.adicionaLog(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[ docAtual ].XML)
                                    end; // Evento completo
                end;





               if  ( trim ( dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.chDFe) <> '' ) then
              begin



               if ( (dfe.schema = schprocNFe)  or (dfe.schema = schresNFe) ) then
                begin
                   if (DFe.schema = schresNFe) then
                    begin
                      dm.transacao.Active := true;
                      dm.qryauxiliar.SQL.Clear;
                      dm.qryauxiliar.Active := false;
                      dm.qryauxiliar.sql.Clear;
                      dm.qryauxiliar.SQL.Add(' select * from nfe_destinadas nf where nf.chave_nfe='+Quotedstr(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.chDFe));
                      dm.qryauxiliar.Active := true;
                      if dm.qryauxiliar.IsEmpty  then
                       begin
                          dm.qryauxiliar.Active := false;
                          dm.qryauxiliar.sql.clear;
                          dm.qryauxiliar.sql.add('insert into NFE_DESTINADAS (chave_nfe,cnpj,ie,nome_fornecedor,data_emissao,numero_nota,status_nfe,tipo_manifestacao,valor_nota) values (');
                          dm.qryauxiliar.sql.add(''+Quotedstr(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.chDFe)+',');
                          dm.qryauxiliar.sql.add(''+Quotedstr(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.CNPJCPF)+',');
                          dm.qryauxiliar.sql.add(''+Quotedstr(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.IE)+',');
                          dm.qryauxiliar.sql.add(''+Quotedstr(UpperCase(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.xNome))+',');
                          dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YY',dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.dhEmi) )+',');
                          dm.qryauxiliar.sql.add(''+Quotedstr(FormatFloat('000000000000000', StrToFloat( copy(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.chDFe,26,9))))+',');
                          dm.qryauxiliar.sql.add(''+Quotedstr('0')+',');
                          dm.qryauxiliar.sql.add(Inttostr(0) +',');
                          dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(FloatToStr(dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].resDFe.vNF))+')');
                          dm.adicionaLog(dm.qryauxiliar.SQL.Text);

                          try
                           dm.qryauxiliar.ExecSQL;
                          except
                             begin
                               Showmessage('Erro ao inserir nota no banco!');
                               frm_principal.memo_avisos.Lines.Clear;
                               frm_principal.memo_avisos.Lines := dm.qryauxiliar.SQL;
                               frm_principal.memo_avisos.Visible := true;
                               dm.adicionaLog(dm.qryauxiliar.SQL.text);
                             end;
                          end;


                       end;
                      dm.transacao.Commit;
                    end

                   else
                    begin
                      dm.ACBrNFe1.NotasFiscais.Clear;
                      xmlNota := '';

                      xmlNota :=  dm.ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip[docAtual].XML;
                      try
                        dm.ACBrNFe1.NotasFiscais.LoadFromString(xmlNota  , false);
                      Except
                      end;
                      if dm.ACBrNFe1.NotasFiscais.Count > 0 then
                       begin
                         if dm.ACBrNFe1.NotasFiscais[0].NFe.Dest.CNPJCPF = cnpj  then
                          begin
                            dm.ACBrNFe1.NotasFiscais[0].GravarXML(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'-nfe.xml',patchXMLEntradas);
                            caminhoArquivo :=patchXMLEntradas+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'-nfe.xml';

                            dm.transacao.Active := true;
                            dm.qryauxiliar.SQL.Clear;
                            dm.qryauxiliar.Active := false;
                            dm.qryauxiliar.sql.Clear;
                            dm.qryauxiliar.SQL.Add(' select * from nfe_destinadas nf where nf.chave_nfe='+Quotedstr(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)));
                            dm.qryauxiliar.Active := true;
                            if dm.qryauxiliar.IsEmpty  then
                             begin
                                dm.qryauxiliar.Active := false;
                                dm.qryauxiliar.sql.clear;
                                dm.qryauxiliar.sql.add('insert into NFE_DESTINADAS (chave_nfe,cnpj,ie,nome_fornecedor,data_emissao,numero_nota,status_nfe,tipo_manifestacao,valor_nota,caminho_xml,xml_nota) values (');
                                dm.qryauxiliar.sql.add(''+Quotedstr(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60))+',');
                                dm.qryauxiliar.sql.add(''+Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF)+',');
                                dm.qryauxiliar.sql.add(''+Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.IE)+',');
                                dm.qryauxiliar.sql.add(''+Quotedstr(UpperCase(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.xNome))+',');
                                dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YY',dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.dEmi) )+',');
                                dm.qryauxiliar.sql.add(''+Quotedstr(FormatFloat('000000000000000', dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF))+',');
                                dm.qryauxiliar.sql.add(''+Quotedstr('0')+',');
                                dm.qryauxiliar.sql.add(Inttostr(1) +',');
                                dm.qryauxiliar.sql.add(''+dm.TrocaVirgPPto(FloatToStr(dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF))+',');
                                dm.qryauxiliar.sql.add(''+Quotedstr(caminhoArquivo)+',');
                                dm.qryauxiliar.sql.add(''+Quotedstr(xmlNota  )+')');
                                dm.adicionaLog(dm.qryauxiliar.SQL.Text);

                                try
                                 dm.qryauxiliar.ExecSQL;
                                except
                                   begin
                                     pnAguarde.Visible := false;
                                     Showmessage('Erro ao inserir nota no banco!');
                                     frm_principal.memo_avisos.Lines.Clear;
                                     frm_principal.memo_avisos.Lines := dm.qryauxiliar.SQL;
                                     frm_principal.memo_avisos.Visible := true;
                                     dm.adicionaLog(dm.qryauxiliar.SQL.text);
                                   end;
                                end;
                             end

                            else
                             begin
                               if ( (dm.qryauxiliar.FieldByName('tipo_manifestacao').value <> 2) and (dm.qryauxiliar.FieldByName('tipo_manifestacao').value <> 4))  then
                                begin
                                  dm.qryauxiliar.Active := false;
                                  dm.qryauxiliar.sql.clear;
                                  dm.qryauxiliar.sql.add('update nfe_destinadas set ');
                                  dm.qryauxiliar.SQL.Add(' xml_nota='+Quotedstr(xmlNota ));
                                  dm.qryauxiliar.SQL.Add(' ,caminho_xml='+Quotedstr(caminhoArquivo));
                                  dm.qryauxiliar.sql.add(' where chave_nfe='+Quotedstr(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60))+'');
                                  dm.adicionaLog(dm.qryauxiliar.SQL.Text);
                                  try
                                   dm.qryauxiliar.ExecSQL;
                                  except
                                     begin
                                       pnAguarde.Visible := false;
                                       Showmessage('Erro ao atualizar nota no banco!');
                                       frm_principal.memo_avisos.Lines.Clear;
                                       frm_principal.memo_avisos.Lines := dm.qryauxiliar.SQL;
                                       frm_principal.memo_avisos.Visible := true;
                                       dm.adicionaLog(dm.qryauxiliar.SQL.text);
                                     end;
                                  end;
                                end;
                             end;
                            dm.transacao.Commit;
                          end;
                       end;

                    end;

                    dm.transacao.Active := true;
                    dm.tb_parametros.Active := true;
                    dm.tb_parametros.edit;
                    dm.tb_parametrosULT_NSU_NFE_DEST.Value := ultNSU;
                    dm.tb_parametros.Post;
                    pnNSU.Caption := 'Último NSU: '+dm.tb_parametrosULT_NSU_NFE_DEST.Value;
                    dm.transacao.Commit;

                end
               else
                begin
                
                end;




              end;


           end;

       end
     else
      begin
        achouDocumentos := false;
      end;

 end;

 pnAguarde.Visible := false;
end;


procedure TfrmCapturaXMLNFE.tmAguardeTimer(Sender: TObject);
begin
  inherited;
  AdvCircularProgress1.Position := AdvCircularProgress1.Position +1;
  tmAguarde.Enabled := True;
end;

procedure TfrmCapturaXMLNFE.BitBtn5Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCapturaXMLNFE.ProcessarNotas();
var
 codFornecedor : string;
 caminhodaNFE : string;
 qryNotasNaoProcessadas : TIBquery;
begin

 qryNotasNaoProcessadas:= TIBQuery.create(self);
 qryNotasNaoProcessadas.Database := dm.dbrestaurante;
 qryNotasNaoProcessadas.Transaction := dm.transacao;

 dm.transacao.Active := false;
 dm.transacao.StartTransaction;

 qryNotasNaoProcessadas.Active := false;
 qryNotasNaoProcessadas.SQL.Clear;
 qryNotasNaoProcessadas.SQL.Add('   select * from nfe_destinadas nf where  nf.xml_nota <> '+Quotedstr(''));
 qryNotasNaoProcessadas.SQL.Add('       and nf.processada=0 ');

 dm.adicionaLog(qryNotasNaoProcessadas.SQL.Text);


 qryNotasNaoProcessadas.Active := true;
 qryNotasNaoProcessadas.First;

 if qryNotasNaoProcessadas.IsEmpty = false then
  begin


     while not qryNotasNaoProcessadas.Eof do
      begin
        try
         begin
          processaFornecedorNota(qryNotasNaoProcessadas.FieldByName('xml_nota').value);
          processaItensNota(qryNotasNaoProcessadas.FieldByName('xml_nota').value);

          dm.qryauxiliar.Active := false;
          dm.qryauxiliar.sql.clear;
          dm.qryauxiliar.sql.add('update nfe_destinadas nf set nf.processada=1 where chave_nfe='+Quotedstr(qryNotasNaoProcessadas.fieldbyname('chave_nfe').Value));
          dm.qryauxiliar.ExecSQL;


          qryNotasNaoProcessadas.Next;
        end
       except
         begin
           showmessage('Erro ao processar nota '+dm.qryauxiliar.FieldByName('chave_nfe').Value);
//           frm_principal.memo_avisos.Visible := true;
           frm_principal.memo_avisos.Lines.add('Erro ao processar nota '+dm.qryauxiliar.FieldByName('chave_nfe').Value);
           exit;
         end;
       end

      end;




  end;
  dm.transacao.Commit;
  dm.transacao.Active := false;
  dm.transacao.Active := true;



end;


procedure TfrmCapturaXMLNFE.processaFornecedorNota( xml_nota: string);
var
  codFornecedor : string;
begin
  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromString(xml_nota,False);

  if ( verificaExistenciaFornecedorCNPJ( dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF) = false ) then
   begin
      codFornecedor  :=dm.geraCodigo('G_FORNECEDORES_CODIGO',4);

      dm.qryauxiliar2.Active := false;
      dm.qryauxiliar2.sql.clear;
      dm.qryauxiliar2.sql.Add('insert into fornecedor (cod_fornecedor,razao_social,nome_fantasia,endereco,');
      dm.qryauxiliar2.sql.Add('bairro,cep,telefone,cod_cidade,CGC_CPF,inscricao_estadual,cod_estado ) values (');
      dm.qryauxiliar2.SQL.Add(''+Quotedstr(codFornecedor)+',');


      dm.qryauxiliar2.SQL.Add(''+Quotedstr(AnsiUpperCase(  dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.xNome) )+',');
      dm.qryauxiliar2.SQL.Add(''+Quotedstr(AnsiUpperCase ( dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.xFant) )+',');
      dm.qryauxiliar2.SQL.Add(''+Quotedstr(AnsiUpperCase (  dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.xLgr +' '+dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.xCpl+ ' '+ dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.nro )  )+  ',');
      dm.qryauxiliar2.SQL.Add(''+Quotedstr(AnsiUpperCase (  dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.xBairro  ))+',');
      dm.qryauxiliar2.SQL.Add(''+Quotedstr( Inttostr( dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.CEP) )+',');
      dm.qryauxiliar2.SQL.Add(''+Quotedstr(dm.AcbrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.fone )+',');
      dm.qryauxiliar2.SQL.Add(''+Quotedstr(  Inttostr( dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.cMun  )  )+',');
      dm.qryauxiliar2.SQL.Add(''+Quotedstr( dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF  )+',');
      dm.qryauxiliar2.SQL.Add(''+Quotedstr(dm.AcbrNFe1.NotasFiscais[0].NFe.Emit.IE  )+',');
      dm.qryauxiliar2.SQL.Add(''+Quotedstr( getCodEstadoUF(dm.AcbrNFe1.NotasFiscais[0].NFe.Emit.EnderEmit.UF ))+')');


      try
        begin
         dm.qryauxiliar2.ExecSQL;
        end;
      except
         begin
           dm.adicionaLog('Erro ao incluir fornecedor automaticamente');
           dm.adicionaLog(dm.qryauxiliar2.SQL.Text);
           exit;
         end;
      end


  end
  else
    begin
    end;

end;


procedure TfrmCapturaXMLNFE.registraEventoNFEDestinada(chave : string ; evento : TpcnTpEvento; descricao: string;  dataHora : TDateTime);
var
 qryEvento : TIBQuery;
 ts: TIBTransaction;
 tipoManifestacao : string;
 statusNota : string;


begin

  ts      :=   TIBTransaction.Create(self);
  ts.DefaultDatabase   :=  dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;
  qryEvento := TIBQuery.Create(self);
  qryEvento.Database :=dm.dbrestaurante;
  qryEvento.Transaction := ts;
  qryEvento.Active := false;
  statusNota :='1';

  TRY

//    case AnsiIndexStr(UpperCase(evento), ['210210', '210200','210220','210240','110111']) of
   case evento  of


     teManifDestCiencia :
       begin
        tipoManifestacao := '3';
       end;

     teManifDestConfirmacao  :
       begin
          tipoManifestacao := '1';
       end;

     teManifDestDesconhecimento :
       begin
          tipoManifestacao := '4';
       end;

     teManifDestOperNaoRealizada  :
       begin
          tipoManifestacao := '2';
       end;

     teCancelamento   :
       begin
          tipoManifestacao := '5';
          statusNota :='3';
       end;

     else
      begin
        // Ignorar evento
        tipoManifestacao :='0';
      end;


    end;

    if StrToInt(tipoManifestacao) > 0  then
     begin
       qryEvento.Active := false;
       qryEvento.SQL.Clear;
       qryEvento.SQL.Add('update nfe_destinadas nf set tipo_manifestacao='+tipoManifestacao+',');
       qryEvento.SQL.Add('DATA_EVENTO_RECEBIDO='+Quotedstr(FormatDateTime('DD.MM.YYY HH:MM:SS',dataHora))+',');
       qryEvento.SQL.Add('descricao_evento='+Quotedstr(descricao)+',');
       qryEvento.SQL.Add('status_nfe='+Quotedstr(statusNota)+' ');
       qryEvento.SQL.Add(' where nf.chave_nfe='+Quotedstr(chave));


       try
         dm.adicionaLog('Registro do evento na base');
         dm.adicionaLog(qryEvento.SQL.Text);
         qryEvento.ExecSQL;
         ts.Commit;
       except
         dm.adicionaLog('Erro ao registrar evento!');
         ts.Rollback;
         raise Exception.Create('Error ao atualizar evento na tabela de notas destinadas');
       end;
     end;

  FINALLY
    qryEvento.Active := false;
    ts.Active := false;
    FreeAndNil(qryEvento);
    FreeAndNil(ts);
  END;


end;

procedure TfrmCapturaXMLNFE.BitBtn3Click(Sender: TObject);
begin
  inherited;
  consultaNotasFiscais(true);

  if dm.qryManifestacaoNFE.IsEmpty then
   begin
     showmessage('Não há notas para imprimir!');
   end
  else
   begin
      dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relManifestacao.fr3',true);
      dm_relatorios.setPeriodoRelatorio('De  '+ edDe.Text +'  até  '+edAte .Text);
      dm_relatorios.rpt.ShowReport(true);
      consultaNotasFiscais(false);   
   end;
end;

procedure TfrmCapturaXMLNFE.processaNotasEntrada();
begin
  inherited;
  ProcessarNotas();
  pnAguarde.Visible := false;
  pnProcessando.Visible := false;
  tmAguarde.Enabled := false;

end;

procedure TfrmCapturaXMLNFE.itCancelarEntradaClick(Sender: TObject);
var
 chave : string;
begin
  inherited;

  if (dm.verificaPermissaoAcao('B40006007') = true) then
   begin
    if MessageDlg('Confirma cancelamento da entrada ?',mtConfirmation,[mbYes,mbno],0) = mrYes   then
     begin
        chave := dm.qryManifestacaoNFECHAVE_NFE.Value;
        try
          dm.transacao.Active := false;
          dm.transacao.Active := true;
          dm.qryauxiliar.SQL.Clear;
          dm.qryauxiliar.SQL.Add(' execute procedure cancelar_entrada('+Quotedstr(chave)+',2)');
          dm.qryauxiliar.ExecSQL;
          dm.transacao.Commit;
          dm.qryauxiliar.Active := false;
          showmessage('Entrada cancelada!');
          btPesquisar.Click;
        except
          dm.transacao.Rollback;
          showmessage('Ocorreu um erro ao processar o cancelamento!');
        end;
     end;
   end;




end;

procedure TfrmCapturaXMLNFE.itLancarNotasEntradaClick(Sender: TObject);
var
 xmlNota : string;
 recno : integer;
 produtosNaoAssociados : string;
 itemAtual: Integer;
 codigosProdutosNFE : string;

begin
  inherited;

  if (dm.verificaPermissaoAcao('B40006008') =false) then
   Exit;


 recno :=   dm.qryManifestacaoNFE.RecNo;
 if  ((dm.qryManifestacaoNFEXML_NOTA.Value = null ) or (dm.qryManifestacaoNFEXML_NOTA.Value ='') ) then
  begin
    dm.exibe_painel_erro('NFE não possui XML baixado','Ok');
    exit;
  end;

 if  (dm.qryManifestacaoNFELANCADA.value =1 ) then
  begin
    dm.exibe_painel_erro('NFE Já foi lançada!','Ok');
    exit;
  end;

  xmlNota  := dm.qryManifestacaoNFEXML_NOTA.Value;

  try
   begin
    pnAguarde.Visible := True;
    pnProcessando.Visible := true;
    tmAguarde.Enabled := true;
    processaNotasEntrada();
   end
  except
     begin
       showmessage('Erro ao iniciar Thread de processamento de notas!');
     end;
  end;





 dm.ACBrNFe1.NotasFiscais.Clear;
 dm.ACBrNFe1.NotasFiscais.LoadFromString (xmlNota  ,False);
 dm.transacao.Commit;
 dm.transacao.StartTransaction;


 codigosProdutosNFE :='';

 for itemAtual  := 0 to dm.ACBrNFe1.NotasFiscais[0].NFe.det.Count-1 do
 begin
   codigosProdutosNFE := codigosProdutosNFE   + Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.Det[itemAtual].Prod.cProd)+',';
 end;


  codigosProdutosNFE := Copy(codigosProdutosNFE, 0,codigosProdutosNFE.Length-1);
// codigosProdutosNFE.Remove(codigosProdutosNFE.Length-1,2);

  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select * from compara_produtos_nfe where cnpj_fornecedor='+Quotedstr(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF) +' and cod_produto_interno is null');
  dm.qryauxiliar.SQL.add( ' and cod_prod_fornecedor in ('+codigosProdutosNFE+')');
  dm.adicionaLog(dm.qryauxiliar.SQL.Text);
  dm.qryauxiliar.active := true;





 if dm.qryauxiliar.IsEmpty = false then
  begin
    dm.exibe_painel_erro('Existe produtos deste fornecedor que ainda não foram asssociados. Faça a associação dos produtos na tela a seguir e tente novamente!','Ok');
    Application.CreateForm(TfrmComparaProdutosNFEFornecedor, frmComparaProdutosNFEFornecedor);
    frmComparaProdutosNFEFornecedor.setCodFornecedorAssociar(getCodFornecedorViaCNPJ(dm.ACBrNFe1.NotasFiscais[0].NFe.Emit.CNPJCPF), codigosProdutosNFE);
    frmComparaProdutosNFEFornecedor.ShowModal;
    frmComparaProdutosNFEFornecedor.Free;
    btPesquisar.Click;
    dm.qryManifestacaoNFE.RecNo := recno;
    exit;
  end
 else
  begin
    try
      Application.CreateForm(Tfrm_entradas, frm_entradas);
      frm_entradas.processaXML := true;
      frm_entradas.showmodal;
      frm_entradas.Free;
    except
       begin
        Showmessage('Erro ao abrir formulário das entradas!');
       end;
    end;

  end;


  btPesquisar.Click;
end;

procedure TfrmCapturaXMLNFE.FormCreate(Sender: TObject);
begin
  inherited;
     dm.ACBrNFe1.Configuracoes.Geral.ModeloDF              := moNFe;
//     DM.ACBrNFe1.DANFE := dm_relatorios.ACBrNFeDANFEFR1;
end;

procedure TfrmCapturaXMLNFE.Edit1Exit(Sender: TObject);
begin
  inherited;
  if (sender is TCustomEdit and ((sender as TCustomEdit).Name='edNumeroNota')) then
   begin
    if (trim(edNumeroNota.text) <> '')
     then
      begin
         try
           edNumeroNota.Text:= FormatFloat('000000000000000',StrToFloat(edNumeroNota.Text));
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

procedure TfrmCapturaXMLNFE.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dm.tb_parametros.Active := true;
  dm.tb_parametros.Edit;
  dm.tb_parametrosULT_NSU_NFE_DEST.Value :='0';
  dm.tb_parametros.Post;
  pnNSU.Caption := 'Último NSU: ';
  dm.transacao.Commit;
  dm.transacao.Active := false;
  dm.transacao.Active :=true;

end;

end.
