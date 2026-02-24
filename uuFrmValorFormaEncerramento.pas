unit uuFrmValorFormaEncerramento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, JvExStdCtrls, JvEdit,
  JvValidateEdit, AdvTouchKeyboard, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList,
  System.Actions, Vcl.Buttons;

type
  TfrmValorFormaPagamentoEncerramento = class(Tfrm_modelo_vazio)
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    podeFechar : boolean;
  public
    { Public declarations }
  end;

var
  frmValorFormaPagamentoEncerramento: TfrmValorFormaPagamentoEncerramento;

implementation

{$R *.dfm}

uses uu_data_module;

procedure TfrmValorFormaPagamentoEncerramento.FormActivate(Sender: TObject);
begin
  inherited;
  podeFechar := false;
end;

procedure TfrmValorFormaPagamentoEncerramento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if podeFechar  then
   Action := caFree
  else
   Action := caNone;
end;

end.
