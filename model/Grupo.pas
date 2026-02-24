unit Grupo;

interface
  type
   TGrupo = class
  private
    FDescricao: string;
    FCodigo: string;
    procedure SetCodigo(const Value: string);
    procedure SetDescricao(const Value: string);
   published
     property Codigo : string read FCodigo write SetCodigo;
     property Descricao : string read FDescricao write SetDescricao;
   end;

implementation

{ TGrupo }

procedure TGrupo.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TGrupo.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

end.
