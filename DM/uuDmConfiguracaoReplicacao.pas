unit uuDmConfiguracaoReplicacao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf;

type
  TdmConfiguracaoReplicacao = class(TDataModule)
    qryDatabaseTables: TFDQuery;
    qryFieldNames: TFDQuery;
    dsDatabaseTables: TDataSource;
    dsFieldNames: TDataSource;
    tbFieldProperties: TFDMemTable;
    tbFieldPropertiesExtraParams: TStringField;
    tbFieldPropertiesFieldName: TStringField;
    tbFieldPropertiesAlias: TStringField;
    dsReplicationServers: TDataSource;
    qryReplicationServers: TFDQuery;
    qrySchemas: TFDQuery;
    dsSchemas: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private





    { Private declarations }
  public
    { Public declarations }
    procedure GetTableFieldNames(ATableName: string; AList: TStringList);
    procedure RefreshSchemas;
  end;

var
  dmConfiguracaoReplicacao: TdmConfiguracaoReplicacao;

implementation

uses
  uu_data_module;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConfiguracaoReplicacao.DataModuleCreate(Sender: TObject);
begin
//  if not Assigned(qryFieldNames) then
//    qryFieldNames := TFDQuery.Create(self);
//  if not Assigned(qryDatabaseTables) then
//  qryDatabaseTables := TFDQuery.Create(self);

  qryDatabaseTables.active := true;
  qrySchemas.Active := true;
end;

procedure TdmConfiguracaoReplicacao.DataModuleDestroy(Sender: TObject);
begin
  qryDatabaseTables.Active := false;
  qryFieldNames.Active := false;
  qrySchemas.Active := false;

//  FreeAndNil(qryDatabaseTables);
//  FreeAndNil(qryFieldNames);

end;

procedure TdmConfiguracaoReplicacao.RefreshSchemas();
begin
  qrySchemas.Active := false;
  qrySchemas.active := true;
end;

procedure TdmConfiguracaoReplicacao.GetTableFieldNames(ATableName: string; AList: TStringList);
var
  LSQL: Tstringlist;
begin

  LSQL := TStringList.Create;
  qryFieldNames.Active := false;
  qryFieldNames.sql.clear;

  try
    try
      LSQL.add(' SELECT                                                          ');
      LSQL.add('     rf.RDB$FIELD_NAME AS field_name                             ');
      LSQL.add('                                                                 ');
      LSQL.add(' FROM                                                            ');
      LSQL.add('     RDB$RELATION_FIELDS rf                                      ');
      LSQL.add('     JOIN RDB$FIELDS f ON rf.RDB$FIELD_SOURCE = f.RDB$FIELD_NAME ');
      LSQL.add(' WHERE                                                           ');
      LSQL.add('     rf.RDB$RELATION_NAME = ' + Quotedstr(ATableName));
      LSQL.add(' ORDER BY                                                        ');
      LSQL.add('     rf.RDB$FIELD_POSITION;                                      ');
      LSQL.add('                                                                 ');
      qryFieldNames.sql.Add(LSQL.text);
      qryFieldNames.Active := true;
      qryFieldNames.FetchAll;
      qryFieldNames.first;

      while not qryFieldNames.eof do
      begin
        AList.add(qryFieldNames.fields[0].Value);
        qryFieldNames.next;
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao retornar nomes dos campos ' + E.Message);
      end;

    end;
  finally
    qryFieldNames.active := false;
    FreeAndNil(LSQL);
  end;

end;

end.

