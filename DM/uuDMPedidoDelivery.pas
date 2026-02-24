unit uuDMPedidoDelivery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  uu_data_module, IBX.IBDatabase, Vcl.Controls, RxMemDS, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Comp.DataSet, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf;

type
  TdmPedidoDelivery = class(TDataModule)
    dsObservacoesClientes: TDataSource;
    dsUltimosPedidos: TDataSource;
    dsQryItensUltimosPedidos: TDataSource;
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
    dsQryTabelaPrecos: TDataSource;
    tbCsClientesDelivery: TFDMemTable;
    dsConsultaClientes: TDataSource;
    tbObservacoesClientes: TFDMemTable;
    tbTabelaDePrecos: TFDMemTable;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    dsMovimentoResumido: TDataSource;
    qryUltimosPedidos: TFDQuery;
    qryItensUltimosPedidos: TFDQuery;
    tbMovimentoResumido: TFDMemTable;
    qryCsFormasPagamento: TFDQuery;
    dsQryCsFormasPagamento: TDataSource;
    qryMesasAbertas: TFDQuery;
    dsQryMesasAbertas: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure getTabelasBasicas;
    procedure getTabelasDePrecos;
    procedure getTabelaFormasPagamento;
    procedure CloseDatasets;



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

procedure TdmPedidoDelivery.DataModuleCreate(Sender: TObject);
begin
  getTabelasBasicas;
end;

procedure TdmPedidoDelivery.getTabelasDePrecos;
var
  LSQL: TStringList;
begin

  tbTabelaDePrecos.Active := false;
  LSQL := TStringList.Create();
  try
    LSQL.Clear;
    LSQL.Add('select * from tabelas_preco tb order by tb.codigo');
    dm.getMemTable(tbTabelaDePrecos, LSQL.Text);
  finally
    FreeAndNil(LSQL);

  end;

end;

procedure TdmPedidoDelivery.getTabelaFormasPagamento();
begin
  qryCsFormasPagamento.Active := false;
  qryCsFormasPagamento.SQL.clear;
  qryCsFormasPagamento.SQL.add(' select fp.cod_forma, fp.descricao, fp.tef, fp.permite_troco ');
  qryCsFormasPagamento.SQL.add('  from formas_pagamento fp ');
  qryCsFormasPagamento.SQL.add('  where fp.desativada =0');
  qryCsFormasPagamento.SQL.add('  and fp.delivery=1');
  qryCsFormasPagamento.SQL.add(' order by fp.descricao');
  qryCsFormasPagamento.Active := true;

end;

procedure TdmPedidoDelivery.getTabelasBasicas();
begin
  getTabelasDePrecos;
  getTabelaFormasPagamento;
  qryMesasAbertas.Active := true;
end;

procedure TdmPedidoDelivery.DataModuleDestroy(Sender: TObject);
begin
  CloseDatasets;

  tbFormasPagamentoTemp.Active := false;
  FreeAndNil(tbCsClientesDelivery);
  FreeAndNil(tbObservacoesClientes);
  FreeAndNil(tbFormasPagamentoTemp);
  FreeAndNil(tbTabelaDePrecos);
end;

procedure TdmPedidoDelivery.CloseDatasets;
begin
  tbObservacoesClientes.Active := false;
  tbCsClientesDelivery.Active := false;
  tbObservacoesClientes.Active := false;
  qryUltimosPedidos.Active := false;
  qryItensUltimosPedidos.active := false;
  qryCsFormasPagamento.Active := false;
  qryMesasAbertas.Active := false;
end;

procedure TdmPedidoDelivery.copiarPedido(codPedido: string; numeroCaixa: string; codusuario: string; mesa: string);
var
  ts: TIBTransaction;
  qryCopiaPedido: TIBQuery;
begin

  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  qryCopiaPedido := TIBQuery.Create(Self);
  qryCopiaPedido.Database := dm.dbrestaurante;
  qryCopiaPedido.Transaction := ts;
  qryCopiaPedido.Active := false;

  try

    qryCopiaPedido.SQL.Clear;
    qryCopiaPedido.SQL.Add('execute procedure copiapedidodelivery(' + Quotedstr(codPedido) + ',' + Quotedstr(mesa) + ',' + Quotedstr(numeroCaixa) + ',' + Quotedstr(codusuario) + ')');

    try
      dm.adicionaLog(qryCopiaPedido.SQL.Text);
      qryCopiaPedido.ExecSQL;
      ts.Commit;

      qryCopiaPedido.Active := false;
      qryCopiaPedido.SQL.Clear;
      qryCopiaPedido.SQL.Add('select tabela_preco from pedidos_delivery p where p.codigo=' + QUotedstr(codPedido));
      qryCopiaPedido.Active := true;

      dm.setTabelaPrecoAtual(qryCopiaPedido.FieldByName('tabela_preco').Value);
      dm.modificaTabelaDePrecoItensLancados(mesa, qryCopiaPedido.FieldByName('tabela_preco').Value);

    except

      on E: Exception do
      begin
        dm.adicionaLog('Erro ao copiar pedido +' + codPedido + '. ' + e.Message);
        dm.adicionaLog(qryCopiaPedido.SQL.Text);
        raise Exception.Create('Erro ao copiar pedido' + e.Message);
        ts.Rollback;
      end;

    end;

  finally
    qryCopiaPedido.Active := false;
    FreeAndNil(qryCopiaPedido);
    FreeAndNil(ts);
  end;

end;

procedure TdmPedidoDelivery.BuscaUltimosPedidos(ACodCliente: string);
var
  LSQL: TStringList;
begin
  LSQL := TStringList.Create();
  try
    LSQL.Add(' select first 20 p.codigo, p.data, p.hora, p.nome_entregador, p.valor_total ');
    LSQL.Add('   from pedidos_delivery p');
    LSQL.Add('  where p.cod_cliente=' + Quotedstr(ACodCliente));
    LSQL.Add('    order by p.codigo desc');
    dm.adicionaLog(LSQL.Text);
    qryUltimosPedidos.Active := false;
    qryUltimosPedidos.sql.clear;
    qryUltimosPedidos.sql.add(LSQL.Text);
    qryUltimosPedidos.Active := true;

  finally
    FreeAndNil(LSQL);
  end;
end;

procedure TdmPedidoDelivery.buscaItensDoPedidoDelivery();
var
  LSQL: TStringList;
begin
  LSQL := TStringList.Create();
  try
    LSQL.Add('     select it.id, it.cod_pedido, it.cod_produto, ');
    LSQL.Add('            p.descricao ,it.valor_unitario, it.quantidade, it.observacoes, it.sabores ');
    LSQL.Add('        from itens_pedido_delivery it ');
    LSQL.Add('       inner join produtos p on (p.cod_produto = it.cod_produto) ');
    LSQL.Add('        where it.cod_pedido=' + Quotedstr(qryUltimosPedidos.FieldByName('codigo').Value));
    qryItensUltimosPedidos.active := false;
    qryItensUltimosPedidos.sql.clear;
    qryItensUltimosPedidos.sql.add(LSQL.Text);
    qryItensUltimosPedidos.active := true;

  finally
    FreeAndNil(LSQL);
  end;
end;

end.

