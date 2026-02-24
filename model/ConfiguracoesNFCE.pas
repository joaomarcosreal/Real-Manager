unit ConfiguracoesNFCE;

interface
type
  TConfiguracoesNFCE = class
  private
    FSerie: LongInt;
    FNumero: LongInt;
    procedure SetNumero(const Value: LongInt);
    procedure SetSerie(const Value: LongInt);
    published
     property Serie  : LongInt read FSerie write SetSerie;
     property Numero : LongInt read FNumero write SetNumero;
  end;

implementation

{ TConfiguracoesNFCE }

procedure TConfiguracoesNFCE.SetNumero(const Value: LongInt);
begin
  FNumero := Value;
end;

procedure TConfiguracoesNFCE.SetSerie(const Value: LongInt);
begin
  FSerie := Value;
end;

end.
