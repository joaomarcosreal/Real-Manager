unit uu_cs_clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Data.DB, PngSpeedButton, AdvGlassButton;

type
  Tfrm_cs_clientes = class(Tfrm_modelo_pesquisas)
    Panel4: TPanel;
    Label2: TLabel;
    PngSpeedButton1: TPngSpeedButton;
    btSair: TAdvGlassButton;
    btSelecionar: TAdvGlassButton;
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btSairClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure PngSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_clientes: Tfrm_cs_clientes;

implementation

uses
  uu_data_module;

{$R *.dfm}

procedure Tfrm_cs_clientes.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.SQL.clear;
  dm.qry_consultas.SQL.Add('  select  cli.*,tp.descricao as descricaoTipo ');
  dm.qry_consultas.SQL.Add('from clientes cli ');
  dm.qry_consultas.SQL.Add(' left join tipos_cliente tp on (tp.cod_tipo = cli.cod_tipo)');
  dm.qry_consultas.sql.add(' where cli.razao_social like ' + Quotedstr('%' + ed_parametro.Text + '%'));
  dm.qry_consultas.sql.add(' or trim(cli.nome_fantasia) like ' + Quotedstr('%' + ed_parametro.Text + '%'));
  dm.qry_consultas.sql.add(' order by trim(cli.razao_social), cli.nome_fantasia');
  dm.qry_consultas.Active := true;

end;

procedure Tfrm_cs_clientes.FormActivate(Sender: TObject);
begin
  inherited;

  dm.qry_consultas.SQL.clear;
  dm.qry_consultas.SQL.Add('  select  cli.*');
  dm.qry_consultas.SQL.Add('from clientes cli ');
  dm.qry_consultas.Active := true;

end;

procedure Tfrm_cs_clientes.PngSpeedButton1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_cs_clientes.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure Tfrm_cs_clientes.btSelecionarClick(Sender: TObject);
begin
  inherited;
  bt_selecionar.Click;
end;

procedure Tfrm_cs_clientes.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if odd(dm.qry_consultas.RecNo) then
    DBGrid1.Canvas.Brush.Color := clwhite
  else
    DBGrid1.Canvas.Brush.Color := clMoneyGreen;

  TDbGrid(Sender).Canvas.font.Color := clBlack;
  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[DataCol].field, State);

  TDbGrid(Sender).Canvas.font.Color := clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := clred; //aqui é definida a cor do fundo
      Font.Color := clWhite;
      Font.Size := Font.Size + 2;
      Font.Style := [fsbold];
      FillRect(Rect);
    end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[DataCol].field, State);

end;

end.

