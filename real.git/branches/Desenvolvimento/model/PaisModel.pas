unit PaisModel;

interface
  type
   TPais = class
  private
    FCodigo: string;
    FNome: string;



    procedure SetCodigo(const Value: string);
    procedure SetNome(const Value: string);
     public
       property Codigo : string read FCodigo write SetCodigo;
       property Nome : string read FNome write SetNome;
   end;

implementation

{ TPais }


procedure TPais.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TPais.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
