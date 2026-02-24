unit uu_cad_formas_pagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls, ComCtrls;

type
  Tfrm_formas_pagto = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ed_desc_f: TDBEdit;
    ed_rp: TDBEdit;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit2: TDBEdit;
    TreeView1: TTreeView;
    procedure bt_novoClick(Sender: TObject);
    procedure gravarInformacoes();
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure retornaInformacoes(cod_forma : string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_formas_pagto: Tfrm_formas_pagto;

implementation

uses uu_data_module, uu_modelo_vazio;

{$R *.dfm}

procedure Tfrm_formas_pagto.bt_novoClick(Sender: TObject);
begin
  inherited;
  pn_principal.Enabled:=true;
  dm.qry_formas_pagto.Active:=true;
  dm.qry_formas_pagto.append;

end;

procedure Tfrm_formas_pagto.gravarInformacoes();
begin

  if ( (evento = 1) or (evento = 2)) then
   begin
    ed_codigo.Text:=dm.geraCodigo('G_FORMAS_PAGTO',3);
    dm.qry_formas_pagtoCOD_FORMA.Value:=ed_codigo.text;
    dm.qry_formas_pagto.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qry_formas_pagto]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão da forma de pagamento ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qry_formas_pagto.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qry_formas_pagto]);
         end;

    end;


end;

procedure Tfrm_formas_pagto.bt_gravarClick(Sender: TObject);
begin
  gravarInformacoes();
  inherited;

end;

procedure Tfrm_formas_pagto.bt_pesquisaClick(Sender: TObject);
begin
  pesquisaFormaPagto();
  inherited;
  if verificaExistenciaFormaPagto(ed_codigo.text) then
   begin
     retornaInformacoes(ed_codigo.text);
   end;

end;


procedure Tfrm_formas_pagto.retornaInformacoes(cod_forma : string);
begin
 dm.qry_formas_pagto.Active:=false;
 dm.qry_formas_pagto.sql.clear;
 dm.qry_formas_pagto.SQL.add('select * from formas_pagamento where cod_forma='+QUotedstr(cod_forma));
 dm.qry_formas_pagto.Active:=true;

 case evento of
  2: begin
      dm.qry_formas_pagto.Edit;
      bt_gravar.Enabled:=true;
    end;
  3: begin
      bt_gravar.Enabled:=true;
     end;
 end;

end;

end.
