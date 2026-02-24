unit uu_cs_c_custo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGrids, StdCtrls,   ExtCtrls,
  Buttons, Data.DB, Vcl.Grids;

type
  Tfrm_cs_c_custo = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    ed_descricao: Tedit;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    bt_selecionar: TBitBtn;
    bt_sair: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ed_descricaoChange(Sender: TObject);
    procedure ed_descricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_descricaoEnter(Sender: TObject);
    procedure ed_descricaoExit(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    procedure bt_selecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cs_c_custo: Tfrm_cs_c_custo;

implementation

uses uu_data_module, uu_frm_principal;

{$R *.dfm}

procedure Tfrm_cs_c_custo.FormActivate(Sender: TObject);
begin

  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.sql.add('select * from centros_de_custo order by descricao');
  dm.qry_consultas.Active:=true;
  DBGrid1.Columns[0].Title.Caption:='Código';
  DBGrid1.Columns[1].Title.Caption:='Centro de custo';
  ed_descricao.SetFocus;

end;

procedure Tfrm_cs_c_custo.ed_descricaoChange(Sender: TObject);
begin
  dm.qry_consultas.Active:=false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.sql.add('select * from centros_de_custo where descricao like '+QuotedStr(ed_descricao.Text+'%')+ 'order by descricao');
  dm.qry_consultas.Active:=true;

  DBGrid1.Columns[0].Title.Caption:='Código';
  DBGrid1.Columns[1].Title.Caption:='Centro de custo';
  ed_descricao.SetFocus;




end;

procedure Tfrm_cs_c_custo.ed_descricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return then
  begin
     if  sender is Tedit and ((sender as Tedit).Name='ed_descricao') then
     begin
       DBGrid1.SetFocus;
     end;

     if  sender is TDBGrid and ((sender as TDBGrid).Name='DBGrid1') then
     begin
        bt_selecionar.Click;
     end;

  end;

  if key=vk_escape then
  begin
     if  sender is Tedit and ((sender as Tedit).Name='ed_descricao') then
     begin
        bt_sair.Click;
     end;

     if  sender is TDBGrid and ((sender as TDBGrid).Name='DBGrid1') then
     begin
        ed_descricao.SetFocus;
     end;

  end;


end;

procedure Tfrm_cs_c_custo.ed_descricaoEnter(Sender: TObject);
begin


if  sender is TDBGrid then
 begin
    (sender as TDBGrid).Color:=cor_foco_edit;
 end;


end;

procedure Tfrm_cs_c_custo.ed_descricaoExit(Sender: TObject);
begin


if  sender is TDBGrid then
 begin
    (sender as TDBGrid).Color:=clWhite;
 end;

end;

procedure Tfrm_cs_c_custo.bt_sairClick(Sender: TObject);
begin
  string_auxiliar:='';
  close;
end;

procedure Tfrm_cs_c_custo.bt_selecionarClick(Sender: TObject);
begin
  try
    string_auxiliar:=dm.qry_consultas.fieldbyname('cod_c_custo').Value;
  except
   begin
     Showmessage('Seleção inválida!');
     ed_descricao.SetFocus;
     exit;
   end;
  end;
  close;

end;

end.
