unit ObsClienteDeliveryModel;

interface

uses
  System.SysUtils;

type

  TObsClienteDelivery = class
  private
    _codObs : integer;
    _codCliente: string;
    _observacao: string;
    _dataCadastro: TDate;
    _alertaPedidos: boolean;
    _imprimirNaProducao: boolean;

    procedure setCodObs(AcodObs : integer);
    procedure setCodCliente(AcodCliente: string);
    procedure setObservacao(Aobservacao: string);
    procedure setDataCadastro(ADataCadastro: TDate);
    procedure setAlertaPedido(AalertaPedidos: boolean);
    procedure setImprimirNaProducao(AImprimirNaProducao: boolean);




  public
   property codObs    : integer read _codObs write setCodObs;
   property codCliente : string read _codCliente write setCodCliente;
   property observacao : string read _observacao write setObservacao;
   property dataCadastro : TDate  read _dataCadastro write setDataCadastro;
   property alertaPedidos : boolean read _alertaPedidos write setAlertaPedido;
   property imprimirNaProducao : boolean read _imprimirNaProducao write setImprimirNaProducao;

   constructor Create ;
   function cadastrar: boolean;
   function excluir:  Boolean;
   function validar() : boolean;

  end;



implementation

{ TObsClienteDelivery }

uses ObsClienteDeliveryDAO;




constructor TObsClienteDelivery.Create;
begin
  inherited;
  Self.alertaPedidos  := false;
  Self.imprimirNaProducao := false;
  Self.dataCadastro := Date;
  Self.observacao :='';
  Self.codCliente := '';
end;

function TObsClienteDelivery.excluir: Boolean;
var
 vDAO : TObsClienteDeliveryDAO;
begin
 Result := false;

  vDAO := TObsClienteDeliveryDAO.Create();
  try
    vDAO.excluir(Self);
    Result := true;
  finally
    vDAO.Free;
  end;

end;

procedure TObsClienteDelivery.setAlertaPedido(AalertaPedidos: boolean);
begin
  _alertaPedidos := AalertaPedidos;
end;

procedure TObsClienteDelivery.setCodCliente(AcodCliente: string);
begin
 _codCliente := AcodCliente;
end;

procedure TObsClienteDelivery.setCodObs(AcodObs: integer);
begin
  _codObs := AcodObs;
end;

procedure TObsClienteDelivery.setDataCadastro(ADataCadastro: TDate);
begin
   _dataCadastro := ADataCadastro;
end;

procedure TObsClienteDelivery.setImprimirNaProducao(
  AImprimirNaProducao: boolean);
begin
  _imprimirNaProducao := AImprimirNaProducao;
end;

procedure TObsClienteDelivery.setObservacao(Aobservacao: string);
begin
  _observacao := Aobservacao;
end;


function TObsClienteDelivery.validar : boolean;
begin
result := false;

  if ( trim(self.observacao) = '')  then
   raise Exception.Create('Observação inválida!');

  if ( trim(self.codCliente ) = '')  then
   raise Exception.Create('Código de cliente inválido!');

 Result := true;
end;




function TObsClienteDelivery.cadastrar : boolean;
var
 vDAO : TObsClienteDeliveryDAO;
begin
 Result := false;

 if validar()  then
  begin
    vDAO := TObsClienteDeliveryDAO.Create();
    try
      vDAO.cadastrar(Self);
      Result := true;
    finally
      vDAO.Free;
    end;
  end;

end;


end.
