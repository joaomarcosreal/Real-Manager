unit uu_cs_mini_printer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Data.DB;

type
  Tfrm_cs_miniprinters = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_miniprinters: Tfrm_cs_miniprinters;

implementation

uses uu_data_module;

{$R *.dfm}

procedure Tfrm_cs_miniprinters.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.SQL.add('select cod_miniprinter,descricao from  miniprinters where descricao like '+Quotedstr(ed_parametro.Text+'%')+' order by descricao');
  dm.qry_consultas.Active:=true;

end;

procedure Tfrm_cs_miniprinters.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.SQL.add('select cod_miniprinter,descricao from miniprinters order by  descricao');
  dm.qry_consultas.Active:=true;
end;

end.

