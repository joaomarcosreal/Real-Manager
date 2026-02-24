unit URequisicaoAPIHorse;

interface

uses
  System.Generics.Collections;

type
  TDadosConexaoBanco = class
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

  TDadosRequisicaoAPIHorse = class
  private
    FComandos: TList<String>;
    FDadosConexao: TDadosConexaoBanco;
    procedure SetComandos(const Value: TList<String>);
    procedure SetDadosConexao(const Value: TDadosConexaoBanco);
  published
    property DadosConexao: TDadosConexaoBanco read FDadosConexao write SetDadosConexao;
    property Comandos: TList<string> read FComandos write SetComandos;
  end;

implementation

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

{ TDadosRequisicaoAPIHorse }

procedure TDadosRequisicaoAPIHorse.SetComandos(const Value: TList<String>);
begin
  FComandos := Value;
end;

procedure TDadosRequisicaoAPIHorse.SetDadosConexao(
  const Value: TDadosConexaoBanco);
begin
  FDadosConexao := Value;
end;

end.

