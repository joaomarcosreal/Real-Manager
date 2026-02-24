unit MunicipioModel;

interface

uses EstadoModel;
 type

   TMunicipio = class
  private
    FCodigo: string;
    FNome: string;
    FEstado: TEstado;
    procedure SetCodigo(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetEstado(const Value: TEstado);
     public
      property  Codigo : string read FCodigo write SetCodigo;
      property  Nome   : string read FNome write SetNome;
      property  Estado : TEstado read FEstado write SetEstado;
   end;

implementation

{ TMunicipio }

procedure TMunicipio.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TMunicipio.SetEstado(const Value: TEstado);
begin
  FEstado := Value;
end;

procedure TMunicipio.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
