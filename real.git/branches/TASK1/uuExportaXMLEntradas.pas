unit uuExportaXMLEntradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, RxToolEdit, Vcl.ExtCtrls, FolderDialog, Vcl.ComCtrls,
  Vcl.ActnList, System.Actions;

type
  TfrmExportaXMLEntradas = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Panel5: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    ed_data_inicial: TDateEdit;
    ed_data_final: TDateEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    BitBtn2: TBitBtn;
    Panel7: TPanel;
    BitBtn3: TBitBtn;
    Label14: TLabel;
    Label1: TLabel;
    FolderDialog1: TFolderDialog;
    ProgressBar1: TProgressBar;
    function verificaValidade() : boolean;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportaXMLEntradas: TfrmExportaXMLEntradas;

implementation

{$R *.dfm}

uses uu_data_module, uu_frm_principal;


procedure TfrmExportaXMLEntradas.BitBtn2Click(Sender: TObject);
var
 localArquivoNota : string;
 pastaDestino : string;
 nomeArquivoNota : string;
 nomeArquivoDestino: string;
 arquivosNaoEncontrados : integer;
 TotalDeNotas : integer;

begin
  inherited;
  arquivosNaoEncontrados := 0;
  TotalDeNotas :=0;
  ProgressBar1.Position := 0;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.SQL.Clear;
  dm.qryauxiliar.sql.Add('select f.razao_social, e.serie_nota, e.numero_nota,e.data_entrada,e.chave_nfe,e.total_nota from entradas e');
  dm.qryauxiliar.sql.Add(' inner join fornecedor f on (f.cod_fornecedor = e.cod_fornecedor)');
  dm.qryauxiliar.sql.Add(' where e.modelo_nota='+Quotedstr('55')+' and e.chave_nfe is not null and e.chave_nfe <> '+Quotedstr(''));
  dm.qryauxiliar.sql.Add('and e.data_entrada  between '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_inicial.Date  )));
  dm.qryauxiliar.sql.add(' and '+Quotedstr( FormatDateTime('DD.MM.YYYY',ed_data_final.date )));
  dm.qryauxiliar.Active := true;
  dm.qryauxiliar.FetchAll;

  TotalDeNotas := dm.qryauxiliar.RecordCount;

  if  dm.qryauxiliar.IsEmpty  then
   begin
    Showmessage('Nenhuma nota de entrada encontrada para este período!');
   end
  else
   begin
     ProgressBar1.Max := TotalDeNotas;
     FolderDialog1.Execute;
     pastaDestino:= FolderDialog1.Directory;
     if DirectoryExists(pastaDestino)  then
       begin
         dm.qryauxiliar.First;
         while not dm.qryauxiliar.Eof  do
          begin
          nomeArquivoNota :=dm.qryauxiliar.FieldByName('chave_nfe').Value+'-nfe.xml';
          localArquivoNota :=patchXMLEntradas+nomeArquivoNota;
          nomeArquivoDestino := pastaDestino +'\'+ nomeArquivoNota;

            if FileExists(localArquivoNota  ,true) then
              begin
               CopyFile(Pchar(localArquivoNota),Pchar(nomeArquivoDestino),false);
              end
            else
              begin
                arquivosNaoEncontrados := arquivosNaoEncontrados +1;
              end;

           Application.ProcessMessages;
           ProgressBar1.Position := ProgressBar1.Position + 1;
           dm.qryauxiliar.Next;
          end;

          showmessage('Cópia terminada.'+Inttostr(dm.qryauxiliar.RecordCount)+' entradas com XML no período. '+Inttostr(arquivosNaoEncontrados)+' arquivos não encontrados');

       end
     else
       begin
         showmessage('A pasta informada não existe!');

       end;
   end;
  ProgressBar1.Position := 0;
  dm.qryauxiliar.Active := false;
end;

procedure TfrmExportaXMLEntradas.BitBtn3Click(Sender: TObject);
begin
  inherited;
  close;
end;

function TfrmExportaXMLEntradas.verificaValidade() : boolean;
begin
  try
    ed_data_inicial.Text := FormatDateTime('DD/MM/YYY',ed_data_inicial.date);
  except
   begin
     ShowMessage('Data inicial inválida');
     ed_data_inicial.SetFocus;
     result:=false;
     exit;
   end;
  end;



  try
    ed_data_final.Text := FormatDateTime('DD/MM/YYY',ed_data_final.Date );
  except
   begin
     ShowMessage('Data final inválida');
     ed_data_final.SetFocus;
     result:=false;
     exit;
   end;
  end;

  if (  ed_data_inicial.date > ed_data_final.date ) then
  begin
    showmessage('Período inválido!!  Data inicial não pode ser maior que a data final !');
    ed_data_inicial.SetFocus;
    result:=false;
    exit;
  end;



  result:=true;

end;

end.
