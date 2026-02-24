unit uuPesqTipoItemSped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmPesqTipoItemSPED = class(Tfrm_modelo_pesquisas)
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqTipoItemSPED: TfrmPesqTipoItemSPED;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmPesqTipoItemSPED.FormActivate(Sender: TObject);
begin
  inherited;
  DM.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select * from tipos_item_sped');
  dm.qry_consultas.active:=true;

end;

end.
