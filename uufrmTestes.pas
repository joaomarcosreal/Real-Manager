unit uufrmTestes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  uRESTDWConsts, System.json, UUDadosConexaoAPIReplicacao, uu_data_module,
  Rest.Types, uRESTDWParams, Rest.Json, RealFramework,
  System.Generics.Collections, System.NetEncoding, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uu_modelo_Vazio, Data.DB, Vcl.StdCtrls,
  Vcl.ExtCtrls, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, ReplicationContainer, ReplicationItem, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Comp.DataSet, JvActionsEngine, JvControlActions,
  Vcl.ActnList, System.Actions, Vcl.Buttons, AdvGlassButton,
  Vcl.ComCtrls, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.Menus;

type
  TfrmSincronizarBase = class(Tfrm_modelo_vazio)
    DataSource1: TDataSource;
    memTb: TFDMemTable;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Panel1: TPanel;
    lb_mesa: TLabel;
    lblTitulo: TLabel;
    Panel2: TPanel;
    btSincronizar: TAdvGlassButton;
    btSair: TAdvGlassButton;
    Panel3: TPanel;
    lbStatus: TLabel;
    ProgressBar1: TProgressBar;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSincronizarClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
  private
    procedure sincronizar;
    procedure SincronizarGrupos;
    procedure sincronizarProdutos;
    procedure sincronizarGruposAdicionais;
    procedure sincronizarProdutosGruposAdicionais;
    procedure sincronizarGruposTouch;
    procedure sincronizarUsuarios;
    procedure sincronizarPermissoes;
    procedure sincronizarModulos;
    procedure ApagarModulosEPermissoesGerenciais;
    procedure ReplicateItem(AItem: TReplicationItem; ATransacao: TFDTransaction);
    function generateSQLUpdateCommand(AQuery: TFDquery; AItem: TReplicationItem): string;
    procedure ReplicarDados(ADados: TStringList);
    function getDadosSincronizacao(ARetorno: TStringList; ADadosAPIReplicacao: TDadosAPIReplicacao): boolean;


    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSincronizarBase: TfrmSincronizarBase;

implementation

uses
  uuDmAtualizaBase, uu_frm_principal;

{$R *.dfm}

procedure TfrmSincronizarBase.btSairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmSincronizarBase.btSincronizarClick(Sender: TObject);
var
  LDadoSincronizacao: TStringList;
  LDadosAPIReplicacao: TDadosAPIReplicacao;
begin
  inherited;
  LDadoSincronizacao := TStringlist.Create;

  try
    LDadosAPIReplicacao := dm.GetDadosAPIReplicacao();
    if LDadosAPIReplicacao.PermiteSincronizar = true then
    begin
      try
        btSincronizar.Enabled := false;
        if (ShowRealDialog(Self, tmConfirmacao, 'Confirme', 'Confirma a sincronização das bases   ?') = teSim) then
        begin
          getDadosSincronizacao(LDadoSincronizacao, LDadosAPIReplicacao);
          ReplicarDados(LDadoSincronizacao);
          ShowRealDialog(Self, tmsucesso, 'Sucesso!', 'Sincronização efetuada corretamente!');
        end;
      except
        on E: Exception do
        begin
          showRealDialog(frm_principal, tmErro, 'Erro', 'Erro ao realizar sincronização!' + sLineBreak + e.Message, 22, false);
        end;
      end;
    end
    else
    begin
      showRealDialog(frm_principal, tmErro, 'Erro', 'Esta estação não tem permissão para sincronização!', 22, false);
    end;

  finally
    FreeAndNil(LDadoSincronizacao);
    btSincronizar.Enabled := true;
  end;

end;

function TfrmSincronizarBase.getDadosSincronizacao(ARetorno: TStringList; ADadosAPIReplicacao: TDadosAPIReplicacao): boolean;
var
  LJsonRetorno: TStringList;
  LData, LHora, LDataHora: string;
  LHeaders: TStringList;
  LBody: Tstringlist;
  LURLBase, LURLParam: string;
begin
{

  LJsonRetorno := TStringList.Create;
  LHeaders := TStringList.Create;
  LHeaders.NameValueSeparator := '=';
  LBody := TStringList.Create;
  LBody.NameValueSeparator := '=';

  try
    try

      LURLBase := 'http://' + ADadosAPIReplicacao.Servidor + ':' + ADadosAPIReplicacao.Porta + '/';

      LHeaders.Add('Authorization=Bearer ' + ADadosAPIReplicacao.Token);
      LHeaders.add('X-Merchant=' + ADadosAPIReplicacao.MerchantID);

      if dm.HTTPRequest(rmGET, scOK, LURLBase, 'getBasicTables', LURLParam, LHeaders, LBody, LJsonRetorno, 3, 3, ctAPPLICATION_JSON) then
      begin
        ARetorno.Add(LJsonRetorno.Text);
        Result := true;
      end
      else
      begin
        ARetorno.Add(LJsonRetorno.Text);
        dm.adicionaLog(LJsonRetorno.Text);
        Result := false;
        raise Exception.Create('Erro buscar dados de sincronização!');
      end;

    except
      on E: Exception do
      begin
        Result := false;
        dm.adicionaLog('Erro ao buscar dados de sincronização!');
        dm.adicionaLog(LJsonRetorno.Text);
      end;

    end;
  finally
    FreeAndNil(LJsonRetorno);
    FreeAndNil(LBody);
    FreeAndNil(LHeaders);

  end;
  }
end;

procedure TfrmSincronizarBase.ReplicarDados(ADados: TStringList);
var
  ts: TFDTransaction;
  ctItemsReplicacao: integer;
  LContainer: TReplicationContainer;
  LItemReplicacao: TReplicationItem;
  LQtdRegistros: Integer;
  LStream: TStringStream;
begin

  ts := TFDTransaction.Create(nil);
  ts.Connection := dm.fdRestaurante;
  LStream := TStringStream.Create;

  try
    try

      LStream.WriteString(ADados.Text);
      TNetEncoding.Base64.Decode(LStream, LStream);
      ADados.Text := LStream.DataString;

      LContainer := TJson.JsonToObject<TReplicationContainer>(ADados.Text);
      LQtdRegistros := 0;
      ts.StartTransaction;

      for ctItemsReplicacao := 0 to LContainer.Items.Count - 1 do
      begin
        LItemReplicacao := LContainer.Items[ctItemsReplicacao];
        ReplicateItem(LItemReplicacao, ts);
      end;

      ts.Commit;
    except
      on E: Exception do
      begin
        ts.Rollback;
        dm.adicionaLog('Erro durante a sincronização: ' + sLineBreak + E.Message);
        raise Exception.Create('Erro durante a sincronização: ' + sLineBreak + E.Message);

      end;
    end;
  finally

    FreeAndNil(ts);
    FreeAndNil(LContainer);
    FreeAndNil(LStream);
  end;
end;

function TfrmSincronizarBase.generateSQLUpdateCommand(AQuery: TFDquery; AItem: TReplicationItem): string;
var
  LFields: TStringList;
  I: Integer;
  LCommand: TStringList;
  LParamValues: TStringList;
begin
  LFields := TStringList.Create;
  LCommand := TStringList.Create;
  LParamValues := TStringList.Create;

  try
    try
      LCommand.Clear;
      LParamValues.Clear;
      LCommand.Add(AItem.UpdateCommand + ' ' + AItem.TableName + ' (');
      AQuery.GetFieldNames(LFields);

      for I := 0 to LFields.Count - 1 do
      begin
        if (I < LFields.Count - 1) then
        begin
          LCommand.Add(LFields[I] + ',');
          LParamValues.Add(':NEW_' + LFields[I] + ',')
        end
        else
        begin
          LCommand.Add(LFields[I] + ') values (');
          LParamValues.Add(':NEW_' + LFields[I] + ')');
        end;
      end;

      LCommand.Add(LParamValues.Text);
      Result := LCommand.Text;

    except
      on E: Exception do
      begin
        raise Exception.Create('Error generating SQL Update command.' + sLineBreak + 'Error : ' + E.Message);
      end;
    end;
  finally
    LFields.Clear;
    LCommand.Clear;
    LParamValues.Clear;

    FreeAndNil(LParamValues);
    FreeAndNil(LFields);
    FreeAndNil(LCommand);
  end;
end;

procedure TfrmSincronizarBase.ReplicateItem(AItem: TReplicationItem; ATransacao: TFDTransaction);
var
  q: TFDQuery;
  LUpdateObj: TFDUpdateSQL;
  LScriptInsertUpdate: string;
  LJsonObj: TRESTDWJSONValue;
  AListaSQL: TList<string>;
begin
  q := TFDQuery.Create(nil);
  LUpdateObj := TFDUpdateSQL.Create(nil);
  LJsonObj := TRESTDWJSONValue.Create;
  AListaSQL := TList<string>.Create;

  try
    try
      q.Connection := dm.fdRestaurante;
      q.Transaction := ATransacao;
      q.UpdateObject := LUpdateObj;
      q.UpdateTransaction := ATransacao;

      q.SQL.Clear;
      q.SQL.Add(AItem.FetchSQL);
      q.Active := true;
      q.FetchAll;

      AListaSQL.Add(AItem.ScriptBefore);
      dm.ExecutaBlocoDeInstrucoesTransacao(AListaSQL, 100, ATransacao);

      LScriptInsertUpdate := generateSQLUpdateCommand(q, AItem);
      LUpdateObj.InsertSQL.Clear;
      LUpdateObj.InsertSQL.Add(LScriptInsertUpdate);
      LUpdateObj.ModifySQL.Add(LScriptInsertUpdate);
      LUpdateObj.FetchRowSQL.Add(q.SQL.Text);
      q.UpdateOptions.FastUpdates := true;
      q.UpdateOptions.UpdateTableName := AItem.TableName;
      LJsonObj.WriteToDataset(dtFull, AItem.Data, q, false);

      AListaSQL.clear;
      AListaSQL.Add(AItem.ScriptAfter);
      dm.ExecutaBlocoDeInstrucoesTransacao(AListaSQL, 100, ATransacao);

      dm.adicionaLog('Replicou a tabela ' + AItem.TableName + '. ' + Inttostr(q.RecordCount) + ' registros');

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao replicar item' + sLineBreak + e.message);
      end;
    end;
  finally
    q.Active := False;

    FreeAndNil(q);
    FreeAndNil(LUpdateObj);
    FreeAndNil(LJsonObj);
    FreeAndNil(AListaSQL);

  end;
end;

procedure TfrmSincronizarBase.ApagarModulosEPermissoesGerenciais();
var
  LSQLInsert: TStringList;
  LListaSQL: TList<string>;
begin
  LSQLInsert := TStringList.Create;
  LListaSQL := TList<string>.Create;
  try
    try
      LSQLInsert.Clear;
      LSQLInsert.add('delete from modulos m where m.cod_modulo between ' + Quotedstr('10000') + ' and ' + QUotedstr('19999') + ';');
      LListaSQL.Add(LSQLInsert.Text);
      LSQLInsert.Clear;
      LSQLInsert.add('delete from permissoes  m where m.cod_modulo between ' + Quotedstr('10000') + ' and ' + QUotedstr('19999') + ';');
      LListaSQL.Add(LSQLInsert.Text);

      LSQLInsert.Clear;
      LSQLInsert.add('delete from modulos m where m.cod_modulo between ' + Quotedstr('40000') + ' and ' + QUotedstr('49999') + ';');
      LListaSQL.Add(LSQLInsert.Text);
      LSQLInsert.Clear;
      LSQLInsert.add('delete from permissoes  m where m.cod_modulo between ' + Quotedstr('40000') + ' and ' + QUotedstr('49999') + ';');
      LListaSQL.Add(LSQLInsert.Text);

      LSQLInsert.Clear;
      LSQLInsert.add('delete from modulos m where m.cod_modulo between ' + Quotedstr('80000') + ' and ' + QUotedstr('89999') + ';');
      LListaSQL.Add(LSQLInsert.Text);
      LSQLInsert.Clear;
      LSQLInsert.add('delete from permissoes  m where m.cod_modulo between ' + Quotedstr('80000') + ' and ' + QUotedstr('89999') + ';');
      LListaSQL.Add(LSQLInsert.Text);
      dm.ExecutaBlocoDeInstrucoes(LListaSQL, 100);
    except
      on E: Exception do
      begin

      end;

    end;
  finally
    FreeAndNil(LSQLInsert);
    FreeAndNil(LListaSQL);
  end;
end;

procedure TfrmSincronizarBase.SincronizarGrupos();
var
  memTable: TFDMemTable;
  LSQL: string;
begin
  memTable := TFDMemTable.Create(Self);
  try
    try
      LSQL := 'select * from grupos order by cod_grupo';

      dmAtualizaBase.qryGrupos.Active := false;
      dmAtualizaBase.qryGrupos.SQL.Clear;
      dmAtualizaBase.qryGrupos.SQL.Add('select * from grupos g where g.cod_grupo=-1');
      dmAtualizaBase.qryGrupos.Active := true;
//      dm.getMemTableByAPI(dmAtualizaBase.qryGrupos, LSQL);

    except
      on E: exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    memTable.Active := false;
    FreeAndNil(memTable);
  end;

end;

procedure TfrmSincronizarBase.sincronizarGruposTouch();
var
  memTable: TFDMemTable;
  LSQL: string;
begin
  memTable := TFDMemTable.Create(Self);
  try
    try
      LSQL := 'select * from grupos_touch order by codigo';

      dmAtualizaBase.qryGruposTouch.Active := false;
      dmAtualizaBase.qryGruposTouch.SQL.Clear;
      dmAtualizaBase.qryGruposTouch.SQL.Add(' select * from grupos_touch  where codigo=-1');
      dmAtualizaBase.qryGruposTouch.Active := true;
//      dm.getMemTableByAPI(dmAtualizaBase.qryGruposTouch, LSQL);

    except
      on E: exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    memTable.Active := false;
    FreeAndNil(memTable);
  end;

end;

procedure TfrmSincronizarBase.sincronizarUsuarios();
var
  memTable: TFDMemTable;
  LSQL: string;
begin
  memTable := TFDMemTable.Create(Self);
  try
    try

      LSQL := 'select u.cod_usuario, u.nome_usuario, u.login, u.funcao, u.entradas, u.acesso from usuarios u order by u.cod_usuario';

      dmAtualizaBase.qryUsuarios.Active := false;
      dmAtualizaBase.qryUsuarios.SQL.Clear;
      dmAtualizaBase.qryUsuarios.SQL.Add('       select u.cod_usuario, u.nome_usuario, ');
      dmAtualizaBase.qryUsuarios.SQL.Add('        u.login, u.funcao, u.entradas, u.acesso ');
      dmAtualizaBase.qryUsuarios.SQL.Add('      from usuarios u');
      dmAtualizaBase.qryUsuarios.SQL.Add('        where u.cod_usuario=-1  ');
      dmAtualizaBase.qryUsuarios.SQL.Add('       order by u.cod_usuario');
      dmAtualizaBase.qryUsuarios.Active := true;
//      dm.getMemTableByAPI(dmAtualizaBase.qryUsuarios, LSQL);

    except
      on E: exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    memTable.Active := false;
    FreeAndNil(memTable);
  end;

end;

procedure TfrmSincronizarBase.sincronizarPermissoes();
var
  memTable: TFDMemTable;
  LSQL: string;
begin
  memTable := TFDMemTable.Create(Self);
  try
    try

      LSQL := '  select  * from permissoes p order by p.cod_usuario, p.cod_modulo, p.cod_mod';

      dmAtualizaBase.qrypermissoes.Active := false;
      dmAtualizaBase.qrypermissoes.SQL.Clear;
      dmAtualizaBase.qrypermissoes.SQL.Add(' select  * from permissoes p where p.cod_usuario =-1');

      dmAtualizaBase.qrypermissoes.Active := true;
//      dm.getMemTableByAPI(dmAtualizaBase.qrypermissoes, LSQL);

    except
      on E: exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    memTable.Active := false;
    FreeAndNil(memTable);
  end;

end;

procedure TfrmSincronizarBase.sincronizarModulos();
var
  memTable: TFDMemTable;
  LSQL: string;
begin
  memTable := TFDMemTable.Create(Self);
  try
    try

      LSQL := ' select * from modulos order by cod_modulo, cod_mod';
      dm.executaSQL('delete from modulos');
      dmAtualizaBase.qryModulos.Active := false;
      dmAtualizaBase.qryModulos.SQL.Clear;
      dmAtualizaBase.qryModulos.SQL.Add('select * from modulos  where cod_modulo=-1  order by cod_modulo, cod_mod');
      dmAtualizaBase.qryModulos.Active := true;
//      dm.getMemTableByAPI(dmAtualizaBase.qryModulos, LSQL);

    except
      on E: exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    memTable.Active := false;
    FreeAndNil(memTable);
  end;

end;

procedure TfrmSincronizarBase.sincronizarProdutos();
var
  memTable: TFDMemTable;
  LSQL: string;
begin
  memTable := TFDMemTable.Create(Self);
  try
    try
      LSQL := 'select * from produtos order by cod_produto';

      dmAtualizaBase.qryProdutos.Active := false;
      dmAtualizaBase.qryProdutos.SQL.Clear;
      dmAtualizaBase.qryProdutos.SQL.Add('select * from produtos p where p.cod_produto=-1');
      dmAtualizaBase.qryProdutos.Active := true;
//      dm.getMemTableByAPI(dmAtualizaBase.qryProdutos, LSQL);

    except
      on E: exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    memTable.Active := false;
    FreeAndNil(memTable);
  end;

end;

procedure TfrmSincronizarBase.sincronizarGruposAdicionais();
var
  memTable: TFDMemTable;
  LSQL: string;
begin
  memTable := TFDMemTable.Create(Self);
  try
    try

      dm.executaSQL('delete from grupos_adicionais');
      dm.executaSQL('delete from produtos_grupos_adicionais');

      LSQL := 'select * from grupos_adicionais order by id';
      dmAtualizaBase.qryGruposAdicionais.Active := false;
      dmAtualizaBase.qryGruposAdicionais.SQL.Clear;
      dmAtualizaBase.qryGruposAdicionais.SQL.Add('select * from grupos_adicionais   where id=-1 order by id ');
      dmAtualizaBase.qryGruposAdicionais.Active := true;
//      dm.getMemTableByAPI(dmAtualizaBase.qryGruposAdicionais, LSQL);

    except
      on E: exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    memTable.Active := false;
    FreeAndNil(memTable);
  end;

end;

procedure TfrmSincronizarBase.sincronizarProdutosGruposAdicionais();
var
  memTable: TFDMemTable;
  LSQL: string;
begin
  memTable := TFDMemTable.Create(Self);
  try
    try
      LSQL := 'select * from produtos_grupos_adicionais order by id';

      dmAtualizaBase.qryProdutosGruposAdicionais.Active := false;
      dmAtualizaBase.qryProdutosGruposAdicionais.SQL.Clear;
      dmAtualizaBase.qryProdutosGruposAdicionais.SQL.Add('select * from produtos_grupos_adicionais  where id=-1 order by id ');
      dmAtualizaBase.qryProdutosGruposAdicionais.Active := true;
//      dm.getMemTableByAPI(dmAtualizaBase.qryProdutosGruposAdicionais, LSQL);

    except
      on E: exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    memTable.Active := false;
    FreeAndNil(memTable);
  end;

end;

procedure TfrmSincronizarBase.sincronizar;
var
  LSQL: string;
  ThreadSincronizar: TThread;
begin

  try

    dmAtualizaBase.qryGrupos.Active := false;
    ThreadSincronizar := TThread.CreateAnonymousThread(
      procedure()
      begin
        try
          try
            btSincronizar.Enabled := false;
            btSair.Enabled := False;
            lbStatus.Caption := 'Aguarde. Sistema sincronizando....';
            progressbar1.position := 0;
            SincronizarGrupos();

            ThreadSincronizar.Synchronize(TThread.CurrentThread,
              procedure
              begin
                lbStatus.Caption := 'Aguarde... Sincronizando grupos touch';
                progressbar1.position := 20;
              end);

            sincronizarGruposTouch();
            ThreadSincronizar.Synchronize(TThread.CurrentThread,
              procedure
              begin
                lbStatus.Caption := 'Aguarde... Sincronizando produtos';
                progressbar1.position := 30;
              end);

            sincronizarProdutos();

            ThreadSincronizar.Synchronize(TThread.CurrentThread,
              procedure
              begin
                lbStatus.Caption := 'Aguarde... Sincronizando combos';
                progressbar1.position := 60;
              end);

            sincronizarGruposAdicionais;
            sincronizarProdutosGruposAdicionais;

            ThreadSincronizar.Synchronize(TThread.CurrentThread,
              procedure
              begin
                lbStatus.Caption := 'Aguarde... Sincronizando usuários e permissões.';
                progressbar1.position := 80;
              end);
            sincronizarUsuarios;
            sincronizarModulos;
            sincronizarPermissoes;

            progressbar1.position := 100;

            try

              dmAtualizaBase.CommitChanges;
              dm.recriarTabelasDePreco;
              ApagarModulosEPermissoesGerenciais;
              dm.exibe_painel_erro('Sincronização efetuada com sucesso!', 'Ok', mtInformation);

            except
              on E: Exception do
              begin
                raise Exception.Create('Erro ao fazer commit nas atualizações ' + E.Message);
              end;

            end;
          except
            on E: Exception do
            begin
              ThreadSincronizar.Synchronize(TThread.CurrentThread,
                procedure
                begin
                  lbStatus.Caption := 'Ocorreu um erro: ' + sLineBreak + 'Erro: ' + E.Message;
                end);
            end

          end;
        finally

          btSincronizar.Enabled := true;
          btSair.Enabled := true;
        end;

      end);
    ThreadSincronizar.FreeOnTerminate := True;
    ThreadSincronizar.Start;
  except
    on E: Exception do
    begin
      raise Exception.Create(e.Message);
    end;
  end;

end;

procedure TfrmSincronizarBase.Button2Click(Sender: TObject);
var
  LSplit: TStringList;
  i: integer;
begin
  inherited;
  LSplit := TStringList.Create;

  try
//    dm.SplitXML(Memo1.Lines.Text, LSplit);
    for i := 0 to LSplit.Count - 1 do
    begin
      dm.adicionaLog(LSplit[i]);
    end;

  finally
    FreeAndNil(LSplit);
  end;
end;

procedure TfrmSincronizarBase.FormCreate(Sender: TObject);
begin
  inherited;
  dmAtualizaBase := TdmAtualizaBase.Create(self);
end;

end.

