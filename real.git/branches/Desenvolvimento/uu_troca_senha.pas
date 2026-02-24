unit uu_troca_senha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask,  Buttons, AdvTouchKeyboard,
  dxGDIPlusClasses, JvExControls, JvGradient;

type
  Tfrm_troca_senha = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    JvGradient1: TJvGradient;
    Image1: TImage;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    ed_senha_atual: TMaskEdit;
    Label2: TLabel;
    ed_nova_senha: TMaskEdit;
    Label3: TLabel;
    ed_confirmacao: TMaskEdit;
    Label4: TLabel;
    bt_entrar: TBitBtn;
    bt_sair: TBitBtn;
    function verifica_permissao : boolean;
    procedure bt_entrarClick(Sender: TObject);
    procedure alterar_senha;
    procedure ed_senha_atualKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_senha_atualEnter(Sender: TObject);
    procedure ed_senha_atualExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_troca_senha: Tfrm_troca_senha;

implementation

uses uu_data_module, uu_frm_principal, Math;

{$R *.dfm}

function Tfrm_troca_senha.verifica_permissao : boolean;
begin
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.SQL.Add('select * from usuarios where cod_usuario='+Quotedstr(codigo_usuario));
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


  if ed_senha_atual.Text <> dm.qryauxiliar.fieldbyname('senha').value then
  begin
    showmessage('Senha atual incorreta!');
    ed_senha_atual.SetFocus;
    ed_senha_atual.clear;
    Result:=false;
    exit;
  end;

  if Trim(ed_nova_senha.text) <> trim(ed_confirmacao.text) then
  begin
    ShowMessage('Confirmação de senha incorreta!');
    ed_confirmacao.SetFocus;
    ed_confirmacao.clear;
    Result:=false;
    Exit;
  end;
  Result:=true;
end;


procedure Tfrm_troca_senha.bt_entrarClick(Sender: TObject);
begin
  If verifica_permissao then
  begin
    alterar_senha;
    ShowMessage('Senha alterada com sucesso!');
    Close;
  end;
end;

procedure Tfrm_troca_senha.alterar_senha;
begin
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('update usuarios set senha='+Quotedstr(ed_nova_senha.text)+' where cod_usuario='+Quotedstr(codigo_usuario));
  try
   begin
     dm.qryauxiliar.ExecSQL;
   end;
  except
   begin
     dm.cria_log_de_erros(dm.qryauxiliar.sql,'Formulário de login','Erro ao alterar senha  usuários ',codigo_usuario);
     exit;
   end;
  end;
  dm.transacao.Commit;
  dm.transacao.Active:=true;
end;

procedure Tfrm_troca_senha.ed_senha_atualKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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

procedure Tfrm_troca_senha.ed_senha_atualEnter(Sender: TObject);
begin
 if  sender is TMaskEdit then
  begin
     (sender as TMaskEdit).Color:=cor_foco_edit;
  end;


end;

procedure Tfrm_troca_senha.ed_senha_atualExit(Sender: TObject);
begin



 if  sender is TMaskEdit then
  begin
     (sender as TMaskEdit).Color:=clWhite;
  end;


end;

procedure Tfrm_troca_senha.FormActivate(Sender: TObject);
begin
  ed_senha_atual.SetFocus;
end;

procedure Tfrm_troca_senha.bt_sairClick(Sender: TObject);
begin
 close;
end;

end.

