unit uuCsMotivosEstorno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmCsMotivosEstorno = class(Tfrm_modelo_pesquisas)
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsMotivosEstorno: TfrmCsMotivosEstorno;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmCsMotivosEstorno.FormActivate(Sender: TObject);
begin
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.SQL.add('select codigo,descricao from motivos_estornos order by codigo');
  dm.qry_consultas.Active:=true;

end;

end.
