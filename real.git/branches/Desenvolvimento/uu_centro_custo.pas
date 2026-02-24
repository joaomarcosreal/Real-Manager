unit uu_centro_custo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  Buttons,  ExtCtrls;

type
  Tfrm_centros_custo = class(TForm)
    Panel12: TPanel;
    Panel2: TPanel;
    painel: TPanel;
    ed_cod_cc: Tedit;
    Label1: TLabel;
    Label14: TLabel;
    ed_desc_cc: Tedit;
    bt_pesq_cc: TSpeedButton;
    bt_excluir: TBitBtn;
    bt_alterar: TBitBtn;
    bt_novo: TBitBtn;
    bt_gravar: TBitBtn;
    bt_cancelar: TBitBtn;
    bt_sair: TBitBtn;
    function controla_botoes(botao : TbitBtn) : boolean;
    procedure bt_novoClick(Sender: TObject);
    procedure novo_centro;
    procedure ed_cod_ccKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_cod_ccExit(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    function  gravar_grupo : boolean;
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_novoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_alterarClick(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_pesq_ccClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frm_centros_custo: Tfrm_centros_custo;
  oquefazer : integer;

implementation

uses uu_frm_principal, uu_data_module, uu_cs_c_custo;

{$R *.dfm}


function Tfrm_centros_custo.controla_botoes(botao : TbitBtn) : boolean;
begin

  if ((botao = bt_novo) or (botao=bt_alterar) or (botao=bt_excluir)) then
  begin
    bt_novo.Enabled:=false;
    bt_alterar.Enabled:=false;
    bt_excluir.Enabled:=false;
    bt_cancelar.Enabled:=true;
    bt_gravar.Enabled:=true;
    bt_sair.Enabled:=false;
  end;

  if botao=bt_gravar then
  begin
     bt_novo.Enabled:=true;
     bt_alterar.Enabled:=true;
     bt_excluir.Enabled:=true;
     bt_gravar.Enabled:=false;
     bt_cancelar.Enabled:=false;
     bt_sair.Enabled:=true;
  end;

  if botao= bt_cancelar then
  begin
     bt_novo.Enabled:=true;
     bt_alterar.Enabled:=true;
     bt_excluir.Enabled:=true;
     bt_cancelar.Enabled:=false;
     bt_sair.Enabled:=true;
     bt_gravar.Enabled:=false;
  end;

end;


procedure Tfrm_centros_custo.bt_novoClick(Sender: TObject);
begin
  oquefazer:=1;
  controla_botoes(bt_novo);
  novo_centro;
end;

procedure Tfrm_centros_custo.novo_centro;
begin
  painel.Enabled:=true;
  ed_cod_cc.Text:=Inttostr(dm.maior('centros_de_custo','cod_c_custo'));
  ed_cod_cc.text:=FormatFloat('000',StrtoFloat(ed_cod_cc.Text));
  ed_desc_cc.SetFocus;
end;


procedure Tfrm_centros_custo.ed_cod_ccKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=vk_return
   then
     begin
       Perform(WM_NEXTDLGCTL,0,0);
     end;

  if key=vk_escape then
  begin
    bt_cancelar.Click;
  end;

  if key=vk_f2 then
  begin
   if  sender is Tedit and ((sender as Tedit).Name='ed_cod_cc') then
   begin
     bt_pesq_cc.Click;
   end;
  end;

end;

procedure Tfrm_centros_custo.ed_cod_ccExit(Sender: TObject);
begin





   if  sender is Tedit and ((sender as Tedit).Name='ed_cod_cc') then
    begin
      if trim(ed_cod_cc.text) = '' then exit;
       try
        ed_cod_cc.Text:=formatfloat('000',StrToFloat(ed_cod_cc.Text));
       except
        begin
           ShowMessage('Código de centro de custo inválido!');
           ed_cod_cc.SetFocus;
           ed_cod_cc.Clear;
           exit;
        end;
       end;

       dm.qryauxiliar.Active:=false;
       dm.qryauxiliar.SQL.Clear;
       dm.qryauxiliar.SQL.add('select * from centros_de_custo where cod_c_custo='+Quotedstr(ed_cod_cc.Text));
       dm.qryauxiliar.Active:=true;

       if dm.qryauxiliar.IsEmpty then
       begin
         ShowMessage('Não existe centro de custo cadastrado com o código informado!');
         ed_cod_cc.clear;
         ed_desc_cc.clear;
         ed_cod_cc.setfocus;
         exit;
       end;
       ed_desc_cc.Text:=dm.qryauxiliar.fieldbyname('descricao').value;
    end;


end;

procedure Tfrm_centros_custo.bt_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_centros_custo.bt_cancelarClick(Sender: TObject);
begin
  controla_botoes(bt_cancelar);
  ed_cod_cc.clear;
  ed_desc_cc.clear;
  bt_pesq_cc.Enabled:=false;
  ed_cod_cc.Enabled:=false;
  ed_desc_cc.Enabled:=true;
  painel.Enabled:=false;
  bt_novo.SetFocus;
end;

function Tfrm_centros_custo.gravar_grupo : boolean;
begin
 if oquefazer = 1 then
 begin
  if trim(ed_desc_cc.Text) = '' then
   begin
     ShowMessage('Nome de centro de custo inválido!');
     ed_desc_cc.SetFocus;
     Result:=false;
     Exit;
   end;
 end;


  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select * from centros_de_custo where descricao='+Quotedstr(ed_desc_cc.text));
  dm.qryauxiliar.Active:=true;

  if oquefazer = 1 then
  begin
    if  dm.qryauxiliar.IsEmpty = false then
     begin
       ShowMessage('Já existe um centro de custo cadastrado com esse nome!');
       ed_desc_cc.SetFocus;
       ed_desc_cc.Clear;
       Result:=false;
       Exit;
     end;
  end;

  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.sql.clear;


  case oquefazer of
  1: begin
       dm.qryauxiliar.sql.add('insert into centros_de_custo (cod_c_custo,descricao) values (');
       dm.qryauxiliar.sql.add(' '+QuotedStr(ed_cod_cc.text)+',');
       dm.qryauxiliar.sql.add(' '+QuotedStr(ed_desc_cc.text)+')');
     end;
  2: begin
       dm.qryauxiliar.SQL.add('update centros_de_custo set ');
       dm.qryauxiliar.sql.add('descricao='+Quotedstr(ed_desc_cc.Text)+' where cod_c_custo='+Quotedstr(ed_cod_cc.text));
     end;
  3: begin
       dm.qryauxiliar.sql.add('delete from centros_de_custo where cod_c_custo='+Quotedstr(ed_cod_cc.text));
     end;

  end;

  try
   begin
     dm.qryauxiliar.ExecSQL;
     Result:=true;
   end;
  except
   begin
     case oquefazer of
     1: dm.cria_log_de_erros(dm.qryauxiliar.sql,'Cadastro de centros de custo ','Erro ao incluir grupo',codigo_usuario);
     end;
     exit;
     Result:=false;
   end;
  end;

  case oquefazer of
  1: showmessage('Centro de custo cadastrado com sucesso!');
  2: showmessage('Centro de custo alterado com sucesso!');
  3: showmessage('Centro de custo excluído com sucesso!');
 end;

 if dm.transacao.Active=false then dm.transacao.Active:=true;
 dm.transacao.Commit;

 Result:=true;
 bt_cancelar.click;
end;

procedure Tfrm_centros_custo.bt_gravarClick(Sender: TObject);
begin
  gravar_grupo;
end;

procedure Tfrm_centros_custo.bt_novoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then Close;
end;

procedure Tfrm_centros_custo.bt_alterarClick(Sender: TObject);
begin
  oquefazer:=2;
  controla_botoes(bt_alterar);
  painel.Enabled:=true;
  ed_cod_cc.Enabled:=true;
  bt_pesq_cc.Enabled:=true;
  ed_cod_cc.SetFocus;
end;

procedure Tfrm_centros_custo.bt_excluirClick(Sender: TObject);
begin
  oquefazer:=3;
  controla_botoes(bt_alterar);
  painel.Enabled:=true;
  ed_cod_cc.Enabled:=true;
  ed_desc_cc.Enabled:=false;
  bt_pesq_cc.Enabled:=true;
  ed_cod_cc.SetFocus;

end;

procedure Tfrm_centros_custo.bt_pesq_ccClick(Sender: TObject);
begin
  dm.qryauxiliar.Active:=false;
  dm.qryauxiliar.SQL.clear;
  dm.qryauxiliar.sql.add('select * from centros_de_custo');
  dm.qryauxiliar.Active:=true;
  if dm.qryauxiliar.IsEmpty then
  begin
    ShowMessage('Não existem cnetros de custos cadastrados!');

    bt_cancelar.Click;

    Exit;
  end;
  Application.CreateForm(Tfrm_cs_c_custo,frm_cs_c_custo);;
  frm_cs_c_custo.ShowModal;
  frm_cs_c_custo.Free;
  ed_cod_cc.Text:=string_auxiliar;
end;

end.
