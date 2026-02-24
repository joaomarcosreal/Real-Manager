unit uu_cs_tipos_documentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  Tfrm_cs_tipos_documentos = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_tipos_documentos: Tfrm_cs_tipos_documentos;

implementation

uses uu_data_module;

{$R *.dfm}

procedure Tfrm_cs_tipos_documentos.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select * from tipos_documento where  descricao like '+Quotedstr(ed_parametro.Text+'%')+' order by descricao');
  dm.qry_consultas.Active:=true;

end;

procedure Tfrm_cs_tipos_documentos.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select * from tipos_documento order by descricao');
  dm.qry_consultas.Active:=true;
end;

end.
