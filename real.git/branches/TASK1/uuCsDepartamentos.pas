unit uuCsDepartamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Data.DB;

type
  TfrmCsDepartamentos = class(Tfrm_modelo_pesquisas)
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsDepartamentos: TfrmCsDepartamentos;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsDepartamentos.FormActivate(Sender: TObject);
begin
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add(' select codigo,descricao from departamentos');
  dm.qry_consultas.Active:=true;
  DBGrid1.SetFocus;

end;

procedure TfrmCsDepartamentos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if odd(dm.qry_consultas.RecNo) then
DBGrid1.Canvas.Brush.Color:= clwhite
else
DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin

  Brush.Color:=clred; //aqui é definida a cor do fundo
  Font.Color := clWhite;
  Font.Size :=   Font.Size + 2;
  Lineto(10,30);
  Font.Style:= [fsbold];
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


end;

end.
