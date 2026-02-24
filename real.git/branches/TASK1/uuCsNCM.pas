unit uuCsNCM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmCsNCM = class(Tfrm_modelo_pesquisas)
    procedure FormActivate(Sender: TObject);
    procedure ed_parametroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsNCM: TfrmCsNCM;

implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsNCM.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select ncm,descricao from ncm order by ncm');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsNCM.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.SQL.add('select ncm,descricao from ncm where descricao like '+QuotedStr(ed_parametro.Text+'%')+' order by ncm');
  dm.qry_consultas.Active:=true;
end;

end.
