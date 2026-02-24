unit uuCsEntregradores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, ExtCtrls,
  Data.DB, AdvGlassButton, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCsEntregadores = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsEntregadores: TfrmCsEntregadores;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsEntregadores.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add(' select e.codigo, e.nome_entregador from entregadores e ');
  dm.qry_consultas.SQL.add(' where e.nome_entregador  like '+Quotedstr(ed_parametro.Text+'%'));
  dm.qry_consultas.SQL.add('order by e.nome_entregador');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsEntregadores.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add(' select e.codigo, e.nome_entregador from entregadores e ');
  dm.qry_consultas.SQL.add(' order by e.nome_entregador');
  dm.qry_consultas.Active:=true;

end;

end.
