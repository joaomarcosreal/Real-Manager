unit uu_leitura_barras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_vazio, StdCtrls, Buttons;

type
  TfrmLeituraBarras = class(Tfrm_modelo_vazio)
    Edit2: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLeituraBarras: TfrmLeituraBarras;
   mensagem : string;
implementation

uses uu_frm_principal;

{$R *.dfm}

procedure TfrmLeituraBarras.FormKeyPress(Sender: TObject; var Key: Char);


begin
  inherited;
  mensagem := mensagem+Key;
end;

end.
