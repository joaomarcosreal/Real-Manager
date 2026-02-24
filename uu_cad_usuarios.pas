unit uu_cad_usuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  System.Generics.Collections, IBX.IBDatabase, Dialogs, StdCtrls, ExtCtrls,
  IBX.IBQuery, Buttons, CheckLst,

  Data.DB, FireDAC.Comp.Client,
  AdvOfficeImage, AdvGlassButton;

type
  Tfrm_cad_usuarios = class(TForm)
    Panel1: TPanel;
    Label6: TLabel;
    pn_permissoes: TPanel;
    Panel3: TPanel;
    bt_pesq_usuario: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ed_cod_usuario: TEdit;
    ed_nome: TEdit;
    ed_login: TEdit;
    ed_cargo: TEdit;
    Label4: TLabel;
    ckbRedefinir: TCheckBox;
    ckbUsuarioAtivo: TCheckBox;
    Panel2: TPanel;
    bt_novo: TAdvGlassButton;
    bt_alterar: TAdvGlassButton;
    bt_excluir: TAdvGlassButton;
    bt_gravar: TAdvGlassButton;
    bt_cancelar: TAdvGlassButton;
    bt_sair: TAdvGlassButton;
    AdvOfficeImage2: TAdvOfficeImage;
    Panel4: TPanel;
    Panel5: TPanel;
    ckbPermitirtudo: TCheckBox;
    Panel6: TPanel;
    Panel7: TPanel;
    ckb_submodulos: TCheckListBox;
    ckb_modulos: TCheckListBox;
    function novo_usuario: boolean;
    function gravar_usuario: boolean;
    function cria_lista_permissoes: boolean;
    function verifica_dados: boolean;
    procedure verifica_usuario;
    procedure bt_novoClick(Sender: TObject);
    procedure ed_cod_usuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bt_alterarClick(Sender: TObject);
    procedure bt_gravarClick(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure ckb_submodulosClickCheck(Sender: TObject);
    procedure ckb_modulosClickCheck(Sender: TObject);
    procedure verificar_modulos_selecionados;
    procedure ckb_modulosClick(Sender: TObject);
    procedure ed_cod_usuarioEnter(Sender: TObject);
    procedure ed_cod_usuarioExit(Sender: TObject);
    procedure bt_sairClick(Sender: TObject);
    procedure bt_novoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_pesq_usuarioClick(Sender: TObject);
    procedure RevisarPermissoesDoUsuario(cod_usuario: string);
    procedure ckbPermitirtudoClick(Sender: TObject);
  private
    function controla_botoes(botao: TAdvGlassButton): boolean;
    procedure AtualizaPermissoes(AListaSQL: TList<string>);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_cad_usuarios: Tfrm_cad_usuarios;
  oquefazer: smallint;

implementation

uses
  uu_frm_principal, uu_data_module, uu_cs_usuarios;

{$R *.dfm}

function Tfrm_cad_usuarios.controla_botoes(botao: TAdvGlassButton): boolean;
begin

  if ((botao = bt_novo) or (botao = bt_alterar) or (botao = bt_excluir)) then
  begin
    bt_novo.Enabled := false;
    bt_alterar.Enabled := false;
    bt_excluir.Enabled := false;
    bt_cancelar.Enabled := true;
    bt_gravar.Enabled := true;
    bt_sair.Enabled := false;
  end;

  if botao = bt_gravar then
  begin
    bt_novo.Enabled := true;
    bt_alterar.Enabled := true;
    bt_excluir.Enabled := true;
    bt_gravar.Enabled := false;
    bt_cancelar.Enabled := false;
    bt_sair.Enabled := true;
  end;

  if botao = bt_cancelar then
  begin
    bt_novo.Enabled := true;
    bt_alterar.Enabled := true;
    bt_excluir.Enabled := true;
    bt_cancelar.Enabled := false;
    bt_sair.Enabled := true;
    bt_gravar.Enabled := false;
  end;
end;

procedure Tfrm_cad_usuarios.bt_novoClick(Sender: TObject);
begin
  oquefazer := 1;
  controla_botoes(bt_novo);
  ckbRedefinir.Enabled := false;
  novo_usuario;
end;

procedure Tfrm_cad_usuarios.ed_cod_usuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

  if Key = vk_f2 then
  begin
    if Sender is Tedit and ((Sender as Tedit).Name = 'ed_cod_usuario') then
      bt_pesq_usuario.Click;
  end;

  if Key = vk_escape then
  begin
    bt_cancelar.Click;
  end;

  if Key = vk_right then
  begin
    if Sender is TCheckListBox and ((Sender as TCheckListBox).Name = 'ckb_modulos') then
      ckb_submodulos.SetFocus;
  end;

  if Key = vk_left then
  begin
    if Sender is TCheckListBox and ((Sender as TCheckListBox).Name = 'ckb_submodulos') then
      ckb_modulos.SetFocus;
  end;

end;

function Tfrm_cad_usuarios.novo_usuario: boolean;
begin
  Panel3.enabled := true;

  pn_permissoes.Enabled := true;

  dm.submodulos_temp.EmptyTable;
  dm.modulos_temp.EmptyTable;
  dm.modulos_temp.Active := true;
  dm.submodulos_temp.Active := true;
  ed_cod_usuario.Text := inttostr(dm.maior('usuarios', 'cod_usuario'));
  ed_cod_usuario.Text := FormatFloat('000', Strtofloat(ed_cod_usuario.text));
  ed_cod_usuario.Enabled := false;
  cria_lista_permissoes;
  ed_nome.SetFocus;

end;

function Tfrm_cad_usuarios.gravar_usuario: boolean;
var
  LSenhaPadrao: string;
  LSQLInsert: TStringList;
  LListaSQL: TList<string>;
begin
  dm.tb_parametros.Active := true;
  dm.tb_parametros.Refresh;
  dm.tb_parametros.Active := true;

  LSenhaPadrao := dm.tb_parametros.fieldbyname('senha_padrao').value;
  LSQLInsert := TStringList.Create;
  LListaSQL := TList<string>.Create;

  try

    case oquefazer of
      1:
        begin

          LSQLInsert.Clear;
          LSQLInsert.add('insert into usuarios (cod_usuario,nome_usuario,funcao,login,senha,entradas,acesso) values (');
          LSQLInsert.add('' + QuotedStr(ed_cod_usuario.Text) + ',');
          LSQLInsert.add('' + QuotedStr(ed_nome.text) + ',');
          LSQLInsert.add('' + Quotedstr(ed_cargo.text) + ',');
          LSQLInsert.add('' + Quotedstr(ed_login.text) + ',');
          LSQLInsert.add('' + Quotedstr(LSenhaPadrao) + ',0,' + Quotedstr('01060101') + ');');
          LListaSQL.Add(LSQLInsert.Text);

        end;

      2:
        begin
          LSQLInsert.clear;
          LSQLInsert.add('update usuarios set ');
          LSQLInsert.add('nome_usuario=' + QuotedStr(ed_nome.text) + ',');
          LSQLInsert.add('funcao=' + Quotedstr(ed_cargo.text) + ',');
          LSQLInsert.add('login=' + Quotedstr(ed_login.text) + ' ');

          if (ckbRedefinir.Checked = true) then
          begin
            LSQLInsert.add(',senha=' + Quotedstr(dm.tb_parametros.fieldbyname('senha_padrao').value));
          end;
          LListaSQL.Add(LSQLInsert.Text);

          LSQLInsert.Clear;
          LSQLInsert.add('where cod_usuario=' + Quotedstr(ed_cod_usuario.text) + ';');
          LListaSQL.Add(LSQLInsert.Text);

        end;
      3:
        begin
          LSQLInsert.clear;
          LSQLInsert.add('delete from permissoes where cod_usuario=' + Quotedstr(ed_cod_usuario.text) + ';');
          LListaSQL.Add(LSQLInsert.Text);

          LSQLInsert.clear;
          LSQLInsert.add('delete from usuarios where cod_usuario=' + Quotedstr(ed_cod_usuario.text) + ';');
          LListaSQL.Add(LSQLInsert.Text);
        end;
    end;

    case oquefazer of
      1:
        begin
          AtualizaPermissoes(LListaSQL);
          dm.ExecutaBlocoDeInstrucoes(LListaSQL, 100);
          showmessage('Cadastro realizado com sucesso!');
        end;
      2:
        begin
          AtualizaPermissoes(LListaSQL);
          dm.ExecutaBlocoDeInstrucoes(LListaSQL, 100);
          showmessage('Cadastro atualizado com sucesso!');
        end;
      3:
        begin
          dm.ExecutaBlocoDeInstrucoes(LListaSQL, 100);
          showmessage('Usuário excluído com sucesso!');
        end;
    end;

    Result := true;
  finally
    FreeAndNil(LSQLInsert);
    FreeAndNil(LListaSQL);
  end;

end;

procedure Tfrm_cad_usuarios.bt_alterarClick(Sender: TObject);
begin
  oquefazer := 2;
  controla_botoes(bt_alterar);
  Panel3.enabled := true;

  ed_cod_usuario.Enabled := true;
  bt_pesq_usuario.Enabled := true;
//  ed_login.Enabled:=false;
  ckbRedefinir.Enabled := true;
  ed_cod_usuario.SetFocus;

end;

procedure Tfrm_cad_usuarios.bt_gravarClick(Sender: TObject);
begin
  if verifica_dados then
  begin
    gravar_usuario;
    controla_botoes(bt_gravar);
    bt_cancelar.Click;
  end;
end;

procedure Tfrm_cad_usuarios.bt_cancelarClick(Sender: TObject);
begin
  controla_botoes(bt_cancelar);
  ed_cod_usuario.clear;
  ed_nome.clear;
  ed_cargo.clear;
  ed_login.Clear;
  bt_novo.setfocus;
  Panel3.enabled := false;

  ed_login.Enabled := true;
  pn_permissoes.Enabled := false;
  ed_cod_usuario.Enabled := false;
  bt_pesq_usuario.Enabled := false;
  ckb_modulos.Clear;
  ckb_submodulos.Clear;
  dm.submodulos_temp.Active := false;
  dm.modulos_temp.Active := false;

end;

function Tfrm_cad_usuarios.cria_lista_permissoes: boolean;
begin
  dm.transacao.Active := false;
  dm.qryauxiliar.Active := false;
  dm.qryauxiliar.sql.clear;
  dm.qryauxiliar.sql.add('select * from modulos  order by cod_modulo,cod_mod');
  dm.qryauxiliar.Active := true;
  dm.qryauxiliar.First;

  dm.modulos_temp.Active := true;
  dm.submodulos_temp.Active := true;
  ckb_modulos.Clear;
  ckb_submodulos.Clear;

  while not dm.qryauxiliar.Eof do
  begin
    if dm.qryauxiliar.fieldbyname('cod_mod').value = '000' then
    begin

      dm.modulos_temp.Append;
      dm.modulos_tempcod_modulo.Value := dm.qryauxiliar.fieldbyname('cod_modulo').value;
      dm.modulos_tempcod_mod.Value := dm.qryauxiliar.fieldbyname('cod_mod').value;
      dm.modulos_tempdescricao.Value := dm.qryauxiliar.fieldbyname('descricao').value;
      dm.modulos_temppermite.Value := 0;
      dm.modulos_temp.Post;
      ckb_modulos.Items.Add(dm.qryauxiliar.fieldbyname('cod_modulo').value + ' - ' + dm.qryauxiliar.fieldbyname('descricao').value);

    end
    else
    begin
      dm.submodulos_temp.Append;
      dm.submodulos_tempcod_modulo.Value := dm.qryauxiliar.fieldbyname('cod_modulo').value;
      dm.submodulos_tempcod_mod.Value := dm.qryauxiliar.fieldbyname('cod_mod').value;
      dm.submodulos_tempdescricao.Value := dm.qryauxiliar.fieldbyname('descricao').value;
      dm.submodulos_temppermite.Value := 0;
      dm.submodulos_temp.Post;
    end;
    dm.qryauxiliar.Next;
  end;

end;

procedure Tfrm_cad_usuarios.verificar_modulos_selecionados;
var
  modulo: string;
  submodulo: string;
  total_itens, item_atual, total_selecionados: smallint;
begin
  ckb_submodulos.Clear;
  dm.submodulos_temp.Refresh;
  dm.submodulos_temp.Refresh;
  dm.submodulos_temp.First;
  while not dm.submodulos_temp.Eof do
  begin
    if dm.submodulos_tempcod_modulo.Value = copy(ckb_modulos.Items[ckb_modulos.itemIndex], 0, 5) then
    begin
      ckb_submodulos.Items.Add(dm.submodulos_tempcod_mod.value + ' - ' + dm.submodulos_tempdescricao.Value);
    end;
    dm.submodulos_temp.Next;
  end;
  total_itens := ckb_submodulos.items.count;
  item_atual := 0;
  while item_atual <> total_itens do
  begin
    modulo := copy(ckb_modulos.Items[ckb_modulos.itemIndex], 0, 5);
    submodulo := copy(ckb_submodulos.Items[item_atual], 0, 3);

    dm.submodulos_temp.Locate('cod_modulo;cod_mod', VarArrayof([modulo, submodulo]), []);

    if dm.submodulos_temppermite.Value = 1 then
      ckb_submodulos.Checked[item_atual] := true
    else
      ckb_submodulos.Checked[item_atual] := false;
    item_atual := item_atual + 1;
  end;

  item_atual := 0;
  total_selecionados := 0;
  while item_atual <> total_itens do
  begin
    if ckb_submodulos.Checked[item_atual] then
      total_selecionados := total_selecionados + 1;
    item_atual := item_atual + 1;
  end;

  if total_selecionados > 0 then
  begin
    ckb_modulos.Checked[ckb_modulos.ItemIndex] := true;
  end
  else
  begin
    ckb_modulos.Checked[ckb_modulos.ItemIndex] := false;
  end;

end;

procedure Tfrm_cad_usuarios.ckb_submodulosClickCheck(Sender: TObject);
var
  modulo, submodulo: string;
begin
  modulo := copy(ckb_modulos.Items[ckb_modulos.itemIndex], 0, 5);
  submodulo := copy(ckb_submodulos.Items[ckb_submodulos.itemindex], 0, 3);
  dm.submodulos_temp.Locate('cod_modulo;cod_mod', VarArrayof([modulo, submodulo]), []);
  dm.submodulos_temp.Edit;

  if ckb_submodulos.Checked[ckb_submodulos.ItemIndex] = false then
    dm.submodulos_temppermite.Value := 0
  else
    dm.submodulos_temppermite.value := 1;
  dm.submodulos_temp.Post;
  dm.submodulos_temp.Refresh;
  verificar_modulos_selecionados;
end;

procedure Tfrm_cad_usuarios.ckb_modulosClickCheck(Sender: TObject);
var
  modulo, submodulo: string;
begin
  modulo := copy(ckb_modulos.Items[ckb_modulos.itemIndex], 0, 5);
  submodulo := '000';
  dm.modulos_temp.Locate('cod_modulo;cod_mod', VarArrayof([modulo, submodulo]), []);
  dm.modulos_temp.Edit;
  if ckb_modulos.Checked[ckb_modulos.ItemIndex] = true then
    dm.modulos_temppermite.value := 1
  else
    dm.modulos_temppermite.value := 0;
  dm.modulos_temp.Post;

  dm.submodulos_temp.First;
  while not dm.submodulos_temp.Eof do
  begin
    if dm.submodulos_tempcod_modulo.Value = copy(ckb_modulos.Items[ckb_modulos.itemIndex], 0, 5) then
    begin
      dm.submodulos_temp.edit;
      if ckb_modulos.Checked[ckb_modulos.ItemIndex] = true then
        dm.submodulos_temppermite.Value := 1
      else
        dm.submodulos_temppermite.Value := 0;
      dm.submodulos_temp.Post;
    end;
    dm.submodulos_temp.Next;
  end;

  dm.submodulos_temp.Refresh;
  dm.submodulos_temp.Refresh;
  dm.modulos_temp.Refresh;
  verificar_modulos_selecionados;

end;

procedure Tfrm_cad_usuarios.ckbPermitirtudoClick(Sender: TObject);
begin
  if ckbPermitirtudo.Checked then
  begin
    dm.executaSQL('update permissoes p set p.permite=1 where p.cod_usuario=' + Quotedstr(ed_cod_usuario.Text));
    ckbPermitirtudo.Caption := 'Negar todas as funções';
  end
  else
  begin
    dm.executaSQL('update permissoes p set p.permite=0 where p.cod_usuario=' + Quotedstr(ed_cod_usuario.Text));
    ckbPermitirtudo.Caption := 'Permitir todas as funções';
  end;

  verifica_usuario;
end;

procedure Tfrm_cad_usuarios.ckb_modulosClick(Sender: TObject);
begin
  verificar_modulos_selecionados;
end;

function Tfrm_cad_usuarios.verifica_dados: boolean;
begin

  if Trim(ed_nome.Text) = '' then
  begin
    ShowMessage('Nome inválido!');
    Result := false;
    ed_nome.setfocus;
    exit;
  end;

  if trim(ed_cargo.text) = '' then
  begin
    ShowMessage('Cargo inválido!');
    ed_cargo.SetFocus;
    Result := false;
    exit;
  end;

  if trim(ed_login.text) = '' then
  begin
    ShowMessage('Login inválido!');
    Result := false;
    ed_login.setfocus;
    exit;
  end;

  //verificar se já existe login cadastrado;

  if oquefazer = 1 then
  begin
    dm.qryauxiliar.Active := false;
    dm.qryauxiliar.sql.clear;
    dm.qryauxiliar.sql.add('select * from usuarios where nome_usuario=' + Quotedstr(trim(ed_login.text)));
    dm.qryauxiliar.active := true;
    if dm.qryauxiliar.IsEmpty then

    else
    begin
      ShowMessage('Já existe um usuário cadastrado com o login informado!');
      ed_login.SetFocus;
      Result := false;
      Exit;
    end;
  end;
  Result := true;
end;

procedure Tfrm_cad_usuarios.ed_cod_usuarioEnter(Sender: TObject);
begin
  if Sender is TCheckListBox then
  begin
    (Sender as TCheckListBox).Color := cor_foco_edit;
  end;

end;

procedure Tfrm_cad_usuarios.ed_cod_usuarioExit(Sender: TObject);
begin
  if Sender is TCheckListBox then
  begin
    (Sender as TCheckListBox).Color := clWhite;
  end;

  if Sender is Tedit and ((Sender as Tedit).Name = 'ed_cod_usuario') then
  begin
    if trim(ed_cod_usuario.Text) = '' then
      exit;
    try
      begin
        ed_cod_usuario.text := FormatFloat('000', Strtofloat(ed_cod_usuario.text));
      end;
    except
      begin
        ShowMessage('Código de usuário inválido!');
        ed_cod_usuario.clear;
        ed_cod_usuario.setfocus;
        exit;
      end;
    end;
    verifica_usuario;
  end;

end;

procedure Tfrm_cad_usuarios.AtualizaPermissoes(AListaSQL: TList<string>);
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
begin

  LSQL := TStringList.Create;

  try

    try
      LSQL.Clear;
      LSQL.Add('delete from permissoes where cod_usuario=' + Quotedstr(ed_cod_usuario.text) + ';');
      AListaSQL.Add(LSQL.Text);

      dm.modulos_temp.First;
      while not dm.modulos_temp.Eof do
      begin
        LSQL.Clear;
        LSQL.Add('insert into permissoes (cod_usuario,cod_modulo,cod_mod,permite) values (');
        LSQL.Add(QuotedStr(ed_cod_usuario.Text) + ',');
        LSQL.Add(Quotedstr(dm.modulos_tempcod_modulo.Value) + ',');
        LSQL.Add(Quotedstr(dm.modulos_tempcod_mod.Value) + ',');
        LSQL.Add(Inttostr(dm.modulos_temppermite.Value) + ');');
        AListaSQL.Add(LSQL.Text);
        dm.modulos_temp.Next;
      end;

      dm.submodulos_temp.First;
      while not dm.submodulos_temp.Eof do
      begin
        LSQL.Clear;
        LSQL.Add('insert into permissoes (cod_usuario,cod_modulo,cod_mod,permite) values (');
        LSQL.Add(QuotedStr(ed_cod_usuario.Text) + ',');
        LSQL.Add(Quotedstr(dm.submodulos_tempcod_modulo.Value) + ',');
        LSQL.Add(Quotedstr(dm.submodulos_tempcod_mod.Value) + ',');
        LSQL.Add(Inttostr(dm.submodulos_temppermite.Value) + ');');
        AListaSQL.Add(LSQL.Text);
        dm.submodulos_temp.Next;
      end;

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao executar permissões!' + E.Message, 'Ok');
//        ////dm.adicionalog(LSQL.Text);
      end
    end;
  finally

    FreeAndNil(LSQL);

  end

end;

procedure Tfrm_cad_usuarios.bt_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_cad_usuarios.bt_novoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_escape then
    bt_sair.Click;
end;

procedure Tfrm_cad_usuarios.verifica_usuario;
var
  modulo: string;
  item_atual, total_itens: integer;
begin
  dm.qry_consultas.Active := false;
  dm.qry_consultas.SQL.Clear;
  dm.qry_consultas.sql.add('select * from usuarios where cod_usuario=' + quotedstr(ed_cod_usuario.text));
  dm.qry_consultas.Active := true;
  if dm.qry_consultas.IsEmpty then
  begin
    showmessage('Usuário não localizado!');
    ed_cod_usuario.SetFocus;
    exit;
  end;

  if oquefazer <> 3 then
  begin

    pn_permissoes.Enabled := true;
  end;

  ed_nome.Text := dm.qry_consultas.fieldbyname('nome_usuario').value;
  ed_cargo.Text := dm.qry_consultas.fieldbyname('funcao').value;
  ed_login.Text := dm.qry_consultas.fieldbyname('login').value;

  //buscar permissoes do usuário;
  RevisarPermissoesDoUsuario(ed_cod_usuario.Text);

  dm.modulos_temp.EmptyTable;
  dm.submodulos_temp.EmptyTable;
  ckb_modulos.Clear;
  ckb_submodulos.Clear;

  dm.modulos_temp.Active := true;
  dm.submodulos_temp.Active := true;

  dm.qry_consultas.Active := false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.SQL.Add(' select permissoes.cod_usuario,permissoes.cod_modulo,');
  dm.qry_consultas.SQL.Add(' permissoes.cod_mod,permissoes.permite,modulos.descricao,modulos.cod_modulo,modulos.cod_mod');
  dm.qry_consultas.SQL.Add(' from permissoes,modulos');
  dm.qry_consultas.SQL.Add(' where modulos.cod_modulo=permissoes.cod_modulo and');
  dm.qry_consultas.SQL.Add(' modulos.cod_mod=permissoes.cod_mod and permissoes.cod_mod=' + Quotedstr('000'));
  dm.qry_consultas.SQL.Add(' and permissoes.cod_usuario=' + Quotedstr(ed_cod_usuario.Text) + ' order by permissoes.cod_modulo,permissoes.cod_mod');
  dm.qry_consultas.Active := true;

  while not dm.qry_consultas.Eof do
  begin
    dm.modulos_temp.Append;
    dm.modulos_tempcod_modulo.Value := dm.qry_consultas.fieldbyname('cod_modulo').value;
    dm.modulos_tempcod_mod.Value := dm.qry_consultas.fieldbyname('cod_mod').value;
    dm.modulos_tempdescricao.Value := dm.qry_consultas.fieldbyname('descricao').value;
    dm.modulos_temppermite.Value := dm.qry_consultas.fieldbyname('permite').value;
    ckb_modulos.Items.Add(dm.qry_consultas.fieldbyname('cod_modulo').value + ' - ' + dm.qry_consultas.fieldbyname('descricao').value);
    dm.modulos_temp.Post;
    dm.qry_consultas.Next;
  end;

  dm.qry_consultas.Active := false;
  dm.qry_consultas.sql.clear;
  dm.qry_consultas.SQL.Add(' select permissoes.cod_usuario,permissoes.cod_modulo,');
  dm.qry_consultas.SQL.Add(' permissoes.cod_mod,permissoes.permite,modulos.descricao,modulos.cod_modulo,modulos.cod_mod');
  dm.qry_consultas.SQL.Add(' from permissoes,modulos');
  dm.qry_consultas.SQL.Add(' where modulos.cod_modulo=permissoes.cod_modulo and');
  dm.qry_consultas.SQL.Add(' modulos.cod_mod=permissoes.cod_mod and permissoes.cod_mod<>' + Quotedstr('000'));
  dm.qry_consultas.SQL.Add(' and permissoes.cod_usuario=' + Quotedstr(ed_cod_usuario.Text) + ' order by permissoes.cod_modulo,permissoes.cod_mod');
  dm.qry_consultas.Active := true;

  while not dm.qry_consultas.Eof do
  begin
    dm.submodulos_temp.Append;
    dm.submodulos_tempcod_modulo.Value := dm.qry_consultas.fieldbyname('cod_modulo').value;
    dm.submodulos_tempcod_mod.Value := dm.qry_consultas.fieldbyname('cod_mod').value;
    dm.submodulos_tempdescricao.Value := dm.qry_consultas.fieldbyname('descricao').value;
    dm.submodulos_temppermite.Value := dm.qry_consultas.fieldbyname('permite').value;

    dm.submodulos_temp.Post;
    dm.qry_consultas.Next;
  end;

  item_atual := 0;
  dm.modulos_temp.first;
  total_itens := ckb_modulos.Items.Count;
  while item_atual <> total_itens do
  begin
    modulo := copy(ckb_modulos.Items[item_atual], 0, 5);
    dm.modulos_temp.Locate('cod_modulo', modulo, []);
    if dm.modulos_temppermite.Value = 1 then
      ckb_modulos.Checked[item_atual] := true
    else
      ckb_modulos.Checked[item_atual] := false;
    item_atual := item_atual + 1;
  end;

  if oquefazer <> 3 then
    ed_nome.SetFocus;

end;

procedure Tfrm_cad_usuarios.bt_excluirClick(Sender: TObject);
begin
  oquefazer := 3;
  controla_botoes(bt_alterar);
  Panel3.enabled := true;
  ed_cod_usuario.Enabled := true;
  bt_pesq_usuario.Enabled := true;
//  ed_login.Enabled:=false;
  ckbRedefinir.Enabled := false;
  ed_cod_usuario.SetFocus;

end;

procedure Tfrm_cad_usuarios.bt_pesq_usuarioClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cs_usuarios, frm_cs_usuarios);
  frm_cs_usuarios.ShowModal;
  frm_cs_usuarios.free;
  ed_cod_usuario.Text := string_auxiliar;
end;

procedure Tfrm_cad_usuarios.RevisarPermissoesDoUsuario(cod_usuario: string);
var
  ts: TIBTransaction;
  q: TIBQuery;
begin
  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  q := TIBQuery.Create(Self);
  q.Database := dm.dbrestaurante;
  q.Transaction := ts;

  try
    ts.Active := true;
    q.Active := false;
    q.SQL.Clear;
    q.SQL.Add(' insert into permissoes(cod_usuario,cod_modulo, cod_mod, permite) ');
    q.SQL.Add('   select ' + Quotedstr(ed_cod_usuario.Text) + ', m.cod_modulo, m.cod_mod,0 from modulos m');
    q.SQL.Add('    where not exists (select * from permissoes p2');
    q.SQL.Add('                           where p2.cod_modulo=m.cod_modulo and');
    q.SQL.Add('                           p2.cod_mod=m.cod_mod  and');
    q.SQL.Add('                           p2.cod_usuario=' + Quotedstr(ed_cod_usuario.Text) + ')');
    ;

    try
      q.ExecSQL;
      ts.Commit;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao efetuar revisão das permissões.' + E.Message, 'Ok');
        ////dm.adicionalog('Erro ao efetuar revisão das permissões do usuário.' + cod_usuario + sLineBreak + E.Message);
      end;

    end;

  finally
    q.Active := false;
    ts.Active := false;
    FreeAndNil(q);
    FreeAndNil(ts);
  end;

end;

end.

