unit UnidadeMedida;

interface
 type TUnidadeMedida = class
  private
    Fvalor: LongInt;
    FDescricao: string;
    FCodigo: string;
    FSigla: string;
    procedure SetCodigo(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetSigla(const Value: string);
    procedure Setvalor(const Value: LongInt);

  published
    property Codigo : string read FCodigo write SetCodigo;
    property Descricao : string read FDescricao write SetDescricao;
    property Sigla   : string read FSigla write SetSigla;
    property valor   : LongInt read Fvalor write Setvalor;

 end;

implementation

{ TUnidadeMedida }

procedure TUnidadeMedida.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TUnidadeMedida.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TUnidadeMedida.SetSigla(const Value: string);
begin
  FSigla := Value;
end;

procedure TUnidadeMedida.Setvalor(const Value: LongInt);
begin
  Fvalor := Value;
end;

end.
