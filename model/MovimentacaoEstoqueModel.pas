unit MovimentacaoEstoqueModel;

interface

 type
  TMovimentacaoEstoqueModel = class
  private
    FCodBaixa: string;
    FcodUnidade: string;
    FcodTipo: string;
    Fquantidade: double;
    FcodProduto: string;
    Fhora: Ttime;
    FdataSistema: Tdate;
    Fusuario: string;
    Fobservacoes: string;
    FdataSO: Tdate;
    Fid: integer;
    FcustoUnitario: double;
    FEstoqueAtualizado: integer;
    FcodOrigem: integer;
    FtipoMovimentacao: smallint;
    FEstoqueAnterior: integer;
    procedure SetCodBaixa(const Value: string);
    procedure SetcodProduto(const Value: string);
    procedure SetcodTipo(const Value: string);
    procedure SetcodUnidade(const Value: string);
    procedure Setquantidade(const Value: double);
    procedure Setid(const Value: integer);
    procedure Setobservacoes(const Value: string);
    procedure Setusuario(const Value: string);
    procedure SetdataSistema(const Value: Tdate);
    procedure SetdataSO(const Value: Tdate);
    procedure Sethora(const Value: ttime);
    procedure SetcodOrigem(const Value: integer);
    procedure SetcustoUnitario(const Value: double);
    procedure SetEstoqueAnterior(const Value: integer);
    procedure SetEstoqueAtualizado(const Value: integer);
    procedure SettipoMovimentacao(const Value: smallint);


  public
   property id : integer read Fid write Setid;
   property CodBaixa : string  read FCodBaixa write SetCodBaixa;
   property codOrigem : integer read FcodOrigem write SetcodOrigem;
   property codTipo   : string read FcodTipo write SetcodTipo;
   property codProduto : string read FcodProduto write SetcodProduto;
   property codUnidade : string read FcodUnidade write SetcodUnidade;
   property quantidade : double read Fquantidade write Setquantidade;
   property dataSistema : Tdate read FdataSistema write SetdataSistema;
   property dataSO      : Tdate read FdataSO write SetdataSO;
   property hora : Ttime read Fhora write Sethora;
   property observacoes : string read Fobservacoes write Setobservacoes;
   property usuario : string read Fusuario write Setusuario;
   property EstoqueAnterior : integer read FEstoqueAnterior write SetEstoqueAnterior;
   property EstoqueAtualizado : integer read FEstoqueAtualizado write SetEstoqueAtualizado;
   property custoUnitario : double read FcustoUnitario write SetcustoUnitario;
   property tipoMovimentacao : smallint read FtipoMovimentacao write SettipoMovimentacao;




  end;

implementation

{ TMovimentacaoEstoqueModel }

procedure TMovimentacaoEstoqueModel.SetCodBaixa(const Value: string);
begin
  FCodBaixa := Value;
end;

procedure TMovimentacaoEstoqueModel.SetcodOrigem(const Value: integer);
begin
  FcodOrigem := Value;
end;

procedure TMovimentacaoEstoqueModel.SetcodProduto(const Value: string);
begin
  FcodProduto := Value;
end;

procedure TMovimentacaoEstoqueModel.SetcodTipo(const Value: string);
begin
  FcodTipo := Value;
end;

procedure TMovimentacaoEstoqueModel.SetcodUnidade(const Value: string);
begin
  FcodUnidade := Value;
end;


procedure TMovimentacaoEstoqueModel.SetcustoUnitario(const Value: double);
begin
  FcustoUnitario := Value;
end;

procedure TMovimentacaoEstoqueModel.SetdataSistema(const Value: Tdate);
begin
 FdataSistema := value;
end;

procedure TMovimentacaoEstoqueModel.SetdataSO(const Value: Tdate);
begin
  FdataSO := value;
end;

procedure TMovimentacaoEstoqueModel.SetEstoqueAnterior(const Value: integer);
begin
  FEstoqueAnterior := Value;
end;

procedure TMovimentacaoEstoqueModel.SetEstoqueAtualizado(const Value: integer);
begin
  FEstoqueAtualizado := Value;
end;

procedure TMovimentacaoEstoqueModel.Sethora(const Value: ttime);
begin
  Fhora := Value;
end;

procedure TMovimentacaoEstoqueModel.Setid(const Value: integer);
begin
 Fid := Value;
end;

procedure TMovimentacaoEstoqueModel.Setobservacoes(const Value: string);
begin
  Fobservacoes := Value;
end;

procedure TMovimentacaoEstoqueModel.Setquantidade(const Value: double);
begin
  Fquantidade := Value;
end;

procedure TMovimentacaoEstoqueModel.SettipoMovimentacao(const Value: smallint);
begin
  FtipoMovimentacao := Value;
end;

procedure TMovimentacaoEstoqueModel.Setusuario(const Value: string);
begin
  Fusuario := Value;
end;

end{ TMovimentacaoEstoqueModel }


.
