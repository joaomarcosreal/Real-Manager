unit uuFrmEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Vcl.StdCtrls,
  Vcl.ExtCtrls,  ACBrValidador,
  PngSpeedButton, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, Vcl.Buttons, Vcl.Menus;

type
  TfrmEmail = class(Tfrm_modelo_vazio)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    edEmail: TEdit;
    PngSpeedButton4: TPngSpeedButton;
    PngSpeedButton1: TPngSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure PngSpeedButton4Click(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
  private
    procedure doEmailInvalido;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmail: TfrmEmail;

implementation

{$R *.dfm}

uses uu_data_module, uu_frm_principal;

procedure TfrmEmail.FormActivate(Sender: TObject);
begin
  inherited;
  string_auxiliar :='';
  edEmail.SetFocus;
end;

procedure TfrmEmail.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  string_auxiliar :='';
  Close;
end;

procedure TfrmEmail.PngSpeedButton4Click(Sender: TObject);
begin
  inherited;
  string_auxiliar :='';
  frm_principal.validador.TipoDocto := docEmail;
  frm_principal.validador.Documento := edEmail.Text;
  try
   if  frm_principal.validador.Validar = false then
     doEmailInvalido
   else
    begin
      string_auxiliar := edEmail.Text;
      Close;
    end;
  except
   on E: Exception do
    begin
      doEmailInvalido;
    end;

  end;
end;

procedure TfrmEmail.doEmailInvalido();
begin
     dm.exibe_painel_erro('E-mail inválido!','Ok');
     string_auxiliar :='';
     edEmail.SetFocus;
end;

end.
