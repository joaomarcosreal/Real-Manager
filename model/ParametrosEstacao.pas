unit ParametrosEstacao;

interface

uses
  ConfiguracoesNFCE;

type
  TParametrosEstacao = class
  private
    FMesaBalcao: string;
    FMesaDelivery: string;
    FCodigoGarconBalcao: string;
    FCabecalhoPedidoBalcao: string;
    FNFCEProducao: TConfiguracoesNFCE;
    FCodigoGarconDelivery: string;
    FNumeroCaixa: string;
    procedure SetCabecalhoPedidoBalcao(const Value: string);
    procedure SetCodigoGarconBalcao(const Value: string);
    procedure SetCodigoGarconDelivery(const Value: string);
    procedure SetMesaBalcao(const Value: string);
    procedure SetMesaDelivery(const Value: string);
    procedure SetNFCEProducao(const Value: TConfiguracoesNFCE);
    procedure SetNumeroCaixa(const Value: string);
  published
    property NumeroCaixa: string read FNumeroCaixa write SetNumeroCaixa;
    property MesaBalcao: string read FMesaBalcao write SetMesaBalcao;
    property MesaDelivery: string read FMesaDelivery write SetMesaDelivery;
    property CodigoGarconBalcao: string read FCodigoGarconBalcao write SetCodigoGarconBalcao;
    property CodigoGarconDelivery: string read FCodigoGarconDelivery write SetCodigoGarconDelivery;
    property NFCEProducao: TConfiguracoesNFCE read FNFCEProducao write SetNFCEProducao;
    property CabecalhoPedidoBalcao : string read FCabecalhoPedidoBalcao write SetCabecalhoPedidoBalcao;


  end;

implementation

{ TParametrosEstacao }

procedure TParametrosEstacao.SetCabecalhoPedidoBalcao(const Value: string);
begin
  FCabecalhoPedidoBalcao := Value;
end;

procedure TParametrosEstacao.SetCodigoGarconBalcao(const Value: string);
begin
  FCodigoGarconBalcao := Value;
end;

procedure TParametrosEstacao.SetCodigoGarconDelivery(const Value: string);
begin
  FCodigoGarconDelivery := Value;
end;

procedure TParametrosEstacao.SetMesaBalcao(const Value: string);
begin
  FMesaBalcao := Value;
end;

procedure TParametrosEstacao.SetMesaDelivery(const Value: string);
begin
  FMesaDelivery := Value;
end;

procedure TParametrosEstacao.SetNFCEProducao(const Value: TConfiguracoesNFCE);
begin
  FNFCEProducao := Value;
end;

procedure TParametrosEstacao.SetNumeroCaixa(const Value: string);
begin
  FNumeroCaixa := Value;
end;

end.

