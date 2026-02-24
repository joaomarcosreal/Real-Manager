unit about;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  Tfrm_about = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    function conexao_banco : boolean;
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_about: Tfrm_about;
  senha_correta : boolean;
  codigo_usuario : string;
  nome_usuario : string;
  nome_completo_usuario : string;

implementation

uses  uu_controle, uu_data_module, uu_login_naves;

{$R *.dfm}

function Tfrm_about.conexao_banco : boolean;
var
 local_banco,usuario,senha : string;
begin

  // Conecta ao banco de dados do rpcdx32 desse caralho

  local_banco:=ExtractFilePath( Application.ExeName )+dm.LeIni2(2,'BANCO_DE_DADOS','local_bd');
  usuario:=dm.LeIni2(2,'BANCO_DE_DADOS','usuario');
  senha:=dm.LeIni2(2,'BANCO_DE_DADOS','senha');
  dm.dbrestaurante.Connected:=false;
  dm.dbrestaurante.DatabaseName:=local_banco;
  dm.dbrestaurante.Params.Values['user_name']:=usuario;
  dm.dbrestaurante.Params.Values['password']:=senha;
  try
    dm.dbrestaurante.Connected:=true;
  except
    begin
      ShowMessage('Error on colection 1 game information!  Close application and return!');
      Result:=false;
      exit;
    end;
  end;

  //Conexão com o banco de dados principal - servidor / caixa

  Result:=true;

end;



procedure Tfrm_about.Label3Click(Sender: TObject);
begin

  If conexao_banco = false then
  begin
    Application.Terminate;
  end;
  senha_correta:=false;
  Application.CreateForm(Tfrm_login_naves ,frm_login_naves);
  frm_login_naves .ShowModal;
  frm_login_naves.Free;
  if senha_correta = false then
   begin
     frm_about.Close;
   end
  else
   begin
     Application.CreateForm(Tfrm_controle,frm_controle);
     frm_controle.showmodal;
     frm_controle.free;
   end;
end;

end.
