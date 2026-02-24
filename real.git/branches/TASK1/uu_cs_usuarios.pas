unit uu_cs_usuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Data.DB;

type
  Tfrm_cs_usuarios = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_usuarios: Tfrm_cs_usuarios;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure Tfrm_cs_usuarios.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;

  dm.qry_consultas.sql.add(' select us.cod_usuario as Codigo,us.nome_usuario as Nome,us.login as Login,');
  dm.qry_consultas.sql.add('     us.funcao,');
  dm.qry_consultas.sql.add('     case acesso  ');
  dm.qry_consultas.sql.add('      when '+Quotedstr('01060101')+' then '+Quotedstr('ATIVO'));
  dm.qry_consultas.sql.add('      else '+Quotedstr('INATIVO'));
  dm.qry_consultas.sql.add('     END');
  dm.qry_consultas.sql.add('    from usuarios us ');

  case RadioGroup1.ItemIndex of
   0: dm.qry_consultas.sql.add(' where us.nome_usuario like '+Quotedstr(ed_parametro.text+'%'));
   1: dm.qry_consultas.sql.add(' where us. login  like'+Quotedstr(ed_parametro.text+'%'));
  end;

  try
   begin
     dm.qry_consultas.Active:=true;
   end;
  except
   begin
     ShowMessage('Erro ao consultar usuários!');
     dm.cria_log_de_erros(dm.qry_consultas.sql,'Consulta de usuários','Erro ao consultar usuários',codigo_usuario);
     exit;
   end;
  end;

  if dm.qryauxiliar.IsEmpty then exit;

  DBGrid1.Columns[0].Title.caption:='Código';
  DBGrid1.Columns[1].Title.caption:='Nome';
  DBGrid1.Columns[2].Title.caption:='Login';
  DBGrid1.Columns[2].Title.caption:='Função';

end;

procedure Tfrm_cs_usuarios.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.sql.add('select us.cod_usuario as Codigo,us.nome_usuario as Nome,us.login as Login,us.funcao from usuarios us ');
  dm.qry_consultas.Active:=true;
  DBGrid1.Columns[0].Title.caption:='Código';
  DBGrid1.Columns[1].Title.caption:='Nome';
  DBGrid1.Columns[2].Title.caption:='Login';
  DBGrid1.Columns[2].Title.caption:='Função';

end;

end.
