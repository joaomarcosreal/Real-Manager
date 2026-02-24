unit UUDadosConexaoAPIReplicacao;

interface

type
  TDadosAPIReplicacao = class
  private
    FServidor: string;
    FMerchantID: string;
    FToken: string;
    FPorta: string;
    FPermiteSincronizar: boolean;
    FQtdRegistros: integer;
    procedure SetMerchantID(const Value: string);
    procedure SetPorta(const Value: string);
    procedure SetServidor(const Value: string);
    procedure SetToken(const Value: string);
    procedure SetPermiteSincronizar(const Value: boolean);
    procedure SetQtdRegistros(const Value: integer);
  published
    property Servidor: string read FServidor write SetServidor;
    property Porta: string read FPorta write SetPorta;
    property MerchantID: string read FMerchantID write SetMerchantID;
    property Token: string read FToken write SetToken;
    property PermiteSincronizar: boolean read FPermiteSincronizar write SetPermiteSincronizar;
    property QtdRegistros : integer read FQtdRegistros write SetQtdRegistros;
  end;

implementation


procedure TDadosAPIReplicacao.SetMerchantID(const Value: string);
begin
  FMerchantID := Value;
end;

procedure TDadosAPIReplicacao.SetPermiteSincronizar(const Value: boolean);
begin
  FPermiteSincronizar := Value;
end;

procedure TDadosAPIReplicacao.SetPorta(const Value: string);
begin
  FPorta := Value;
end;

procedure TDadosAPIReplicacao.SetQtdRegistros(const Value: integer);
begin
  FQtdRegistros := Value;
end;

procedure TDadosAPIReplicacao.SetServidor(const Value: string);
begin
  FServidor := Value;
end;

procedure TDadosAPIReplicacao.SetToken(const Value: string);
begin
  FToken := Value;
end;



end.

