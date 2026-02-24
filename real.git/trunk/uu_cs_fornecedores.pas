unit uu_cs_fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  Tfrm_cs_fornecedores = class(Tfrm_modelo_pesquisas)
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_fornecedores: Tfrm_cs_fornecedores;

implementation

uses uu_data_module, uu_frm_principal, DB;

{$R *.dfm}

procedure Tfrm_cs_fornecedores.Edit1Change(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.sql.add('select f.cod_fornecedor, f.razao_social, f.nome_fantasia, c.nome as nome_cidade, f.cgc_cpf');
  dm.qry_consultas.sql.add('  from fornecedor f ');
  dm.qry_consultas.SQL.add(' inner join cidade c on (c.cod_cidade = f.cod_cidade) ');
  case RadioGroup1.ItemIndex of
   0: dm.qry_consultas.sql.add(' where f.razao_social like '+Quotedstr(ed_parametro.text+'%'));
   1: dm.qry_consultas.sql.add(' where f.nome_fantasia like'+Quotedstr(ed_parametro.text+'%'));
   2: dm.qry_consultas.sql.add(' where f.cgc_cpf like '+Quotedstr(ed_parametro.text+'%'));
  end;

  try
   begin
     dm.qry_consultas.Active:=true;
   end;
  except
   begin
     ShowMessage('Erro ao consultar fornecedor!');
     dm.cria_log_de_erros(dm.qry_consultas.sql,'Consulta de Fornecedores','Erro ao consultar fornecedor',codigo_usuario);
     exit;
   end;
  end;




end;

procedure Tfrm_cs_fornecedores.FormActivate(Sender: TObject);
begin
  inherited;
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.sql.add('select f.cod_fornecedor, f.razao_social, f.nome_fantasia, c.nome as nome_cidade, f.cgc_cpf');
  dm.qry_consultas.sql.add('  from fornecedor f ');
  dm.qry_consultas.SQL.add(' inner join cidade c on (c.cod_cidade = f.cod_cidade) ');
  dm.qry_consultas.Active:=true;

end;

procedure Tfrm_cs_fornecedores.DBGrid1DrawColumnCell(Sender: TObject;
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
