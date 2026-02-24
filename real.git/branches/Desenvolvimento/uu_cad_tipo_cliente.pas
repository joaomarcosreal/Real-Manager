unit uu_cad_tipo_cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls;

type
  Tfrm_cad_tipo_cliente = class(Tfrm_modelo_cadastro)
    pn_descricao: TPanel;
    Label14: TLabel;
    ed_descricao: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    procedure bt_novoClick(Sender: TObject);
    procedure gravarInformacoes();
    procedure bt_gravarClick(Sender: TObject);
    procedure retornaInformacoes(cod_tipo_cliente : string);
    function ValidaInformacoes() : boolean;
    procedure bt_pesquisaClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_tipo_cliente: Tfrm_cad_tipo_cliente;

implementation

uses uu_data_module, uu_modelo_vazio, uu_frm_principal;

{$R *.dfm}

procedure Tfrm_cad_tipo_cliente.bt_novoClick(Sender: TObject);
begin
  inherited;
  pn_principal.Enabled:=true;
  pn_descricao.Enabled:=true;
  dm.qry_tipos_cli.Active:=true;
  dm.qry_tipos_cli.append;
  ed_descricao.SetFocus;
end;


function Tfrm_cad_tipo_cliente.ValidaInformacoes() : boolean;
begin

  if Trim(ed_descricao.text) ='' then
   begin
     showmessage('Descrição inválida!!');
     ed_descricao.setfocus;
     result:=false;
     exit;
   end;
result:=true;
end;


procedure Tfrm_cad_tipo_cliente.gravarInformacoes();
begin
  if (evento = 1) then
   begin

     ed_codigo.Text:=dm.geraCodigo('G_TIPO_CLIENTE',3);
     dm.qry_tipos_cliCOD_TIPO.Value:=ed_codigo.Text;
   end;


  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qry_tipos_cli.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qry_tipos_cli]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do tipo de cliente?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qry_tipos_cli.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qry_tipos_cli]);
         end;

    end;
end;

procedure Tfrm_cad_tipo_cliente.bt_gravarClick(Sender: TObject);
begin
  if (validaInformacoes = true) then
  begin
    gravarInformacoes;
    inherited;
  end;
end;


procedure Tfrm_cad_tipo_cliente.retornaInformacoes(cod_tipo_cliente : string);
begin
  dm.qry_tipos_cli.Active:=false;
  dm.qry_tipos_cli.SQL.Clear;
  dm.qry_tipos_cli.SQL.add(' select  * from tipos_cliente where cod_tipo='+QuotedStr(cod_tipo_cliente));
  dm.qry_tipos_cli.active:=true;
  dm.qry_tipos_cli.active:=true;
  if (evento = 2)then
    begin
     dm.qry_tipos_cli.Edit;
    end;

  if ((evento=2) or (evento = 3)) then
    bt_gravar.Enabled:=true;

end;


procedure Tfrm_cad_tipo_cliente.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaTipoDeCliente();
  ed_codigo.Text:=string_auxiliar;
  if verificaExistenciaTipoDeCliente(ed_codigo.text) then
   retornaInformacoes(ed_codigo.text);
end;

procedure Tfrm_cad_tipo_cliente.ed_codigoExit(Sender: TObject);
begin
  inherited;
 if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
 begin


  if trim(ed_codigo.Text ) <> '' then
   begin
    try
     ed_codigo.Text:=FormatFloat('000',StrToFloat(ed_codigo.text));
    except
     begin
       Showmessage('Código de tipo de cliente inválido!!');
       exit;
     end;
    end;

   if (verificaExistenciaTipoDeCliente(ed_codigo.Text)) then
      retornaInformacoes(ed_codigo.text)
   else
    begin
      Showmessage('Código inválido!');
      exit;
    end;

   end;
 end;
end;

end.
