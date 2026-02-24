unit TransferenciaItem;

interface

type

  TTransferenciaItem = class
  private
    FCodMOtivo: string;
    FObservacao: string;
    FCodTransferencia: string;
    FDescricaoProduto: string;
    FValorUnitario: Double;
    FIDMovimento: LongInt;
    FMesaDestino: string;
    FMesaOrigem: string;
    FQuantidade: Double;
    FCodProduto: string;
    procedure SetCodMOtivo(const Value: string);
    procedure SetCodProduto(const Value: string);
    procedure SetCodTransferencia(const Value: string);
    procedure SetDescricaoProduto(const Value: string);
    procedure SetIDMovimento(const Value: LongInt);
    procedure SetMesaDestino(const Value: string);
    procedure SetMesaOrigem(const Value: string);
    procedure SetObservacao(const Value: string);
    procedure SetQuantidade(const Value: Double);
    procedure SetValorUnitario(const Value: Double);
  published
    property CodTransferencia: string read FCodTransferencia write SetCodTransferencia;
    property     MesaOrigem: string read FMesaOrigem write SetMesaOrigem;
    property     MesaDestino: string read FMesaDestino write SetMesaDestino;
    property     CodMOtivo: string read FCodMOtivo write SetCodMOtivo;
    property     CodProduto: string read FCodProduto write SetCodProduto;
    property     DescricaoProduto: string read FDescricaoProduto write SetDescricaoProduto;
    property     Quantidade: Double read FQuantidade write SetQuantidade;
    property     ValorUnitario: Double read FValorUnitario write SetValorUnitario;
    property     Observacao: string read FObservacao write SetObservacao;
    property     IDMovimento : LongInt read FIDMovimento write SetIDMovimento;
  end;

implementation

{ TTransferenciaItem }

procedure TTransferenciaItem.SetCodMOtivo(const Value: string);
begin
  FCodMOtivo := Value;
end;

procedure TTransferenciaItem.SetCodProduto(const Value: string);
begin
  FCodProduto := Value;
end;

procedure TTransferenciaItem.SetCodTransferencia(const Value: string);
begin
  FCodTransferencia := Value;
end;

procedure TTransferenciaItem.SetDescricaoProduto(const Value: string);
begin
  FDescricaoProduto := Value;
end;

procedure TTransferenciaItem.SetIDMovimento(const Value: LongInt);
begin
  FIDMovimento := Value;
end;

procedure TTransferenciaItem.SetMesaDestino(const Value: string);
begin
  FMesaDestino := Value;
end;

procedure TTransferenciaItem.SetMesaOrigem(const Value: string);
begin
  FMesaOrigem := Value;
end;

procedure TTransferenciaItem.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TTransferenciaItem.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TTransferenciaItem.SetValorUnitario(const Value: Double);
begin
  FValorUnitario := Value;
end;

end.
