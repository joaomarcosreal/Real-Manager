unit uuCsTiposSangria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, ExtCtrls,
  Data.DB, AdvGlassButton, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCsTiposSangria = class(Tfrm_modelo_pesquisas)
    procedure FormActivate(Sender: TObject);
    procedure ed_parametroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsTiposSangria: TfrmCsTiposSangria;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmCsTiposSangria.FormActivate(Sender: TObject);
begin
  string_auxiliar:='';
  string_auxiliar2:='';
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.SQL.add('select codigo,descricao from tipos_sangria order by codigo  ');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsTiposSangria.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.SQL.add('select codigo,descricao from tipos_sangria order by codigo');
  dm.qry_consultas.Active:=true;

end;

end.
