unit uu_cs_clientes_reduzido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Data.DB;

type
  TfrmPesquisaClienteReduzido = class(Tfrm_modelo_pesquisas)
    Panel4: TPanel;
    Label2: TLabel;
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ed_parametroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaClienteReduzido: TfrmPesquisaClienteReduzido;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmPesquisaClienteReduzido.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.SQL.clear;
  dm.qry_consultas.SQL.Add('  select  cli.cod_cli,cli.rg,cli.razao_social ');
  dm.qry_consultas.SQL.Add('from clientes cli ');
  if (RadioGroup1.ItemIndex = 0) then
   dm.qry_consultas.sql.add(' where cli.razao_social like '+Quotedstr(ed_parametro.Text+'%')+' order by cli.razao_social')
  else
   dm.qry_consultas.sql.add(' where cli.rg like '+Quotedstr(ed_parametro.Text+'%')+' order by cli.razao_social');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmPesquisaClienteReduzido.FormActivate(Sender: TObject);
begin
  inherited;

   dm.qry_consultas.SQL.clear;
  dm.qry_consultas.SQL.Add('  select  cli.cod_cli,cli.rg,cli.razao_social ');
  dm.qry_consultas.SQL.Add('from clientes cli ');
  dm.qry_consultas.Active:=true;


end;

procedure TfrmPesquisaClienteReduzido.DBGrid1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
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

procedure TfrmPesquisaClienteReduzido.ed_parametroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  {
if  sender is TCustomEdit and ((sender as TCustomEdit).Name='ed_parametro') then
    begin
      if key = vk_up then
       begin
         dm.qry_consultas.Prior;
       end;

      if key = vk_down then
       begin
         dm.qry_consultas.Next;
       end;
    end;}

end;

end.
