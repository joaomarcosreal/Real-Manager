unit uu_cad_contas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uu_modelo, StdCtrls, ExtCtrls, Buttons, Mask;

type
  Tfrm_cad_contas = class(Tfrm_modelo_cadastro)
    pn_descricao: TPanel;
    Label1: TLabel;
    ed_descricao: TEdit;
    ckb_fixa: TCheckBox;
    procedure NovoCadastro;
    procedure bt_novoClick(Sender: TObject);
    procedure GravarAlteracoes;
    function verificaExistenciaConta(codigo : string) : boolean;
    function verificaValidade(tipo : smallint) : boolean;
    procedure bt_gravarClick(Sender: TObject);
    procedure ed_codigoExit(Sender: TObject);
    procedure informacoesConta(codigo : string);
    procedure bt_pesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_contas: Tfrm_cad_contas;

implementation

uses uu_data_module, uu_frm_principal,  uu_modelo_vazio;

{$R *.dfm}

procedure Tfrm_cad_contas.NovoCadastro;
begin
  pn_principal.Enabled:=true;
  pn_descricao.Enabled:=true;
  ed_codigo.SetFocus;

end;






procedure Tfrm_cad_contas.bt_novoClick(Sender: TObject);
begin
  inherited;
  NovoCadastro;
end;

procedure Tfrm_cad_contas.GravarAlteracoes();
var
 fixa : string;
begin
    dm.transacao.Active:=false;
    dm.transacao.StartTransaction;
    
    dm.qryauxiliar.active:=false;
    dm.qryauxiliar.sql.clear;

    if ckb_fixa.Checked then fixa:='1' else fixa:='0';

   case evento of
     1: begin
          dm.qryauxiliar.SQL.Add('insert into plano_contas_financeiro (cod_conta,DESCRICAO,fixa,DATA_CADASTRO) VALUES(');
          dm.qryauxiliar.sql.add(''+Quotedstr(ed_codigo.Text)+',');
          dm.qryauxiliar.sql.add(''+Quotedstr(ed_descricao.Text)+',');
          dm.qryauxiliar.sql.add(fixa+',');
          dm.qryauxiliar.sql.add(''+Quotedstr(FormatDateTime('DD.MM.YYY',data_do_sistema))+')');

          try
            begin
              dm.qryauxiliar.ExecSQL;
              dm.transacao.Commit;
            end;
          except
            begin
              dm.transacao.Rollback;
              dm.cria_log_de_erros(dm.qryauxiliar.sql,'Cadastro de Contas ','Erro incluir conta ',codigo_usuario);
              exit;
            end;
          end;
          
        end;
     2: begin
          dm.qryauxiliar.SQL.Add('update plano_contas_financeiro set descricao=');
          dm.qryauxiliar.sql.add(''+Quotedstr(ed_descricao.Text)+' where cod_conta='+QuotedStr(ed_codigo.text));

          try
            begin
              dm.qryauxiliar.ExecSQL;
              dm.transacao.Commit;
            end;
          except
            begin
              dm.transacao.Rollback;
              dm.cria_log_de_erros(dm.qryauxiliar.sql,'Cadastro de Contas ','Erro alterar conta ',codigo_usuario);
              exit;
            end;
          end;

        end;
     3: begin
          if ( MessageDlg('Confirma a exclusão da conta ?', mtConfirmation, [mbYes,mbNo],0 ) = mrNo) then exit; 

          dm.qryauxiliar.SQL.add('delete from plano_contas_financeiro where cod_conta='+Quotedstr(ed_codigo.Text));
          try
            begin
              dm.qryauxiliar.ExecSQL;
              dm.transacao.Commit;
              Showmessage('Conta excluída com sucesso!');
            end;
          except
            begin
              dm.transacao.Rollback;
              dm.cria_log_de_erros(dm.qryauxiliar.sql,'Cadastro de Contas ','Erro excluir conta ',codigo_usuario);
              exit;
            end;
          end;
        end;
   end;
end;

function Tfrm_cad_contas.verificaExistenciaConta(codigo : string) : boolean;
begin
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('select cod_conta from plano_contas_financeiro where cod_conta='+Quotedstr(codigo));
  dm.qryauxiliar.Active:=true;
  if dm.qryauxiliar.IsEmpty then result:=false else result:=true;
end;



function Tfrm_cad_contas.verificaValidade(tipo : smallint) : boolean;
begin
  if( (StrToInt(ed_codigo.Text) <= 2) and (evento=3) ) then
  begin
   showmessage('Essa é uma conta raiz e não pode ser manipulada');
   result:=false;
   exit;
  end;




  If tipo = 1 then
   begin

     if ( verificaExistenciaConta(trim(ed_codigo.text)) = true )  then
     begin
       ShowMessage('Já existe uma conta com o código informado!!!');
       Result:=false;
       exit;
     end;

     if ( length(trim(ed_codigo.text)) = 6 ) then
      begin
        if ( verificaExistenciaConta(copy(trim(ed_codigo.text),0,3)) = false) then
         begin
           Showmessage('Conta sintética informada não existe!');
           result:=false;
           exit;
         end;
      end;

     if ( length(trim(ed_codigo.text)) = 3 ) then
     begin
        if ( verificaExistenciaConta(copy(trim(ed_codigo.text),0,1)) = false) then
         begin
           Showmessage('Conta sintética informada não existe!');
           result:=false;
           exit;
         end;
     end;


   end
  else
    begin
      dm.qryauxiliar.Active:=false;
      dm.qryauxiliar.sql.clear;
      dm.qryauxiliar.sql.add('select * from plano_contas_financeiro where cod_conta like '+Quotedstr(ed_codigo.text+'%')+' and cod_conta <> '+Quotedstr(ed_codigo.text));

      dm.qryauxiliar.Active:=true;

      if dm.qryauxiliar.IsEmpty = false then
       begin
         Showmessage('Essa conta não pode ser excluída pois existem contas analíticas relacionadas com a mesma!');
         result:=false;
         exit;
       end;

    end;
   result:=true;
end;




procedure Tfrm_cad_contas.bt_gravarClick(Sender: TObject);
begin

 if verificaValidade(evento) then
 begin
   GravarAlteracoes;
 end;
 inherited;
end;


procedure Tfrm_cad_contas.informacoesConta(codigo : string);
begin
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select * from plano_contas_financeiro where cod_conta='+Quotedstr(codigo));
  dm.qryauxiliar.Active:=true;

  ed_descricao.Text:=dm.qryauxiliar.fieldbyname('descricao').value;
  if dm.qryauxiliar.FieldByName('fixa').value  = 1 then
   ckb_fixa.Checked:=true
  else
   ckb_fixa.Checked:=false;


 case evento of
   2: begin
       pn_descricao.Enabled:=true;
       bt_gravar.Enabled:=true;
       ed_descricao.SetFocus;
      end;
  3 : begin
       bt_gravar.Enabled:=true;
      end;
 end;
end;


procedure Tfrm_cad_contas.ed_codigoExit(Sender: TObject);
begin
  inherited;
  if (sender is TMaskEdit and ((sender as TMaskEdit).Name='ed_codigo')) then
   begin
    if trim(ed_codigo.Text) = '' then exit;

    if evento <> 1 then
     begin
      if verificaExistenciaConta(ed_codigo.Text) = false then
       begin
        showMessage('A conta informada não existe!');
        limpa_edits;
        ed_codigo.SetFocus;
        exit;
       end
      else
       begin
        informacoesConta(ed_codigo.Text);

       end;

     end;
   end;

end;

procedure Tfrm_cad_contas.bt_pesquisaClick(Sender: TObject);
begin
  pesquisaCentroDeCusto();
  inherited;
  if verificaExistenciaCentroDeCusto(ed_codigo.text) then
   begin
     informacoesConta(ed_codigo.text);
   end;

end;


end.
