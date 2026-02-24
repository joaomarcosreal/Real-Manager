unit uuCsCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmCsCFOP = class(Tfrm_modelo_pesquisas)
    procedure FormActivate(Sender: TObject);
    procedure ed_parametroChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
     tipoCFOP   : integer;
  end;

var
  frmCsCFOP: TfrmCsCFOP;


implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsCFOP.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.sql.add('select * from cfop order by codigo');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsCFOP.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.sql.add('select * from cfop');
  dm.qry_consultas.sql.add(' where descricao like '+Quotedstr(ed_parametro.text+'%'));
  dm.qry_consultas.sql.add(' order by descricao');
  dm.qry_consultas.Active:=true;
end;

procedure TfrmCsCFOP.DBGrid1DrawColumnCell(Sender: TObject;
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
  Font.Style:= [fsbold];
  FillRect(Rect);
end;

TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

end;

end.
