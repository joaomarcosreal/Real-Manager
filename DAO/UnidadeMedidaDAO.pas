unit UnidadeMedidaDAO;

interface

uses
  UnidadeMedida, system.SysUtils, System.Classes, URealDatasets;

type
  TUnidadeMedidaDAO = class
  private
  public
    procedure CreateNew(AUnidadeMedida: TUnidadeMedida; AConexao: TRealConnection);
    procedure Update(AUnidadeMedida: TUnidadeMedida; AConexao: TRealConnection);
    procedure Read(AUnidadeMedida: TUnidadeMedida; AConexao: TRealConnection);
  end;

implementation

{ TUnidadeMedidaDAO }


{ TUnidadeMedidaDAO }

procedure TUnidadeMedidaDAO.CreateNew(AUnidadeMedida: TUnidadeMedida; AConexao: TRealConnection);
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
    LSQL.Add('insert into unidades (descricao, sigla, parametro) values (' + QuotedStr(AUnidadeMedida.Descricao) + ',' + QuotedStr(AUnidadeMedida.Sigla) + ',' + IntToStr(AUnidadeMedida.valor) + ')');
    LSQL.Add(' returning cod_unidade');
    try
      LTransaction.StartTransaction;
      LQuery.SQL.Text := LSQL.Text;
      LQuery.Open(LSQL.Text);
      LTransaction.Commit;
      AUnidadeMedida.Codigo := LQuery.Fields[0].value;

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

procedure TUnidadeMedidaDAO.Update(AUnidadeMedida: TUnidadeMedida; AConexao: TRealConnection);
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
    LSQL.Add('update unidades u set u.descricao=' + QuotedStr(AUnidadeMedida.Descricao) + ',');
    LSQL.Add(' u.sigla=' + Quotedstr(AUnidadeMedida.Sigla) + ',');
    LSQL.Add('  u.parametro =' + IntToStr(AUnidadeMedida.valor));
    LSQL.Add(' where u.cod_unidade=' + QuotedStr(AUnidadeMedida.Codigo));

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

procedure TUnidadeMedidaDAO.Read(AUnidadeMedida: TUnidadeMedida; AConexao: TRealConnection);
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
    LSQL.Add('select cod_unidade, descricao, sigla, parametro from unidades where cod_unidade=' + Quotedstr(AUnidadeMedida.Codigo));

    try
      LTransaction.StartTransaction;
      LQuery.SQL.Text := LSQL.Text;
      LQuery.Open(LSQL.Text);

      LQuery.FetchAll;

      if LQuery.IsEmpty then
        raise Exception.Create('Unidade de medida não encontrada!');

      AUnidadeMedida.Codigo := LQuery.FieldByName('cod_unidade').Value;
      AUnidadeMedida.Descricao := LQuery.FieldByName('Descricao').Value;
      AUnidadeMedida.sigla := LQuery.FieldByName('sigla').Value;
      AUnidadeMedida.valor := LQuery.FieldByName('parametro').Value;
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

