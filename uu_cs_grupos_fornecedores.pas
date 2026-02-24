unit uu_cs_grupos_fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, ExtCtrls,
  Data.DB, AdvGlassButton, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_cs_grupos_fornecedores = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_grupos_fornecedores: Tfrm_cs_grupos_fornecedores;

implementation

uses uu_data_module;

{$R *.dfm}

procedure Tfrm_cs_grupos_fornecedores.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select gpf.codigo, gpf.descricao from grupo_fornecedor gpf where gpf.descricao like '+Quotedstr(ed_parametro.Text+'%')+' order by gpf.descricao');
  dm.qry_consultas.Active:=true;
end;

procedure Tfrm_cs_grupos_fornecedores.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select gpf.codigo, gpf.descricao from grupo_fornecedor gpf order by gpf.descricao');
  dm.qry_consultas.Active:=true;

end;

end.
