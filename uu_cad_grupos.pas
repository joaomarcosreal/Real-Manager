unit uu_cad_grupos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls,  ExtCtrls, Buttons,Mask,
  DBCtrls;

type
  Tfrm_cad_grupos = class(Tfrm_modelo_cadastro)
    pn_descricao: TPanel;
    Label14: TLabel;
    ed_descricao: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    procedure bt_novoClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure GravarAlteracoes();
    procedure exibeInformacoes(cod_grupo : string);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function verificaValidade(tipo : smallint) : boolean;


  end;

var
  frm_cad_grupos: Tfrm_cad_grupos;

implementation

uses uu_data_module,
  uu_modelo_vazio;
{$R *.dfm}

function Tfrm_cad_grupos.verificaValidade(tipo : smallint) : boolean;
begin
   If tipo = 1 then
   begin

     if ( verificaExistenciaGrupo(trim(ed_codigo.text)) = true )  then
     begin
       ShowMessage('Já existe um grupo com o código informado!!!');
       Result:=false;
       exit;
     end;

     if ( length(trim(ed_codigo.text)) = 6 ) then
      begin
        if ( verificaExistenciaGrupo(copy(trim(ed_codigo.text),0,3)) = false) then
         begin
           Showmessage('Subgrupo informado não existe!');
           result:=false;
           exit;
         end;
      end;

     if ( length(trim(ed_codigo.text)) = 3 ) then
     begin
        if ( verificaExistenciaGrupo(copy(trim(ed_codigo.text),0,1)) = false) then
         begin
           Showmessage('Grupo-raiz informado não existe!');
           result:=false;
           exit;
         end;
     end;


   end
  else
    begin
      dm.qryauxiliar.Active:=false;
      dm.qryauxiliar.sql.clear;
      dm.qryauxiliar.sql.add('select * from grupos where cod_grupo like '+Quotedstr(ed_codigo.text+'%')+' and cod_grupo <> '+Quotedstr(ed_codigo.text));

      dm.qryauxiliar.Active:=true;

      if ((dm.qryauxiliar.IsEmpty = false) and (evento=3)) then
       begin
         Showmessage('Essa grupo não pode ser excluído pois existem grupos relacionados com o mesmo!');
         result:=false;
         exit;
       end;

    end;
   result:=true;
end;

procedure Tfrm_cad_grupos.bt_novoClick(Sender: TObject);
begin
  inherited;
  pn_principal.Enabled:=true;
  pn_descricao.Enabled:=true;
  dm.qry_grupos.Active:=true;
  dm.qry_grupos.append;
  dm.qry_gruposRESULTADO_RD.Value := 1;
  dm.qry_gruposMOSTRA_NO_RD.Value := 1;
  dm.qry_gruposPERC_PROJ_RD.Value :=0;

  ed_codigo.SetFocus;

end;
procedure Tfrm_cad_grupos.bt_gravarClick(Sender: TObject);
begin
  if verificaValidade(evento) then
  begin
   GravarAlteracoes();
   inherited;
  end;

end;


procedure Tfrm_cad_grupos.GravarAlteracoes();
begin

  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qry_gruposCOD_GRUPO.Value:=ed_codigo.text;
    dm.qry_grupos.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qry_grupos]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do grupo ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qry_grupos.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qry_grupos]);
         end;

    end;

end;


procedure Tfrm_cad_grupos.ed_codigoExit(Sender: TObject);
begin
  inherited;
if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
   begin
    if trim(ed_codigo.Text) = '' then exit;

    if evento <> 1 then
     begin
      if verificaExistenciaGrupo(ed_codigo.Text) = false then
       begin
        showMessage('O grupo informado não existe!');
        limpa_edits;
        ed_codigo.SetFocus;
        dm.qry_garcons.Active:=false;
        exit;
       end
      else
       begin
         exibeInformacoes(ed_codigo.Text);
        case evento of
         2: begin
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


procedure Tfrm_cad_grupos.exibeInformacoes(cod_grupo : string);
begin
 dm.qry_grupos.Active:=false;
 dm.qry_grupos.sql.clear;
 dm.qry_grupos.sql.add('select * from grupos where cod_grupo='+Quotedstr(ed_codigo.text));
 dm.qry_grupos.active:=true;
end;

procedure Tfrm_cad_grupos.bt_pesquisaClick(Sender: TObject);
begin
  pesquisaGrupo();
  inherited;
  if verificaExistenciaGrupo(ed_codigo.text) then
   begin
     exibeInformacoes(ed_codigo.text);
   end;


end;

end.
