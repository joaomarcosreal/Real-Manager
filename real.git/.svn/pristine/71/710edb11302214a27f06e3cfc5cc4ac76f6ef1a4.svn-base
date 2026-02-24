unit uRelAuditoriaMesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, WinInet,
  Dialogs, uu_modelo_Vazio, StdCtrls, Buttons, Mask,  ExtCtrls,
  Grids, DBGrids, ACBrNFe, pcnConversaoNFE, pcnConversao, xmldom, Provider, Xmlxform, DB,
  DBClient, IdBaseComponent, IdThreadComponent,  XMLintf, XMLDoc, ComCtrls,ActiveX,
  msxmldom, AdvCircularProgress,GifImage ,UrlMon, MSHtml, ACBrUtil, pcnAuxiliar, ACBrNFeNotasFiscais,
  ACBrBase, ACBrDFe, OleCtrls, SHDocVw;
type
  TfrmConsultaNotasDestinadas = class(Tfrm_modelo_vazio)



    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    memoRespWS: TMemo;
    ACBrNFe1: TACBrNFe;
    xmlPVD: TXMLTransformProvider;
    cds: TClientDataSet;
    dsXMLPvd: TDataSource;
    cdsNSU: TStringField;
    cdschNFe: TStringField;
    cdsCNPJ: TStringField;
    cdsxNome: TStringField;
    cdsIE: TStringField;
    cdsdEmi: TStringField;
    cdstpNF: TStringField;
    cdsvNF: TStringField;
    cdsdigVal: TStringField;
    cdsdhRecbto: TStringField;
    cdscSitNFe: TStringField;
    cdscSitConf: TStringField;
    td: TIdThreadComponent;
    pnAguarde: TPanel;
    lbAguarde: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qtdNotas: TLabel;
    qtdErros: TLabel;
    tmAguarde: TTimer;
    AdvCircularProgress1: TAdvCircularProgress;
    Panel3: TPanel;
    btn1: TBitBtn;
    pnPegarXML: TPanel;
    Panel5: TPanel;
    Image1: TImage;
    lbNovaImagem: TLabel;
    edtCaptcha: TEdit;
    Label6: TLabel;
    btnPegarHTML: TBitBtn;
    edtChaveNFe: TEdit;
    Memo2: TMemo;
    btnNovaConsulta: TBitBtn;
    WebBrowser1: TWebBrowser;
    WBXML: TWebBrowser;
    ProgressBar1: TProgressBar;
    lblStatus: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qtdSemRetorno: TLabel;
    lbConsultasSemRetorno: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    edIteracoes: TEdit;
    Label8: TLabel;
    ckbNsu: TCheckBox;


    procedure BitBtn2Click(Sender: TObject);
    

    function ReplaceString(Str:String; SearchStr:string; NewStr:String):String;
    procedure tdRun(Sender: TIdCustomThreadComponent);
    procedure btn1Click(Sender: TObject);
    procedure tmAguardeTimer(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

    procedure GeraXml;
    procedure PegarHTML;
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);

    function DownloadFile(SourceFile, DestFile: string): Boolean;
  procedure  NovaConsulta;
   procedure DeleteIECache;
    procedure btnPegarHTMLClick(Sender: TObject);
    procedure WebBrowser1ProgressChange(Sender: TObject; Progress,
      ProgressMax: Integer);
    procedure btnNovaConsultaClick(Sender: TObject);
    procedure lbNovaImagemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCaptchaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FPath: string;
  end;

var
  frmConsultaNotasDestinadas: TfrmConsultaNotasDestinadas;

implementation

uses uu_data_module, uu_frm_principal, ComObj, uuCapturaXMLNFE;

{$R *.dfm}

procedure TfrmConsultaNotasDestinadas.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;


function TfrmConsultaNotasDestinadas.ReplaceString(Str:String; SearchStr:string; NewStr:String):String;
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



procedure TfrmConsultaNotasDestinadas.tdRun(
  Sender: TIdCustomThreadComponent);
var
 CNPJ, IndNFe, IndEmi, ultNSU: string;
 NSUAntesErro : string;
 ok: boolean;
 ct : integer;
 ctLinhas : integer;
 ctNada : integer;
 posicao : integer;
 novaString : string;
 linhas : TStringList;
 caminhoArqXML : string;
 parar : Boolean;
 notasAdicionadasBanco : Integer;

begin


  CoInitialize(nil);
  memoRespWS.Clear;
  dm.tb_parametros.Active := false;
  dm.tb_parametros.Active := True;
  ACBrNFe1.Configuracoes.Certificados.NumeroSerie := Trim(dm.tb_parametrosNUM_SERIE_CERTIFICADO.Value);
  ACBrNFe1.Configuracoes.Certificados.Senha       := Trim(dm.tb_parametrosSENHA_CERTIFICADO.Value);



  qtdNotas.Caption := '0';
  qtdErros.Caption := '0';


  linhas :=TStringList.Create;
  CNPJ := '';
  indNFe := '0';
  IndEmi := '0';

  if ckbNsu.Checked  then
   ultNSU := dm.tb_parametrosULT_NSU_NFE_DEST.Value
  else
   ultNSU :='0';


  ctnada :=0;
  memoRespWS.Lines.Add('<?xml version="1.0" encoding="ISO-8859-1" ?>');
  memoRespWS.Lines.Add('<notasFiscais>');
  parar := false;
  notasAdicionadasBanco :=0;

  while (parar = False) do
   begin
    try
     begin
        frmConsultaNotasDestinadas.Repaint;
        NSUAntesErro := ultNSU;
        Sleep(100);

        ACBrNFe1.ConsultaNFeDest(dm.tb_parametrosCNPJ.Value ,
                               StrToIndicadorNFe(ok,indNFe),
                               StrToIndicadorEmissor(ok,IndEmi),
                              ultNSU);




        ultNSU := AcbrNFe1.WebServices.ConsNFeDest.retConsNFeDest.ultNSU;

        if ( (Trim(AcbrNFe1.WebServices.ConsNFeDest.retConsNFeDest.xMotivo) <> 'Nenhum documento localizado para o destinatario') and (Trim(AcbrNFe1.WebServices.ConsNFeDest.retConsNFeDest.xMotivo) <> '2999 - Falha nao tratada') ) then
                 begin
                  linhas.Clear;
                  posicao := pos('</ultNSU>',AcbrNFe1.WebServices.ConsNFeDest.retConsNFeDest.XML);
                  novaString := AcbrNFe1.WebServices.ConsNFeDest.retConsNFeDest.XML;
                  novastring:= copy(novaString,posicao+9,length(novaString));
                  posicao:= pos('</retConsNFeDest>',novaString);
                  novastring:= copy(novaString,0,posicao-1);
                  novaString := ReplaceString(novastring,'<ret>','#');
                  novaString := ReplaceString(novastring,'</ret>','');
                  novaString := ReplaceString(novastring,'&','');
                  ExtractStrings(['#'],[], PChar(novaString), linhas);

                  if linhas.Count > 0 then
                  begin
                    for ctLinhas :=0 to linhas.Count - 1 do
                     begin
                       memoRespWS.Lines.Add(linhas[ctLinhas]);
                       qtdNotas.Caption := Inttostr(StrToInt(qtdNotas.Caption) + 1);

                       //quando quiser parar para não pegar todas as notas

//                       if (StrToInt(qtdNotas.Caption) >=5) then
  //                      parar := True;

                     end;
                  end;
                  ctnada:=0;
                  qtdSemRetorno.Caption :='0';
                  qtdSemRetorno.Visible := false;
                  lbConsultasSemRetorno.Visible := false;
                  lbAguarde.Repaint;
                 end
               else
                begin
                  ctNada := ctnada+1;
                  qtdSemRetorno.Caption := IntToStr(ctNada);
                  qtdSemRetorno.Visible := True;
                  lbConsultasSemRetorno.Visible := True;
                  frmConsultaNotasDestinadas.Repaint;
                  lbAguarde.Repaint;

                 if ( ctNada > StrToInt(edIteracoes.text ) )  then
                   parar := True;
                end;
     end
    except
      begin
       ultNSU := NSUAntesErro;
       qtdErros.Caption := IntToStr(strToInt(qtdErros.caption) + 1);
       if (strToInt(qtdErros.caption) > 20) then
        begin
          parar := true;
        end;
      end;
    end;
   end;

  if (StrToInt(qtdNotas.Caption) > 0 ) then
   begin
   memoRespWS.Lines.Add('</notasFiscais>');
   caminhoArqXML := patchAplicacao+'NotasRetornadas'+FormatDateTime('YYMMDD',date)+FormatDateTime('HHMMSS',time)+'.xml';
   memoRespWS.Lines.SaveToFile(caminhoArqXML);
   xmlPVD.TransformRead.TransformationFile := patchAplicacao+'notasEmitidas.xtr';
   xmlPVD.XMLDataFile := caminhoArqXML;
   cds.Active := true;
    pnAguarde.Visible := false;
   tmAguarde.Enabled := false;
   notasAdicionadasBanco :=0;

   cds.First;
    while not cds.Eof do
     begin
        if dm.transacao.Active = false then dm.transacao.Active := True;

         dm.qryauxiliar.Active := false;
         dm.qryauxiliar.SQL.clear;
         dm.qryauxiliar.sql.add('select * from NFE_DESTINADAS where chave_nfe='+Quotedstr(cdschNFe.Value));
         dm.qryauxiliar.Active := True;


         if dm.qryauxiliar.IsEmpty then
          begin
            dm.qryauxiliar.Active := false;
            dm.qryauxiliar.sql.clear;
            dm.qryauxiliar.sql.add('insert into NFE_DESTINADAS (chave_nfe,cnpj,ie,nome_fornecedor,data_emissao,numero_nota,status_nfe,valor_nota) values (');
            dm.qryauxiliar.sql.add(''+Quotedstr(cdschNFe.Value)+',');
            dm.qryauxiliar.sql.add(''+Quotedstr(cdsCNPJ.Value)+',');
            dm.qryauxiliar.sql.add(''+Quotedstr(cdsIE .Value)+',');
            dm.qryauxiliar.sql.add(''+Quotedstr(UpperCase(cdsxNome.Value))+',');
            dm.qryauxiliar.sql.add(''+Quotedstr(copy(cdsdEmi.value,9,2)+'.'+copy(cdsdEmi.value,6,2)+'.'+copy(cdsdEmi.value,0,4) )+',');
            dm.qryauxiliar.sql.add(''+Quotedstr(FormatFloat('000000000000000', StrToFloat( copy( cdschNFe.Value,26,9))))+',');
            dm.qryauxiliar.sql.add(''+Quotedstr(cdscSitNFe.Value)+',');
            dm.qryauxiliar.sql.add(''+Quotedstr(cdsvNF.Value)+')');
            dm.qryauxiliar.ExecSQL;
            notasAdicionadasBanco := notasAdicionadasBanco + 1;
          end;
        cds.Next;
     end;


    dm.tb_parametros.Edit;
    dm.tb_parametrosULT_NSU_NFE_DEST.Value := ultNSU;
    dm.tb_parametros.Post;
    if dm.transacao.Active = false then dm.transacao.Active := True;
    dm.transacao.Commit;
    ShowMessage(IntToStr(notasAdicionadasBanco)+' adicionadas ao banco de dados!');
    td.Stop;
    exit;
   end
  else
    begin
      ShowMessage('Não há novas notas no repositório da Secretaria da Fazenda!');
    end;


end;

procedure TfrmConsultaNotasDestinadas.btn1Click(Sender: TObject);
begin
  inherited;
  pnAguarde.Visible := True;
  tmAguarde.Enabled := true;
  frmConsultaNotasDestinadas.Repaint;
  td.Start;
end;

procedure TfrmConsultaNotasDestinadas.tmAguardeTimer(Sender: TObject);
begin
  inherited;
  AdvCircularProgress1.Position := AdvCircularProgress1.Position +1;
  tmAguarde.Enabled := True;



end;

procedure TfrmConsultaNotasDestinadas.DBGrid1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//  inherited;
//if odd(cds.RecNo) then
//DBGrid1.Canvas.Brush.Color:= clwhite
//else
//DBGrid1.Canvas.Brush.Color:= clMoneyGreen;
//
//TDbGrid(Sender).Canvas.font.Color:= clBlack;
//TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
//
//
//TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
//if gdSelected in State then
//with (Sender as TDBGrid).Canvas do
//begin
//  Brush.Color:=clred; //aqui é definida a cor do fundo
//  Font.Color := clWhite;
//  Font.Size :=   Font.Size + 2;
//  Font.Style:= [fsbold];
//  FillRect(Rect);
//end;
//
//TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
//
end;




procedure TfrmConsultaNotasDestinadas.PegarHTML;
begin
  edtChaveNFe.Text := OnlyNumber(edtChaveNFe.Text);
  if trim(edtCaptcha.Text) = '' then
   begin
     MessageDlg('Digite o valor da imagem.',mtError,[mbok],0);
     edtCaptcha.SetFocus;
     exit;
   end;

  Memo2.Lines.Clear;

//  Button1.Enabled         := False;
//  btnPegarHTML.Enabled    := False;
  btnNovaConsulta.Enabled := False;
//  btnGerarXML.Enabled     := False;
  try
     WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder1$txtChaveAcessoCompleta', 0).value := edtChaveNFe.Text;
     WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder1$txtCaptcha', 0).value := edtCaptcha.Text;
     WebBrowser1.OleObject.Document.all.Item('ctl00$ContentPlaceHolder1$btnConsultar', 0).click;
  except
     //btnNovaConsulta.Enabled := True;
      edtCaptcha.Clear;
      NovaConsulta;
//     lbNovaImagem.click;


     raise;
  end;
end;


procedure TfrmConsultaNotasDestinadas.GeraXml;
var
  caminhoXMLNovo : string;
begin
// RESOLVER ESSE PROBLEMA

//  FPath:=GerarXML (Memo2.Lines.Text);

  caminhoXMLNovo := patchAplicacao+'XML\'+copy(fpath,16,300);
  CopyFile(pchar(FPath),PChar(patchAplicacao+'XML\'+copy(fpath,16,300))  ,false);
  DeleteFile(FPath);

  if dm.transacao.Active = false then dm.transacao.Active := true;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.Add('update nfe_destinadas set caminho_xml='+Quotedstr(caminhoXMLNovo)+' where chave_nfe='+Quotedstr(edtChaveNFe.Text));
  dm.qryauxiliar.ExecSQL;
  dm.transacao.Commit;
  btnNovaConsulta.Click;
  btnPegarHTML.Enabled    := True;

end;



procedure TfrmConsultaNotasDestinadas.WebBrowser1DocumentComplete(
  Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
var
  k, i: Integer;
  Source, dest: string;
  textoNFe : IHTMLDocument2;
begin
  Application.ProcessMessages;
  if WebBrowser1.LocationURL = 'http://www.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=' then
  begin
    for k := 0 to WebBrowser1.OleObject.Document.Images.Length - 1 do
     begin
       Source := WebBrowser1.OleObject.Document.Images.Item(k).Src;
       if (Source = 'http://www.nfe.fazenda.gov.br/scripts/srf/intercepta/captcha.aspx?opt=image') then
       begin
         dest := ExtractFilePath(ParamStr(0)) + 'captcha.gif';
         DownloadFile(Source, dest);
       end;
     end;
     Image1.Picture.LoadFromFile(dest);
     btnPegarHTML.Enabled := True;
  end
  else if WebBrowser1.LocationURL = 'https://www.nfe.fazenda.gov.br/portal/visualizacaoNFe/completa/Default.aspx' then
  begin
    WebBrowser1.Navigate('https://www.nfe.fazenda.gov.br/PORTAL/visualizacaoNFe/completa/impressao.aspx');
  end
  else if WebBrowser1.LocationURL = 'http://www.nfe.fazenda.gov.br/portal/consultaCompleta.aspx?tipoConteudo=XbSeqxE8pl8=' then
  begin
    textoNFe := WebBrowser1.Document as IHTMLDocument2;
    repeat
       Application.ProcessMessages;
    until Assigned(textoNFe.body);
    Memo2.Lines.Text := StripHTML(textoNFe.body.innerHTML);
    Memo2.Lines.Text := StringReplace(Memo2.Lines.Text,'&nbsp;','',[rfReplaceAll, rfIgnoreCase]);

    i := 0;
    while i < memo2.Lines.Count-1 do
    begin
      if trim(Memo2.Lines[i]) = '' then
      begin
        Memo2.Lines.Delete(i);
        i := i - 1;
      end;
      if pos('function',Memo2.lines[i])>0 then
      begin
        Memo2.Lines.Delete(i);
        i := i - 1;
      end;
      if pos('document',Memo2.lines[i])>0 then
      begin
        Memo2.Lines.Delete(i);
        i := i - 1;
      end;
      if pos('{',Memo2.lines[i])>0 then
      begin
        Memo2.Lines.Delete(i);
        i := i - 1;
      end;
      if pos('}',Memo2.lines[i])>0 then
      begin
        Memo2.Lines.Delete(i);
        i := i - 1;
      end;

      i := i + 1;
    end;
    Image1.Picture      := nil;

    // RESOLVER ESSE PROBLEMA

    SHOWMESSAGE('ERRO NA CONSULTA');
    GeraXml;

  end
  else if WebBrowser1.LocationURL = 'https://www.nfe.fazenda.gov.br/portal/inexistente_completa.aspx' then
  begin
    MessageDlg('NF-e INEXISTENTE na base nacional, favor consultar esta NF-e no site da SEFAZ de origem.',mtError,[mbok],0);
    Image1.Picture          := nil;
    btnNovaConsulta.Enabled := True;
    
  end
  else
  begin
    MessageDlg('Erro carregando URL: '+WebBrowser1.LocationURL,mtError,[mbok],0);
    Image1.Picture          := nil;
    NovaConsulta;
//    btnGerarXML.Enabled     := True;
//    btnNovaConsulta.Enabled := True;
  end;
end;



procedure TfrmConsultaNotasDestinadas.DeleteIECache;
var
  lpEntryInfo: PInternetCacheEntryInfo;
  hCacheDir: LongWord;
  dwEntrySize: LongWord;
begin { DeleteIECache }
  dwEntrySize := 0;

  FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), dwEntrySize);

  GetMem(lpEntryInfo, dwEntrySize);

  if dwEntrySize>0 then
    lpEntryInfo^.dwStructSize := dwEntrySize;

  hCacheDir := FindFirstUrlCacheEntry(nil, lpEntryInfo^, dwEntrySize);

  if hCacheDir<>0 then
  begin
    repeat
      DeleteUrlCacheEntry(lpEntryInfo^.lpszSourceUrlName);
      FreeMem(lpEntryInfo, dwEntrySize);
      dwEntrySize := 0;
      FindNextUrlCacheEntry(hCacheDir, TInternetCacheEntryInfo(nil^), dwEntrySize);
      GetMem(lpEntryInfo, dwEntrySize);
      if dwEntrySize>0 then
        lpEntryInfo^.dwStructSize := dwEntrySize;
    until not FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize)
  end; { hCacheDir<>0 }
  FreeMem(lpEntryInfo, dwEntrySize);

  FindCloseUrlCache(hCacheDir)
end; { DeleteIECache }


function TfrmConsultaNotasDestinadas.DownloadFile(SourceFile, DestFile: string): Boolean;
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



procedure TfrmConsultaNotasDestinadas.btnPegarHTMLClick(Sender: TObject);
begin
  inherited;
  PegarHTML;
end;

procedure TfrmConsultaNotasDestinadas.WebBrowser1ProgressChange(
  Sender: TObject; Progress, ProgressMax: Integer);
begin
if ProgressMax = 0 then
  begin
    ProgressBar1.Visible := False;
    lblStatus.Visible    := False;
    exit;
  end
 else
  begin
    ProgressBar1.Visible := True;
    lblStatus.Visible    := True;
    try
       ProgressBar1.Max := ProgressMax;
       if (Progress <> -1) and (Progress <= ProgressMax) then
          ProgressBar1.Position := Progress
       else
        begin
          ProgressBar1.Visible := False;
          lblStatus.Visible    := False;
        end;
    except
       on EDivByZero do
         exit;
    end;
  end;
end;

procedure TfrmConsultaNotasDestinadas.NovaConsulta;
begin
  btnNovaConsulta.Enabled := False;
//  btnGerarXML.Enabled     := False;
  edtcaptcha.Text:='';
//  Button1.Enabled         := True;
//  DeleteIECache;
  Memo2.Lines.Clear;
  WebBrowser1.Navigate('http://www.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=');
end;


procedure TfrmConsultaNotasDestinadas.btnNovaConsultaClick(
  Sender: TObject);
begin
  inherited;
  if not cds.Eof then
  begin
    cds.Next;
    edtChaveNFe.Text := cdschNFe.Value;
    NovaConsulta;
  end;

end;

procedure TfrmConsultaNotasDestinadas.lbNovaImagemClick(Sender: TObject);
begin
  inherited;
  NovaConsulta;
end;

procedure TfrmConsultaNotasDestinadas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
    if (Key = 38 ) or (Key =38) then
  begin
    edtCaptcha.Clear;
    NovaConsulta;
  end;

end;

procedure TfrmConsultaNotasDestinadas.edtCaptchaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
    btnPegarHTML.Click;
end;

procedure TfrmConsultaNotasDestinadas.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  pnPegarXML.Visible := false;
end;

end.
