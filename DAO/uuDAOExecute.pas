unit uuDAOExecute;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  vcl.forms, Rest.Json, DataSet.Serialize, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, inifiles, firedac.dapt, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, System.Generics.Collections,
  SynLZO, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, Data.DB,
  System.JSON, URequisicaoAPI, FireDAC.Comp.Client, uDadosConexao,
  FireDAC.Stan.Param, FireDAC.DatS, uDWJSONObject, FireDAC.DApt.Intf, uDWConsts,
  ReplicationContainer, ReplicationItem, FireDAC.Comp.DataSet;

type
  TDadosConexaoBanco = class(TPersistent)
  private
    FLocalBanco: string;
    FServidor: string;
    FSenha: string;
    FUsuario: string;
    FPorta: string;
    procedure SetLocalBanco(const Value: string);
    procedure SetPorta(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetServidor(const Value: string);
    procedure SetUsuario(const Value: string);
  published
    property Servidor: string read FServidor write SetServidor;
    property LocalBanco: string read FLocalBanco write SetLocalBanco;
    property Porta: string read FPorta write SetPorta;
    property Usuario: string read FUsuario write SetUsuario;
    property Senha: string read FSenha write SetSenha;
  end;

  TDAOExecute = class
  private
    DB: TFDConnection;
    DadosConexao: TDadosConexaoBanco;
    DadosConexaoCentral: TDadosConexaoBanco;
    function LeArquivoConfiguracao(AArquivo, grupo, chave: string): string;
    procedure TDAOExecute(AIDCliente, AMensagem, ASQL: string);
    procedure AdicionaLog(AIDCliente, AMensagem, ASQL: string);
    procedure ReplicateItem(AItem: TReplicationItem; ATransacao: TFDTransaction);
    function generateSQLUpdateCommand(AQuery: TFDquery; AItem: TReplicationItem): string;
    procedure UpdateCustosMovimentoVenda(AQuery: TFDQuery);
    function ExecuteSQL(ASQL: string): Boolean;
    function ExecuteSQLCentral(ASQL: string): Boolean;
    procedure CarregaParametrosDeConexaoLocal;
  public
    function GetDadosConexao(): TDadosConexaoBanco;
    procedure ConectarBanco(ADadosConexao: TDadosConexaoBanco);
    procedure CarregaDadosConexaoBancoCentral(ADadosConexao: TDadosConexaoBanco);
    procedure CarregaDadosConexaoBancoCliente(ADadosConexao: TDadosConexaoBanco; AIDCliente: string);
    function ExecuteSQLCliente(AIDCliente, ASQL: string): Boolean;
    function GetMemTableCentral(ASQL: string): string;
    function GetMemTableCliente(AIDCliente, ASQL: string): string;
    function GetMemTable(ASQL: string): string;

    procedure ExecuteSQLBlock(AListaSQL: TList<string>; AQtdBlocos: smallint);
    function Replicate(AIDCliente, ADadosReplicacao: string): Boolean;
    procedure ExecuteFinishingScripts(ATransacao: TFDTransaction);
    destructor Destroy; override;
    constructor Create();
  end;

implementation



{ DAOExecute }

constructor TDAOExecute.Create();
begin
  DB := TFDConnection.Create(nil);
  DadosConexao := TDadosConexaoBanco.Create;
  DadosConexaoCentral := TDadosConexaoBanco.Create;
  CarregaDadosConexaoBancoCentral(DadosConexao);
end;

procedure TDAOExecute.CarregaParametrosDeConexaoLocal();
begin
  DadosConexaoCentral.Servidor := LeArquivoConfiguracao('config', 'BANCO_DE_DADOS', 'servidor');
  DadosConexaoCentral.LocalBanco := LeArquivoConfiguracao('config', 'BANCO_DE_DADOS', 'local_bd');
  DadosConexaoCentral.Porta := LeArquivoConfiguracao('config', 'BANCO_DE_DADOS', 'porta');
  DadosConexaoCentral.Usuario := LeArquivoConfiguracao('config', 'BANCO_DE_DADOS', 'usuario');
  DadosConexaoCentral.Senha := LeArquivoConfiguracao('config', 'BANCO_DE_DADOS', 'senha');

end;

destructor TDAOExecute.Destroy;
begin
  DB.Connected := False;
  DB.Free;
  DadosConexao.Free;
end;

procedure TDAOExecute.ConectarBanco(ADadosConexao: TDadosConexaoBanco);
begin
  db.Params.Clear;
  db.Params.Add('DriverID=' + 'FB');
  db.Params.Add('Server=' + ADadosConexao.Servidor);
  db.Params.Add('Port=' + ADadosConexao.Porta);
  db.Params.Add('Database=' + ADadosConexao.LocalBanco);
  db.Params.Add('User_Name=' + ADadosConexao.Usuario);
  db.Params.Add('Password=' + ADadosConexao.Senha);
  db.Params.Add('Protocol=TCPIP');
  db.DriverName := 'FB';
  db.LoginPrompt := FALSE;
  db.UpdateOptions.CountUpdatedRecords := False;
  try
    db.Connected := true;
  except
    on E: Exception do
    begin
      AdicionaLog('Erro ao conectar ao banco', E.message, '');
      raise Exception.Create('Erro ao conectar ao banco' + sLineBreak + E.Message);

    end;
  end;
end;

procedure TDAOExecute.CarregaDadosConexaoBancoCliente(ADadosConexao: TDadosConexaoBanco; AIDCliente: string);
var
  LQuery: TFDQuery;
  LTransaction: TFDTransaction;
begin
  LQuery := TFDQuery.create(nil);
  LTransaction := TFDTransaction.Create(nil);

  try
    try
      LTransaction.Connection := db;
      LQuery.Connection := db;
      LQuery.Transaction := LTransaction;

      CarregaParametrosDeConexaoLocal;
      ConectarBanco(ADadosConexao);

      LTransaction.StartTransaction;
      LQuery.sql.clear;
      LQuery.sql.add(' select c.id,b.servidor, b.caminho, b.porta, b.usuario, b.senha ');
      LQuery.sql.add('    from clientes c');
      LQuery.sql.add('     inner join bancos_de_dados b on (b.id = c.id_banco)');
      LQuery.sql.add('     where c.id=' + Quotedstr(AIDCliente));
      LQuery.Active := true;

      if LQuery.IsEmpty = false then
      begin
        ADadosConexao.Servidor := LQuery.FieldByName('servidor').Value;
        ADadosConexao.LocalBanco := LQuery.FieldByName('caminho').Value;
        ADadosConexao.Porta := LQuery.FieldByName('porta').Value;
        ADadosConexao.Usuario := LQuery.FieldByName('usuario').Value;
        ADadosConexao.Senha := LQuery.FieldByName('senha').Value;
      end
      else
      begin
        raise Exception.Create('Banco de dados não encontrado para este cliente!');
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao conectar ao banco de dados central! ' + sLineBreak + E.message);
      end;

    end;
  finally
    LTransaction.Rollback;
    db.connected := false;
    LQuery.Active := false;
    FreeAndNil(LQuery);
    FreeAndNil(LTransaction);
  end;

end;

procedure TDAOExecute.CarregaDadosConexaoBancoCentral(ADadosConexao: TDadosConexaoBanco);
begin

  try
    try

      ADadosConexao.Servidor := LeArquivoConfiguracao('config', 'BANCO_DE_DADOS', 'servidor');
      ADadosConexao.LocalBanco := LeArquivoConfiguracao('config', 'BANCO_DE_DADOS', 'local_bd');
      ADadosConexao.Porta := LeArquivoConfiguracao('config', 'BANCO_DE_DADOS', 'porta');
      ADadosConexao.Usuario := LeArquivoConfiguracao('config', 'BANCO_DE_DADOS', 'usuario');
      ADadosConexao.Senha := LeArquivoConfiguracao('config', 'BANCO_DE_DADOS', 'senha');

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao conectar ao banco de dados central! ' + sLineBreak + E.message);
      end;

    end;
  finally

  end;

end;

function TDAOExecute.LeArquivoConfiguracao(AArquivo: string; grupo: string; chave: string): string;
var
  ArqIni: tIniFile;
  caminho: string;
begin
  ArqIni := tIniFile.Create(ExtractFilePath(Application.ExeName) + AArquivo + '.ini');
  Result := ArqIni.ReadString(grupo, chave, '0');
  ArqIni.Free;
end;

procedure TDAOExecute.TDAOExecute(AIDCliente, AMensagem, ASQL: string);
begin

end;

function TDAOExecute.GetMemTableCliente(AIDCliente: string; ASQL: string): string;
begin
  try
    CarregaDadosConexaoBancoCliente(DadosConexao, AIDCliente);
    ConectarBanco(DadosConexao);
    result := GetMemTable(ASQL);

  finally

  end;

end;

function TDAOExecute.GetMemTableCentral(ASQL: string): string;
begin
  try
    CarregaDadosConexaoBancoCentral(DadosConexao);
    ConectarBanco(DadosConexao);
    result := GetMemTable(ASQL);

  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;

  end;

end;

function TDAOExecute.GetDadosConexao: TDadosConexaoBanco;
begin
  result := self.DadosConexao;
end;


function TDAOExecute.GetMemTable(ASQL: string): string;
var
  ts: TFDTransaction;
  q: TFDQuery;
  LDWJsonObject: TJSONValue;
  LJsonGerado: string;

begin

  result := '';

  LDWJsonObject := TJSONValue.Create;
  ts := TFDTransaction.Create(nil);

  ts.Connection := db;
  q := TFDQuery.Create(nil);
  q.Connection := db;
  q.Transaction := ts;

  try
    try

      ts.StartTransaction;
      q.Active := False;
      q.SQL.Clear;
      q.SQL.add(ASQL);
      q.Active := True;
      q.FetchAll;

      LDWJsonObject.LoadFromDataset('Memtable', q, True);
      LJsonGerado := LDWJsonObject.ToJSON;
      q.Active := False;

      Result := LJsonGerado;

    except
      on E: Exception do
      begin
        Result := '';
        AdicionaLog('Erro ao obter tabela em memória', E.message, ASQL);
        raise Exception.Create('Erro ao obter tabela em memória' + sLineBreak + e.message);
        ts.Rollback;
      end;
    end;
  finally
    ts.Commit;
    q.Active := False;
    FreeAndNil(q);
    FreeAndNil(ts);
    FreeAndNil(LDWJsonObject);
  end;

end;

function TDAOExecute.Replicate(AIDCliente: string; ADadosReplicacao: string): Boolean;
var
  ts: TFDTransaction;
  LDadosRequisicao: TDadosRequisicao;
  ctItemsReplicacao: integer;
  LContainer: TReplicationContainer;
  LItemReplicacao: TReplicationItem;
  LQtdRegistros: Integer;
begin

  Result := false;
  ts := TFDTransaction.Create(nil);
  ts.Connection := db;

  try
    try

      CarregaDadosConexaoBancoCliente(DadosConexao, AIDCliente);
      ConectarBanco(DadosConexao);

      LDadosRequisicao := TJson.JsonToObject<TDadosRequisicao>(ADadosReplicacao);

      LContainer := LDadosRequisicao.ReplicationContainer;
      LQtdRegistros := 0;
      Writeln('====================||||||||||||====================');
      Writeln('Pacote de replicação recebido');
      Writeln('Cod. Empresa ' + LContainer.CodEmpresa);
      Writeln('Nome: ' + LContainer.NomeEmpresa);
      Writeln('-----------------------------------');

      ts.StartTransaction;
      Writeln('Transação iniciada');
      for ctItemsReplicacao := 0 to LContainer.Items.Count - 1 do
      begin
        LItemReplicacao := LContainer.Items[ctItemsReplicacao];
        ReplicateItem(LItemReplicacao, ts);
        LQtdRegistros := LQtdRegistros + LItemReplicacao.RecordCount;
      end;

      ExecuteFinishingScripts(ts);
      ts.Commit;
      Writeln(Inttostr(LQtdRegistros) + ' registros replicados!');
      Writeln('=====================================================');
    except
      on E: Exception do
      begin
        Result := False;
        ts.Rollback;
        Writeln('Erro durante a replicação: ' + sLineBreak + E.Message);
        raise Exception.Create('Erro durante a replicação: ' + sLineBreak + E.Message);

      end;
    end;
  finally
    DB.Connected := false;
    FreeAndNil(ts);
    FreeAndNil(LDadosRequisicao);
    FreeAndNil(LContainer);

  end;
end;

function TDAOExecute.generateSQLUpdateCommand(AQuery: TFDquery; AItem: TReplicationItem): string;
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
      LCommand.Add('update or insert into ' + AItem.TableName + '(');
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

procedure TDAOExecute.UpdateCustosMovimentoVenda(AQuery: TFDQuery);
var
  LSQL: TStringList;
begin
  try
    try
      LSQL.add(' UPDATE movimento_venda mv ');
      LSQL.add('  SET mv.custo = (');
      LSQL.add(' SELECT  SUM(cp.custo_unitario_produto * cp.qtd_baixa_prod)');
      LSQL.add(' FROM calcula_custo_produto_novo(mv.cod_produto ,mv.cod_produto,1) cp)');
      LSQL.add(' WHERE mv.custo=0');
      AQuery.SQL.Clear;
      AQuery.SQL.Add(LSQL.Text);
      AQuery.ExecSQL;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao atualizar os custos do movimento' + sLineBreak + e.message);
      end;
    end;
  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TDAOExecute.ExecuteFinishingScripts(ATransacao: TFDTransaction);
var
  LQuery: TFDQuery;
begin
  LQuery := TFDQuery.Create(nil);
  try
    try
      UpdateCustosMovimentoVenda(LQuery);
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao executar scripts de finalização' + sLineBreak + e.message);
      end;
    end;
  finally
    FreeAndNil(LQuery);
  end;
end;

procedure TDAOExecute.ReplicateItem(AItem: TReplicationItem; ATransacao: TFDTransaction);
var
  q: TFDQuery;
  LUpdateObj: TFDUpdateSQL;
  LScriptInsertUpdate: string;
  LJsonObj: TJSONValue;
begin
  q := TFDQuery.Create(nil);
  LUpdateObj := TFDUpdateSQL.Create(nil);
  LJsonObj := TJSONValue.Create;

  try
    try
      q.Connection := db;
      q.Transaction := ATransacao;
      q.UpdateObject := LUpdateObj;
      q.UpdateTransaction := ATransacao;

      q.SQL.Clear;
      q.SQL.Add(AItem.FetchSQL);
      q.Active := true;
      q.FetchAll;

      LScriptInsertUpdate := generateSQLUpdateCommand(q, AItem);

      LUpdateObj.InsertSQL.Clear;
      LUpdateObj.InsertSQL.Add(LScriptInsertUpdate);
      LUpdateObj.ModifySQL.Add(LScriptInsertUpdate);
      LUpdateObj.FetchRowSQL.Add(q.SQL.Text);
      q.UpdateOptions.FastUpdates := true;
      q.UpdateOptions.UpdateTableName := AItem.TableName;
      LJsonObj.WriteToDataset(dtFull, AItem.Data, q, false);
      Writeln('Replicou a tabela ' + AItem.TableName + '. ' + Inttostr(q.RecordCount) + ' registros');

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

  end;
end;

function TDAOExecute.ExecuteSQLCentral(ASQL: string): Boolean;
begin

  try
    CarregaDadosConexaoBancoCentral(DadosConexao);
    ConectarBanco(DadosConexao);
    Result := ExecuteSQL(ASQL);
  finally

  end;
end;

function TDAOExecute.ExecuteSQLCliente(AIDCliente: string; ASQL: string): Boolean;
begin

  try
    CarregaDadosConexaoBancoCliente(DadosConexao, AIDCliente);
    ConectarBanco(DadosConexao);
    Result := ExecuteSQL(ASQL);
  except
    on E: Exception do
    begin
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TDAOExecute.ExecuteSQL(ASQL: string): Boolean;
var
  ts: TFDTransaction;
  q: TFDQuery;
  LDadosConexaoBody: TDadosConexaoBanco;
  LDadosRequisicao: TDadosRequisicao;
begin

  result := False;

  ts := TFDTransaction.Create(nil);
  ts.Connection := db;
  q := TFDQuery.Create(nil);
  q.Connection := db;
  q.Transaction := ts;

  try
    try
      ts.StartTransaction;
      q.Active := False;
      q.SQL.Clear;
      q.SQL.Add(ASQL);
      q.ExecSQL;
      q.Active := False;
      ts.Commit;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao executar SQL ' + sLineBreak + e.Message + LDadosRequisicao.Comandos[0]);
        ts.Rollback;
      end;
    end;
  finally
    DB.Connected := false;
    q.Active := False;
    FreeAndNil(q);
    FreeAndNil(ts);
  end;
end;

procedure TDAOExecute.ExecuteSQLBlock(AListaSQL: TList<string>; AQtdBlocos: smallint);
var
  LBloco: TStringList;
  ctLinhas: Integer;
  ts: TFDTransaction;
  q: TFDQuery;
  LFormatoBlocoInstrucoes: string;
  ct: integer;
  LStrSize: integer;
begin

  ts := TFDTransaction.Create(nil);
  ts.Connection := db;
  q := TFDQuery.Create(nil);
  q.Connection := db;
  q.Transaction := ts;
  LBloco := TStringList.Create();
  LStrSize := 0;

  LBloco.Clear;
  LFormatoBlocoInstrucoes := 'execute block' + ' as' + ' begin' + '  :vpBlocoInstrucoes' + 'end';

  try

    try
      ts.StartTransaction;

      for ct := 0 to AListaSQL.Count - 1 do
      begin
        LBloco.Add(AListaSQL.Items[ct]);
        LStrSize := ((Length(LBloco.Text) * SizeOf(Char)) div 1024);

        if ((LBloco.Count >= AQtdBlocos) or (LStrSize >= 48)) then
        begin
          q.SQL.Clear;

          q.SQL.Add(LFormatoBlocoInstrucoes);
          q.SQL.Text := StringReplace(q.SQL.Text, ':vpBlocoInstrucoes', LBloco.Text, [rfReplaceAll]);
          q.ExecSQL;
          LBloco.Clear;

        end
        else
        begin

        end;
      end;

      if LBloco.Count > 0 then
      begin
        LStrSize := ((Length(LBloco.Text) * SizeOf(Char)) div 1024);
        q.SQL.Clear;
        q.SQL.Add(LFormatoBlocoInstrucoes);
        q.SQL.Text := StringReplace(q.SQL.Text, ':vpBlocoInstrucoes', LBloco.Text, [rfReplaceAll]);
        q.ExecSQL;
      end;

      ts.Commit;

    except
      on E: Exception do
      begin
        ts.Rollback;

        raise Exception.Create('Erro ao executar bloco de instruções. ' + sLineBreak + sLineBreak + 'Erro: ' + E.Message);
      end;

    end;

  finally
    FreeAndNil(LBloco);
    FreeAndNil(ts);
  end;
end;

procedure TDAOExecute.AdicionaLog(AIDCliente: string; AMensagem: string; ASQL: string);
var
  arq: TextFile;
  linha: string;
  mensagemErro: TStringList;
  NomeArquivoLOG: string;
begin

  mensagemErro := TStringList.Create;
  try
    NomeArquivoLOG := ExtractFilePath(Application.ExeName) + '\' + 'logs\' + FormatDateTime('YYY', Date) + '_' + FormatDateTime('MM', date) + '_' + FormatDateTime('DD', Date) + '.log';

    mensagemErro.Add('========================================================================================');
    mensagemErro.Add('Função:   ' + AIDCliente);
    mensagemErro.Add('Hora:     ' + TimeToStr(Now));
    mensagemErro.Add('Mensagem  ' + AMensagem);
    if (trim(ASQL) <> '') then
    begin
      mensagemErro.Add('SQL do erro: ' + sLineBreak + ASQL);
    end;
    mensagemErro.Add('');
    mensagemErro.Add('========================================================================================');

    AssignFile(arq, NomeArquivoLOG);

    if not FileExists(NomeArquivoLOG) then
      Rewrite(arq)
    else
      Append(arq);
    Writeln(arq, mensagemErro.Text);

  finally
    FreeAndNil(mensagemErro);
    CloseFile(arq);

  end;
end;

{ TDadosConexaoBanco }

procedure TDadosConexaoBanco.SetLocalBanco(const Value: string);
begin
  FLocalBanco := Value;
end;

procedure TDadosConexaoBanco.SetPorta(const Value: string);
begin
  FPorta := Value;
end;

procedure TDadosConexaoBanco.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TDadosConexaoBanco.SetServidor(const Value: string);
begin
  FServidor := Value;
end;

procedure TDadosConexaoBanco.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

end.

