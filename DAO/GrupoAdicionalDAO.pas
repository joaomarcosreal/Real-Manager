unit GrupoAdicionalDAO;

interface

uses
  system.SysUtils, System.Classes, GrupoAdicional, URealDatasets, RealFramework;

type
  TGrupoAdicionalDAO = class
  public
    procedure Cadastrar(AGrupoAdicional: TGrupoAdicional; AConexao: TRealConnection);
    procedure Atualizar(AGrupoAdicional: TGrupoAdicional; AConexao: TRealConnection);
    procedure Get(AGrupoAdicional: TGrupoAdicional; AConexao: TRealConnection);
  end;

implementation

{ TGrupoAdicionalDAO }



{ TGrupoAdicionalDAO }

procedure TGrupoAdicionalDAO.Atualizar(AGrupoAdicional: TGrupoAdicional; AConexao: TRealConnection);
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
    LSQL.Add('update grupos_adicionais g set g.nome=' + QuotedStr(AGrupoAdicional.Nome) + ',');
    LSQL.Add('  g.cod_produto=' + QuotedStr(AGrupoAdicional.CodProduto) + ',');
    LSQL.Add('  g.descricao=' + QuotedStr(AGrupoAdicional.Descricao) + ',');
    LSQL.Add(' g.qtd_min=' + Inttostr(AGrupoAdicional.QtdeMinima) + ',');
    LSQL.Add(' g.qtd_max=' + Inttostr(AGrupoAdicional.QtdeMaxima) + ',');
    LSQL.Add(' g.tipo=' + Inttostr(AGrupoAdicional.tipo) + ',');
    LSQL.Add(' g.unico=' + Inttostr(BoolToInt(AGrupoAdicional.Unico)) + '');
    LSQL.Add(' where g.id=' + Inttostr(AGrupoAdicional.id));

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

procedure TGrupoAdicionalDAO.Cadastrar(AGrupoAdicional: TGrupoAdicional; AConexao: TRealConnection);
var
  LSQL: TStringList;
  LQuery: TRealQuery;
  LTransaction: TRealTransaction;
  LID : LongInt;
begin
  LSQL := TStringList.Create;
  LQuery := TRealQuery.Create(nil);
  LTransaction := TRealTransaction.Create(nil);

  try

    LQuery.Connection := AConexao;
    LTransaction.Connection := AConexao;
    LQuery.Transaction := LTransaction;
    LSQL.Clear;

    LSQL.Clear;
    LSQL.Add('select gen_id(g_grupos_adicionais,1) as id from RDB$DATABASE ');
    LQuery.SQL.Clear;
    LQuery.SQL.Add(LSQL.Text);
    LQuery.Active := true;
    LID := LQuery.FieldByName('id').Value;
    LQuery.Active := false;
    LQuery.SQL.Clear;
    LSQL.Clear;


    LSQL.Add('insert into grupos_adicionais (id, nome,descricao,cod_produto,qtd_min,qtd_max,unico,tipo) values ('+IntToStr(LID)+',' + QuotedStr(AGrupoAdicional.Nome) + ',' + QuotedStr(AGrupoAdicional.Descricao));
    LSQL.Add(',' + Quotedstr(AGrupoAdicional.CodProduto));
    LSQL.Add(',' + IntToStr(AGrupoAdicional.QtdeMinima));
    LSQL.Add(',' + IntToStr(AGrupoAdicional.QtdeMaxima));
    LSQL.Add(',' + IntToStr(BoolToInt(AGrupoAdicional.Unico)));
    LSQL.Add(',' + IntToStr(AGrupoAdicional.tipo) + ')');
    try
      LTransaction.StartTransaction;
      LQuery.SQL.Text := LSQL.Text;
      LQuery.ExecSQL;
      LTransaction.Commit;
      AGrupoAdicional.ID := LID;

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

procedure TGrupoAdicionalDAO.Get(AGrupoAdicional: TGrupoAdicional; AConexao: TRealConnection);
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
    LSQL.Add(' select g.id, g.nome, g.descricao, coalesce(g.qtd_min,1) as Qtdmin');
    LSQL.Add(',coalesce(g.qtd_max,1) as qtdMax , coalesce(g.tipo,0) as tipo, coalesce(g.unico,0) as unico ');
    LSQL.Add(' from grupos_adicionais g  where g.id=' + IntToStr(AGrupoAdicional.ID));

    try
      LTransaction.StartTransaction;
      LQuery.SQL.Text := LSQL.Text;
      LQuery.Open(LSQL.Text);
      LQuery.FetchAll;

      if LQuery.IsEmpty then
        raise Exception.Create('Grupo de adicional não encontrado!');

      AGrupoAdicional.ID := LQuery.FieldByName('id').Value;
      AGrupoAdicional.Nome := LQuery.FieldByName('nome').Value;
      AGrupoAdicional.Descricao := LQuery.FieldByName('descricao').Value;
      AGrupoAdicional.QtdeMinima := LQuery.FieldByName('Qtdmin').Value;
      AGrupoAdicional.QtdeMaxima := LQuery.FieldByName('qtdMax').Value;
      AGrupoAdicional.tipo := LQuery.FieldByName('tipo').Value;

      LTransaction.Rollback;

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

end.

