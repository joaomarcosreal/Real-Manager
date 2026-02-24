unit uu_cs_unidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  Tfrm_cs_unidades = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_unidades: Tfrm_cs_unidades;

implementation

uses uu_data_module;

{$R *.dfm}

procedure Tfrm_cs_unidades.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.sql.add('select  cod_unidade,descricao,sigla,parametro from unidades  where descricao like '+QuotedStr(ed_parametro.Text+'%')+ 'order by descricao');
  dm.qry_consultas.Active:=true;
end;

procedure Tfrm_cs_unidades.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.sql.add('select  cod_unidade,descricao,sigla,parametro from unidades order by descricao');
  dm.qry_consultas.Active:=true;
end;

end.
