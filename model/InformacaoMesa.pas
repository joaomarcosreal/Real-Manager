unit InformacaoMesa;

interface

 type TInformacaoMesa =  class
  private
    FqtdPessoas: smallint;
    Fhora: TDateTime;
    FvalorDesconto: double;
    FcodUsuario: string;
    FMesa: string;
    FtipoDesconto: smallint;
    procedure SetcodUsuario(const Value: string);
    procedure Sethora(const Value: TDateTime);
    procedure SetMesa(const Value: string);
    procedure SetqtdPessoas(const Value: smallint);
    procedure SettipoDesconto(const Value: smallint);
    procedure SetvalorDesconto(const Value: double);
  public
    property Mesa : string read FMesa write SetMesa;
    property hora : TDateTime read Fhora write Sethora;
    property codUsuario : string read FcodUsuario write SetcodUsuario;
    property qtdPessoas : smallint read FqtdPessoas write SetqtdPessoas;
    property tipoDesconto : smallint read FtipoDesconto write SettipoDesconto;
    property valorDesconto : double read FvalorDesconto write SetvalorDesconto;

 end;




implementation

{ TInformacaoMesa }

procedure TInformacaoMesa.SetcodUsuario(const Value: string);
begin
  FcodUsuario := Value;
end;

procedure TInformacaoMesa.Sethora(const Value: TDateTime);
begin
  Fhora := Value;
end;

procedure TInformacaoMesa.SetMesa(const Value: string);
begin
  FMesa := Value;
end;

procedure TInformacaoMesa.SetqtdPessoas(const Value: smallint);
begin
  FqtdPessoas := Value;
end;

procedure TInformacaoMesa.SettipoDesconto(const Value: smallint);
begin
  FtipoDesconto := Value;
end;

procedure TInformacaoMesa.SetvalorDesconto(const Value: double);
begin
  FvalorDesconto := Value;
end;

end.
