unit uuSenhaGarcon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_Vazio, Mask, jpeg, ExtCtrls, AdvTouchKeyboard,
  StdCtrls, Buttons;

type
  TfrmSenhaGarcon = class(Tfrm_modelo_vazio)
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Edit2: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenhaGarcon: TfrmSenhaGarcon;

implementation

uses uuLancamentosSalao;

{$R *.dfm}

procedure TfrmSenhaGarcon.FormActivate(Sender: TObject);
begin
  inherited;
   frmSenhaGarcon.Top :=   frmLancamentosSalao.top + 105;
   frmSenhaGarcon.left :=   frmLancamentosSalao.left + 440;

end;

end.
