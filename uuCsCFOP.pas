unit uuCsCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,
  Data.DB, uu_modelo_Vazio, JvActionsEngine, JvControlActions, Vcl.ActnList,
  System.Actions, AdvGlassButton, Vcl.Menus;

type
  TfrmCsCFOP = class(Tfrm_modelo_vazio)
    pnTitulo: TPanel;
    lbTitulo: TLabel;
    btSelecionar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Edit2: TEdit;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ed_parametroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     tipoCFOP   : integer;
  end;

var
  frmCsCFOP: TfrmCsCFOP;


implementation

uses uu_data_module;

{$R *.dfm}

procedure TfrmCsCFOP.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.sql.add('select * from cfop order by codigo');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsCFOP.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.Clear;
  dm.qry_consultas.sql.add('select * from cfop');
//  dm.qry_consultas.sql.add(' where descricao like '+Quotedstr(ed_parametro.text+'%'));
  dm.qry_consultas.sql.add(' order by descricao');
  dm.qry_consultas.Active:=true;
end;

end.
