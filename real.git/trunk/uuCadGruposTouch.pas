unit uuCadGruposTouch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls;

type
  TfrmCadGruposTouch = class(Tfrm_modelo_cadastro)
    Panel1: TPanel;
    edDescGrupoTouch: TDBEdit;
    Label6: TLabel;
    procedure bt_novoClick(Sender: TObject);
    procedure bt_alterarClick(Sender: TObject);
    procedure GravarAlteracoes();
    procedure retornaInformacoes(codGrupo : string);    
    procedure bt_gravarClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGruposTouch: TfrmCadGruposTouch;

implementation

uses uu_data_module, uu_modelo_vazio;

{$R *.dfm}

procedure TfrmCadGruposTouch.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qryGruposTouch.Active:=true;
  dm.qryGruposTouch.Append;
  edDescGrupoTouch.SetFocus;

end;

procedure TfrmCadGruposTouch.bt_alterarClick(Sender: TObject);
begin
  inherited;
  ed_codigo.Enabled := true;
  ed_codigo.SetFocus;
end;


procedure TfrmCadGruposTouch.GravarAlteracoes();
begin
  if (evento = 1) then
   begin
     dm.qryGruposTouchCODIGO.Value:=dm.geraCodigo('G_GRUPOS_TOUCH',2);
   end;


  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qryGruposTouch.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryGruposTouch]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do grupo ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qryGruposTouch.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qryGruposTouch]);
         end;

    end;
end;


procedure TfrmCadGruposTouch.bt_gravarClick(Sender: TObject);
begin
  if (trim(dm.qryGruposTouchDESCRICAO.Value) <> '') then
   begin
     GravarAlteracoes;
     inherited;
   end
  else
   begin
     ShowMessage('Descrição inválida!');
     edDescGrupoTouch.SetFocus;
   end;
end;


procedure TfrmCadGruposTouch.retornaInformacoes(codGrupo : string);
begin
 dm.qryGruposTouch.Active:=false;
 dm.qryGruposTouch.sql.clear;
 dm.qryGruposTouch.SQL.ADD(' select * from grupos_touch');
 dm.qryGruposTouch.sql.add(' where codigo='+Quotedstr(codGrupo));
 dm.qryGruposTouch.Active:=true;
end;


procedure TfrmCadGruposTouch.ed_codigoExit(Sender: TObject);
begin
  inherited;
 if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
   begin
    if trim(ed_codigo.Text) = '' then exit
    else
     try
       ed_codigo.Text:=FormatFloat('00',StrToFloat(ed_codigo.text));
     except
       begin
         Showmessage('Código de grupo inválido!');
         ed_codigo.SetFocus;
         ed_codigo.Clear;
         dm.qryGruposTouch.Active:=false;
         exit;
       end;
     end;

    if evento <> 1 then
     begin
      if verificaExistenciaGrupoTouch(ed_codigo.Text) = false then
       begin
        showMessage('O grupo informado não existe!');
        limpa_edits;
        dm.qryGruposTouch.Active:=false;
        ed_codigo.SetFocus;
        exit;
       end
      else
       begin
        retornaInformacoes(ed_codigo.text);
        case evento of
         2: begin
              dm.qryGruposTouch.Edit;
              bt_gravar.Enabled:=true;
            end;
         3: begin
              bt_gravar.Enabled:=true;
            end;
        end;
       end;
     end;
   end;

end;

procedure TfrmCadGruposTouch.bt_pesquisaClick(Sender: TObject);
begin
  inherited;
  pesquisaGrupoTouch;
  
end;

end.
