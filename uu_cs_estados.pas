unit uu_cs_estados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, ExtCtrls,
  Data.DB, AdvGlassButton, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCsEstados = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsEstados: TfrmCsEstados;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsEstados.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.clear;
  dm.qry_consultas.sql.add('select e.codigo, e.nome, e.sigla from estado e');
  dm.qry_consultas.sql.add(' where e.nome like '+QuotedStr(ed_parametro.Text+'%')+'order by e.nome');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsEstados.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.clear;
  dm.qry_consultas.sql.add('select e.codigo, e.nome, e.sigla from estado e order by e.nome');
  dm.qry_consultas.Active:=true;
end;

end.
