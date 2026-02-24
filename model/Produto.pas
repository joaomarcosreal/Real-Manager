unit Produto;

interface

uses
  Grupo, Aliquota, FireDAC.Comp.Client;

type
  TProduto = class
  private
    FDescricao: string;
    FCodigo: string;
    FCodigoBarras: string;
    FPreco: double;
    FDataCadastro: TDate;
    FFoto: string;
    FGrupo: TGrupo;
    FAliquota: TAliquota;
    FUnidadeNFE: string;
    FCodImpressoraProducao: string;
    FQuantidadeCalculada: boolean;
    FRequerObservacao: boolean;
    FVende: boolean;
    FCompra: Boolean;
    FSubproduto: boolean;
    procedure SetCodigo(const Value: string);
    procedure SetCodigoBarras(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetPreco(const Value: double);
    procedure SetDataCadastro(const Value: TDate);
    procedure SetFoto(const Value: string);
    procedure SetGrupo(const Value: TGrupo);
    procedure SetAliquota(const Value: TAliquota);
    procedure SetUnidadeNFE(const Value: string);
    procedure SetCodImpressoraProducao(const Value: string);
    procedure SetQuantidadeCalculada(const Value: boolean);
    procedure SetRequerObservacao(const Value: boolean);
    procedure SetCompra(const Value: Boolean);
    procedure SetVende(const Value: boolean);
    procedure SetSubproduto(const Value: boolean);

  published
    property Codigo: string read FCodigo write SetCodigo;
    property CodigoBarras: string read FCodigoBarras write SetCodigoBarras;
    property Grupo: TGrupo read FGrupo write SetGrupo;

    property Descricao: string read FDescricao write SetDescricao;
    property Preco: double read FPreco write SetPreco;
    property DataCadastro: TDate read FDataCadastro write SetDataCadastro;
    property Foto: string read FFoto write SetFoto;
    property Aliquota: TAliquota read FAliquota write SetAliquota;
    property UnidadeNFE: string read FUnidadeNFE write SetUnidadeNFE;
    property CodImpressoraProducao: string read FCodImpressoraProducao write SetCodImpressoraProducao;
    property QuantidadeCalculada: boolean read FQuantidadeCalculada write SetQuantidadeCalculada;
    property RequerObservacao : boolean read FRequerObservacao write SetRequerObservacao;
    property Compra : Boolean read FCompra write SetCompra;
    property Vende : boolean read FVende write SetVende;
    property Subproduto : boolean read FSubproduto write SetSubproduto;
  end;

implementation

{ TProduto }

procedure TProduto.SetAliquota(const Value: TAliquota);
begin
  FAliquota := Value;
end;

procedure TProduto.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TProduto.SetCodigoBarras(const Value: string);
begin
  FCodigoBarras := Value;
end;

procedure TProduto.SetCodImpressoraProducao(const Value: string);
begin
  FCodImpressoraProducao := Value;
end;

procedure TProduto.SetCompra(const Value: Boolean);
begin
  FCompra := Value;
end;

procedure TProduto.SetDataCadastro(const Value: TDate);
begin
  FDataCadastro := Value;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.SetFoto(const Value: string);
begin
  FFoto := Value;
end;

procedure TProduto.SetGrupo(const Value: TGrupo);
begin
  FGrupo := Value;
end;

procedure TProduto.SetPreco(const Value: double);
begin
  FPreco := Value;
end;

procedure TProduto.SetQuantidadeCalculada(const Value: boolean);
begin
  FQuantidadeCalculada := Value;
end;

procedure TProduto.SetRequerObservacao(const Value: boolean);
begin
  FRequerObservacao := Value;
end;

procedure TProduto.SetSubproduto(const Value: boolean);
begin
  FSubproduto := Value;
end;

procedure TProduto.SetUnidadeNFE(const Value: string);
begin
  FUnidadeNFE := Value;
end;

procedure TProduto.SetVende(const Value: boolean);
begin
  FVende := Value;
end;

end.

