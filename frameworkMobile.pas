unit frameworkMobile;

interface

uses
  System.Generics.Collections, Classes, System.SysUtils;

type
  TPlataformaPedidos = class
  private
    FCodTabelaPreco: integer;
    Fid: integer;
    FNome: string;
    procedure SetCodTabelaPreco(const Value: integer);
    procedure Setid(const Value: integer);
    procedure SetNome(const Value: string);
  published
    property id: integer read Fid write Setid;
    property Nome: string read FNome write SetNome;
    property CodTabelaPreco: integer read FCodTabelaPreco write SetCodTabelaPreco;
  end;



  TFormaPagtoPlataforma = class
  private
    Fdescricao: string;
    FcodigoPDV: string;
    Fid: LongInt;
    FCodigoPlataforma: integer;
    FidFormaPagtoPlataforma: string;
    Fnome: string;
    Fvalor: double;
    Fautorizacao: string;
    Ftransacao: string;
    FprePaga: boolean;
    FidPedido: longint;
    procedure SetcodigoPDV(const Value: string);
    procedure SetCodigoPlataforma(const Value: integer);
    procedure Setdescricao(const Value: string);
    procedure Setid(const Value: longInt);
    procedure SetidFormaPagtoPlataforma(const Value: string);
    procedure Setnome(const Value: string);
    procedure Setautorizacao(const Value: string);
    procedure Settransacao(const Value: string);
    procedure Setvalor(const Value: double);
    procedure SetprePaga(const Value: boolean);
    procedure SetidPedido(const Value: longint);
  published
    property id: longInt read Fid write Setid;
    property idPedido: longint read FidPedido write SetidPedido;
    property CodigoPlataforma: integer read FCodigoPlataforma write SetCodigoPlataforma;
    property idFormaPagtoPlataforma: string read FidFormaPagtoPlataforma write SetidFormaPagtoPlataforma;
    property descricao: string read Fdescricao write Setdescricao;
    property nome: string read Fnome write Setnome;
    property valor: double read Fvalor write Setvalor;
    property autorizacao: string read Fautorizacao write Setautorizacao;
    property transacao: string read Ftransacao write Settransacao;
    property prePaga: boolean read FprePaga write SetprePaga;
    property codigoPDV: string read FcodigoPDV write SetcodigoPDV;

  end;

  TClientePlataforma = class
  private
    FQtdPedidos: integer;
    FIDMerchant: integer;
    FID: LongInt;
    FNome: string;
    FcodPlataforma: integer;
    FIDClientePlataforma: string;
    FIDNumericoPlataforma: LongInt;
    Ftelefone: string;
    procedure SetcodPlataforma(const Value: integer);
    procedure SetID(const Value: LongInt);
    procedure SetIDClientePlataforma(const Value: string);
    procedure SetIDMerchant(const Value: integer);
    procedure SetNome(const Value: string);
    procedure SetQtdPedidos(const Value: integer);
    procedure SetIDNumericoPlataforma(const Value: LongInt);
    procedure Settelefone(const Value: string);
  published
    property ID: LongInt read FID write SetID;
    property codPlataforma: integer read FcodPlataforma write SetcodPlataforma;
    property IDClientePlataforma: string read FIDClientePlataforma write SetIDClientePlataforma;
    property IDNumericoPlataforma: LongInt read FIDNumericoPlataforma write SetIDNumericoPlataforma;
    property IDMerchant: integer read FIDMerchant write SetIDMerchant;
    property Nome: string read FNome write SetNome;
    property telefone: string read Ftelefone write Settelefone;
    property QtdPedidos: integer read FQtdPedidos write SetQtdPedidos;
  end;

  TEnderecoPlataforma = class
  private
    FIdLogradouro: longint;
    FCEP: string;
    FID: longint;
    Fnumero: string;
    FidCliente: longInt;
    FEndereco: string;
    FCodPlataforma: integer;
    FLatitude: double;
    FLongitude: double;
    procedure SetCEP(const Value: string);
    procedure SetCodPlataforma(const Value: integer);
    procedure SetEndereco(const Value: string);
    procedure SetID(const Value: longint);
    procedure SetidCliente(const Value: longInt);
    procedure SetIdLogradouro(const Value: longint);
    procedure Setnumero(const Value: string);
    procedure SetLatitude(const Value: double);
    procedure SetLongitude(const Value: double);
  published
    property ID: longint read FID write SetID;
    property idCliente: longInt read FidCliente write SetidCliente;
    property CodPlataforma: integer read FCodPlataforma write SetCodPlataforma;
    property Endereco: string read FEndereco write SetEndereco;
    property numero: string read Fnumero write Setnumero;
    property CEP: string read FCEP write SetCEP;
    property IdLogradouro: longint read FIdLogradouro write SetIdLogradouro;
    property Latitude: double read FLatitude write SetLatitude;
    property Longitude: double read FLongitude write SetLongitude;
  end;

  TItemPedidoPlataforma = class
  private
    FCodProdutoSistema: string;
    Fpreco: double;
    Ftotal: double;
    Fquantidade: double;
    FNome: string;
    Fobservacoes: string;
    procedure SetCodProdutoSistema(const Value: string);
    procedure SetNome(const Value: string);
    procedure Setobservacoes(const Value: string);
    procedure Setpreco(const Value: double);
    procedure Setquantidade(const Value: double);
    procedure Settotal(const Value: double);
  published
    property CodProdutoSistema: string read FCodProdutoSistema write SetCodProdutoSistema;
    property Nome: string read FNome write SetNome;
    property quantidade: double read Fquantidade write Setquantidade;
    property preco: double read Fpreco write Setpreco;
    property total: double read Ftotal write Settotal;
    property observacoes: string read Fobservacoes write Setobservacoes;


  end;




  TSaborPizzaPlataforma = class
  private

    FcodProduto: string;
    FcodSabor: string;
    Fproporcao: string;
    FvalorUnitario: Currency;
    FDescricao: string;
    FQuantidade: Double;
    procedure SetcodProduto(const Value: string);
    procedure SetcodSabor(const Value: string);
    procedure Setproporcao(const Value: string);

    procedure SetvalorUnitario(const Value: Currency);
    procedure SetDescricao(const Value: string);
    procedure SetQuantidade(const Value: Double);
    published
     property codSabor : string read FcodSabor write SetcodSabor;
     property codProduto : string read FcodProduto write SetcodProduto;
     property Descricao : string read FDescricao write SetDescricao;
     property Quantidade : Double read FQuantidade write SetQuantidade;

     property valorUnitario : Currency read FvalorUnitario write SetvalorUnitario;
     property proporcao : string read Fproporcao write Setproporcao;
  end;

  TProdutoPlataforma = class
  private
    FExternalID: string;
    FDescricao: string;
    FCodigoPDV: string;
    FID_categoria: LongInt;
    FIDProdutoPlataforma: string;
    FNome: string;
    FtotalSubProdutos: double;
    Facrescimo: double;
    Fdesconto: double;
    Ftotal: double;
    FQuantidade: double;
    Fpreco: double;
    FIDProdutoPai: LongInt;
    FObservacaoPreparo: string;
    FmerchantId: integer;
    Fdisponibilidade: boolean;
    Fordem: integer;
    FcodigoPlataforma: integer;
    FidItemPai: integer;
    FnomeGrupo: string;
    FidCadastroItemPrincipal: integer;
    Fpizza: Boolean;
    FTamanhoPizza: string;
    FSaboresPizza: TObjectList<TSaborPizzaPlataforma>;
    FsaboresPizzaDescricao: string;
    procedure SetCodigoPDV(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetExternalID(const Value: string);
    procedure SetID_categoria(const Value: LongInt);
    procedure SetIDProdutoPlataforma(const Value: string);
    procedure SetNome(const Value: string);
    procedure Setacrescimo(const Value: double);
    procedure Setdesconto(const Value: double);
    procedure SetQuantidade(const Value: double);
    procedure Settotal(const Value: double);
    procedure SettotalSubProdutos(const Value: double);
    procedure Setpreco(const Value: double);
    procedure SetIDProdutoPai(const Value: LongInt);
    procedure SetObservacaoPreparo(const Value: string);
    procedure SetmerchantId(const Value: integer);
    procedure Setdisponibilidade(const Value: boolean);
    procedure Setordem(const Value: integer);
    procedure SetcodigoPlataforma(const Value: integer);
    procedure SetnomeGrupo(const Value: string);
    procedure SetidCadastroItemPrincipal(const Value: integer);
    procedure Setpizza(const Value: Boolean);
    procedure SetTamanhoPizza(const Value: string);
    procedure SetSaboresPizza(const Value: TObjectList<TSaborPizzaPlataforma>);
    procedure destroiSaboresDePizza;
    procedure SetsaboresPizzaDescricao(const Value: string);
  published
    property IDProdutoPlataforma: string read FIDProdutoPlataforma write SetIDProdutoPlataforma;
    property Nome: string read FNome write SetNome;
    property Descricao: string read FDescricao write SetDescricao;
    property CodigoPDV: string read FCodigoPDV write SetCodigoPDV;
    property ExternalID: string read FExternalID write SetExternalID;
    property ID_categoria: LongInt read FID_categoria write SetID_categoria;
    property Quantidade: double read FQuantidade write SetQuantidade;
    property preco: double read Fpreco write Setpreco;
    property total: double read Ftotal write Settotal;
    property totalSubProdutos: double read FtotalSubProdutos write SettotalSubProdutos;
    property desconto: double read Fdesconto write Setdesconto;
    property acrescimo: double read Facrescimo write Setacrescimo;
    property IDProdutoPai: LongInt read FIDProdutoPai write SetIDProdutoPai;
    property ObservacaoPreparo: string read FObservacaoPreparo write SetObservacaoPreparo;
    property saboresPizzaDescricao : string read FsaboresPizzaDescricao write SetsaboresPizzaDescricao;
    property merchantId: integer read FmerchantId write SetmerchantId;
    property disponibilidade: boolean read Fdisponibilidade write Setdisponibilidade;
    property ordem: integer read Fordem write Setordem;
    property codigoPlataforma: integer read FcodigoPlataforma write SetcodigoPlataforma;
    property nomeGrupo: string read FnomeGrupo write SetnomeGrupo;
    property idCadastroItemPrincipal: integer read FidCadastroItemPrincipal write SetidCadastroItemPrincipal;
    property pizza: Boolean read Fpizza write Setpizza;
    property TamanhoPizza: string read FTamanhoPizza write SetTamanhoPizza;
    property SaboresPizza : TObjectList<TSaborPizzaPlataforma> read FSaboresPizza write SetSaboresPizza;

    public
    constructor Create;
    destructor  Destroy; override;



  end;

  TPedidoPlataforma = class
  private
    FNomeBairroSistema: string;
    FbairroIntegrado: boolean;
    FNomeClienteSistema: string;
    FidPedido: LongInt;
    FclienteIntegrado: boolean;
    FcodClienteSistema: integer;
    FStatusIntegracaoAtual: integer;
    FidClientePlataforma: integer;
    FCodBairroSistema: integer;
    Fcancelado: boolean;
    Fconfirmado: boolean;
    Fintegrado: boolean;
    FqtdPedidosCliente: integer;
    Fcliente: TClientePlataforma;
    FEndereco: TEnderecoPlataforma;
    FComplemento: string;

    FProdutos: TObjectList<TProdutoPlataforma>;
    FDesconto: double;
    FTaxaDeEntrega: double;
    Fsubtotal: double;
    FTotal: double;

    FPagamentos: TObjectList<TFormaPagtoPlataforma>;
    FPlataforma: TPlataformaPedidos;
    FretirarNoLocal: Boolean;
    FCPFCliente: string;
    FidPedidoPlataforma: string;
    FResponsavelEntrega: boolean;
    FTaxaServico: Double;
    FLocalizador: string;
    FValorPagamentoPendente: double;
    procedure SetbairroIntegrado(const Value: boolean);
    procedure SetclienteIntegrado(const Value: boolean);
    procedure SetcodClienteSistema(const Value: integer);
    procedure SetidClientePlataforma(const Value: integer);
    procedure SetidPedido(const Value: LongInt);
    procedure SetNomeBairroSistema(const Value: string);
    procedure SetNomeClienteSistema(const Value: string);
    procedure SetStatusIntegracaoAtual(const Value: integer);
    procedure SetCodBairroSistema(const Value: integer);
    procedure Setcancelado(const Value: boolean);
    procedure Setconfirmado(const Value: boolean);
    procedure Setintegrado(const Value: boolean);
    procedure SetqtdPedidosCliente(const Value: integer);
    procedure Setcliente(const Value: TClientePlataforma);
    procedure SetEndereco(const Value: TEnderecoPlataforma);
    procedure SetComplemento(const Value: string);

    procedure SetProdutos(const Value: TObjectList<TProdutoPlataforma>);
    procedure SetDesconto(const Value: double);
    procedure Setsubtotal(const Value: double);
    procedure SetTaxaDeEntrega(const Value: double);
    procedure SetTotal(const Value: double);

    procedure SetPagamentos(const Value: TObjectList<TFormaPagtoPlataforma>);
    procedure SetPlataforma(const Value: TPlataformaPedidos);
    procedure SetretirarNoLocal(const Value: Boolean);
    procedure SetCPFCliente(const Value: string);
    procedure SetidPedidoPlataforma(const Value: string);
    procedure SetResponsavelEntrega(const Value: boolean);
    procedure SetTaxaServico(const Value: Double);
    procedure SetLocalizador(const Value: string);
    procedure SetValorPagamentoPendente(const Value: double);
  published
    property idPedido: LongInt read FidPedido write SetidPedido;
    property idPedidoPlataforma : string read FidPedidoPlataforma write SetidPedidoPlataforma;
    property Localizador : string read FLocalizador write SetLocalizador;

    property idClientePlataforma: integer read FidClientePlataforma write SetidClientePlataforma;
    property subtotal: double read Fsubtotal write Setsubtotal;
    property TaxaDeEntrega: double read FTaxaDeEntrega write SetTaxaDeEntrega;
    property TaxaServico : Double read FTaxaServico write SetTaxaServico;
    property retirarNoLocal: Boolean read FretirarNoLocal write SetretirarNoLocal;
    property Desconto: double read FDesconto write SetDesconto;
    property Total: double read FTotal write SetTotal;
    property StatusIntegracaoAtual: integer read FStatusIntegracaoAtual write SetStatusIntegracaoAtual;
    property codClienteSistema: integer read FcodClienteSistema write SetcodClienteSistema;
    property NomeClienteSistema: string read FNomeClienteSistema write SetNomeClienteSistema;
    property CodBairroSistema: integer read FCodBairroSistema write SetCodBairroSistema;
    property NomeBairroSistema: string read FNomeBairroSistema write SetNomeBairroSistema;
    property Complemento: string read FComplemento write SetComplemento;
    property cliente: TClientePlataforma read Fcliente write Setcliente;
    property Endereco: TEnderecoPlataforma read FEndereco write SetEndereco;
    property bairroIntegrado: boolean read FbairroIntegrado write SetbairroIntegrado;
    property clienteIntegrado: boolean read FclienteIntegrado write SetclienteIntegrado;
    property confirmado: boolean read Fconfirmado write Setconfirmado;
    property cancelado: boolean read Fcancelado write Setcancelado;
    property integrado: boolean read Fintegrado write Setintegrado;
    property Produtos: TObjectList<TProdutoPlataforma > read FProdutos write SetProdutos;
    property Pagamentos: TObjectList<TFormaPagtoPlataforma> read FPagamentos write SetPagamentos;
    property Plataforma: TPlataformaPedidos read FPlataforma write SetPlataforma;
    property CPFCliente : string read FCPFCliente write SetCPFCliente;
    property ResponsavelEntrega : boolean read FResponsavelEntrega write SetResponsavelEntrega;
    property ValorPagamentoPendente : double read FValorPagamentoPendente write SetValorPagamentoPendente;

  public
    constructor create;
    destructor destroy; override;
    procedure destroiListaDeProdutos;
    procedure destroiListaDePagamentos;
    procedure criaListaDeProdutos;
    procedure criaListaDePagamentos();
  end;


  TCategoriaPlataforma = class
  private
    FidCategoriaPlataforma: string;
    Fid: longint;
    FcodigoPlataforma: integer;
    Fnome: string;
    Fordem: integer;
    Fdisponibilidade: boolean;
    FmerchantId: integer;
    procedure SetcodigoPlataforma(const Value: integer);
    procedure Setid(const Value: longint);
    procedure SetidCategoriaPlataforma(const Value: string);
    procedure Setnome(const Value: string);
    procedure Setordem(const Value: integer);
    procedure Setdisponibilidade(const Value: boolean);
    procedure SetmerchantID(const Value: integer);
  published
    property id: longint read Fid write Setid;
    property codigoPlataforma: integer read FcodigoPlataforma write SetcodigoPlataforma;
    property idCategoriaPlataforma: string read FidCategoriaPlataforma write SetidCategoriaPlataforma;
    property nome: string read Fnome write Setnome;
    property disponibilidade: boolean read Fdisponibilidade write Setdisponibilidade;
    property ordem: integer read Fordem write Setordem;
    property merchantID: integer read FmerchantID write SetmerchantID;
  end;

  TProduto = class
  private
    FtamanhoPizza: string;
    Fpizza: Boolean;
    Fcodigo: string;
    FvalorUnitario: Double;
    FcodBarras: string;
    FcodMiniPrinter: string;
    FcodGrupoTouch: string;
    Fbalanca: boolean;
    Ffracionado: boolean;
    Fdescricao: string;
    procedure SetcodBarras(const Value: string);
    procedure Setcodigo(const Value: string);
    procedure SetcodMiniPrinter(const Value: string);
    procedure Setpizza(const Value: Boolean);
    procedure SettamanhoPizza(const Value: string);
    procedure SetvalorUnitario(const Value: Double);
    procedure SetcodGrupoTouch(const Value: string);
    procedure Setbalanca(const Value: boolean);
    procedure Setfracionado(const Value: boolean);
    procedure Setdescricao(const Value: string);
  published
    property codigo: string read Fcodigo write Setcodigo;
    property codBarras: string read FcodBarras write SetcodBarras;
    property descricao: string read Fdescricao write Setdescricao;
    property codGrupoTouch: string read FcodGrupoTouch write SetcodGrupoTouch;
    property balanca: boolean read Fbalanca write Setbalanca;
    property fracionado: boolean read Ffracionado write Setfracionado;
    property valorUnitario: Double read FvalorUnitario write SetvalorUnitario;
    property pizza: Boolean read Fpizza write Setpizza;
    property tamanhoPizza: string read FtamanhoPizza write SettamanhoPizza;
    property codMiniPrinter: string read FcodMiniPrinter write SetcodMiniPrinter;
    procedure Clone(aObject: TObject);
  public
    constructor Create();
  end;

  TItemPedido = class
  private
    Fproduto: TProduto;
    Fobs: string;
    FsaboresPizza: string;
    Fquantidade: Double;
    FguidProduto: string;
    Fid: integer;
    procedure SetFid(const Value: integer);
    procedure SetguidProduto(const Value: string);
    procedure Setobs(const Value: string);
    procedure Setquantidade(const Value: Double);
    procedure SetsaboresPizza(const Value: string);
    procedure Setproduto(const Value: TProduto);
    procedure Setid(const Value: integer);
  published
    property id: integer read Fid write Setid;
    property produto: TProduto read Fproduto write Setproduto;
    property guidProduto: string read FguidProduto write SetguidProduto;
    property quantidade: Double read Fquantidade write Setquantidade;
    property obs: string read Fobs write Setobs;
    property saboresPizza: string read FsaboresPizza write SetsaboresPizza;
  end;

  TPedido = class
  private
    FprodutosPedido: TObjectList<TItemPedido>;
    FidItem: integer;
    Fmesa: string;
    Fgarcon: string;
    Fterminal: string;
    FguidPedido: string;
    FresultadoPedido: string;
    procedure SetprodutosPedido(const Value: TObjectList<TItemPedido>);
    procedure SetidItem(const Value: integer);
    procedure Setmesa(const Value: string);
    procedure Setgarcon(const Value: string);
    procedure Setterminal(const Value: string);
    procedure SetguidPedido(const Value: string);
    procedure SetresultadoPedido(const Value: string);
  published
    property idItem: integer read FidItem write SetidItem;
    property produtosPedido: TObjectList<TItemPedido> read FprodutosPedido write SetprodutosPedido;
    procedure addItem(AItem: TItemPedido);
    property mesa: string read Fmesa write Setmesa;
    property garcon: string read Fgarcon write Setgarcon;
    property terminal: string read Fterminal write Setterminal;
    property guidPedido: string read FguidPedido write SetguidPedido;
    property resultadoPedido: string read FresultadoPedido write SetresultadoPedido;
  end;

  TSaborPizza = class
  private
    Fproduto: TProduto;
    FindiceQuantidade: smallint;
    Fdescricao: string;
    Fid: smallint;
    Fquantidade: extended;
    Fproporcao: string;
    Fcodigo: string;
    Fselecionado: boolean;
    Fcor: integer;
    FPBalcao: string;
    FMBalcao: string;
    FBBalcao: string;
    FFBalcao: string;
    FGBalcao: string;
    procedure Setdescricao(const Value: string);
    procedure Setid(const Value: smallint);
    procedure SetindiceQuantidade(const Value: smallint);
    procedure Setproduto(const Value: TProduto);
    procedure Setproporcao(const Value: string);
    procedure Setquantidade(const Value: extended);
    procedure Setcodigo(const Value: string);
    procedure Setselecionado(const Value: boolean);
    procedure Setcor(const Value: integer);
    procedure SetBBalcao(const Value: string);
    procedure SetFBalcao(const Value: string);
    procedure SetGBalcao(const Value: string);
    procedure SetMBalcao(const Value: string);
    procedure SetPBalcao(const Value: string);
  published
    property id: smallint read Fid write Setid;
    property codigo: string read Fcodigo write Setcodigo;
    property descricao: string read Fdescricao write Setdescricao;
    property proporcao: string read Fproporcao write Setproporcao;
    property quantidade: extended read Fquantidade write Setquantidade;
    property indiceQuantidade: smallint read FindiceQuantidade write SetindiceQuantidade;
    property produto: TProduto read Fproduto write Setproduto;
    property selecionado: boolean read Fselecionado write Setselecionado;
    property cor: integer read Fcor write Setcor;
    property BBalcao: string read FBBalcao write SetBBalcao;
    property PBalcao: string read FPBalcao write SetPBalcao;
    property MBalcao: string read FMBalcao write SetMBalcao;
    property GBalcao: string read FGBalcao write SetGBalcao;
    property FBalcao: string read FFBalcao write SetFBalcao;
    constructor Create();
    procedure Clone(aObject: TObject);
  end;

  TListaSabores = class
  private
    var
      FSaboresSelecionados: TObjectList<TSaborPizza>;
      FproximoID: integer;
    procedure SetSaboresSelecionados(const Value: TObjectList<TSaborPizza>);
    procedure SetproximoID(const Value: integer);
  public
  published
    property SaboresSelecionados: TObjectList<TSaborPizza> read FSaboresSelecionados write SetSaboresSelecionados;
    property proximoID: integer read FproximoID write SetproximoID;
  end;

implementation

{ TListaSabores }
{
procedure TListaSabores.addSabor(sabor: TSaborPizza);
var
 i: integer;
 total : integer;
 inseriu : boolean;
 strJson : string;
begin
  inseriu := false;
  i := Low(Fsabores);
  total:= High(Self.Fsabores);

   while ( (i <  total) and (inseriu = false)) do
   begin
     if Fsabores[i] = nil then
      begin
        Fsabores[i] := sabor;
        inseriu := true;
      end;
      i := i+1;
   end;

end;
 }

procedure TListaSabores.SetproximoID(const Value: integer);
begin
  FproximoID := Value;
end;

procedure TListaSabores.SetSaboresSelecionados(const Value: TObjectList<TSaborPizza>);
begin
  FSaboresSelecionados := Value;
end;

{ TProduto }

procedure TProduto.Clone(aObject: TObject);
begin
  if Assigned(aObject) then
  begin
    if aObject.InheritsFrom(TProduto) then
    begin
      self.Fcodigo := TProduto(aObject).Fcodigo;
      self.FcodBarras := TProduto(aObject).FcodBarras;
      self.Fdescricao := TProduto(aObject).Fdescricao;
      self.FvalorUnitario := TProduto(aObject).FvalorUnitario;
      self.FcodGrupoTouch := TProduto(aObject).FcodGrupoTouch;
      self.FcodMiniPrinter := TProduto(aObject).FcodMiniPrinter;
      self.Fpizza := TProduto(aObject).Fpizza;
      self.Fbalanca := TProduto(aObject).Fbalanca;
      self.Ffracionado := TProduto(aObject).Ffracionado;
      self.FtamanhoPizza := TProduto(aObject).FtamanhoPizza;
    end;

  end;
end;

constructor TProduto.Create;
begin
  Fdescricao := '';
  FcodBarras := '';
  Fcodigo := '';
  FcodGrupoTouch := '';
  Fpizza := false;
  Fbalanca := false;
  FcodMiniPrinter := '';
end;

procedure TProduto.Setbalanca(const Value: boolean);
begin
  Fbalanca := Value;
end;

procedure TProduto.SetcodBarras(const Value: string);
begin
  FcodBarras := Value;
end;

procedure TProduto.SetcodGrupoTouch(const Value: string);
begin
  FcodGrupoTouch := Value;
end;

procedure TProduto.Setcodigo(const Value: string);
begin
  Fcodigo := Value;
end;

procedure TProduto.SetcodMiniPrinter(const Value: string);
begin
  FcodMiniPrinter := Value;
end;

procedure TProduto.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TProduto.Setfracionado(const Value: boolean);
begin
  Ffracionado := Value;
end;

procedure TProduto.Setpizza(const Value: Boolean);
begin
  Fpizza := Value;
end;

procedure TProduto.SettamanhoPizza(const Value: string);
begin
  FtamanhoPizza := Value;
end;

procedure TProduto.SetvalorUnitario(const Value: Double);
begin
  FvalorUnitario := Value;
end;

{ TSaborPizza }

procedure TSaborPizza.Clone(aObject: TObject);
begin

  if Assigned(aObject) then
  begin
    if aObject.InheritsFrom(TSaborPizza) then
    begin
      self.Fid := TSaborPizza(aObject).Fid;
      self.Fcodigo := TSaborPizza(aObject).Fcodigo;
      self.Fdescricao := TSaborPizza(aObject).Fdescricao;
      self.Fproporcao := TSaborPizza(aObject).Fproporcao;
      self.Fproduto := TSaborPizza(aObject).Fproduto;
      self.FindiceQuantidade := TSaborPizza(aObject).FindiceQuantidade;
      self.Fquantidade := TSaborPizza(aObject).Fquantidade;
      self.Fselecionado := TSaborPizza(aObject).Fselecionado;
      Self.BBalcao := TSaborPizza(aObject).BBalcao;
      Self.PBalcao := TSaborPizza(aObject).PBalcao;
      Self.MBalcao := TSaborPizza(aObject).MBalcao;
      Self.GBalcao := TSaborPizza(aObject).GBalcao;
      self.FBalcao := TSaborPizza(aObject).FBalcao;
    end;

  end;

end;

constructor TSaborPizza.Create;
begin

end;

procedure TSaborPizza.SetBBalcao(const Value: string);
begin
  FBBalcao := Value;
end;

procedure TSaborPizza.Setcodigo(const Value: string);
begin
  Fcodigo := Value;
end;

procedure TSaborPizza.Setcor(const Value: integer);
begin
  Fcor := Value;
end;

procedure TSaborPizza.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TSaborPizza.SetFBalcao(const Value: string);
begin
  FFBalcao := Value;
end;

procedure TSaborPizza.SetGBalcao(const Value: string);
begin
  FGBalcao := Value;
end;

procedure TSaborPizza.Setid(const Value: smallint);
begin
  Fid := Value;
end;

procedure TSaborPizza.SetindiceQuantidade(const Value: smallint);
begin
  FindiceQuantidade := Value;
end;

procedure TSaborPizza.SetMBalcao(const Value: string);
begin
  FMBalcao := Value;
end;

procedure TSaborPizza.SetPBalcao(const Value: string);
begin
  FPBalcao := Value;
end;

procedure TSaborPizza.Setproduto(const Value: TProduto);
begin
  Fproduto := Value;
end;

procedure TSaborPizza.Setproporcao(const Value: string);
begin
  Fproporcao := Value;
end;

procedure TSaborPizza.Setquantidade(const Value: extended);
begin
  Fquantidade := Value;
end;

procedure TSaborPizza.Setselecionado(const Value: boolean);
begin
  Fselecionado := Value;
end;

{ TPedido }

procedure TItemPedido.SetFid(const Value: integer);
begin

end;

procedure TItemPedido.SetguidProduto(const Value: string);
begin
  FguidProduto := Value;
end;

procedure TItemPedido.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TItemPedido.Setobs(const Value: string);
begin
  Fobs := Value;
end;

procedure TItemPedido.Setproduto(const Value: TProduto);
begin
  Fproduto := Value;
end;

procedure TItemPedido.Setquantidade(const Value: Double);
begin
  Fquantidade := Value;
end;

procedure TItemPedido.SetsaboresPizza(const Value: string);
begin
  FsaboresPizza := Value;
end;


{ TPedido }

procedure TPedido.addItem(AItem: TItemPedido);
begin
  idItem := idItem + 1;
  AItem.Fid := idItem;
  produtosPedido.Add(AItem);
end;

procedure TPedido.Setgarcon(const Value: string);
begin
  Fgarcon := Value;
end;

procedure TPedido.SetguidPedido(const Value: string);
begin
  FguidPedido := Value;
end;

procedure TPedido.SetidItem(const Value: integer);
begin
  FidItem := Value;
end;

procedure TPedido.Setmesa(const Value: string);
begin
  Fmesa := Value;
end;

procedure TPedido.SetprodutosPedido(const Value: TObjectList<TItemPedido>);
begin
  FprodutosPedido := Value;
end;

procedure TPedido.SetresultadoPedido(const Value: string);
begin
  FresultadoPedido := Value;
end;

procedure TPedido.Setterminal(const Value: string);
begin
  Fterminal := Value;
end;

{ TProdutoPlataforma }
destructor TProdutoPlataforma.destroy;
begin
  destroiSaboresDePizza;
end;



constructor TProdutoPlataforma.Create;
begin
   pizza := false;
   SaboresPizza  := TObjectList<TSaborPizzaPlataforma>.Create(true);
end;

procedure TProdutoPlataforma.destroiSaboresDePizza;
var
  I: Integer;
  ItemSabor : TSaborPizzaPlataforma;
begin
  inherited;
  for I := 0 to SaboresPizza.Count -1  do
   begin     
      ItemSabor :=  SaboresPizza.Items[i];
      FreeAndNil(ItemSabor);   
   end;

end;

procedure TProdutoPlataforma.Setacrescimo(const Value: double);
begin
  Facrescimo := Value;
end;

procedure TProdutoPlataforma.SetCodigoPDV(const Value: string);
begin
  FCodigoPDV := Value;
end;

procedure TProdutoPlataforma.SetcodigoPlataforma(const Value: integer);
begin
  FcodigoPlataforma := Value;
end;

procedure TProdutoPlataforma.Setdesconto(const Value: double);
begin
  Fdesconto := Value;
end;

procedure TProdutoPlataforma.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProdutoPlataforma.Setdisponibilidade(const Value: boolean);
begin
  Fdisponibilidade := Value;
end;

procedure TProdutoPlataforma.SetExternalID(const Value: string);
begin
  FExternalID := Value;
end;

procedure TProdutoPlataforma.SetidCadastroItemPrincipal(const Value: integer);
begin
  FidCadastroItemPrincipal := Value;
end;

procedure TProdutoPlataforma.SetIDProdutoPai(const Value: LongInt);
begin
  FIDProdutoPai := Value;
end;

procedure TProdutoPlataforma.SetIDProdutoPlataforma(const Value: string);
begin
  FIDProdutoPlataforma := Value;
end;

procedure TProdutoPlataforma.SetID_categoria(const Value: LongInt);
begin
  FID_categoria := Value;
end;

procedure TProdutoPlataforma.SetmerchantId(const Value: integer);
begin
  FmerchantId := Value;
end;

procedure TProdutoPlataforma.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TProdutoPlataforma.SetnomeGrupo(const Value: string);
begin
  FnomeGrupo := Value;
end;

procedure TProdutoPlataforma.SetObservacaoPreparo(const Value: string);
begin
  FObservacaoPreparo := Value;
end;

procedure TProdutoPlataforma.Setordem(const Value: integer);
begin
  Fordem := Value;
end;

procedure TProdutoPlataforma.Setpizza(const Value: Boolean);
begin
  Fpizza := Value;
end;

procedure TProdutoPlataforma.Setpreco(const Value: double);
begin
  Fpreco := Value;
end;

procedure TProdutoPlataforma.SetQuantidade(const Value: double);
begin
  FQuantidade := Value;
end;

procedure TProdutoPlataforma.SetSaboresPizza(
  const Value: TObjectList<TSaborPizzaPlataforma>);
begin
  FSaboresPizza := Value;
end;

procedure TProdutoPlataforma.SetsaboresPizzaDescricao(const Value: string);
begin
  FsaboresPizzaDescricao := Value;
end;

procedure TProdutoPlataforma.SetTamanhoPizza(const Value: string);
begin
  FTamanhoPizza := Value;
end;

procedure TProdutoPlataforma.Settotal(const Value: double);
begin
  Ftotal := Value;
end;

procedure TProdutoPlataforma.SettotalSubProdutos(const Value: double);
begin
  FtotalSubProdutos := Value;
end;

{ TFormaPagtoPlataforma }

procedure TFormaPagtoPlataforma.Setautorizacao(const Value: string);
begin
  Fautorizacao := Value;
end;

procedure TFormaPagtoPlataforma.SetcodigoPDV(const Value: string);
begin
  FcodigoPDV := Value;
end;

procedure TFormaPagtoPlataforma.SetCodigoPlataforma(const Value: integer);
begin
  FCodigoPlataforma := Value;
end;

procedure TFormaPagtoPlataforma.Setdescricao(const Value: string);
begin
  Fdescricao := Value;
end;

procedure TFormaPagtoPlataforma.Setid(const Value: longInt);
begin
  Fid := Value;
end;

procedure TFormaPagtoPlataforma.SetidFormaPagtoPlataforma(const Value: string);
begin
  FidFormaPagtoPlataforma := Value;
end;

procedure TFormaPagtoPlataforma.SetidPedido(const Value: longint);
begin
  FidPedido := Value;
end;

procedure TFormaPagtoPlataforma.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TFormaPagtoPlataforma.SetprePaga(const Value: boolean);
begin
  FprePaga := Value;
end;

procedure TFormaPagtoPlataforma.Settransacao(const Value: string);
begin
  Ftransacao := Value;
end;

procedure TFormaPagtoPlataforma.Setvalor(const Value: double);
begin
  Fvalor := Value;
end;

{ TCategoriaPlataforma }

procedure TCategoriaPlataforma.SetcodigoPlataforma(const Value: integer);
begin
  FcodigoPlataforma := Value;
end;

procedure TCategoriaPlataforma.Setdisponibilidade(const Value: boolean);
begin
  Fdisponibilidade := Value;
end;

procedure TCategoriaPlataforma.Setid(const Value: longint);
begin
  Fid := Value;
end;

procedure TCategoriaPlataforma.SetidCategoriaPlataforma(const Value: string);
begin
  FidCategoriaPlataforma := Value;
end;

procedure TCategoriaPlataforma.SetmerchantID(const Value: integer);
begin
  FmerchantID := Value;
end;

procedure TCategoriaPlataforma.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TCategoriaPlataforma.Setordem(const Value: integer);
begin
  Fordem := Value;
end;

{ TClientePlataforma }

procedure TClientePlataforma.SetcodPlataforma(const Value: integer);
begin
  FcodPlataforma := Value;
end;

procedure TClientePlataforma.SetID(const Value: LongInt);
begin
  FID := Value;
end;

procedure TClientePlataforma.SetIDClientePlataforma(const Value: string);
begin
  FIDClientePlataforma := Value;
end;

procedure TClientePlataforma.SetIDMerchant(const Value: integer);
begin
  FIDMerchant := Value;
end;

procedure TClientePlataforma.SetIDNumericoPlataforma(const Value: LongInt);
begin
  FIDNumericoPlataforma := Value;
end;

procedure TClientePlataforma.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TClientePlataforma.SetQtdPedidos(const Value: integer);
begin
  FQtdPedidos := Value;
end;

procedure TClientePlataforma.Settelefone(const Value: string);
begin
  Ftelefone := Value;
end;

constructor TPedidoPlataforma.create;
begin
  cliente := TClientePlataforma.Create;
  Endereco := TEnderecoPlataforma.Create;
  Plataforma := TPlataformaPedidos.Create;
  criaListaDeProdutos;
  criaListaDePagamentos;

end;

procedure TPedidoPlataforma.criaListaDePagamentos;
begin
  Pagamentos := TObjectList<TFormaPagtoPlataforma>.Create(true);
  Pagamentos.OwnsObjects := true;
end;

procedure TPedidoPlataforma.criaListaDeProdutos;
begin
  Produtos := TObjectList<TProdutoPlataforma>.Create(true);
  Produtos.OwnsObjects := true;

end;

procedure TPedidoPlataforma.destroiListaDeProdutos;
begin
  Produtos.Free;
end;

procedure TPedidoPlataforma.destroiListaDePagamentos();
begin
  Pagamentos.Free;
end;

destructor TPedidoPlataforma.destroy;
begin
  cliente.Free;
  Endereco.Free;
  Plataforma.Free;
  destroiListaDeProdutos;
  destroiListaDePagamentos;
  inherited;
end;

procedure TPedidoPlataforma.SetbairroIntegrado(const Value: boolean);
begin
  FbairroIntegrado := Value;
end;

procedure TPedidoPlataforma.Setcancelado(const Value: boolean);
begin
  Fcancelado := Value;
end;

procedure TPedidoPlataforma.Setcliente(const Value: TClientePlataforma);
begin
  Fcliente := Value;
end;

procedure TPedidoPlataforma.SetclienteIntegrado(const Value: boolean);
begin
  FclienteIntegrado := Value;
end;

procedure TPedidoPlataforma.SetCodBairroSistema(const Value: integer);
begin
  FCodBairroSistema := Value;
end;

procedure TPedidoPlataforma.SetcodClienteSistema(const Value: integer);
begin
  FcodClienteSistema := Value;
end;

procedure TPedidoPlataforma.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TPedidoPlataforma.Setconfirmado(const Value: boolean);
begin
  Fconfirmado := Value;
end;

procedure TPedidoPlataforma.SetCPFCliente(const Value: string);
begin
  FCPFCliente := Value;
end;

procedure TPedidoPlataforma.SetDesconto(const Value: double);
begin
  FDesconto := Value;
end;

procedure TPedidoPlataforma.SetEndereco(const Value: TEnderecoPlataforma);
begin
  FEndereco := Value;
end;

procedure TPedidoPlataforma.SetidClientePlataforma(const Value: integer);
begin
  FidClientePlataforma := Value;
end;

procedure TPedidoPlataforma.SetidPedido(const Value: LongInt);
begin
  FidPedido := Value;
end;

procedure TPedidoPlataforma.SetidPedidoPlataforma(const Value: string);
begin
  FidPedidoPlataforma := Value;
end;

procedure TPedidoPlataforma.Setintegrado(const Value: boolean);
begin
  Fintegrado := Value;
end;


procedure TPedidoPlataforma.SetLocalizador(const Value: string);
begin
  FLocalizador := Value;
end;

procedure TPedidoPlataforma.SetNomeBairroSistema(const Value: string);
begin
  FNomeBairroSistema := Value;
end;

procedure TPedidoPlataforma.SetNomeClienteSistema(const Value: string);
begin
  FNomeClienteSistema := Value;
end;

procedure TPedidoPlataforma.SetPagamentos(const Value: TObjectList<TFormaPagtoPlataforma>);
begin
  FPagamentos := Value;
end;

procedure TPedidoPlataforma.SetPlataforma(const Value: TPlataformaPedidos);
begin
  FPlataforma := Value;
end;

procedure TPedidoPlataforma.SetProdutos(const Value: TObjectList<TProdutoPlataforma>);
begin
  FProdutos := Value;
end;

procedure TPedidoPlataforma.SetqtdPedidosCliente(const Value: integer);
begin
  FqtdPedidosCliente := Value;
end;


procedure TPedidoPlataforma.SetResponsavelEntrega(const Value: boolean);
begin
  FResponsavelEntrega := Value;
end;

procedure TPedidoPlataforma.SetretirarNoLocal(const Value: Boolean);
begin
  FretirarNoLocal := Value;
end;

procedure TPedidoPlataforma.SetStatusIntegracaoAtual(const Value: integer);
begin
  FStatusIntegracaoAtual := Value;
end;

procedure TPedidoPlataforma.Setsubtotal(const Value: double);
begin
  Fsubtotal := Value;
end;

procedure TPedidoPlataforma.SetTaxaDeEntrega(const Value: double);
begin
  FTaxaDeEntrega := Value;
end;

procedure TPedidoPlataforma.SetTaxaServico(const Value: Double);
begin
  FTaxaServico := Value;
end;

procedure TPedidoPlataforma.SetTotal(const Value: double);
begin
  FTotal := Value;
end;

procedure TPedidoPlataforma.SetValorPagamentoPendente(const Value: double);
begin
  FValorPagamentoPendente := Value;
end;

{ TEnderecoPlataforma }

procedure TEnderecoPlataforma.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TEnderecoPlataforma.SetCodPlataforma(const Value: integer);
begin
  FCodPlataforma := Value;
end;

procedure TEnderecoPlataforma.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TEnderecoPlataforma.SetID(const Value: longint);
begin
  FID := Value;
end;

procedure TEnderecoPlataforma.SetidCliente(const Value: longInt);
begin
  FidCliente := Value;
end;

procedure TEnderecoPlataforma.SetIdLogradouro(const Value: longint);
begin
  FIdLogradouro := Value;
end;

procedure TEnderecoPlataforma.SetLatitude(const Value: double);
begin
  FLatitude := Value;
end;

procedure TEnderecoPlataforma.SetLongitude(const Value: double);
begin
  FLongitude := Value;
end;

procedure TEnderecoPlataforma.Setnumero(const Value: string);
begin
  Fnumero := Value;
end;

{ TItemPedidoPlataforma }

procedure TItemPedidoPlataforma.SetCodProdutoSistema(const Value: string);
begin
  FCodProdutoSistema := Value;
end;

procedure TItemPedidoPlataforma.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TItemPedidoPlataforma.Setobservacoes(const Value: string);
begin
  Fobservacoes := Value;
end;

procedure TItemPedidoPlataforma.Setpreco(const Value: double);
begin
  Fpreco := Value;
end;

procedure TItemPedidoPlataforma.Setquantidade(const Value: double);
begin
  Fquantidade := Value;
end;

procedure TItemPedidoPlataforma.Settotal(const Value: double);
begin
  Ftotal := Value;
end;

{ TPlataforma }


{ TPlataformaPedidos }


{ TPlataformaPedidos }

procedure TPlataformaPedidos.SetCodTabelaPreco(const Value: integer);
begin
  FCodTabelaPreco := Value;
end;

procedure TPlataformaPedidos.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TPlataformaPedidos.SetNome(const Value: string);
begin
  FNome := Value;
end;

{ TSaborPizzaPlataforma }


{ TSaborPizzaPlataforma }

procedure TSaborPizzaPlataforma.SetcodProduto(const Value: string);
begin
  FcodProduto := Value;
end;

procedure TSaborPizzaPlataforma.SetcodSabor(const Value: string);
begin
  FcodSabor := Value;
end;

procedure TSaborPizzaPlataforma.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TSaborPizzaPlataforma.Setproporcao(const Value: string);
begin
  Fproporcao := Value;
end;



procedure TSaborPizzaPlataforma.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TSaborPizzaPlataforma.SetvalorUnitario(const Value: Currency);
begin
  FvalorUnitario := Value;
end;

end.

