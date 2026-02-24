unit uu_cad_grupos_fornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls;

type
  Tfrm_cad_grupos_fornecedores = class(Tfrm_modelo_cadastro)
    pn_descricao: TPanel;
    ed_descricao: TDBEdit;
    Label1: TLabel;
    procedure bt_novoClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
    procedure GravarAlteracoes();
    procedure ed_codigoExit(Sender: TObject);
    procedure informacoesGrupoFornecedor(cod_grupo : string);
    procedure bt_gravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_grupos_fornecedores: Tfrm_cad_grupos_fornecedores;

implementation

uses uu_data_module, uu_modelo_vazio, uu_frm_principal;

{$R *.dfm}

procedure Tfrm_cad_grupos_fornecedores.bt_novoClick(Sender: TObject);
begin
  inherited;
  pn_principal.Enabled:=true;
  dm.qry_grupos_fornecedores.Active:=true;
  dm.qry_grupos_fornecedores.Append;
  pn_descricao.Enabled:=true;
  ed_descricao.SetFocus;
end;

procedure Tfrm_cad_grupos_fornecedores.bt_pesquisaClick(Sender: TObject);
begin
  pesquisaGrupoFornecedor;
  inherited;
  if trim(ed_codigo.text) <> '' then
  informacoesGrupoFornecedor(ed_codigo.Text);

end;



procedure Tfrm_cad_grupos_fornecedores.GravarAlteracoes();
begin

   if (evento = 1) then
   begin
     ed_codigo.Text:=dm.geraCodigo('G_GRUPO_FORNECEDOR',4);
     dm.qry_grupos_fornecedoresCODIGO .Value:=ed_codigo.Text;
   end;

  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qry_grupos_fornecedores.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qry_grupos_fornecedores]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do grupo de fornecedor ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qry_grupos_fornecedores.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qry_grupos_fornecedores]);
         end;

    end;

end;


procedure Tfrm_cad_grupos_fornecedores.ed_codigoExit(Sender: TObject);
begin
  inherited;


  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
   begin
    if trim(ed_codigo.Text) = '' then exit;

    try
     ed_codigo.Text:= FormatFloat('0000',StrToFloat(ed_codigo.text));
    except
     begin
       Showmessage('Código de grupo de fornecedor inválido!');
       limpa_edits;
       ed_codigo.SetFocus;
       Exit;
     end
    end;
    if evento <> 1 then
     begin
      if verificaExistenciaGrupoFonecedor(ed_codigo.Text) = false then
       begin
        showMessage('O código de grupo informado não existe!');
        limpa_edits;
        ed_codigo.SetFocus;
        exit;
       end
      else
       begin
         informacoesGrupoFornecedor(ed_codigo.Text);
        case evento of
         2: begin
              dm.qry_grupos_fornecedores.Edit;
              pn_descricao.Enabled:=true;
              bt_gravar.Enabled:=true;
              ed_descricao.SetFocus;
            end;
         3: begin
              bt_gravar.Enabled:=true;
            end;
        end;
       end;

     end;
   end;
end;

procedure Tfrm_cad_grupos_fornecedores.informacoesGrupoFornecedor(cod_grupo : string);
begin
  dm.qry_grupos_fornecedores.Active:=false;
  dm.qry_grupos_fornecedores.SQL.clear;
  dm.qry_grupos_fornecedores.SQL.add('select * from grupo_fornecedor where codigo='+Quotedstr(cod_grupo));
  dm.qry_grupos_fornecedores.Active:=true;


end;


procedure Tfrm_cad_grupos_fornecedores.bt_gravarClick(Sender: TObject);
begin
  GravarAlteracoes();
  inherited;

end;

end.
