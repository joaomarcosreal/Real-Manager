unit URealDatasets;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Option, Data.DB, URequisicaoAPI,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TRealConnection = class(TFDConnection)
  private
    FRest: TDadosRequisicao;
    procedure SetRest(const Value: TDadosRequisicao);
  published
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    property Rest: TDadosRequisicao read FRest write SetRest;
  end;

  TRealTransaction = class(TFDTransaction)
  private
  published
    constructor Create(AOwner: TComponent); override;
  end;

  TRealQuery = class(TFDQuery)
  published
    procedure setTransaction(ATransaction: TRealTransaction);
  end;

  TRealDataset = class(TDataSet)
  end;

  TRealMemTable = class(TFDMemTable)
  end;

implementation



{ TRealQuery }

procedure TRealQuery.setTransaction(ATransaction: TRealTransaction);
begin
  Transaction := ATransaction;
end;

{ TRealTransaction }

constructor TRealTransaction.Create(AOwner: TComponent);
begin
  inherited;
  Self.Options.AutoCommit := false;
end;



{ TRealConnection }

constructor TRealConnection.Create(AOwner: TComponent);
begin
  inherited;

  Rest := TDadosRequisicao.Create;
  Transaction := TRealTransaction.Create(nil);

end;

destructor TRealConnection.Destroy;
begin
  inherited;
  Transaction.free;
  Rest.Free;

end;

procedure TRealConnection.SetRest(const Value: TDadosRequisicao);
begin
  FRest := Value;
end;

end.

