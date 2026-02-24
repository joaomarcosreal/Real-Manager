unit ObsClienteDeliveryDAO;

interface

uses ObsClienteDeliveryModel;

type

  TObsClienteDeliveryDAO = class
  public
    procedure cadastrar(AObsClienteDelivery: TObsClienteDelivery);
    procedure excluir(AObsClienteDelivery: TObsClienteDelivery);

  end;

implementation

uses
  IBX.IBQuery, IBX.IBDatabase, uu_data_module, System.SysUtils;

{ TObsClienteDeliveryDAO }

{ TObsClienteDeliveryDAO }

procedure TObsClienteDeliveryDAO.cadastrar(AObsClienteDelivery
  : TObsClienteDelivery);
var
  LqryCadastrar: TIBquery;
  Ltransacao: TIBTransaction;
  LnomeGenerator: string;
begin
  LnomeGenerator := 'G_OBS_CLIENTES_DELIVERY';
  Ltransacao := TIBTransaction.Create(nil);
  Ltransacao.Params.Add('read_committed');
  Ltransacao.Params.Add('rec_version');
  Ltransacao.Params.Add('nowait');

  Ltransacao.DefaultDatabase := dm.dbrestaurante;
  Ltransacao.Active := false;
  Ltransacao.Active := true;

  LqryCadastrar := TIBquery.Create(nil);
  LqryCadastrar.Database := dm.dbrestaurante;
  LqryCadastrar.Transaction := Ltransacao;

  try
    try

      LqryCadastrar.Active := false;
      LqryCadastrar.SQL.Clear;
      LqryCadastrar.SQL.Add('select gen_id(' + LnomeGenerator +
        ', 1) from rdb$database');
      LqryCadastrar.Active := true;
      AObsClienteDelivery.codObs := LqryCadastrar.Fields[0].AsInteger;

      LqryCadastrar.Active := false;
      LqryCadastrar.SQL.Clear;
      LqryCadastrar.SQL.Add('insert into OBS_CLIENTES_DELIVERY (CODIGO, COD_CLI, DATA, OBSERVACAO, ALERTA, IMPRIMIR_PRODUCAO) ');
      LqryCadastrar.SQL.Add('       values (');
      LqryCadastrar.SQL.add(  Inttostr(AObsClienteDelivery.codObs)+',');
      LqryCadastrar.SQL.add(  Quotedstr(AObsClienteDelivery.codCliente)+',');
      LqryCadastrar.SQL.add(  Quotedstr(FormatDateTime('DD.MM.YYY',AObsClienteDelivery.dataCadastro))+',');
      LqryCadastrar.SQL.add(  Quotedstr(AObsClienteDelivery.observacao)+',');
      if AObsClienteDelivery.alertaPedidos = true then
           LqryCadastrar.SQL.add(  Inttostr(1)+',')
      else
           LqryCadastrar.SQL.add(  Inttostr(0)+',');


      if AObsClienteDelivery.imprimirNaProducao = true then
           LqryCadastrar.SQL.add(  Inttostr(1)+')')
        else
           LqryCadastrar.SQL.add(  Inttostr(0)+')');

      LqryCadastrar.ExecSQL;
      Ltransacao.Commit;


    except
        on E : Exception  do
        begin
          raise Exception.Create(E.Message);
        end;
    end;

  finally
    LqryCadastrar.Close;
    freeandNil(LqryCadastrar);
    freeandNil(Ltransacao);
  end;

end;

procedure TObsClienteDeliveryDAO.excluir(
  AObsClienteDelivery: TObsClienteDelivery);
var
  LqryExcluir: TIBquery;
  Ltransacao: TIBTransaction;
begin
  Ltransacao := TIBTransaction.Create(nil);
  Ltransacao.DefaultDatabase := dm.dbrestaurante;
  Ltransacao.Active := false;
  Ltransacao.Params.Add('read_committed');
  Ltransacao.Params.Add('rec_version');
  Ltransacao.Params.Add('nowait');


  LqryExcluir := TIBquery.Create(nil);
  LqryExcluir.Database := dm.dbrestaurante;
  LqryExcluir.Transaction   := Ltransacao;

  try
    Ltransacao.Active := true;
    LqryExcluir.Active := false;
    LqryExcluir.sql.Clear;
    LqryExcluir.SQL.Add('delete from OBS_CLIENTES_DELIVERY where codigo='+Inttostr(AObsClienteDelivery.codObs));

    try
      LqryExcluir.ExecSQL;
      Ltransacao.Commit;
    except
     on E : Exception  do
        begin
          raise Exception.Create(E.Message);
        end;
    end;

  finally
     LqryExcluir.Active := false;
     Ltransacao.Active := false;
     FreeAndNil(LqryExcluir);
     FreeAndNil(Ltransacao);
  end;
end;

end.
