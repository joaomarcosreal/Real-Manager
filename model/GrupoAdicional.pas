unit GrupoAdicional;

interface

type
  TGrupoAdicional = class
  private
    FID: LongInt;
    FQtdeMaxima: smallint;
    FDescricao: string;

    FNome: string;
    Ftipo: smallint;
    FUnico: Boolean;

    FQtdeMinima: SmallInt;
    FCodProduto: string;
    procedure SetID(const Value: LongInt);
    procedure SetDescricao(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetQtdeMaxima(const Value: smallint);

    procedure Settipo(const Value: smallint);

    procedure SetUnico(const Value: Boolean);
    procedure SetQtdeMinima(const Value: SmallInt);
    procedure SetCodProduto(const Value: string);
  published
    property ID: LongInt read FID write SetID;
    property CodProduto : string read FCodProduto write SetCodProduto;
    property Nome: string read FNome write SetNome;
    property Descricao: string read FDescricao write SetDescricao;
    property Unico : Boolean read FUnico write SetUnico;
    property QtdeMinima : SmallInt read FQtdeMinima write SetQtdeMinima;
    property QtdeMaxima: smallint read FQtdeMaxima write SetQtdeMaxima;
    property tipo: smallint read Ftipo write Settipo;

  end;

implementation

{ TGrupoAdicional }

procedure TGrupoAdicional.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TGrupoAdicional.SetQtdeMaxima(const Value: smallint);
begin
  FQtdeMaxima := Value;
end;


procedure TGrupoAdicional.SetQtdeMinima(const Value: SmallInt);
begin
  FQtdeMinima := Value;
end;

procedure TGrupoAdicional.Settipo(const Value: smallint);
begin
  Ftipo := Value;
end;

procedure TGrupoAdicional.SetUnico(const Value: Boolean);
begin
  FUnico := Value;
end;

{ TGrupoAdicional }



procedure TGrupoAdicional.SetCodProduto(const Value: string);
begin
  FCodProduto := Value;
end;

procedure TGrupoAdicional.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TGrupoAdicional.SetID(const Value: LongInt);
begin
  FID := Value;
end;

end.

