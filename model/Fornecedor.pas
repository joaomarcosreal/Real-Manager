unit Fornecedor;

interface

uses MunicipioModel, PaisModel;

 type

    TParticipante = class
  private

    FBairro: string;
    FIEstadual: string;
    FCodigo: string;
    FCep: string;
    FCnpjCPF: string;
    FNumero: string;
    FMunicipio: TMunicipio;
    FRazaoSocial: string;
    FComplemento: string;
    FEndereco: string;
    FPais: TPais;
    FIMunicipal: string;
    FNomeFantasia: string;
    FEmail: string;
    FDataCadastro: TDateTime;
    FContato: string;
    FTelefone: string;
    FObservacoes: string;
    FCelular: string;
    FAtivo: boolean;
    FValorCredito: double;
    procedure SetBairro(const Value: string);
    procedure SetCep(const Value: string);
    procedure SetCnpjCPF(const Value: string);
    procedure SetCodigo(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetIEstadual(const Value: string);
    procedure SetIMunicipal(const Value: string);
    procedure SetMunicipio(const Value: TMunicipio);
    procedure SetNomeFantasia(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetPais(const Value: TPais);
    procedure SetRazaoSocial(const Value: string);
    procedure SetCelular(const Value: string);
    procedure SetContato(const Value: string);
    procedure SetDataCadastro(const Value: TDateTime);
    procedure SetEmail(const Value: string);
    procedure SetObservacoes(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetAtivo(const Value: boolean);
    procedure SetValorCredito(const Value: double);


      public
       property Ativo : boolean read FAtivo write SetAtivo;
       property Codigo : string read FCodigo write SetCodigo;
       property RazaoSocial : string read FRazaoSocial write SetRazaoSocial;
       property NomeFantasia : string read FNomeFantasia write SetNomeFantasia;
       property CnpjCPF : string read FCnpjCPF write SetCnpjCPF;
       Property IEstadual : string read FIEstadual write SetIEstadual;
       Property IMunicipal : string read FIMunicipal write SetIMunicipal;
       Property Municipio :  TMunicipio read FMunicipio write SetMunicipio;
       property Endereco : string read FEndereco write SetEndereco;
       property Numero : string read FNumero write SetNumero;
       Property Complemento : string read FComplemento write SetComplemento;
       property Bairro : string read FBairro write SetBairro;
       Property Cep : string read FCep write SetCep;
       Property Telefone : string read FTelefone write SetTelefone;
       Property Celular  : string read FCelular write SetCelular;
       Property Contato : string read FContato write SetContato;
       Property Email : string read FEmail write SetEmail;
       Property Observacoes : string read FObservacoes write SetObservacoes;
       property ValorCredito : double read FValorCredito write SetValorCredito;
       Property DataCadastro : TDateTime read FDataCadastro write SetDataCadastro;


    end;

implementation

{ TFornecedor }


{ TFornecedor }

procedure TParticipante.SetAtivo(const Value: boolean);
begin
  FAtivo := Value;
end;

procedure TParticipante.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TParticipante.SetCelular(const Value: string);
begin
  FCelular := Value;
end;

procedure TParticipante.SetCep(const Value: string);
begin
  FCep := Value;
end;

procedure TParticipante.SetCnpjCPF(const Value: string);
begin
  FCnpjCPF := Value;
end;

procedure TParticipante.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TParticipante.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TParticipante.SetContato(const Value: string);
begin
  FContato := Value;
end;

procedure TParticipante.SetDataCadastro(const Value: TDateTime);
begin
  FDataCadastro := Value;
end;

procedure TParticipante.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TParticipante.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TParticipante.SetIEstadual(const Value: string);
begin
  FIEstadual := Value;
end;

procedure TParticipante.SetIMunicipal(const Value: string);
begin
  FIMunicipal := Value;
end;

procedure TParticipante.SetMunicipio(const Value: TMunicipio);
begin
  FMunicipio := Value;
end;

procedure TParticipante.SetNomeFantasia(const Value: string);
begin
  FNomeFantasia := Value;
end;

procedure TParticipante.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TParticipante.SetObservacoes(const Value: string);
begin
  FObservacoes := Value;
end;

procedure TParticipante.SetPais(const Value: TPais);
begin
  FPais := Value;
end;

procedure TParticipante.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

procedure TParticipante.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TParticipante.SetValorCredito(const Value: double);
begin
  FValorCredito := Value;
end;

end.
