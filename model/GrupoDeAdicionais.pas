unit GrupoDeAdicionais;

interface
uses
  System.SysUtils;

  type
   TGrupoDeAdicionais = class
  private
    FQtdeMaxima: integer;
    FDescricao: string;
    FQtdeMinima: Integer;
    FId: integer;
    FNome: string;
    procedure SetDescricao(const Value: string);
    procedure SetId(const Value: integer);
    procedure SetNome(const Value: string);
    procedure SetQtdeMaxima(const Value: integer);
    procedure SetQtdeMinima(const Value: Integer);

     published
      property Id : integer read FId write SetId;
      property Nome : string read FNome write SetNome;
      property Descricao : string read FDescricao write SetDescricao;
      property QtdeMaxima : integer read FQtdeMaxima write SetQtdeMaxima;
      property QtdeMinima : Integer read FQtdeMinima write SetQtdeMinima;

   end;

implementation

{ TGrupoDeAdicionais }

procedure TGrupoDeAdicionais.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TGrupoDeAdicionais.SetId(const Value: integer);
begin
  FId := Value;
end;

procedure TGrupoDeAdicionais.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TGrupoDeAdicionais.SetQtdeMaxima(const Value: integer);
begin
  FQtdeMaxima := Value;
end;

procedure TGrupoDeAdicionais.SetQtdeMinima(const Value: Integer);
begin
  FQtdeMinima := Value;
end;

end.
