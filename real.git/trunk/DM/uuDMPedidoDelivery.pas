unit uuDMPedidoDelivery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  uu_data_module, IBX.IBDatabase, System.ImageList, Vcl.ImgList, Vcl.Controls,
  RxMemDS;

type
  TdmPedidoDelivery = class(TDataModule)
    qryObservacoesClientes: TIBQuery;
    dsObservacoesClientes: TDataSource;
    tsObservacoesClientesDelivery: TIBTransaction;
    ImageList1: TImageList;
    qryUltimosPedidos: TIBQuery;
    dsUltimosPedidos: TDataSource;
    tsUltimosPedidos: TIBTransaction;
    qryUltimosPedidosCODIGO: TIBStringField;
    qryUltimosPedidosDATA: TDateField;
    qryUltimosPedidosHORA: TTimeField;
    qryUltimosPedidosNOME_ENTREGADOR: TIBStringField;
    qryUltimosPedidosVALOR_TOTAL: TIBBCDField;
    qryItensUltimosPedidos: TIBQuery;
    dsQryItensUltimosPedidos: TDataSource;
    qryItensUltimosPedidosID: TLargeintField;
    qryItensUltimosPedidosCOD_PEDIDO: TIBStringField;
    qryItensUltimosPedidosCOD_PRODUTO: TIBStringField;
    qryItensUltimosPedidosDESCRICAO: TIBStringField;
    qryItensUltimosPedidosQUANTIDADE: TIBBCDField;
    qryItensUltimosPedidosOBSERVACOES: TIBStringField;
    qryItensUltimosPedidosSABORES: TIBStringField;
    qryItensUltimosPedidosVALOR_UNITARIO: TIBBCDField;
    dsFormasPagtoTemp: TDataSource;
    tbFormasPagamentoTemp: TRxMemoryData;
    tbFormasPagamentoTempcodForma: TStringField;
    tbFormasPagamentoTempdescricaoForma: TStringField;
    tbFormasPagamentoTempvalorForma: TCurrencyField;
    tbFormasPagamentoTemprp: TStringField;
    tbFormasPagamentoTempoperadoraCartao: TStringField;
    tbFormasPagamentoTempnumeroCartao: TStringField;
    tbFormasPagamentoTempvalidadeCartao: TStringField;
    tbFormasPagamentoTempcodigoCartao: TStringField;
    tbFormasPagamentoTempcodCliFaturamento: TStringField;
    tbFormasPagamentoTempobsFaturamento: TStringField;
    procedure DataModuleDestroy(Sender: TObject);
  private



    { Private declarations }
  public
    { Public declarations }
    procedure BuscaUltimosPedidos(ACodCliente: string);
    procedure buscaItensDoPedidoDelivery();
    procedure copiarPedido(codPedido, numeroCaixa, codusuario, mesa: string);
  end;

var
  dmPedidoDelivery: TdmPedidoDelivery;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}



{$R *.dfm}

procedure TdmPedidoDelivery.DataModuleDestroy(Sender: TObject);
begin
  qryObservacoesClientes.Active := false;
  tsObservacoesClientesDelivery.Active := false;
  qryUltimosPedidos.Active := false;
  tsUltimosPedidos.Active := false;
end;





procedure TdmPedidoDelivery.copiarPedido(codPedido : string; numeroCaixa : string ; codusuario : string; mesa : string);
var
  ts: TIBTransaction;
  qryCopiaPedido : TIBQuery;
begin
 dm.adicionaLog('...');

  ts      :=   TIBTransaction.Create(self);
  ts.DefaultDatabase   :=  dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  qryCopiaPedido := TIBQuery.Create(Self);
  qryCopiaPedido.Database := dm.dbrestaurante;
  qryCopiaPedido.Transaction := ts;
  qryCopiaPedido.Active := false;

  try

    qryCopiaPedido.SQL.Clear;
    qryCopiaPedido.SQL.Add('execute procedure copiapedidodelivery('+Quotedstr(codPedido)+','
                            +Quotedstr(mesa)+','+Quotedstr(numeroCaixa)+','+Quotedstr(codusuario)+')');

    try
    dm.adicionaLog(qryCopiaPedido.SQL.Text);
    qryCopiaPedido.ExecSQL;
    ts.Commit;
    except

      on E : Exception  do
        begin
           dm.adicionaLog('Erro ao copiar pedido +'+codPedido+'. '+e.Message);
           dm.adicionaLog(qryCopiaPedido.SQL.Text);
           raise Exception.Create('Erro ao copiar pedido'+e.Message);
           ts.Rollback;
        end;

    end;


  finally
     qryCopiaPedido.Active := false;
     FreeAndNil(qryCopiaPedido);
     FreeAndNil(ts);
  end;


end;


procedure TdmPedidoDelivery.BuscaUltimosPedidos(ACodCliente : string);
begin
  tsUltimosPedidos.Active := false;
  tsUltimosPedidos.Active := true;
  qryUltimosPedidos.SQL.Clear;
  qryUltimosPedidos.SQL.Add(' select first 20 p.codigo, p.data, p.hora, p.nome_entregador, p.valor_total ');
  qryUltimosPedidos.SQL.Add('   from pedidos_delivery p');
  qryUltimosPedidos.SQL.Add('  where p.cod_cliente='+Quotedstr(AcodCliente));
  qryUltimosPedidos.SQL.Add('    order by p.data   desc');
  qryUltimosPedidos.Active := true;
end;

procedure TdmPedidoDelivery.buscaItensDoPedidoDelivery();
begin
  qryItensUltimosPedidos.Active := false;
  qryItensUltimosPedidos.SQL.Clear;
  qryItensUltimosPedidos.SQL.Add('     select it.id, it.cod_pedido, it.cod_produto, ');
  qryItensUltimosPedidos.SQL.Add('            p.descricao,it.valor_unitario, it.quantidade, it.observacoes, it.sabores ');
  qryItensUltimosPedidos.SQL.Add('        from itens_pedido_delivery it ');
  qryItensUltimosPedidos.SQL.Add('       inner join produtos p on (p.cod_produto = it.cod_produto) ');
  qryItensUltimosPedidos.SQL.Add('        where it.cod_pedido='+Quotedstr(qryUltimosPedidosCODIGO.Value  ));
  qryItensUltimosPedidos.Active := true;
end;


end.
