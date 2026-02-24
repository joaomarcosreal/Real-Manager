unit uuCsTiposBaixaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmCsTiposBaixaEstoque = class(Tfrm_modelo_pesquisas)
    procedure FormActivate(Sender: TObject);
    procedure bt_selecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsTiposBaixaEstoque: TfrmCsTiposBaixaEstoque;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmCsTiposBaixaEstoque.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.SQL.add('select cod_tipo,descricao from tipos_baixa order by descricao');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsTiposBaixaEstoque.bt_selecionarClick(Sender: TObject);
begin
  inherited;
  string_auxiliar := dm.qry_consultas.fieldbyname('cod_tipo').value;
  close;
end;

procedure TfrmCsTiposBaixaEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  close;
end;

end.
