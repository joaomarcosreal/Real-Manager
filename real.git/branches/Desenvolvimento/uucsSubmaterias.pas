unit uucsSubmaterias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo_consultas, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmCsSubMaterias = class(Tfrm_modelo_pesquisas)
    procedure ed_parametroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bt_selecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCsSubMaterias: TfrmCsSubMaterias;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure TfrmCsSubMaterias.ed_parametroChange(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select  it.* , gp.descricao as desc_grupo,  un.descricao as desc_unidade, un.parametro, (it.estoque_liquido / un.parametro) as estoque  from produtos it');
  dm.qry_consultas.sql.add('inner join grupos gp on (gp.cod_grupo = it.cod_grupo)');
  dm.qry_consultas.sql.add('inner join unidades un on (un.cod_unidade = it.unidade_entrada)');
  dm.qry_consultas.sql.add('  where it.submateria=1 and it.descricao like '+QuotedStr(ed_parametro.Text+'%')+' order by it.descricao');
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsSubMaterias.FormActivate(Sender: TObject);
begin
  inherited;
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.sql.add('select  it.* , gp.descricao as desc_grupo,  un.descricao as desc_unidade, un.parametro, (it.estoque_liquido / un.parametro) as estoque  from produtos it');
  dm.qry_consultas.sql.add('inner join grupos gp on (gp.cod_grupo = it.cod_grupo)');
  dm.qry_consultas.sql.add('inner join unidades un on (un.cod_unidade = it.unidade_entrada)');
  dm.qry_consultas.sql.add(' where it.submateria=1');  
  dm.qry_consultas.Active:=true;

end;

procedure TfrmCsSubMaterias.bt_selecionarClick(Sender: TObject);
begin
  inherited;
  try
   begin
    string_auxiliar:= dm.qry_consultas.fieldbyname('COD_PRODUTO').Value;
    string_auxiliar2:= dm.qry_consultas.fieldbyname('cod_barras').Value;
   end;
  except
   begin
     showmessage('Seleção inválida!');
     exit;
   end;
  end;
  close;

end;

end.
