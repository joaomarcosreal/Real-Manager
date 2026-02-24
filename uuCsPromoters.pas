unit uuCsPromoters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Data.DB;

type
  TfrmCsPromoters = class(Tfrm_modelo_pesquisas)
    procedure FormActivate(Sender: TObject);
    procedure ed_parametroChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsPromoters: TfrmCsPromoters;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsPromoters.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add(' select * from promoters order by cod_promoter');
  dm.qry_consultas.Active :=true;

end;

procedure TfrmCsPromoters.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add(' select * from promoters order by cod_promoter where nome like '+Quotedstr(ed_parametro.Text+'%'));
  dm.qry_consultas.Active :=true;

end;

procedure TfrmCsPromoters.DBGrid1DrawColumnCell(Sender: TObject;
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

end;

end.
