unit uu_cad_historico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, Buttons, Mask, ExtCtrls, DBCtrls;

type
  Tfrm_cad_historico_caixa = class(Tfrm_modelo_cadastro)
    pn_descricao: TPanel;
    Label1: TLabel;
    ed_descricao: TDBEdit;
    procedure bt_novoClick(Sender: TObject);
    procedure GravarAlteracoes();
    procedure informacoesHistorico(codigo : string);
    procedure ed_codigoExit(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_pesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_historico_caixa: Tfrm_cad_historico_caixa;

implementation

uses uu_data_module, uu_frm_principal, uu_modelo_vazio;

{$R *.dfm}




procedure Tfrm_cad_historico_caixa.bt_novoClick(Sender: TObject);
begin
  inherited;
  pn_principal.Enabled:=true;
  dm.qry_historicos_caixa.Active:=true;
  dm.qry_historicos_caixa.Append;
  pn_descricao.Enabled:=true;
  ed_descricao.SetFocus;
end;




procedure Tfrm_cad_historico_caixa.GravarAlteracoes();
begin

   if (evento = 1) then
   begin
     ed_codigo.Text:=dm.geraCodigo('G_HISTORICO_CAIXA',3);
     dm.qry_historicos_caixaCOD_HISTORICO.Value:=ed_codigo.Text;
     dm.qry_historicos_caixaDATA_CADASTRO.Value:=data_do_sistema;
   end;

  if ( (evento = 1) or (evento = 2)) then
   begin
    dm.qry_historicos_caixa.Post;
    dm.dbrestaurante.ApplyUpdates([dm.qry_historicos_caixa]);
   end
  else
    begin
      if ( evento = 3) then
       if MessageDlg('Confirma exclusão do histórico  ?',mtConfirmation,[mbYes,mbNo],0) = Mryes then
         begin
            dm.qry_historicos_caixa.Delete;
            dm.dbrestaurante.ApplyUpdates([dm.qry_historicos_caixa]);
         end;

    end;

end;


procedure Tfrm_cad_historico_caixa.ed_codigoExit(Sender: TObject);
begin
  inherited;

  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
   begin
    if trim(ed_codigo.Text) = '' then exit;

    try
     ed_codigo.Text:= FormatFloat('000',StrToFloat(ed_codigo.text));
    except
     begin
       Showmessage('Código de histórico inválido!');
       limpa_edits;
       ed_codigo.SetFocus;
       Exit;
     end
    end;
    if evento <> 1 then
     begin
      if verificaExistenciaHistorico(ed_codigo.Text) = false then
       begin
        showMessage('A Histórico  informado não existe!');
        limpa_edits;
        ed_codigo.SetFocus;
        exit;
       end
      else
       begin
        informacoesHistorico(ed_codigo.Text);

       end;

     end;
   end;

end;

procedure Tfrm_cad_historico_caixa.informacoesHistorico(codigo : string);
begin
  dm.qry_historicos_caixa.active:=false;
  dm.qry_historicos_caixa.sql.clear;
  dm.qry_historicos_caixa.sql.add('select * from historico_caixa where cod_historico='+Quotedstr(codigo));
  dm.qry_historicos_caixa.Active:=true;

  case evento of
   2: begin
       dm.qry_historicos_caixa.Edit;
       pn_descricao.Enabled:=true;
       bt_gravar.Enabled:=true;
       ed_descricao.SetFocus;
      end;
   3: begin
       bt_gravar.Enabled:=true;
      end;
  end;
end;


procedure Tfrm_cad_historico_caixa.bt_gravarClick(Sender: TObject);
begin
  GravarAlteracoes;
  inherited;

end;

procedure Tfrm_cad_historico_caixa.bt_pesquisaClick(Sender: TObject);
begin

  pesquisaHistorico();
  inherited;
  informacoesHistorico(ed_codigo.text);

end;

end.
