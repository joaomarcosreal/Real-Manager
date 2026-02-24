unit uuCsObservacoesPreparo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmCsObservacoesPreparo = class(Tfrm_modelo_pesquisas)
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsObservacoesPreparo: TfrmCsObservacoesPreparo;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsObservacoesPreparo.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.SQL.add('select cod_obs,descricao from observacoes_padrao order by descricao');
  
  dm.qry_consultas.Active:=true;

end;

end.
