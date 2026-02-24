unit uuCancelaNFCEChave;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.StdCtrls,
  uu_data_module, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, Vcl.Buttons;

type
  TfrmCancelaNFCEChave = class(Tfrm_modelo_vazio)
    edProtocolo: TEdit;
    Button1: TButton;
    edChave: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelaNFCEChave: TfrmCancelaNFCEChave;

implementation

{$R *.dfm}

procedure TfrmCancelaNFCEChave.Button1Click(Sender: TObject);
begin
  inherited;
  dm.cancelaNFEPelaChave(edChave.Text, edProtocolo.Text,'NF-e autorizada porém erro houve erro no envio da mesma');
end;

end.
