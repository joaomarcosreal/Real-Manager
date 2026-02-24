unit uuExportaXMLEntradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, RxToolEdit, Vcl.ExtCtrls, FolderDialog, Vcl.ComCtrls,
  JvBrowseFolder, JvBaseDlg, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions;

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
    folderDialog: TJvBrowseForFolderDialog;
    function verificaValidade() : boolean;

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
