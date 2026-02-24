unit uu_cs_tipos_cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, ExtCtrls,
  Data.DB, AdvGlassButton, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_cs_tipos_cliente = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_tipos_cliente: Tfrm_cs_tipos_cliente;

implementation

uses uu_data_module;

{$R *.dfm}

procedure Tfrm_cs_tipos_cliente.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select * from tipos_cliente where descricao like '+Quotedstr(ed_parametro.Text+'%')+' order by cod_tipo');
  dm.qry_consultas.Active:=true;

end;

procedure Tfrm_cs_tipos_cliente.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select * from tipos_cliente  order by descricao');
  dm.qry_consultas.Active:=true;

end;

end.
