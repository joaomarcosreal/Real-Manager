unit uu_cs_item_estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Data.DB;

type
  Tfrm_cs_itens = class(Tfrm_modelo_pesquisas)
    Panel4: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Panel5: TPanel;
    Label4: TLabel;
    Panel6: TPanel;
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bt_selecionarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_itens: Tfrm_cs_itens;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure Tfrm_cs_itens.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.clear;


  dm.qry_consultas.sql.add('  select  it.*,ri.estoque_atual,vi.gasto_estimado, vi.percentual_ideal, gp.descricao as desc_grupo,');
  dm.qry_consultas.sql.add(' un.descricao as desc_unidade, un.parametro, (it.estoque_liquido / un.parametro) as estoque');
  dm.qry_consultas.sql.add('  from produtos it');
  dm.qry_consultas.sql.add('inner join  v_itens_estoque vi on (vi.cod_item = it.cod_produto)');
  dm.qry_consultas.sql.add('inner join r_estoque_item ri on (ri.cod_item = it.cod_produto)');
  dm.qry_consultas.sql.add('inner join unidades un on (un.cod_unidade = it.unidade_entrada)');
  dm.qry_consultas.sql.add('inner join grupos gp on (gp.cod_grupo = it.cod_grupo)');
  dm.qry_consultas.sql.add(' where it.descricao like '+QuotedStr(ed_parametro.Text+'%')+' order by it.descricao');



  dm.adicionaLog(dm.qry_consultas.SQL.Text);
  dm.qry_consultas.Active:=true;



end;

procedure Tfrm_cs_itens.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('  select  it.*,ri.estoque_atual,vi.gasto_estimado, vi.percentual_ideal, gp.descricao as desc_grupo,');
  dm.qry_consultas.sql.add(' un.descricao as desc_unidade, un.parametro, (it.estoque_liquido / un.parametro) as estoque');
  dm.qry_consultas.sql.add('  from produtos it');
  dm.qry_consultas.sql.add('inner join  v_itens_estoque vi on (vi.cod_item = it.cod_produto)');
  dm.qry_consultas.sql.add('inner join r_estoque_item ri on (ri.cod_item = it.cod_produto)');
  dm.qry_consultas.sql.add('inner join unidades un on (un.cod_unidade = it.unidade_entrada)');
  dm.qry_consultas.sql.add('inner join grupos gp on (gp.cod_grupo = it.cod_grupo)');


  dm.qry_consultas.Active:=true;


end;
procedure Tfrm_cs_itens.bt_selecionarClick(Sender: TObject);
begin
  inherited;
  try
   begin
    string_auxiliar:= dm.qry_consultas.fieldbyname('cod_produto').Value;
   end;
  except
   begin
     showmessage('Seleção inválida!');
     exit;
   end;
  end;
  close;

end;

procedure Tfrm_cs_itens.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
  var
  bold : boolean;
begin
  inherited;

  if ( dm.qry_consultas.fieldbyname('percentual_ideal').Value <=0) then
   begin
     TDbGrid(Sender).Canvas.font.Color:= clWhite;
     TDbGrid(Sender).Canvas.Brush.Color:= clRed;
   end;

  if (  (dm.qry_consultas.fieldbyname('percentual_ideal').Value > 0) and (dm.qry_consultas.fieldbyname('percentual_ideal').Value <=50) ) then
   begin
     TDbGrid(Sender).Canvas.font.Color:= clBlack;
     TDbGrid(Sender).Canvas.Brush.Color:= clYellow;
   end;

  if ( dm.qry_consultas.fieldbyname('percentual_ideal').Value > 50)  then
   begin
     TDbGrid(Sender).Canvas.font.Color:= clWhite;
     TDbGrid(Sender).Canvas.Brush.Color:= clGreen;
   end;
TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);


bold :=false;
//TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
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
