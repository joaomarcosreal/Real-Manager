unit uuLogTouch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, AdvTouchKeyboard, dxGDIPlusClasses,
  JvExControls, JvGradient, CurvyControls, ACBrBase, ACBrEnterTab,
  JvComponentBase, JvEnterTab;

type
  TfrmLoginTouch = class(TForm)
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    Panel1: TPanel;
    Image1: TImage;
    Label2: TLabel;
    Label1: TLabel;
    ACBrEnterTab1: TACBrEnterTab;
    edCodUsuario: TEdit;
    edSenha: TEdit;
    JvGradient1: TJvGradient;
    function verifica_permissao : boolean;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edSenhaExit(Sender: TObject);
    procedure edCodUsuarioExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
              tipo_teste : integer;
  end;

var
  frmLoginTouch: TfrmLoginTouch;

implementation

uses uu_data_module, uu_frm_principal, uu_login;

{$R *.dfm}


function TfrmLoginTouch.verifica_permissao : boolean;
begin
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.SQL.clear;
  edCodUsuario.Text := FormatFloat('000',StrToFloat(edCodUsuario.Text));
  dm.qryauxiliar.SQL.Add('select * from usuarios where cod_usuario='+Quotedstr(edCodUsuario.Text));
  try
   begin
     dm.qryauxiliar.Active:=true;
   end;
  except
   begin
     dm.adicionaLog(dm.qryauxiliar.SQL.TEXT);
     dm.cria_log_de_erros(dm.qryauxiliar.sql,'Formulário de login','Erro ao abrir tabela de usuários ',codigo_usuario);
     exit;
   end;
  end;

  if dm.qryauxiliar.IsEmpty then
  begin
    showmessage('Usuário inexistente ou senha incorreta!');
    edCodUsuario.SetFocus;
    Result:=false;
    exit;
  end;

  if edSenha.Text <> dm.qryauxiliar.fieldbyname('senha').value then
  begin
    showmessage('Usuário inexistente ou senha incorreta!');
    edCodUsuario.SetFocus;
    edCodUsuario.text := '';
    edSenha.text := '';
    Result:=false;
    exit;
  end;

  if trim(dm.qryauxiliar.fieldbyname('acesso').value) <> '01060101' then
  begin
    dm.exibe_painel_erro('ACESSO DESTE USUÁRIO NÃO É AUTORIZADO PARA ESTA LOJA','Clique para continuar');
    edCodUsuario.SetFocus;
    edCodUsuario.text := '';
    edSenha.text :='' ;
    Result:=false;
    exit;
  end;







  dm.adicionaLog('USUARIO '+dm.qryauxiliar.fieldbyname('login').value+' LOGOU NO SISTEMA');

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

procedure TfrmLoginTouch.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin



   if key = 27 then
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
end;

procedure TfrmLoginTouch.FormActivate(Sender: TObject);
begin
  if ( StrToInt(dm.LeIni(2,'SALAO','estacaoLancamentoSalao') ) =1 ) then
    begin
      edCodUsuario.text :=dm.LeIni(2,'SALAO','usr');
      edSenha.Text := dm.LeIni(2,'SALAO','pw');
      edSenha.SetFocus;
      edSenhaExit(edSenha);
      edCodUsuario.ReadOnly:=true;
      edSenha.ReadOnly := true;
      senha_correta:=true;

//      BitBtn1.SetFocus;
    end;

  if senha_correta = true then Self.close;

end;

procedure TfrmLoginTouch.edSenhaExit(Sender: TObject);
begin
  if(  trim(edSenha.Text) <> '') then
    begin   //
      If verifica_permissao then
         begin
          senha_correta:=true;
          close;
         end
        else
         begin
           
            tentativas:=tentativas+1;
         end;
    end;


end;

procedure TfrmLoginTouch.edCodUsuarioExit(Sender: TObject);
begin
  if ( Trim(edCodUsuario.Text)  ='') then
    begin
      exit;
    end
  else
   begin
     edCodUsuario.Text := FormatFloat('000',StrToFloat(edCodUsuario.Text ));

   end;


end;

end.
