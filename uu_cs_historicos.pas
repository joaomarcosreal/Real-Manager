unit uu_cs_historicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, ExtCtrls,
  Data.DB, AdvGlassButton, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_cs_historicos_caixa = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_historicos_caixa: Tfrm_cs_historicos_caixa;

implementation

uses uu_data_module;

{$R *.dfm}

procedure Tfrm_cs_historicos_caixa.ed_parametroChange(Sender: TObject);
begin
  inherited;

  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.SQL.add('select h.cod_historico, h.descricao from historico_caixa h where h.descricao like '+Quotedstr(ed_parametro.Text+'%')+' order by h.descricao');
  dm.qry_consultas.Active:=true;
end;

procedure Tfrm_cs_historicos_caixa.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.SQL.add('select h.cod_historico, h.descricao from historico_caixa h order by descricao');
  dm.qry_consultas.active:=true;
end;

end.
