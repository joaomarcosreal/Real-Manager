unit uuDMGruposAdicionais;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  GrupoAdicional, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  TdmGruposAdicionais = class(TDataModule)
    qryGruposAdicionais: TFDQuery;
    dsGruposAdicionais: TDataSource;
    qryProdutosGruposAdicionais: TFDQuery;
    dsQryProdutosGruposAdicionais: TDataSource;
    updProdutosGruposAdicionais: TFDUpdateSQL;
    procedure DataModuleDestroy(Sender: TObject);
  private
    procedure closeAndDestroyQueries;


    { Private declarations }
  public
    { Public declarations }

    procedure AdicionarProdutoAoGrupo(AGrupoAdicional: TGrupoAdicional; ACodProduto, ADescricaoOBS: string);
    procedure ListarGruposDeAdicionais(ACodProduto: string);
    procedure ExcluirGrupoAdicional;
    procedure ExcluirAdicional();
  end;

var
  dmGruposAdicionais: TdmGruposAdicionais;

implementation

uses
  uu_data_module;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmGruposAdicionais.ExcluirAdicional();
var
  LSQL: string;
  LID: LongInt;
begin
  LID := qryProdutosGruposAdicionais.FieldByName('id').Value;
  LSQL := 'delete from PRODUTOS_GRUPOS_ADICIONAIS where id =' + Inttostr(LID);
  dm.executaSQL(LSQL);
  qryProdutosGruposAdicionais.Active := false;
  qryProdutosGruposAdicionais.Active := true;

end;

procedure TdmGruposAdicionais.ExcluirGrupoAdicional();
var
  LSQL: string;
  LID: LongInt;
begin
  LID := qryGruposAdicionais.FieldByName('id').Value;
  qryGruposAdicionais.Active := false;
  LSQL := 'delete from grupos_adicionais where id =' + Inttostr(LID);
  dm.executaSQL(LSQL);
  qryGruposAdicionais.Active := false;

end;

procedure TdmGruposAdicionais.AdicionarProdutoAoGrupo(AGrupoAdicional: TGrupoAdicional; ACodProduto: string; ADescricaoOBS: string);
var
  LMemTable: TFDMemTable;
  LSQL: TStringList;
  LValorUnitario: Double;
  LTipo: integer;
  LID: LongInt;
begin
  LMemTable := TFDMemTable.Create(self);
  LSQL := TStringList.Create;

  try
    try
      LValorUnitario := 0;
      LTipo := 0;

      qryProdutosGruposAdicionais.Active := false;

      if (ACodProduto <> '00000') then
      begin
        LTipo := 1;
        LSQL.Text := 'select cod_produto, descricao, valor_unitario from produtos p where p.cod_produto=' + Quotedstr(ACodProduto);
        dm.getMemTable(LMemTable, LSQL.Text);
        if LMemTable.IsEmpty then
          raise Exception.Create('Produto não encontrado!');
        ADescricaoOBS := LMemTable.FieldByName('descricao').Value;
        LValorUnitario := LMemTable.FieldByName('valor_unitario').Value;
      end;

      LSQL.Clear;
      LSQL.Add('select gen_id(G_PRODUTOS_GRUPOS_AD,1) as id from RDB$DATABASE ');
      dm.getMemTable(LMemTable, LSQL.Text);
      LID := LMemTable.FieldByName('id').Value;

      LSQL.Clear;
      LSQL.Add('insert into produtos_grupos_adicionais (id, id_grupo, cod_produto, valor,tipo, descricao, qtd) values (');
      LSQL.Add(Inttostr(LID) + ',');
      LSQL.Add(Inttostr(AGrupoAdicional.ID) + ',');
      LSQL.Add(Quotedstr(ACodProduto) + ',');
      LSQL.Add(dm.TrocaVirgPPto(Floattostr(LValorUnitario)) + ',');
      LSQL.Add(Inttostr(LTipo) + ',');
      LSQL.Add(Quotedstr(ADescricaoOBS) + ',1)');
      dm.executaSQL(LSQL.Text);

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao adicionar produto ao grupo!' + sLineBreak + 'Erro: ' + E.Message);
      end;

    end;
  finally
    LMemTable.Active := False;
    FreeAndNil(LMemTable);
    FreeAndNil(LSQL);
    qryProdutosGruposAdicionais.Active := false;
    qryProdutosGruposAdicionais.Active := true;
  end;

end;

procedure TdmGruposAdicionais.closeAndDestroyQueries();
begin
  qryGruposAdicionais.Active := false;
  qryProdutosGruposAdicionais.Active := False;
  FreeAndNil(qryGruposAdicionais);
  FreeAndNil(qryProdutosGruposAdicionais);
end;

procedure TdmGruposAdicionais.ListarGruposDeAdicionais(ACodProduto: string);
var
  LSQL: TStringList;
begin
  qryGruposAdicionais.Active := False;
  LSQL := TStringList.Create;
  try
    try

      LSQL.add(' SELECT ga.id, ga.nome, ga.descricao,coalesce(ga.qtd_min,1) qtdMin,     ');
      LSQL.add('        coalesce(ga.qtd_max,0) as qtdMax, coalesce(ga.tipo,0) as tipo,  ');
      LSQL.add('        ga.cod_produto,coalesce(ga.unico,0) as unico,                   ');
      LSQL.add('  CASE                                                                  ');
      LSQL.add('   WHEN COALESCE(ga.tipo,0) = 0 THEN ' + Quotedstr('Opcional'));
      LSQL.add('   WHEN COALESCE(ga.tipo,0) = 1 THEN ' + Quotedstr('Obrigatório'));
      LSQL.add('   WHEN COALESCE(ga.tipo,0) = 2 THEN ' + Quotedstr('Fixo'));
      LSQL.add('  END as descricaoTipo                                                  ');
      LSQL.add('  FROM grupos_adicionais ga                                             ');
      LSQL.add('    where ga.cod_produto =:vpCodProduto                                 ');
      LSQL.add('   order by ga.id                                                       ');
      LSQL.Text := StringReplace(LSQL.Text, ':vpCodProduto', ACodProduto, [rfReplaceAll, rfIgnoreCase]);
      qryGruposAdicionais.SQL.Text := LSQL.Text;
      qryGruposAdicionais.Active := True;

    except
      on e: Exception do
      begin
        raise Exception.Create('Erro ao buscar grupos de adicionais do produto!');
      end;
    end

  finally
    FreeAndNil(LSQL);
  end;

  qryGruposAdicionais.Active := true;
  qryGruposAdicionais.FetchAll;
end;

procedure TdmGruposAdicionais.DataModuleDestroy(Sender: TObject);
begin
  closeAndDestroyQueries();
end;

end.

