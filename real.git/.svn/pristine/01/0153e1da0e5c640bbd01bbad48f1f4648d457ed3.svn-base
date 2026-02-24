unit uuExportaXMLNFCE;

interface

uses
  Windows, Messages, SysUtils, IBX.IBDatabase,acbrutil, IBX.IBQuery,  Variants, Classes, Graphics, Controls, Forms,pcnConversaoNFe,
  Dialogs, uu_modelo_Vazio,  Mask, StdCtrls, ExtCtrls, Buttons,
  Grids, DBGrids, IdBaseComponent, IdThreadComponent, ComCtrls,ShellAPI, zlib,
  JvComponentBase, JvZlibMultiple, Data.DB, RxToolEdit,System.Zip, JvBaseDlg,
  JvBrowseFolder, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxPC, Vcl.Menus,
  System.Actions, Vcl.ActnList, CurvyControls;

type
  TfrmExportaXMLNfce = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label4: TLabel;
    Label3: TLabel;
    edAquivosEncontrados: TEdit;
    Panel8: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    edTotalArquivos: TEdit;
    Panel9: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    EdArquivosNaoEncontrados: TEdit;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edDe: TDateEdit;
    edAte: TDateEdit;
    MonthCalendar1: TMonthCalendar;
    ProgressBar1: TProgressBar;
    Label11: TLabel;
    lbAguarde: TLabel;
    folderDialog: TJvBrowseForFolderDialog;
    tbErrosExP: TFDMemTable;
    tbErrosExPcodVenda: TStringField;
    tbErrosExPchaveNFE: TStringField;
    tbErrosExPserie: TIntegerField;
    tbErrosExPmodelo: TIntegerField;
    tbErrosExPnumeroNota: TIntegerField;
    tbErrosExPmsgErro: TStringField;
    dsErrosEXP: TDataSource;
    tbErrosExPvalorVenda: TCurrencyField;
    tbErrosExPvalorXML: TCurrencyField;
    tbErrosExPdata: TDateField;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    DBGrid1: TDBGrid;
    tbErrosExPxmlDaNota: TMemoField;
    PopupMenu1: TPopupMenu;
    VisualizaroDanfe1: TMenuItem;
    tbErrosExPcancelada: TBooleanField;
    AtualizarXML1: TMenuItem;
    tbErrosExPprotVenda: TStringField;
    tbErrosExPprotXML: TStringField;
    BitBtn3: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure verificaExistenciaDeArquivos();
    procedure BitBtn1Click(Sender: TObject);


    procedure JvZlibMultiple1Progress(Sender: TObject; Position,
      Total: Integer);
    function ExecutarEEsperar(NomeArquivo : String) : Boolean;
    procedure BitBtn2Click(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure VisualizaroDanfe1Click(Sender: TObject);
    procedure AtualizarXML1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    naoEncontrouAlgum : boolean;
    qtdRegistros,registroAtual, naoEncontrados,encontrados : integer;
    procedure AtualizarXML;


  public
    { Public declarations }
  end;

var
  frmExportaXMLNfce: TfrmExportaXMLNfce;

implementation

uses uu_data_module, uu_frm_principal, DateUtils, uuDmRelatorios,
  UU_DM_RELATORIOS;

{$R *.dfm}

procedure TfrmExportaXMLNfce.FormActivate(Sender: TObject);
begin
  inherited;

  MonthCalendar1.Date := Today;
  MonthCalendar1.OnClick(MonthCalendar1);
  dm.transacao.Active := false;
  dm.transacao.Active := true;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.SQL.Add('select numero_caixa from configuracoes_estacao order by numero_caixa');
  dm.qryauxiliar.Active := true;



end;

procedure TfrmExportaXMLNfce.verificaExistenciaDeArquivos();
var
 caminhoMes : string;
 caminhoArqOriginal : string;
 diretorioMes : string;

 prefixoNota : string;


 arquivos : string;
 i : integer;
 qtArquivos : integer;
 parte : integer;
 ArquivosModelo55: TZipFile;
 caminhoArquivo55 : string;
 ArquivosModelo65 : TZipFile;
 caminhoArquivo65 : string;

 contemModelo55 : boolean;
 contemModelo65 : boolean;
 diferencaValor : Double;
 vendaCancelada : boolean;




begin


  contemModelo55 := false;
  contemModelo65 := false;



 dm.transacao.Active := false;
 dm.transacao.Active := true;

 ArquivosModelo65 := TZipFile.Create;
 ArquivosModelo55 := TZipFile.Create;


 try

   dm.qryauxiliar.Active := false;
   dm.qryauxiliar.SQL.Clear;
   dm.qryauxiliar.SQL.Add(' select cod_venda from vendas v where v.protocolo_nfce='+Quotedstr('CONTINGENCIA')+' and v.data_so between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte.Date)) );
   dm.qryauxiliar.active:=true;

   if (dm.qryauxiliar.IsEmpty = false) then
    begin
     dm.exibe_painel_erro('Existem notas em contingência para o período! Não é possível exportar arquivos. Envie todas as notas nos PDVS e tente novamente','Ok');
     exit;
    end;





   dm.transacao.Commit;
   dm.transacao.Active := false;
   dm.transacao.Active :=true;
   dm.qryauxiliar.Active := false;
   dm.qryauxiliar.SQL.Clear;




    dm.qryauxiliar.sql.Add(' select * from (');
   dm.qryauxiliar.sql.Add(' select 1 as tipoOperacao, 0 as cancelada, v.cod_venda,v.valor_total, v.numero_caixa, v.data_so, v.hora,v.modelo_comprovante,  v.serie_nfce,v.numero_nfce, v.protocolo_nfce, v.chave_nfce, v.xml_doc');
   dm.qryauxiliar.sql.Add('    from vendas v where v.xml_doc is not null and v.modelo_comprovante >= 2 and v.chave_nfce <> '+Quotedstr('')+' and v.data_so between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte .Date)) );
   dm.qryauxiliar.sql.Add(' union all ');
   dm.qryauxiliar.sql.Add(' select 1 as tipoOperacao, 1 as cancelada, v.cod_venda,v.valor_total, v.numero_caixa, v.data_so, v.hora,v.modelo_comprovante,  v.serie_nfce,v.numero_nfce, v.protocolo_nfce, v.chave_nfce, v.xml_doc');
   dm.qryauxiliar.sql.Add('    from vendas_canceladas v where v.modelo_comprovante >= 2 and  v.chave_nfce <> '+Quotedstr('')+' and v.data_so between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte .Date)) );
   dm.qryauxiliar.sql.Add('               ) v2 ');
   dm.qryauxiliar.sql.Add('               order by v2.modelo_comprovante,v2.tipoOperacao,v2.serie_nfce,v2.numero_nfce ');
   dm.adicionaLog(dm.qryauxiliar.SQL.Text);

   dm.qryauxiliar.Active := true;
   dm.qryauxiliar.FetchAll;
   dm.exibe_painel_erro('À seguir, selecione a pasta onde quer guardar os arquivos e aguarde até o winrar comprimir todos os arquivos.','Ok');
   folderDialog.Execute;


   caminhoArquivo55  := folderDialog.Directory+'\'+'XML NOTAS MODELO 55 '+UpperCase(FormatDateTime('MMM',edDe.Date))+' '+FormatDateTime('YYY',edDe.Date)+'.zip';
   caminhoArquivo65  := folderDialog.Directory+'\'+'XML NOTAS MODELO 65 '+UpperCase(FormatDateTime('MMM',edDe.Date))+' '+FormatDateTime('YYY',edDe.Date)+'.zip';

    try
      ArquivosModelo65.Open(caminhoArquivo65 , zmWrite);
      ArquivosModelo55.Open(caminhoArquivo55 , zmWrite);

    except
      dm.exibe_painel_erro('Erro ao criar o arquivo compactado. Verifique a pasta e escolhida e se você possui permissões para gravar na mesma!','Continuar');
      ArquivosModelo65.DisposeOf;
      ArquivosModelo55.DisposeOf;
      exit;
    end;





   lbAguarde.Visible := true;
   qtdRegistros := dm.qryauxiliar.RecordCount;
   edTotalArquivos.Text := Inttostr(qtdRegistros);
   registroAtual :=0;
   ProgressBar1.Max := qtdRegistros;
   ProgressBar1.Position := 0;

   naoEncontrados:=0;
   encontrados :=0;

   dm.qryauxiliar.First;
   naoEncontrouAlgum := false;
   parte := 1;

   tbErrosExP.Active := false;
   tbErrosExP.Active:= true;
   tbErrosExP.EmptyDataSet;


    while not dm.qryauxiliar.Eof do
     begin
       Application.ProcessMessages;

       if dm.qryauxiliar.FieldByName('cancelada').Value =1 then
         prefixoNota := 'CANC'
       else
         prefixoNota :='';


       if dm.qryauxiliar.FieldByName('modelo_comprovante').Value then
         begin
           dm.parametrizaAcbrNFE(moNFCe,false,true);
         end
       else
        begin
         dm.parametrizaAcbrNFE(moNFe,false,true);
        end;



       dm.ACBrNFe1.NotasFiscais.Clear;
       dm.ACBrNFe1.NotasFiscais.LoadFromString(dm.qryauxiliar.FieldByName('xml_doc').Value,false);
       dm.ACBrNFe1.NotasFiscais[0].GravarXML(prefixoNota+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'.xml',
       folderDialog.Directory);
       caminhoArqOriginal :=folderDialog.Directory+'\'+prefixoNota + copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)+'.xml';

           {
       detalheExpNota.Clear;
       detalheExpNota.Append(sLineBreak+'------------------------------------------------');
       detalheExpNota.Append(sLineBreak+'Data: '+FormatDateTime('DD/MM/YYY',dm.qryauxiliar.FieldByName('DATA_SO').Value));
       detalheExpNota.Append(sLineBreak+'Serie: '+IntToStr(dm.qryauxiliar.FieldByName('serie_nfce').Value));
       detalheExpNota.Append(sLineBreak+'Nota: '+IntToStr(dm.qryauxiliar.FieldByName('numero_nfce').Value));

       detalheExpNota.Append(sLineBreak+'Chave:  '+copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60));
       detalheExpNota.Append(sLineBreak+'xml: '+dm.ACBrNFe1.NotasFiscais[0].XML);
            }


       if  dm.qryauxiliar.FieldByName('cancelada').Value =1 then
        begin
         vendaCancelada :=true;
         if dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.cStat <> 101 then
          begin
            tbErrosExP.Append;
            tbErrosExPcodVenda.Value := dm.qryauxiliar.FieldByName('cod_venda').Value;
            tbErrosExPdata.value       := dm.qryauxiliar.FieldByName('data_so').Value;
            tbErrosExPchaveNFE.Value := dm.qryauxiliar.FieldByName('chave_nfce').Value;
            tbErrosExPmodelo.Value   := dm.qryauxiliar.FieldByName('modelo_comprovante').Value;
            tbErrosExPserie.Value    := dm.qryauxiliar.FieldByName('serie_nfce').Value;
            tbErrosExPnumeroNota.Value := dm.qryauxiliar.FieldByName('numero_nfce').Value;
            tbErrosExPvalorVenda.Value := dm.qryauxiliar.FieldByName('valor_total').Value;
            tbErrosExPxmlDaNota.Value  := dm.qryauxiliar.FieldByName('xml_doc').Value;
            tbErrosExPvalorXML.value    :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF;
            tbErrosExPxmlDaNota.Value  := dm.qryauxiliar.FieldByName('xml_doc').Value;
            tbErrosExPprotXML.Value     := trim(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt);
            tbErrosExPmsgErro.Value    := 'Venda cancelada mas XML sem referência de cancelamento';
            tbErrosExPcancelada.Value := vendaCancelada;
            tbErrosExP.Post;
          end;

        end
       else
         begin
           vendaCancelada := false;
         end;


       if dm.qryauxiliar.FieldByName('serie_nfce').Value <>  dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.serie then
        begin
            tbErrosExP.Append;
            tbErrosExPcodVenda.Value := dm.qryauxiliar.FieldByName('cod_venda').Value;
            tbErrosExPdata.value       := dm.qryauxiliar.FieldByName('data_so').Value;
            tbErrosExPchaveNFE.Value := dm.qryauxiliar.FieldByName('chave_nfce').Value;
            tbErrosExPmodelo.Value   := dm.qryauxiliar.FieldByName('modelo_comprovante').Value;
            tbErrosExPserie.Value    := dm.qryauxiliar.FieldByName('serie_nfce').Value;
            tbErrosExPnumeroNota.Value := dm.qryauxiliar.FieldByName('numero_nfce').Value;
            tbErrosExPvalorVenda.Value := dm.qryauxiliar.FieldByName('valor_total').Value;
            tbErrosExPxmlDaNota.Value  := dm.qryauxiliar.FieldByName('xml_doc').Value;
            tbErrosExPvalorXML.value    :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF;
            tbErrosExPxmlDaNota.Value  := dm.qryauxiliar.FieldByName('xml_doc').Value;
            tbErrosExPprotXML.Value     := trim(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt);
            tbErrosExPmsgErro.Value     := 'Protocolo de autorização diferente do arquivo XML';

            tbErrosExPmsgErro.Value    := 'Série da nota difere do XML';
            tbErrosExPcancelada.Value := vendaCancelada;
            tbErrosExP.Post;
        end;

         if dm.qryauxiliar.FieldByName('numero_nfce').Value <>  dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF then
          begin
            tbErrosExP.Append;
            tbErrosExPcodVenda.Value := dm.qryauxiliar.FieldByName('cod_venda').Value;
            tbErrosExPdata.value       := dm.qryauxiliar.FieldByName('data_so').Value;
            tbErrosExPchaveNFE.Value := dm.qryauxiliar.FieldByName('chave_nfce').Value;
            tbErrosExPmodelo.Value   := dm.qryauxiliar.FieldByName('modelo_comprovante').Value;
            tbErrosExPserie.Value    := dm.qryauxiliar.FieldByName('serie_nfce').Value;
            tbErrosExPnumeroNota.Value := dm.qryauxiliar.FieldByName('numero_nfce').Value;
            tbErrosExPvalorVenda.Value := dm.qryauxiliar.FieldByName('valor_total').Value;
            tbErrosExPxmlDaNota.Value  := dm.qryauxiliar.FieldByName('xml_doc').Value;
            tbErrosExPvalorXML.value    :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF;
            tbErrosExPxmlDaNota.Value  := dm.qryauxiliar.FieldByName('xml_doc').Value;
            tbErrosExPprotXML.Value     := trim(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt);
            tbErrosExPmsgErro.Value     := 'Protocolo de autorização diferente do arquivo XML';
            tbErrosExPmsgErro.Value    := 'Número da nota difere do XML';
            tbErrosExPcancelada.Value := vendaCancelada;
            tbErrosExP.Post;
          end;



         diferencaValor := dm.qryauxiliar.FieldByName('valor_total').Value  - dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF;
         diferencaValor := Abs(diferencaValor);


         if (StrToFloat( Floattostr(diferencaValor)) > 0.01 )  then
          begin
            dm.adicionaLog('Diferença de '+FloatToStr(diferencaValor));
            tbErrosExP.Append;
            tbErrosExPcodVenda.Value    := dm.qryauxiliar.FieldByName('cod_venda').Value;
            tbErrosExPdata.value        := dm.qryauxiliar.FieldByName('data_so').Value;
            tbErrosExPchaveNFE.Value    := dm.qryauxiliar.FieldByName('chave_nfce').Value;
            tbErrosExPmodelo.Value      := dm.qryauxiliar.FieldByName('modelo_comprovante').Value;
            tbErrosExPserie.Value       := dm.qryauxiliar.FieldByName('serie_nfce').Value;
            tbErrosExPnumeroNota.Value  := dm.qryauxiliar.FieldByName('numero_nfce').Value;
            tbErrosExPxmlDaNota.Value   := dm.qryauxiliar.FieldByName('xml_doc').Value;
            tbErrosExPvalorVenda.Value  := dm.qryauxiliar.FieldByName('valor_total').Value;
            tbErrosExPvalorXML.value    :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF;
            tbErrosExPprotXML.Value     := trim(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt);
            tbErrosExPmsgErro.Value     := 'Protocolo de autorização diferente do arquivo XML';
            tbErrosExPmsgErro.Value     := 'Valor da nota difere do XML';
            tbErrosExPcancelada.Value := vendaCancelada;
            tbErrosExP.Post;
          end;



         if ( trim(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt) = '') then
          begin
            tbErrosExP.Append;
            tbErrosExPcodVenda.Value    := dm.qryauxiliar.FieldByName('cod_venda').Value;
            tbErrosExPdata.value        := dm.qryauxiliar.FieldByName('data_so').Value;
            tbErrosExPchaveNFE.Value    := dm.qryauxiliar.FieldByName('chave_nfce').Value;
            tbErrosExPmodelo.Value      := dm.qryauxiliar.FieldByName('modelo_comprovante').Value;
            tbErrosExPserie.Value       := dm.qryauxiliar.FieldByName('serie_nfce').Value;
            tbErrosExPnumeroNota.Value  := dm.qryauxiliar.FieldByName('numero_nfce').Value;
            tbErrosExPxmlDaNota.Value  := dm.qryauxiliar.FieldByName('xml_doc').Value;
            tbErrosExPvalorVenda.Value  := dm.qryauxiliar.FieldByName('valor_total').Value;
            tbErrosExPvalorXML.value    :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF;
            tbErrosExPprotXML.Value     := trim(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt);
            tbErrosExPmsgErro.Value     := 'XML sem protocolo de autorizaçao';
            tbErrosExPcancelada.Value := vendaCancelada;
            tbErrosExP.Post;
          end;



         if ( trim(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt) <>  dm.qryauxiliar.FieldByName('protocolo_nfce').Value) then
          begin
            tbErrosExP.Append;
            tbErrosExPcodVenda.Value    := dm.qryauxiliar.FieldByName('cod_venda').Value;
            tbErrosExPdata.value        := dm.qryauxiliar.FieldByName('data_so').Value;
            tbErrosExPchaveNFE.Value    := dm.qryauxiliar.FieldByName('chave_nfce').Value;
            tbErrosExPmodelo.Value      := dm.qryauxiliar.FieldByName('modelo_comprovante').Value;
            tbErrosExPserie.Value       := dm.qryauxiliar.FieldByName('serie_nfce').Value;
            tbErrosExPnumeroNota.Value  := dm.qryauxiliar.FieldByName('numero_nfce').Value;
            tbErrosExPxmlDaNota.Value  := dm.qryauxiliar.FieldByName('xml_doc').Value;
            tbErrosExPvalorVenda.Value  := dm.qryauxiliar.FieldByName('valor_total').Value;
            tbErrosExPvalorXML.value    :=  dm.ACBrNFe1.NotasFiscais[0].NFe.Total.ICMSTot.vNF;
            tbErrosExPprotVenda.Value   :=  dm.qryauxiliar.FieldByName('protocolo_nfce').Value;
            tbErrosExPprotXML.Value     := trim(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt);
            tbErrosExPmsgErro.Value     := 'Protocolo de autorização diferente do arquivo XML';
            tbErrosExPcancelada.Value := vendaCancelada;
            tbErrosExP.Post;
          end;


       sleep(StrToInt(dm.LeIni(2,'NFCE','intervaloExportacao')));

       if not FileExists(caminhoArqOriginal) then
        begin
          Showmessage('XML não encontrado! Verifique a chave no arquivo de log!');
          dm.adicionaLog('XML da chave '+dm.qryauxiliar.FieldByName('chave_nfce').Value+' não foi localizado');
          ArquivosModelo55.Close;
          ArquivosModelo65.CLOSE;
          ArquivosModelo55.DisposeOf;
          ArquivosModelo65.DisposeOf;
          DeleteFile(caminhoArquivo55);
          DeleteFile(caminhoArquivo65);
          exit;
        end
       else
        begin
           case dm.qryauxiliar.FieldByName('modelo_comprovante').Value of
             2:  begin


                 try
                   ArquivosModelo65.Add(caminhoArqOriginal);
  //                 ArquivosModelo65.Close;
                   contemModelo65 := true;
                  except
                    on E : Exception  do
                      begin
                        dm.adicionaLog('Erro ao compactar arquivo de nota 65:  '+E.Message);
                        dm.exibe_painel_erro('Erro ao compactar arquivo de nota 65:  '+E.Message,'Ok');
                        exit;
                      end;
                  end;

                 end;

             3: begin

                 try
                   ArquivosModelo55.Add(caminhoArqOriginal);
  //                 ArquivosModelo55.Close;
                   contemModelo55 := true;
                  except
                    on E : Exception  do
                      begin
                        dm.adicionaLog('Erro ao compactar arquivo de nota 55:  '+E.Message);
                        dm.exibe_painel_erro('Erro ao compactar arquivo de nota 55:  '+E.Message,'Ok');
                        exit;
                      end;
                  end;

                end;
           end;

          DeleteFile(caminhoArqOriginal)
        end;

       registroAtual:=registroAtual +1;
       ProgressBar1.Position := registroAtual;
       dm.qryauxiliar.Next;
     end;

     dm.transacao.Commit;
     ArquivosModelo55.Close;
     ArquivosModelo65.Close;



     if not contemModelo55  then
       Deletefile(caminhoArquivo55);

     if not contemModelo65  then
       Deletefile(caminhoArquivo65);


     dRelatorios.qryNotasInutilizadas.Active := false;
     dRelatorios.qryNotasInutilizadas.sql.Clear;
     dRelatorios.qryNotasInutilizadas.SQL.Add(' select nfc.serie,nfc.nota,nfc.data_hora_inutilizacao, nfc.protocolo,nfc.obs,');
     dRelatorios.qryNotasInutilizadas.SQL.Add('  case nfc.modelo ');
     dRelatorios.qryNotasInutilizadas.SQL.Add('     WHEN 2 THEN '+Quotedstr('NFC-e (MODELO 65)'));
     dRelatorios.qryNotasInutilizadas.SQL.Add('     WHEN 3 THEN '+Quotedstr('NFC-e (MODELO 55)'));
     dRelatorios.qryNotasInutilizadas.SQL.Add(' end as modelo_nota, nfc.xml_doc');
     dRelatorios.qryNotasInutilizadas.SQL.Add('    from inutilizacoes_nfce nfc ');
     dRelatorios.qryNotasInutilizadas.SQL.Add('  where nfc.inutilizada=1 and nfc.emitida =0 and nfc.modelo=2 ');
     dRelatorios.qryNotasInutilizadas.SQL.Add('   and nfc.data_hora_inutilizacao >='+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date)));
     dRelatorios.qryNotasInutilizadas.SQL.Add('   order by nfc.serie, nfc.nota ');
     dm.adicionaLog(dRelatorios.qryNotasInutilizadas.SQL.Text);


     dRelatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relNFCEInutilizadas.fr3',true);
     dm.transacao.Active := false;
     dm.transacao.Active :=true;
     dRelatorios.setPeriodoRelatorio('De  '+edDe.Text   +'  até '+FormatDateTime('DD/MM/YYY',data_do_sistema));
     dRelatorios.frxPDFExport1.FileName := 'INUTILIZAÇÕES '+UpperCase(FormatDateTime('MMM',edDe.Date))+' '+FormatDateTime('YYY',edDe.Date)+'.PDF';
     dRelatorios.frxPDFExport1.DefaultPath := folderDialog.Directory;
     dRelatorios.frxPDFExport1.ShowDialog := false;
     dRelatorios.frxPDFExport1.ShowProgress := false;
     dRelatorios.frxPDFExport1.OverwritePrompt := False;
     dRelatorios.rpt.PrepareReport();
     dRelatorios.rpt.Export(dRelatorios.frxPDFExport1);
     dRelatorios.qryNotasInutilizadas.Active := true;






     lbAguarde.Visible := false;


     dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relNFCEemitidas.fr3',true);
     dm.transacao.Active := false;
     dm.transacao.Active :=true;
     dRelatorios.setPeriodoRelatorio('De  '+edDe.Text   +'  até  '+edAte.Text);
     dRelatorios.qryNFCEEnviadas.SQL.Clear;
     dRelatorios.qryNFCEEnviadas.sql.Add('select v2.*, ');
     dRelatorios.qryNFCEEnviadas.sql.Add('  case v2.modelo_comprovante');
     dRelatorios.qryNFCEEnviadas.sql.Add('    WHEN 2 THEN '+Quotedstr('NFC-e (MODELO 65)'));
     dRelatorios.qryNFCEEnviadas.sql.Add('    WHEN 3 THEN '+Quotedstr('NFC-e (MODELO 55)'));
     dRelatorios.qryNFCEEnviadas.sql.Add('   END as modelo_nota');
     dRelatorios.qryNFCEEnviadas.sql.Add('   from (');
     dRelatorios.qryNFCEEnviadas.sql.Add(' select 1 as tipoOperacao, 0 as cancelada, v.cod_venda,v.valor_total, v.numero_caixa, v.data_so, v.hora,v.modelo_comprovante,  v.serie_nfce,v.numero_nfce, v.protocolo_nfce, v.chave_nfce, v.xml_doc, v.obs_nfce');
     dRelatorios.qryNFCEEnviadas.sql.Add('    from vendas v where v.modelo_comprovante >= 2 and  v.chave_nfce <> '+Quotedstr('')+' and v.data_so between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte .Date)) );
     dRelatorios.qryNFCEEnviadas.sql.Add('               ) v2');
     dRelatorios.qryNFCEEnviadas.sql.Add('               order by v2.modelo_comprovante,v2.data_so,v2.tipoOperacao,v2.serie_nfce,v2.numero_nfce');
     dRelatorios.qryNFCEEnviadas.Active := true;

     dm.adicionaLog(dRelatorios.qryNFCEEnviadas.SQL.Text);
     dRelatorios.qryNFCEEnviadas.Active := true;
     dRelatorios.setPeriodoRelatorio('De  '+edDe.Text   +'  até  '+edAte.Text);
     dRelatorios.frxPDFExport1.FileName := 'NOTAS EMITIDAS '+UpperCase(FormatDateTime('MMM',edDe.Date))+' '+FormatDateTime('YYY',edDe.Date)+'.PDF';
     dRelatorios.frxPDFExport1.DefaultPath := folderDialog.Directory;
     dRelatorios.frxPDFExport1.ShowDialog := false;
     dRelatorios.frxPDFExport1.ShowProgress := false;
     dRelatorios.frxPDFExport1.OverwritePrompt := False;
     dm_relatorios.rpt.PrepareReport();
     dm_relatorios.rpt.Export(dRelatorios.frxPDFExport1);






     dm_relatorios.rpt.LoadFromFile(patchAplicacao+'relatorios\relNFCECanceladas.fr3',true);
     dm.transacao.Active := false;
     dm.transacao.Active :=true;
     dRelatorios.setPeriodoRelatorio('De  '+edDe.Text   +'  até  '+edAte.Text);
     dRelatorios.qryNFCEEnviadas.SQL.Clear;
     dRelatorios.qryNFCEEnviadas.sql.Add('select v2.*, ');
     dRelatorios.qryNFCEEnviadas.sql.Add('  case v2.modelo_comprovante');
     dRelatorios.qryNFCEEnviadas.sql.Add('    WHEN 2 THEN '+Quotedstr('NFC-e (MODELO 65)'));
     dRelatorios.qryNFCEEnviadas.sql.Add('    WHEN 3 THEN '+Quotedstr('NFC-e (MODELO 55)'));
     dRelatorios.qryNFCEEnviadas.sql.Add('   END as modelo_nota');
     dRelatorios.qryNFCEEnviadas.sql.Add('   from (');
     dRelatorios.qryNFCEEnviadas.sql.Add(' select 1 as tipoOperacao, 0 as cancelada, v.cod_venda,v.valor_total, v.numero_caixa, v.data_so, v.hora,v.modelo_comprovante,  v.serie_nfce,v.numero_nfce, v.protocolo_nfce, v.chave_nfce, v.xml_doc, v.obs_nfce');
     dRelatorios.qryNFCEEnviadas.sql.Add('    from vendas_canceladas v where v.chave_nfce <> '+Quotedstr('')+' and v.data_so between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte .Date)) );
     dRelatorios.qryNFCEEnviadas.sql.Add('               ) v2');
     dRelatorios.qryNFCEEnviadas.sql.Add('               order by v2.modelo_comprovante, v2.data_so,v2.tipoOperacao,v2.serie_nfce,v2.numero_nfce');
     dRelatorios.qryNFCEEnviadas.Active := true;

     dm.adicionaLog(dRelatorios.qryNFCEEnviadas.SQL.Text);
     dRelatorios.qryNFCEEnviadas.Active := true;
     dRelatorios.setPeriodoRelatorio('De  '+edDe.Text   +'  até  '+edAte.Text);
     dRelatorios.frxPDFExport1.FileName := 'NOTAS CANCELADAS '+UpperCase(FormatDateTime('MMM',edDe.Date))+' '+FormatDateTime('YYY',edDe.Date)+'.PDF';
     dRelatorios.frxPDFExport1.DefaultPath := folderDialog.Directory;
     dRelatorios.frxPDFExport1.ShowDialog := false;
     dRelatorios.frxPDFExport1.ShowProgress := false;
     dRelatorios.frxPDFExport1.OverwritePrompt := False;
     dm_relatorios.rpt.PrepareReport();
     dm_relatorios.rpt.Export(dRelatorios.frxPDFExport1);
     dm.exibe_painel_erro('O arquivo foi salvo com sucesso','Ok');


 finally
    ArquivosModelo55.DisposeOf;
    ArquivosModelo65.DisposeOf;
 end;




end;



procedure TfrmExportaXMLNfce.VisualizaroDanfe1Click(Sender: TObject);
var
 cancelada : boolean;
begin
  inherited;




  dm.reimprimirDanfe(tbErrosExPchaveNFE.Value,1,true, tbErrosExPcancelada.Value);
end;

function TfrmExportaXMLNfce.ExecutarEEsperar(NomeArquivo : String) : Boolean;
var Sh: TShellExecuteInfo;
CodigoSaida: DWORD;
begin
FillChar(Sh, SizeOf(Sh), 0) ;
Sh.cbSize := SizeOf(TShellExecuteInfo) ;
with Sh do
begin

 fMask := SEE_MASK_NOCLOSEPROCESS;
 Wnd := Application.Handle;
 lpVerb := nil;
 lpFile := PChar(NomeArquivo);
 nShow := SW_SHOWNORMAL;

end;

WinExec(PAnsiChar (NomeArquivo),SW_HIDE);
Application.ProcessMessages;
GetExitCodeProcess(Sh.hProcess, CodigoSaida) ;
repeat
Application.ProcessMessages;
GetExitCodeProcess(Sh.hProcess, CodigoSaida) ;
until not(CodigoSaida = STILL_ACTIVE);
Result := True;



end;

procedure TfrmExportaXMLNfce.AtualizarXML;
var
  ts: TIBTransaction;
  q: TIBQuery;


begin
  inherited;


  if tbErrosExPmodelo.Value =2 then
    dm.parametrizaAcbrNFE(moNFCe,false,true)
  else
   dm.parametrizaAcbrNFE(moNFe,false,true);

  dm.ACBrNFe1.NotasFiscais.Clear;
  dm.ACBrNFe1.NotasFiscais.LoadFromString(tbErrosExPxmlDaNota.Value  ,false);
  try
   dm.ACBrNFe1.Consultar;
  except
      on E : Exception  do
   begin
       showmessage('Erro ao consultar a nota na sefaz: '+E.Message);
       dm.adicionaLog('Deu Erro ao consultar: '+E.Message);
       exit;
   end

  end;

  ts      :=   TIBTransaction.Create(Self);
  ts.Name := RandomName(8);
  ts.DefaultDatabase :=  dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;


  q:= TIBQuery.create(self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;
  q.sql.clear;


  if tbErrosExPcancelada.Value = false  then
   begin
    q.Active := false;
    q.SQL.clear;
    q.sql.add(' update vendas v set ');
    q.sql.add('    v.numero_nfce='+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));
    q.sql.add('   ,v.chave_nfce='+QuotedStr(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)  ));
    q.sql.add('   ,v.PROTOCOLO_NFCE='+QuotedStr(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt));
    q.sql.add('   ,v.xml_doc='+QuotedStr(dm.ACBrNFe1.NotasFiscais[0].XML )+'');
    q.sql.add('  where v.cod_venda='+Quotedstr(tbErrosExPcodVenda.Value ));
    DM.adicionaLog(q.SQL.Text);
    q.ExecSQL;
   end
  else
   begin
    q.Active := false;
    q.SQL.clear;
    q.sql.add(' update vendas_canceladas v set ');
    q.sql.add('    v.numero_nfce='+Inttostr(dm.ACBrNFe1.NotasFiscais[0].NFe.Ide.nNF));
    q.sql.add('   ,v.chave_nfce='+QuotedStr(copy(dm.ACBrNFe1.NotasFiscais[0].NFe.infNFe.ID,4,60)  ));
    q.sql.add('   ,v.PROTOCOLO_NFCE='+QuotedStr(dm.ACBrNFe1.NotasFiscais[0].NFe.procNFe.nProt));
    q.sql.add('   ,v.xml_doc='+QuotedStr(dm.ACBrNFe1.NotasFiscais[0].XML )+'');
    q.sql.add('  where v.cod_venda='+Quotedstr(tbErrosExPcodVenda.Value ));
    DM.adicionaLog(q.SQL.Text);
    q.ExecSQL;

   end;
  ts.Commit;

  FreeAndNil(ts);
  FreeAndNil(q);

//  Showmessage('XML e protocolo de autorização atualizados!');

end;

procedure TfrmExportaXMLNfce.AtualizarXML1Click(Sender: TObject);
begin

 AtualizarXML;
end;

procedure TfrmExportaXMLNfce.BitBtn1Click(Sender: TObject);
begin
  inherited;
//  IdThreadComponent1.Start;
  tbErrosExP.Active := true;
  tbErrosExP.EmptyDataSet;

  verificaExistenciaDeArquivos();
end;




procedure TfrmExportaXMLNfce.JvZlibMultiple1Progress(Sender: TObject;
  Position, Total: Integer);
begin
  inherited;
  ProgressBar1.Max := Total;
  ProgressBar1.Position := Position;
end;

procedure TfrmExportaXMLNfce.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmExportaXMLNfce.BitBtn3Click(Sender: TObject);
begin
  inherited;
  tbErrosExP.First;

  while not tbErrosExP.Eof  do
   begin
     AtualizarXML;
     tbErrosExP.Next;
   end;

   ShowMessage('Protocolos atualizados!');



end;

procedure TfrmExportaXMLNfce.MonthCalendar1Click(Sender: TObject);
begin
  inherited;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.SQL.add('    select cast(udf_monthstart('+FormatDateTime('YYY',MonthCalendar1.Date)+','+FormatDateTime('MM',MonthCalendar1.Date)+') as date) as inicio, ');
  dm.qryauxiliar.SQL.add('     cast(udf_monthend('+FormatDateTime('YYY',MonthCalendar1.Date)+','+FormatDateTime('MM',MonthCalendar1.Date)+') as date) as fim ');
  dm.qryauxiliar.SQL.add('    from parametros  ');
  frm_principal.memo_avisos.Lines := dm.qryauxiliar.sql;
//  frm_principal.memo_avisos.Visible := true;
  dm.qryauxiliar.Active := true;
  edDe.Date  := dm.qryauxiliar.fieldbyname('inicio').Value;
  edAte.Date := dm.qryauxiliar.fieldbyname('fim').Value;
  





end;

procedure TfrmExportaXMLNfce.BitBtn5Click(Sender: TObject);
var
 qtdRegistros : integer;
 registroAtual : integer;
begin
  inherited;

  dm.transacao.Commit;
  dm.transacao.Active := false;
  dm.transacao.Active :=true;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.sql.Add(' select v.cod_venda,v.valor_total, v.numero_caixa, v.data_so, v.hora,  v.serie_nfce,v.numero_nfce, v.protocolo_nfce, v.chave_nfce ');
  dm.qryauxiliar.sql.Add('    from vendas v where v.data_so between '+Quotedstr(FormatDateTime('DD.MM.YYY',edDe.Date))+' and '+Quotedstr(FormatDateTime('DD.MM.YYY',edAte .Date)) );
 dm.qryauxiliar.sql.add( ' and v.chave_nfce <> '+quotedstr(''));
  dm.qryauxiliar.sql.Add('    order by v.numero_caixa, v.serie_nfce, v.numero_nfce ');

  dm.adicionaLog('vai fazer a query');
  dm.qryauxiliar.Active := true;
  dm.qryauxiliar.FetchAll;
 dm.adicionaLog('Fez a query');
  if dm.qryauxiliar.IsEmpty then
   begin
     dm.exibe_painel_erro('Nenhuma nota encontrada para o período informado!','Ok');
     exit;
  end;

 lbAguarde.Visible := true;
 qtdRegistros := dm.qryauxiliar.RecordCount;


 registroAtual :=0;
 ProgressBar1.Position :=0;
 ProgressBar1.Max := qtdRegistros;

 dm.qryauxiliar.First;
 dm.parametrizaAcbrNFE(moNFCe,false,true);

 dm.adicionaLog('Parametrizou, começa o loop');
 dm.qryauxiliar.DisableControls;
 while not dm.qryauxiliar.Eof do
  begin

     try
      begin
       dm.ACBrNFe1.NotasFiscais.Clear;
       dm.ACBrNFe1.WebServices.Consulta.NFeChave := dm.qryauxiliar.fieldbyname('chave_nfce').Value;
       dm.ACBrNFe1.WebServices.Consulta.Executar;

        dm.adicionaLog(' tenta consultar nota '+dm.qryauxiliar.fieldbyname('chave_nfce').Value);

       if  ( trim(dm.ACBrNFe1.WebServices.Consulta.XMotivo) = 'Autorizado o uso da NF-e') then
        begin
          dm.qryauxiliar2.Active := false;
          dm.qryauxiliar2.sql.clear;
          dm.qryauxiliar2.sql.add('update vendas v set  v.consulta_ok=1, v.protocolo_nfce ='+Quotedstr(dm.ACBrNFe1.WebServices.Consulta.Protocolo) +' ,v.obs_nfce='+Quotedstr(dm.ACBrNFe1.WebServices.Consulta.XMotivo));
          dm.qryauxiliar2.sql.add(' where v.chave_nfce='+Quotedstr(dm.qryauxiliar.fieldbyname('chave_nfce').Value ));
          dm.qryauxiliar2.ExecSQL;
           dm.adicionaLog('autorizou a nota '+dm.qryauxiliar.fieldbyname('chave_nfce').Value);

        end
       else
        begin
          dm.qryauxiliar2.Active := false;
          dm.qryauxiliar2.sql.clear;
          dm.qryauxiliar2.sql.add('update vendas v set  v.consulta_ok=0, v.obs_nfce='+Quotedstr(dm.ACBrNFe1.WebServices.Consulta.XMotivo));
          dm.qryauxiliar2.sql.add(' where v.chave_nfce='+Quotedstr(dm.qryauxiliar.fieldbyname('chave_nfce').Value ));
          dm.qryauxiliar2.ExecSQL;

        end;
        Application.ProcessMessages;

        if ( trim(dm.ACBrNFe1.WebServices.Consulta.XMotivo) =  trim('Consumo Indevido - Consulta Situacao - Consumo sucessivo') ) then
          begin
           lbAguarde.Caption := TimeTostr(Time)+' Aguardando bloqueio';
           dm.adicionaLog('Aguardando bloqueio');
           Application.ProcessMessages;
          end
        else
         begin
          registroAtual := registroAtual +1;
          ProgressBar1.Position := registroAtual;
          lbAguarde.Caption := 'Aguarde... '+IntToStr(registroAtual)+' / '+IntToStr(qtdRegistros);
          dm.adicionaLog('Aguarde... '+IntToStr(registroAtual)+' / '+IntToStr(qtdRegistros));
          dm.qryauxiliar.Next;
         end;
      end;


     except
         on E : Exception  do
          begin
            dm.adicionaLog( dm.qryauxiliar.fieldbyname('chave_nfce').Value+'   '+e.Message);
            dm.qryauxiliar.Next;
          end;
     end;
  end;

     dm.qryauxiliar.EnableControls;
     dm.transacao.Commit;
     dm.transacao.Active := false;
     dm.transacao.Active := true;



end;

end.
