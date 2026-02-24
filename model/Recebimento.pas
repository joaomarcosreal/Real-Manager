unit Recebimento;

interface

uses
  FormaPagamento, System.SysUtils;

type
  TRecebimento = class
  private
    FcodigoUsuario: string;
    FFormaPagamento: TFormaPagamento;
    FCodigoVenda: string;
    Fid: longint;
    FAutorizacao: string;
    FCodigoCliente: string;
    FNSU: string;
    FBandeira: string;
    FCodigoCaixa: string;
    FIdConfiguracaoPagamento: smallint;
    FData: TDate;
    FNomeRedeAdquirente: string;
    FCodigoEmpresa: string;
    FNumeroCaixa: string;
    FComprovanteCliente: string;
    FObservacoesFaturamento: string;
    FDataVencimento: TDate;
    FComprovanteEstabelecimento: string;
    FValor: Double;
    procedure SetAutorizacao(const Value: string);
    procedure SetCodigoCaixa(const Value: string);
    procedure SetCodigoCliente(const Value: string);
    procedure SetCodigoEmpresa(const Value: string);
    procedure SetcodigoUsuario(const Value: string);
    procedure SetCodigoVenda(const Value: string);
    procedure SetData(const Value: TDate);
    procedure SetFormaPagamento(const Value: TFormaPagamento);
    procedure Setid(const Value: longint);
    procedure SetIdConfiguracaoPagamento(const Value: smallint);
    procedure SetNomeRedeAdquirente(const Value: string);
    procedure SetNSU(const Value: string);
    procedure SetNumeroCaixa(const Value: string);
    procedure SetComprovanteCliente(const Value: string);
    procedure SetComprovanteEstabelecimento(const Value: string);
    procedure SetDataVencimento(const Value: TDate);
    procedure SetObservacoesFaturamento(const Value: string);
    procedure SetValor(const Value: Double);
    procedure SetBandeira(const Value: string);
  published
    property id: longint read Fid write Setid;
    property Valor: Double read FValor write SetValor;
    property CodigoVenda: string read FCodigoVenda write SetCodigoVenda;
    property FormaPagamento: TFormaPagamento read FFormaPagamento write SetFormaPagamento;
    property codigoUsuario: string read FcodigoUsuario write SetcodigoUsuario;
    property Data: TDate read FData write SetData;
    property NumeroCaixa: string read FNumeroCaixa write SetNumeroCaixa;
    property CodigoCaixa: string read FCodigoCaixa write SetCodigoCaixa;
    property CodigoCliente: string read FCodigoCliente write SetCodigoCliente;
    property CodigoEmpresa: string read FCodigoEmpresa write SetCodigoEmpresa;
    property NSU: string read FNSU write SetNSU;
    property Bandeira: string read FBandeira write SetBandeira;
    property Autorizacao: string read FAutorizacao write SetAutorizacao;
    property NomeRedeAdquirente: string read FNomeRedeAdquirente write SetNomeRedeAdquirente;
    property IdConfiguracaoPagamento: smallint read FIdConfiguracaoPagamento write SetIdConfiguracaoPagamento;
    property DataVencimento: TDate read FDataVencimento write SetDataVencimento;
    property ObservacoesFaturamento: string read FObservacoesFaturamento write SetObservacoesFaturamento;
    property ComprovanteEstabelecimento: string read FComprovanteEstabelecimento write SetComprovanteEstabelecimento;
    property ComprovanteCliente: string read FComprovanteCliente write SetComprovanteCliente;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TRecebimento }

constructor TRecebimento.Create();
begin
  FFormaPagamento := TFormaPagamento.Create;

end;

destructor TRecebimento.Destroy();
begin
  FreeAndNil(FFormaPagamento);
end;

procedure TRecebimento.SetAutorizacao(const Value: string);
begin
  FAutorizacao := Value;
end;

procedure TRecebimento.SetCodigoCaixa(const Value: string);
begin
  FCodigoCaixa := Value;
end;

procedure TRecebimento.SetCodigoCliente(const Value: string);
begin
  FCodigoCliente := Value;
end;

procedure TRecebimento.SetCodigoEmpresa(const Value: string);
begin
  FCodigoEmpresa := Value;
end;

procedure TRecebimento.SetcodigoUsuario(const Value: string);
begin
  FcodigoUsuario := Value;
end;

procedure TRecebimento.SetCodigoVenda(const Value: string);
begin
  FCodigoVenda := Value;
end;

procedure TRecebimento.SetComprovanteCliente(const Value: string);
begin
  FComprovanteCliente := Value;
end;

procedure TRecebimento.SetComprovanteEstabelecimento(const Value: string);
begin
  FComprovanteEstabelecimento := Value;
end;

procedure TRecebimento.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TRecebimento.SetDataVencimento(const Value: TDate);
begin
  FDataVencimento := Value;
end;

procedure TRecebimento.SetFormaPagamento(const Value: TFormaPagamento);
begin
  FFormaPagamento := Value;
end;

procedure TRecebimento.Setid(const Value: longint);
begin
  Fid := Value;
end;

procedure TRecebimento.SetIdConfiguracaoPagamento(const Value: smallint);
begin
  FIdConfiguracaoPagamento := Value;
end;

procedure TRecebimento.SetNomeRedeAdquirente(const Value: string);
begin
  FNomeRedeAdquirente := Value;
end;

procedure TRecebimento.SetNSU(const Value: string);
begin
  FNSU := Value;
end;

procedure TRecebimento.SetBandeira(const Value: string);
begin
  FBandeira := Value;
end;

procedure TRecebimento.SetNumeroCaixa(const Value: string);
begin
  FNumeroCaixa := Value;
end;

procedure TRecebimento.SetObservacoesFaturamento(const Value: string);
begin
  FObservacoesFaturamento := Value;
end;

procedure TRecebimento.SetValor(const Value: Double);
begin
  FValor := Value;
end;

end.

