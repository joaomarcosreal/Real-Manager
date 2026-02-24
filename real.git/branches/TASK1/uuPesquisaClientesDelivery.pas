unit uuPesquisaClientesDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Data.DB;

type
  TfrmPesquisaClienteDelivery = class(Tfrm_modelo_pesquisas)
    procedure FormActivate(Sender: TObject);
    procedure ed_parametroChange(Sender: TObject);
    procedure bt_selecionarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaClienteDelivery: TfrmPesquisaClienteDelivery;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmPesquisaClienteDelivery.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.clear;
  dm.qry_consultas.SQL.Add('select c.codigo, c.nome, c.telefone,c.endereco,b.descricao,c.complemento,c.referencia1,c.referencia2');
  dm.qry_consultas.SQL.Add('from clientes_delivery c inner join bairro b on (b.codigo = c.cod_bairro) order by c.nome');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmPesquisaClienteDelivery.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.clear;
  dm.qry_consultas.SQL.Add('select c.codigo, c.nome, c.telefone,c.endereco,b.descricao,c.complemento,c.referencia1,c.referencia2');
  dm.qry_consultas.SQL.Add('from clientes_delivery c inner join bairro b on (b.codigo = c.cod_bairro) ');
  dm.qry_consultas.Active:=true;

  case RadioGroup1.ItemIndex  of
   0: begin
        dm.qry_consultas.sql.add('where c.nome like '+Quotedstr(ed_parametro.Text+'%')+' order by c.nome');
      end;
   1: begin
        dm.qry_consultas.sql.add('where c.telefone like '+Quotedstr(ed_parametro.Text+'%')+' order by c.nome');
      end;

   2: begin
        dm.qry_consultas.sql.add('where b.descricao like '+Quotedstr(ed_parametro.Text+'%')+' order by c.nome');
      end;

   3: begin
        dm.qry_consultas.sql.add('where c.endereco like'+Quotedstr('%'+ed_parametro.Text+'%')+' order by c.nome');
      end;
  end;


  dm.qry_consultas.Active:=true;


end;

procedure TfrmPesquisaClienteDelivery.bt_selecionarClick(Sender: TObject);
begin
  inherited;

  if dm.qry_consultas.IsEmpty  = false then
  string_auxiliar3 := dm.qry_consultas.fieldbyname('telefone').value;
end;

procedure TfrmPesquisaClienteDelivery.DBGrid1DrawColumnCell(
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

end.
