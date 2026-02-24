unit FormaPagamento;

interface

type
  TFormaPagamento = class
  private
    FTipoPagtoNFE: string;
    FDescricao: string;
    FCodForma: string;
    FContaCredito: string;
    FCaminhoImagem: string;
    FPermiteTroco: Boolean;
    FDesativada: Boolean;
    FFaturado: Boolean;
    FisTEF: Boolean;
    FTipoOperacaoTEF: Smallint;
    FQtdeAdquirentes: Smallint;
    procedure SetCaminhoImagem(const Value: string);
    procedure SetCodForma(const Value: string);
    procedure SetContaCredito(const Value: string);
    procedure SetDesativada(const Value: Boolean);
    procedure SetDescricao(const Value: string);
    procedure SetPermiteTroco(const Value: Boolean);

    procedure SetTipoPagtoNFE(const Value: string);
    procedure SetFaturado(const Value: Boolean);
    procedure SetisTEF(const Value: Boolean);
    procedure SetTipoOperacaoTEF(const Value: Smallint);
    procedure SetQtdeAdquirentes(const Value: Smallint);
  published
    property CodForma: string read FCodForma write SetCodForma;
    property Descricao: string read FDescricao write SetDescricao;
    property PermiteTroco: Boolean read FPermiteTroco write SetPermiteTroco;
    property TipoPagtoNFE: string read FTipoPagtoNFE write SetTipoPagtoNFE;
    property CaminhoImagem: string read FCaminhoImagem write SetCaminhoImagem;

    property Desativada: Boolean read FDesativada write SetDesativada;
    property ContaCredito: string read FContaCredito write SetContaCredito;
    property Faturado : Boolean read FFaturado write SetFaturado;
    property isTEF : Boolean read FisTEF write SetisTEF;
    property TipoOperacaoTEF : Smallint read FTipoOperacaoTEF write SetTipoOperacaoTEF;
    property QtdeAdquirentes : Smallint read FQtdeAdquirentes write SetQtdeAdquirentes;
  end;

implementation

{ TFormaPagamento }

procedure TFormaPagamento.SetCaminhoImagem(const Value: string);
begin
  FCaminhoImagem := Value;
end;

procedure TFormaPagamento.SetCodForma(const Value: string);
begin
  FCodForma := Value;
end;

procedure TFormaPagamento.SetContaCredito(const Value: string);
begin
  FContaCredito := Value;
end;

procedure TFormaPagamento.SetDesativada(const Value: Boolean);
begin
  FDesativada := Value;
end;

procedure TFormaPagamento.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TFormaPagamento.SetFaturado(const Value: Boolean);
begin
  FFaturado := Value;
end;

procedure TFormaPagamento.SetisTEF(const Value: Boolean);
begin
  FisTEF := Value;
end;

procedure TFormaPagamento.SetPermiteTroco(const Value: Boolean);
begin
  FPermiteTroco := Value;
end;




procedure TFormaPagamento.SetQtdeAdquirentes(const Value: Smallint);
begin
  FQtdeAdquirentes := Value;
end;

procedure TFormaPagamento.SetTipoOperacaoTEF(const Value: Smallint);
begin
  FTipoOperacaoTEF := Value;
end;

procedure TFormaPagamento.SetTipoPagtoNFE(const Value: string);
begin
  FTipoPagtoNFE := Value;
end;

end.

