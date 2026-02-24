unit uu_login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask,   Buttons,
  AdvTouchKeyboard;

type
  Tfrm_login = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    ed_senha: TMaskEdit;
    ed_login: TMaskEdit;
    Panel2: TPanel;
    bt_entrar: TBitBtn;
    bt_sair: TBitBtn;
    procedure ed_loginEnter(Sender: TObject);
    procedure ed_loginExit(Sender: TObject);
    procedure ed_loginKeyDown(Sender: TObject; var Key: Word;

      Shift: TShiftState);
      function  verifica_permissao : boolean;
    procedure FormActivate(Sender: TObject);
    procedure bt_entrarClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    procedure bt_entrarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
      tipo_teste : integer;
  end;

var
  frm_login: Tfrm_login;

  tentativas : integer;

implementation

uses uu_frm_principal, uu_data_module, Math;

{$R *.dfm}

procedure Tfrm_login.ed_loginEnter(Sender: TObject);
begin
 if  sender is TMaskEdit then
  begin
     (sender as TMaskEdit).Color:=cor_foco_edit;
  end;

end;

procedure Tfrm_login.ed_loginExit(Sender: TObject);
begin



end;

procedure Tfrm_login.ed_loginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return
   then
     begin
       Perform(WM_NEXTDLGCTL,0,0);
     end;
   if key=vk_escape then
   begin
    if tipo_teste = 0 then
     bt_sair.Click
    else

      Close;
   end;
end;
function Tfrm_login.verifica_permissao : boolean;
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
     dm.cria_log_de_erros(dm.qryauxiliar.sql,'Formulário de login','Erro ao abrir tabela de usuários ',codigo_usuario);
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


  if (tipo_teste = 0)
   then
     begin
        codigo_usuario:=dm.qryauxiliar.fieldbyname('cod_usuario').value;
        nome_usuario:=dm.qryauxiliar.fieldbyname('login').value;
        nome_completo_usuario:=dm.qryauxiliar.fieldbyname('nome_usuario').value;

        codigo_usuario_responsavel:=dm.qryauxiliar.fieldbyname('cod_usuario').value;
        nome_usuario_responsavel:=dm.qryauxiliar.fieldbyname('login').value;
        nome_comp_usuario_responsavel:=dm.qryauxiliar.fieldbyname('nome_usuario').value;


     end
   else
     begin
       codigo_usuario_responsavel:=dm.qryauxiliar.fieldbyname('cod_usuario').value;
       nome_usuario_responsavel:=dm.qryauxiliar.fieldbyname('login').value;
       nome_comp_usuario_responsavel:=dm.qryauxiliar.fieldbyname('nome_usuario').value;

     end;

  Result:=true;

end;

procedure Tfrm_login.FormActivate(Sender: TObject);
begin
  tentativas:=1;
end;

procedure Tfrm_login.bt_entrarClick(Sender: TObject);
begin
If verifica_permissao then
   begin
    senha_correta:=true;
    frm_login.close;
   end
  else
   begin
     if tentativas = 3 then
      begin

       ShowMessage('Número de tentativas excedido!');
       senha_correta:=false;
       if (tipo_teste = 0 ) then
       Application.Terminate;
       close;
      end
     else
      tentativas:=tentativas+1;
   end;

end;

procedure Tfrm_login.bt_sairClick(Sender: TObject);
begin

 if tipo_teste = 0 then
  begin
    if MessageDlg('Deseja realmente sair ?',mtconfirmation,[mbYes,mbNo],1)=Mryes then
      begin
        senha_correta:=false;
        Application.Terminate;
      end;
  end
 else
  Close;

end;

procedure Tfrm_login.bt_entrarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_escape then
   begin
    if tipo_teste = 0 then
     bt_sair.Click
    else

      Close;
   end;
end;

end.
