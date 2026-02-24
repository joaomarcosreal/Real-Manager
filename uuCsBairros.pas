unit uuCsBairros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,db,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  AdvGlassButton;

type
  TfrmCsBairros = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsBairros: TfrmCsBairros;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsBairros.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.clear;
  dm.qry_consultas.sql.add(' select * from bairro b  where b.descricao like '+QuotedStr(ed_parametro.Text+'%')+'order by b.descricao');
  dm.qry_consultas.Active:=true;


end;

procedure TfrmCsBairros.FormActivate(Sender: TObject);
begin
  inherited;
    dm.qry_consultas.Active:=false;
    dm.qry_consultas.SQL.clear;
    dm.qry_consultas.sql.add(' select * from bairro b  order by b.descricao');
    dm.qry_consultas.sql.add(' ');
    dm.qry_consultas.Active:=true;


  end;

  procedure TfrmCsBairros.DBGrid1DrawColumnCell(Sender: TObject;
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
