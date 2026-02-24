unit uuCsProdutosGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Data.DB;

type
  TfrmCsProdutosGeral = class(Tfrm_modelo_pesquisas)
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
  frmCsProdutosGeral: TfrmCsProdutosGeral;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsProdutosGeral.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add(' select p.cod_produto,p.descricao,g.descricao as descricaoGrupo from produtos p ');
  dm.qry_consultas.SQL.add('   inner join grupos g on (g.cod_grupo = p.cod_grupo) ');
  dm.qry_consultas.sql.add(' order by descricao');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsProdutosGeral.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add(' select p.cod_produto,p.descricao,g.descricao as descricaoGrupo from produtos p ');
  dm.qry_consultas.SQL.add('   inner join grupos g on (g.cod_grupo = p.cod_grupo) ');
  dm.qry_consultas.SQL.add('  where p.descricao like '+QuotedStr(ed_parametro .Text+'%')+' ');
  dm.qry_consultas.sql.add(' order by p.descricao');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsProdutosGeral.DBGrid1DrawColumnCell(Sender: TObject;
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
