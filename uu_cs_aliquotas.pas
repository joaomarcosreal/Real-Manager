unit uu_cs_aliquotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, ExtCtrls,
  Data.DB, AdvGlassButton, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCsAliquotas = class(Tfrm_modelo_pesquisas)
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsAliquotas: TfrmCsAliquotas;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsAliquotas.FormActivate(Sender: TObject);
begin
  inherited;
  DM.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select * from aliquotas');
  dm.qry_consultas.active:=true;
end;

end.
