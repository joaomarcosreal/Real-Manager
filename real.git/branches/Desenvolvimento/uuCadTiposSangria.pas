unit uuCadTiposSangria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls;

type
  TfrmCadTiposSangria = class(Tfrm_modelo_cadastro)
    Label1: TLabel;
    Panel1: TPanel;
    edDescricaoTIpoSangria: TDBEdit;
    Label2: TLabel;

    procedure GravarAlteracoes();
    procedure retornaInformacoes(codigo : string);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_novoClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTiposSangria: TfrmCadTiposSangria;

implementation

uses uu_data_module, uu_modelo_vazio;

{$R *.dfm}




procedure TfrmCadTiposSangria.GravarAlteracoes();
begin
   if (evento = 1) then
   begin

     dm.qryTiposSangriaCODIGO.Value:=dm.geraCodigo('G_TIPOS_SANGRIA',3);
   end;

  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qryTiposSangria.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qryTiposSangria]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do tipo de sangria informado ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qryTiposSangria.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qryTiposSangria]);
            dm.transacao.Commit;
            dm.transacao.Active:=false;
            dm.transacao.Active:=true;
         end;

    end;
end;



procedure TfrmCadTiposSangria.ed_codigoExit(Sender: TObject);
begin
  inherited;
   if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
   begin
    if trim(ed_codigo.Text) = '' then exit

    else
     try
       ed_codigo.Text:=FormatFloat('000',StrToFloat(ed_codigo.text));
     except
       begin
         Showmessage('Código de tipo de sangria informado Inválido!');
         ed_codigo.SetFocus;
         ed_codigo.Clear;
         exit;
       end;
     end;

    if evento <> 1 then
     begin
      if verificaExistenciaTipoSangria(ed_codigo.Text) = false then
       begin
        showMessage('Tipo de Sangria não cadastrado!');
        limpa_edits;
        dm.qryTiposSangria.Active:=false;
        ed_codigo.SetFocus;
        exit;
       end
      else
       begin
        retornaInformacoes(ed_codigo.text);
        case evento of
         2: begin
              dm.qryTiposSangria.Edit;
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


procedure TfrmCadTiposSangria.retornaInformacoes(codigo : string);
begin
 dm.qryTiposSangria.Active:=false;
 dm.qryTiposSangria.sql.clear;
 dm.qryTiposSangria.sql.add('select * from tipos_sangria where codigo='+Quotedstr(codigo));
 dm.qryTiposSangria.Active:=true;
end;


procedure TfrmCadTiposSangria.bt_novoClick(Sender: TObject);
begin
  inherited;
  dm.qryTiposSangria.Active:=true;
  dm.qryTiposSangria.Append;
  edDescricaoTIpoSangria.SetFocus;

end;

procedure TfrmCadTiposSangria.bt_cancelarClick(Sender: TObject);
begin
  inherited;
  dm.qryTiposSangria.Cancel;
  dm.transacao.Active:=false;
  dm.transacao.Active:=true;
end;


procedure TfrmCadTiposSangria.bt_gravarClick(Sender: TObject);
begin

  GravarAlteracoes();
    inherited;
end;

procedure TfrmCadTiposSangria.bt_pesquisaClick(Sender: TObject);
begin
  pesquisaTipoSangria;
  inherited;


end;

end.




