unit uu_cs_garcons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  Data.DB, AdvGlassButton;

type
  Tfrm_cs_garcons = class(Tfrm_modelo_pesquisas)
    Panel4: TPanel;
    Label3: TLabel;
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frm_cs_garcons: Tfrm_cs_garcons;

implementation

uses
  uu_data_module;

{$R *.dfm}

procedure Tfrm_cs_garcons.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active := false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add(' select g.cod_garcon, g.apelido, g.metre, g.cod_metre, g2.apelido');
  dm.qry_consultas.sql.add('from garcons g');
  dm.qry_consultas.sql.add('inner join garcons g2 on (g2.cod_garcon = g.cod_metre)');
  dm.qry_consultas.SQL.add(' where g.apelido like ' + Quotedstr(ed_parametro.Text + '%') + ' and g.cod_garcon <>' + Quotedstr('000'));
  case getTipoPesquisa of
    0:
      begin
         // Todos  os metres e garçons
      end;
    1:
      begin
         // Apenas metres
        dm.qry_consultas.sql.add(' and g.metre=1');
      end;
    2:
      begin
        dm.qry_consultas.sql.add(' and  g.metre=0');
      end;

  end;
  dm.qry_consultas.SQL.add('order by g.apelido');
  dm.qry_consultas.Active := true;

end;

procedure Tfrm_cs_garcons.FormActivate(Sender: TObject);
begin
  inherited;

  if (StrToInt(dm.LeIni(2, 'SALAO', 'mostrarCodigoGarcon')) = 0) then
  begin
    DBGrid1.Columns[0].Visible := false;

  end;

  dm.qry_consultas.Active := false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add(' select g.cod_garcon, g.apelido, g.metre, g.cod_metre, g2.apelido');
  dm.qry_consultas.sql.add('from garcons g');
  dm.qry_consultas.sql.add('inner join garcons g2 on (g2.cod_garcon = g.cod_metre)');
  dm.qry_consultas.SQL.add(' where g.apelido like ' + Quotedstr(ed_parametro.Text + '%') + ' and g.cod_garcon <>' + Quotedstr('000') + ' order by g.apelido');
  dm.qry_consultas.Active := true;

end;

procedure Tfrm_cs_garcons.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if odd(dm.qry_consultas.RecNo) then
  begin
    DBGrid1.Canvas.Brush.Color := clwhite;
    TDbGrid(Sender).Canvas.font.Color := clBlack;
  end
  else
  begin
    DBGrid1.Canvas.Brush.Color := $00EEEEEE;
    TDbGrid(Sender).Canvas.font.Color := clWhite;
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[DataCol].field, State);

  TDbGrid(Sender).Canvas.font.Color := clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin

      Brush.Color := clred; //aqui é definida a cor do fundo
      Font.Color := clWhite;
      Font.Size := Font.Size + 2;
      Lineto(10, 30);
      Font.Style := [fsbold];
      FillRect(Rect);
    end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[DataCol].field, State);

end;

end.

