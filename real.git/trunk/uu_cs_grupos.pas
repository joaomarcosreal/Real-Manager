unit uu_cs_grupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  Tfrm_cs_grupos = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);                     
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_grupos: Tfrm_cs_grupos;

implementation

uses uu_data_module;

{$R *.dfm}

procedure Tfrm_cs_grupos.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select * from grupos where descricao like '+Quotedstr(ed_parametro.Text+'%')+' order by cod_grupo');
  dm.qry_consultas.Active:=true;
  dm.qry_consultas.Fields[0].EditMask:='9.99.999;0;_';
end;

procedure Tfrm_cs_grupos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

 If (length(dm.qry_consultas.fieldbyname('cod_grupo').asstring) < 6) then
     Dbgrid1.Canvas.Font.style:= [fsBold];

     dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State)

end;

procedure Tfrm_cs_grupos.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select * from grupos order by cod_grupo');
  dm.qry_consultas.Active:=true;
  dm.qry_consultas.Fields[0].EditMask:='9.99.999;0;_';

end;

end.
