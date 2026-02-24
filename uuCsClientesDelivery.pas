unit uuCsClientesDelivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmCsClientesDelivery = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsClientesDelivery: TfrmCsClientesDelivery;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsClientesDelivery.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.SQL.clear;
  dm.qry_consultas.SQL.Add('  select  cli.*,tp.descricao as descricaoTipo ');
  dm.qry_consultas.SQL.Add('from clientes cli ');
  dm.qry_consultas.SQL.Add(' left join tipos_cliente tp on (tp.cod_tipo = cli.cod_tipo)');
  if (RadioGroup1.ItemIndex = 0) then
   dm.qry_consultas.sql.add(' where cli.razao_social like '+Quotedstr(ed_parametro.Text+'%')+' order by cli.razao_social')
  else
   dm.qry_consultas.sql.add(' where cli.nome_fantasia like '+Quotedstr(ed_parametro.Text+'%')+' order by cli.razao_social');
  dm.qry_consultas.Active:=true;
end;

end.
