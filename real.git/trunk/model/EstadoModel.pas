unit EstadoModel;

interface

uses PaisModel;

  type

   TEstado = class
  private
    FUF: string;
    FCodigo: string;
    FNome: string;
    FPais: TPais;
    procedure SetCodigo(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetPais(const Value: TPais);
    procedure SetUF(const Value: string);
     public
      property  Codigo : string read FCodigo write SetCodigo;
      property  Nome   : string read FNome write SetNome;
      Property  UF     : string read FUF write SetUF;
      Property  Pais   : TPais read FPais write SetPais;
   end;

implementation

{ TEstado }

procedure TEstado.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TEstado.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TEstado.SetPais(const Value: TPais);
begin
  FPais := Value;
end;

procedure TEstado.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
