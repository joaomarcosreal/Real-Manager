unit GrupoDAO;

interface

uses
  Grupo, system.SysUtils, System.Classes, URealDatasets;

type
  TGrupoDAO = class
  published
    procedure CreateNew(AGrupo: TGrupo; AConexao: TRealConnection);
    procedure Update(AGrupo: TGrupo; AConexao: TRealConnection);
    procedure Read(AGrupo: TGrupo; AConexao: TRealConnection);
  end;

implementation

{ TGrupoDAO }

procedure TGrupoDAO.Update(AGrupo: TGrupo; AConexao: TRealConnection);
var
  LSQL: TStringList;
  LQuery: TRealQuery;
  LTransaction: TRealTransaction;
begin
  LSQL := TStringList.Create;
  LQuery := TRealQuery.Create(nil);
  LTransaction := TRealTransaction.Create(nil);

  try

    LQuery.Connection := AConexao;
    LTransaction.Connection := AConexao;
    LQuery.Transaction := LTransaction;
    LSQL.Clear;
    LSQL.Add('update grupos g set g.descricao=' + QuotedStr(AGrupo.Descricao));
    LSQL.Add(' where g.cod_grupo=' + QuotedStr(AGrupo.Codigo));

    try
      LTransaction.StartTransaction;
      LQuery.SQL.Text := LSQL.Text;
      LQuery.ExecSQL(LSQL.Text);
      LTransaction.Commit;

    except
      on E: Exception do
      begin
        LTransaction.Rollback;
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    LSQL.Clear;
    FreeAndNil(LQuery);
    FreeAndNil(LTransaction);
    FreeAndNil(LSQL);
  end;

end;

procedure TGrupoDAO.CreateNew(AGrupo: TGrupo; AConexao: TRealConnection);
var
  LSQL: TStringList;
  LQuery: TRealQuery;
  LTransaction: TRealTransaction;
begin
  LSQL := TStringList.Create;
  LQuery := TRealQuery.Create(nil);
  LTransaction := TRealTransaction.Create(nil);

  try

    LQuery.Connection := AConexao;
    LTransaction.Connection := AConexao;
    LQuery.Transaction := LTransaction;
    LSQL.Clear;
    LSQL.Add('insert into grupos(cod_grupo, descricao) values (');
    LSQL.Add(QUotedstr(AGrupo.Codigo) + ',');
    LSQL.Add(QUotedstr(AGrupo.Descricao) + ')');

    try
      LTransaction.StartTransaction;
      LQuery.SQL.Text := LSQL.Text;
      LTransaction.Commit;
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
        LTransaction.Rollback;
      end;

    end;
  finally
    LSQL.Clear;
    FreeAndNil(LQuery);
    FreeAndNil(LTransaction);
    FreeAndNil(LSQL);
  end;

end;

procedure TGrupoDAO.Read(AGrupo: TGrupo; AConexao: TRealConnection);
var
  LSQL: TStringList;
  LQuery: TRealQuery;
  LTransaction: TRealTransaction;
begin
  LSQL := TStringList.Create;
  LQuery := TRealQuery.Create(nil);
  LTransaction := TRealTransaction.Create(nil);

  try

    LQuery.Connection := AConexao;
    LTransaction.Connection := AConexao;
    LQuery.Transaction := LTransaction;
    LSQL.Clear;
    LSQL.Add('select cod_grupo, descricao from grupos where cod_grupo=' + Quotedstr(AGrupo.Codigo));

    try
      LTransaction.StartTransaction;
      LQuery.SQL.Text := LSQL.Text;
      LQuery.Open(LSQL.Text);

      LQuery.FetchAll;

      if LQuery.IsEmpty then
        raise Exception.Create('Unidade de medida não encontrada!');

      AGrupo.Codigo := LQuery.FieldByName('cod_grupo').Value;
      AGrupo.Descricao := LQuery.FieldByName('descricao').Value;
      LTransaction.Rollback;

    except
      on E: Exception do
      begin
        LTransaction.Rollback;
      end;

    end;
  finally
    LSQL.Clear;
    FreeAndNil(LQuery);
    FreeAndNil(LTransaction);
    FreeAndNil(LSQL);
  end;

end;

end.

