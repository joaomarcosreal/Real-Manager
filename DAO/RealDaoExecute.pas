unit RealDaoExecute;

interface

uses
  URealDatasets, System.SysUtils, uRESTDWParams, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, URequisicaoAPI, FireDAC.Stan.Option,
  System.Classes;

type
  TRealDAOExecute = class
  private
    FConnection: TRealConnection;
    procedure SetConnection(const Value: TRealConnection);
    function getMemTableByAPI(AMemTable: TRealDataset; ASQL: string): string;
  published
    function GetMemTable(AMemTable: TRealMemTable; ASQL: string): Boolean;
  public
    property Connection: TRealConnection read FConnection write SetConnection;
    constructor Create;
    destructor Destroy; override;
  end;

implementation


{ TRealDAOExecute }

constructor TRealDAOExecute.Create;
begin
  Connection := TRealConnection.Create(nil);
end;

destructor TRealDAOExecute.Destroy;
begin
  Connection.Connected := false;
  Connection.Transaction.Free;
  Connection.Free;
  Connection := nil;

  inherited;
end;

function TRealDAOExecute.GetMemTable(AMemTable: TRealMemTable; ASQL: string): Boolean;
var
  LTransaction: TRealTransaction;
  LQuery: TRealQuery;
  LConexaoRest: Boolean;
begin
  LConexaoRest := false;
  LTransaction := TRealTransaction.Create(nil);
  LQuery := TRealQuery.Create(nil);

  LTransaction.Connection := Connection;
  LQuery.Connection := Connection;
  LQuery.Transaction := LTransaction;

  try
    if LConexaoRest = false then
    begin
      try
        LTransaction.StartTransaction;
        LQuery.Active := False;
        LQuery.SQL.Clear;
        LQuery.SQL.add(ASQL);
        LQuery.Active := True;
        LQuery.FetchAll;
        AMemTable.Active := False;

        AMemTable.LogChanges := False;
        AMemTable.ResourceOptions.SilentMode := True;
        AMemTable.UpdateOptions.LockMode := lmNone;
        AMemTable.UpdateOptions.LockPoint := lpDeferred;
        AMemTable.UpdateOptions.FetchGeneratorsPoint := gpImmediate;
        AMemTable.DisableControls;
        AMemTable.CopyDataSet(LQuery, [coStructure, coRestart, coAppend]);
        AMemTable.EnableControls;
        LQuery.Active := False;
        LTransaction.Commit;

      except
        on E: Exception do
        begin
          LTransaction.Rollback;
          raise Exception.Create(E.Message);
        end;
      end;

    end
    else
    begin
//
//    try
//
//      getMemTableByAPI(AMemTable, ASQL);
//
//    except
//      on E: Exception do
//      begin
//        dm.exibe_painel_erro('Erro ao buscar tabela em memória na API ' + sLineBreak + sLineBreak + 'Erro: ' + E.Message + sLineBreak + sLineBreak + 'Envie essa mensagem para a Real softwares!', 'Ok');
//      end;
//
//    end;

    end;
  finally
    LQuery.Active := False;
    FreeAndNil(LQuery);
    FreeAndNil(LTransaction);
  end;

end;

function TRealDAOExecute.getMemTableByAPI(AMemTable: TRealDataset; ASQL: string): string;
var
  JsonStreamRetorno, JsonSTreamEnvio: TStringStream;
  JsonEventosACK: TStringList;
  URL_Endpoint, URL_Requisicao: string;
  tbEventosACK: TRealDataset;
  linha: string;
  LDWJsonValue: TRESTDWJSONValue;
  LDadosRetornados: TDadosRequisicao;
  LBody: string;
  LURLBase: string;
begin

  result := 'Erro';
  JsonStreamRetorno := TStringStream.Create('', TEncoding.UTF8);
  JsonSTreamEnvio := TStringStream.Create('', TEncoding.UTF8);
  JsonEventosACK := TStringList.Create;
  tbEventosACK := TRealDataset.Create(nil);
  LDWJsonValue := TRESTDWJSONValue.Create;





  //Connection.Rest.Comandos.Clear;
//  Connection.Rest.Comandos.Add(ASQL);
//  LBody := TJson.ObjectToJsonString(Connection.Rest.DatabaseParams);
//  LDadosRetornados := TJson.JsonToObject//<TDadosRequisicaoAPIHorse>(LBody);
//  LURLBase := 'http://' + Connection.Rest.ServerParams.ServerAddress + ':' + Connection.Rest.ServerParams.ServerPort;
  //URL_Endpoint := '/getMemTable';
//  URL_Requisicao := LURLBase + URL_Endpoint;


  try
    try
      JsonSTreamEnvio.Clear;
      JsonSTreamEnvio.WriteString(LBody);
  //    result :=  Connection.Rest.HTTPCLient.Post(URL_Requisicao, JsonSTreamEnvio);
//      if  Connection.Rest.HTTPCLient.ResponseCode = 200 then
//      begin
////        LDWJsonValue.WriteToDataset2(result, AMemTable);
//      end
//      else
//      begin
//        result := 'erro';
//        raise Exception.Create('Erro ao obter dados. Resultado da requisição ' + Inttostr(Connection.Rest.HTTPCLient.ResponseCode));
//      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao obter dados.' + E.Message);
      end;

    end;
  finally
    JsonStreamRetorno.Free;
    JsonSTreamEnvio.Free;
    JsonEventosACK.Free;
    tbEventosACK.Active := false;
    FreeAndNil(tbEventosACK);
    FreeAndNil(tbEventosACK);
    FreeAndNil(LDWJsonValue);
//    Connection.Rest.HTTPCLient.Free;

  end;
end;

procedure TRealDAOExecute.SetConnection(const Value: TRealConnection);
begin
  FConnection := Value;
end;

end.

