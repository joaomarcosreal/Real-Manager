unit uu_cs_grupos_estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls,   ExtCtrls,
  Buttons;

type
  Tfrm_cs_grupos_ = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    ed_descricao: Tedit;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    bt_selecionar: TBitBtn;
    bt_sair: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ed_descricaoChange(Sender: TObject);
    procedure ed_descricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_descricaoEnter(Sender: TObject);
    procedure ed_descricaoExit(Sender: TObject);
    procedure bt_selecionarClick(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
  private
    { Private declarations }
    tipo_pesquisa : smallint;
  public
    { Public declarations }
    procedure setTipo(tipo_pesquisa : smallint);
  end;

var
  frm_cs_grupos_: Tfrm_cs_grupos_;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure Tfrm_cs_grupos_.setTipo(tipo_pesquisa : smallint);
begin
   self.tipo_pesquisa:=tipo_pesquisa;
end;

procedure Tfrm_cs_grupos_.FormActivate(Sender: TObject);
begin

  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;


  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.add('select g.cod_grupo,g.descricao, gp.descricao as desc_pai from grupos g');
  dm.qry_consultas.sql.add(' left  join grupos gp on  ( gp.cod_grupo = g.cod_grupo_pai)');
  dm.qry_consultas.sql.add(' where g.descricao like '+Quotedstr(''+'%'));
  if tipo_pesquisa = 1 then
    dm.qry_consultas.sql.add('  and g.cod_grupo_pai is not null ');
    dm.qry_consultas.sql.add(' order by g.descricao');


  dm.qry_consultas.Active:=true;
  DBGrid1.Columns[0].Title.Caption:='Código';
  DBGrid1.Columns[1].Title.Caption:='Nome do grupo';
  DBGrid1.Columns[2].Title.Caption:='Grupo pai';

  ed_descricao.SetFocus;

end;


procedure Tfrm_cs_grupos_.ed_descricaoChange(Sender: TObject);
begin
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.sql.add('select g.cod_grupo,g.descricao, gp.descricao as desc_pai from grupos g');
  dm.qry_consultas.sql.add(' left  join grupos gp on  ( gp.cod_grupo = g.cod_grupo_pai)');
  dm.qry_consultas.sql.add(' where g.descricao like '+Quotedstr(ed_descricao.text+'%'));
   if tipo_pesquisa = 1 then
    dm.qry_consultas.sql.add('  and g.cod_grupo_pai is not null ');
    dm.qry_consultas.sql.add(' order by g.descricao');




  dm.qry_consultas.Active:=true;

  DBGrid1.Columns[0].Title.Caption:='Código';
  DBGrid1.Columns[1].Title.Caption:='Nome do grupo';
  ed_descricao.SetFocus;




end;

procedure Tfrm_cs_grupos_.ed_descricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then
  begin
     if  sender is Tedit and ((sender as Tedit).Name='ed_descricao') then
     begin
       DBGrid1.SetFocus;
     end;

     if  sender is TDBGrid and ((sender as TDBGrid).Name='DBGrid1') then
     begin
        bt_selecionar.Click;
     end;

  end;

  if key=vk_escape then
  begin
     if  sender is Tedit and ((sender as Tedit).Name='ed_descricao') then
     begin
        bt_sair.Click;
     end;

     if  sender is TDBGrid and ((sender as TDBGrid).Name='DBGrid1') then
     begin
        ed_descricao.SetFocus;
     end;

  end;


end;

procedure Tfrm_cs_grupos_.ed_descricaoEnter(Sender: TObject);
begin


if  sender is TDBGrid then
 begin
    (sender as TDBGrid).Color:=cor_foco_edit;
 end;


end;

procedure Tfrm_cs_grupos_.ed_descricaoExit(Sender: TObject);
begin
  

if  sender is TDBGrid then
 begin
    (sender as TDBGrid).Color:=clWhite;
 end;

end;

procedure Tfrm_cs_grupos_.bt_selecionarClick(Sender: TObject);
begin
  try

    string_auxiliar:=dm.qry_consultas.fieldbyname('cod_grupo').Value;
  except
   begin
     Showmessage('Seleção inválida!');
     ed_descricao.SetFocus;
     exit;
   end;
  end;
  close;

end;

procedure Tfrm_cs_grupos_.bt_sairClick(Sender: TObject);
begin
  string_auxiliar:='';
  close; 
end;




end.
