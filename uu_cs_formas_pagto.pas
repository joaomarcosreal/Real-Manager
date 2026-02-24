unit uu_cs_formas_pagto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Data.DB, AdvGlassButton;

type
  Tfrm_cs_formas_pagto = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bt_selecionarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_formas_pagto: Tfrm_cs_formas_pagto;

implementation

uses uu_data_module, uu_frm_principal, Math;

{$R *.dfm}

procedure Tfrm_cs_formas_pagto.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.SQL.add('select * from formas_pagamento where descricao like '+Quotedstr(ed_parametro.Text+'%')+' order by cod_forma');
  dm.qry_consultas.Active:=true;
end;

procedure Tfrm_cs_formas_pagto.FormActivate(Sender: TObject);
begin
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.SQL.add('select * from formas_pagamento order by  cod_forma');
  dm.qry_consultas.Active:=true;

end;

procedure Tfrm_cs_formas_pagto.bt_selecionarClick(Sender: TObject);
begin
  inherited;
  string_auxiliar :=   dm.qry_consultas.fieldbyname('cod_forma').value;
  string_auxiliar2 :=  dm.qry_consultas.fieldbyname('descricao').value;
end;

procedure Tfrm_cs_formas_pagto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
 bold : boolean;

begin
  inherited;
if odd(dm.qry_consultas.RecNo) then
begin
  DBGrid1.Canvas.Brush.Color:= clwhite;

end
else
 begin
  DBGrid1.Canvas.Brush.Color:= clMoneyGreen;

 end;

TDbGrid(Sender).Canvas.font.Color:= clBlack;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

bold :=false;
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

procedure Tfrm_cs_formas_pagto.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

 if key = vk_return then
   bt_selecionar.Click;

end;

end.
