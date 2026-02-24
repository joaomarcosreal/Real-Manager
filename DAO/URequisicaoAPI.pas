unit URequisicaoAPI;

interface

uses
  System.Generics.Collections, Classes, IdSSLOpenSSL, IdGlobal,
  ReplicationContainer;

type


  TDadosRequisicao = class(TPersistent)
  private
    FComandos: TList<string>;
    FContainer: TReplicationContainer;
    procedure SetComandos(const Value: TList<string>);
    procedure SetContainer(const Value: TReplicationContainer);
  published
    property Comandos: TList<string> read FComandos write SetComandos;
    property ReplicationContainer: TReplicationContainer read FContainer write SetContainer;
  public
    constructor Create();
    destructor Destroy; override;
  end;

implementation

constructor TDadosRequisicao.Create;
begin

  Comandos := TList<string>.create;
  Comandos.Clear;

end;

destructor TDadosRequisicao.Destroy;
begin
  inherited;

  Comandos.Free;

end;

procedure TDadosRequisicao.SetComandos(const Value: TList<string>);
begin
  FComandos := Value;
end;

procedure TDadosRequisicao.SetContainer(const Value: TReplicationContainer);
begin
  FContainer := Value;
end;


end.

