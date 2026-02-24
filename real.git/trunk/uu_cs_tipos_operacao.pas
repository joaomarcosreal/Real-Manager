unit uu_cs_tipos_operacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  Tfrm_cs_tipos_operacao = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_tipos_operacao: Tfrm_cs_tipos_operacao;

implementation

uses uu_data_module;

{$R *.dfm}

procedure Tfrm_cs_tipos_operacao.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.clear;
  dm.qry_consultas.sql.add('select * from tipos_operacao where descricao like '+QuotedStr(ed_parametro.Text+'%'));
  dm.qry_consultas.Active:=true;
end;

procedure Tfrm_cs_tipos_operacao.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.clear;
  dm.qry_consultas.sql.add('select * from tipos_operacao ');
  dm.qry_consultas.Active:=true;

end;

end.
