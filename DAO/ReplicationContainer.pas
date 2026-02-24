unit ReplicationContainer;

interface

uses
  System.Generics.Collections, classes, ReplicationItem;

type
  TReplicationContainer = class(TPersistent)
  private
    FItems: TList<TReplicationItem>;
    FCodEmpresa: string;
    FNomeEmpresa: string;
    FScriptsToExecuteBefore: TList<string>;
    FScriptsToExecuteAfter: TList<string>;
    procedure SetItems(const Value: TList<TReplicationItem>);
    procedure SetCodEmpresa(const Value: string);
    procedure SetNomeEmpresa(const Value: string);
    procedure SetScriptsToExecuteAfter(const Value: TList<string>);
    procedure SetScriptsToExecuteBefore(const Value: TList<string>);
  published
    property CodEmpresa: string read FCodEmpresa write SetCodEmpresa;
    property NomeEmpresa: string read FNomeEmpresa write SetNomeEmpresa;
    property Items: TList<TReplicationItem> read FItems write SetItems;
    property ScriptsToExecuteBefore: TList<string> read FScriptsToExecuteBefore write FScriptsToExecuteBefore;
    property ScriptsToExecuteAfter: TList<string> read FScriptsToExecuteAfter write FScriptsToExecuteAfter;
    destructor Destroy; override;
  public
    constructor Create();
  end;

implementation


{ TReplicationContainer }

constructor TReplicationContainer.Create;
begin
  inherited;
  Items := TList<TReplicationItem>.Create;
  FScriptsToExecuteBefore := TList<string>.Create;
  FScriptsToExecuteAfter := TList<string>.Create;

end;

destructor TReplicationContainer.Destroy;
var
  I: Integer;
begin
  for I := 0 to items.count - 1 do
    Items[I].Free;

  FScriptsToExecuteBefore.Clear;
  FScriptsToExecuteAfter.Clear;

  Items.Free;
  inherited;
end;

procedure TReplicationContainer.SetCodEmpresa(const Value: string);
begin
  FCodEmpresa := Value;
end;

procedure TReplicationContainer.SetItems(const Value: TList<TReplicationItem>);
begin
  FItems := Value;
end;

procedure TReplicationContainer.SetNomeEmpresa(const Value: string);
begin
  FNomeEmpresa := Value;
end;

procedure TReplicationContainer.SetScriptsToExecuteAfter(const Value: TList<string>);
begin
  ScriptsToExecuteAfter := Value;
end;

procedure TReplicationContainer.SetScriptsToExecuteBefore(const Value: TList<string>);
begin
  FScriptsToExecuteBefore := Value;
end;

end.

