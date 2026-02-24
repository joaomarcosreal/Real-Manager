unit uuCsGeneroItemSPED;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmCsGeneroItemSPED = class(Tfrm_modelo_pesquisas)
    procedure FormActivate(Sender: TObject);
    procedure ed_parametroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsGeneroItemSPED: TfrmCsGeneroItemSPED;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsGeneroItemSPED.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select codigo,descricao from genero_item order by codigo');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsGeneroItemSPED.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select codigo,descricao from genero_item where descricao like '+QuotedStr(ed_parametro.Text+'%')+' order by codigo');
  dm.qry_consultas.Active:=true;

end;

end.
