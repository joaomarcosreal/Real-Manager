unit uu_login_naves;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Mask,  XP_Form;

type
  Tfrm_login_naves = class(TForm)
    tfXPForm1: TtfXPForm;
    ed_login: TMaskEdit;
    Label1: TLabel;
    ed_senha: TMaskEdit;
    Label2: TLabel;
    bt_entrar: TIAeverButton;
    bt_sair: TIAeverButton;
    procedure bt_entrarClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    procedure ed_loginExit(Sender: TObject);
    procedure ed_loginKeyDown(Sender: TObject; var Key: Word;

      Shift: TShiftState);
      function  verifica_permissao : boolean;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_login_naves: Tfrm_login_naves;
  tentativas : integer;

implementation

uses about,  Math, uu_data_module;

{$R *.dfm}

procedure Tfrm_login_naves.bt_entrarClick(Sender: TObject);
begin
  If verifica_permissao then
   begin
    senha_correta:=true;
    close;
   end
  else
   begin
     if tentativas = 3 then
      begin
       ShowMessage('Número de tentativas excedido!');
       senha_correta:=false;
       close;
      end
     else
      tentativas:=tentativas+1;
   end;


end;

procedure Tfrm_login_naves.bt_sairClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair ?',mtconfirmation,[mbYes,mbNo],1)=Mryes then
  begin
    senha_correta:=false;
    Close;
  end;
end;

procedure Tfrm_login_naves.ed_loginExit(Sender: TObject);
begin
 

 if  sender is TMaskEdit then
  begin
     (sender as TMaskEdit).Color:=clWhite;
  end;

end;

procedure Tfrm_login_naves.ed_loginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return
   then
     begin
       Perform(WM_NEXTDLGCTL,0,0);
     end;
   if key=vk_escape then
   begin
     bt_sair.Click;
   end;
end;
function Tfrm_login_naves.verifica_permissao : boolean;
begin
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.SQL.Add('select * from usuarios where login='+Quotedstr(ed_login.Text));
  try
   begin
     dm.qryauxiliar.Active:=true;
   end;
  except
   begin
     ShowMessage('Ocorreu um erro no sistema!  Um log de erros foi criado no formato DATA+HORA na pasta logs do Sistema. Abra o arquivo e envio por fax ou email para a Real Sofwares');
     exit;
   end;
  end;

  if dm.qryauxiliar.IsEmpty then
  begin
    showmessage('Usuário inexistente ou senha incorreta!');
    ed_login.SetFocus;
    Result:=false;
    exit;
  end;

  if ed_senha.Text <> dm.qryauxiliar.fieldbyname('senha').value then
  begin
    showmessage('Usuário inexistente ou senha incorreta!');
    ed_login.SetFocus;
    Result:=false;
    exit;
  end;               

  codigo_usuario:=dm.qryauxiliar.fieldbyname('cod_usuario').value;
  nome_usuario:=dm.qryauxiliar.fieldbyname('login').value;
  nome_completo_usuario:=dm.qryauxiliar.fieldbyname('nome_usuario').value;
  Result:=true;
end;

procedure Tfrm_login_naves.FormActivate(Sender: TObject);
begin
  tentativas:=1;
end;

end.
