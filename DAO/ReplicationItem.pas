unit ReplicationItem;

interface

uses
  classes;

type
  TReplicationItem = class(TPersistent)
  private
    FData: string;
    FTableName: string;
    FUpdateSQL: string;
    FFetchSQL: string;
    FRecordCount: Integer;
    FScriptAfter: string;
    FScriptBefore: string;
    FUpdateCommand: string;
    procedure SetData(const Value: string);
    procedure SetFetchSQL(const Value: string);
    procedure SetTableName(const Value: string);
    procedure SetUpdateSQL(const Value: string);
    procedure SetRecordCount(const Value: Integer);
    procedure SetScriptAfter(const Value: string);
    procedure SetScriptBefore(const Value: string);
    procedure SetUpdateCommand(const Value: string);
  published
    property FetchSQL: string read FFetchSQL write SetFetchSQL;
    property UpdateSQL: string read FUpdateSQL write SetUpdateSQL;
    property TableName: string read FTableName write SetTableName;
    property UpdateCommand: string read FUpdateCommand write SetUpdateCommand;
    property Data: string read FData write SetData;
    property ScriptBefore: string read FScriptBefore write SetScriptBefore;
    property ScriptAfter: string read FScriptAfter write SetScriptAfter;
    property RecordCount: Integer read FRecordCount write SetRecordCount;
  end;

implementation

{ TReplicationItem }

procedure TReplicationItem.SetData(const Value: string);
begin
  FData := Value;
end;

procedure TReplicationItem.SetFetchSQL(const Value: string);
begin
  FFetchSQL := Value;
end;

procedure TReplicationItem.SetRecordCount(const Value: Integer);
begin
  FRecordCount := Value;
end;

procedure TReplicationItem.SetScriptAfter(const Value: string);
begin
  FScriptAfter := Value;
end;

procedure TReplicationItem.SetScriptBefore(const Value: string);
begin
  FScriptBefore := Value;
end;

procedure TReplicationItem.SetTableName(const Value: string);
begin
  FTableName := Value;
end;

procedure TReplicationItem.SetUpdateCommand(const Value: string);
begin
  FUpdateCommand := Value;
end;

procedure TReplicationItem.SetUpdateSQL(const Value: string);
begin
  FUpdateSQL := Value;
end;

end.

