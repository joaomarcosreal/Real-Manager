unit uuCsGuarnicoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmCsGuarnicoes = class(Tfrm_modelo_pesquisas)
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure ed_parametroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsGuarnicoes: TfrmCsGuarnicoes;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsGuarnicoes.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

if odd(dm.qry_consultas.RecNo) then
 begin
   DBGrid1.Canvas.Brush.Color:= clMoneyGreen;
//   DBGrid2.Font.Color := clWhite;
 end
else
 begin
  DBGrid1.Canvas.Brush.Color:= clwhite;
//DBGrid2.Font.Color := clBlack;
 end;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte


if gdSelected in State then
with (Sender as TDBGrid).Canvas do
begin
  Brush.Color:=clRed; //aqui é definida a cor do fundo
  Font.Color := clWhite;
  Font.Size :=   Font.Size + 2;
  Font.Style:= [fsbold];
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

procedure TfrmCsGuarnicoes.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add(' select g.codigo, g.descricao from guarnicoes g ');
  dm.qry_consultas.SQL.add(' where g.descricao like '+Quotedstr(ed_parametro.Text+'%')+' order by g.descricao');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsGuarnicoes.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add(' select g.codigo, g.descricao from guarnicoes g ');
  dm.qry_consultas.SQL.add(' where g.descricao like '+Quotedstr(ed_parametro.Text+'%')+' order by g.descricao');
  dm.qry_consultas.Active:=true;

end;

end.
