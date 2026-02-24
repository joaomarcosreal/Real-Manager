unit uuDMExpedicaoDelivery;

interface

uses
  System.SysUtils, System.Classes, uu_data_module, Data.DB, IBX.IBCustomDataSet,
  System.Character, ACBrUtil, IBX.IBQuery, ibx.ibdatabase, rest.Client,
  REST.Types, system.Variants, FireDAC.Comp.Client, FireDAC.Comp.UI,
  frameworkMobile, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.DataSet,
  Data.Bind.Components, Data.Bind.ObjectScope, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  THttpStatusCode = (scAccepted, scAmbiguous, scBadGateway, scBadRequest, scConflict, scContinue, scCreated, scExpectationFailed, scForbidden, scFound, scGatewayTimeout, scGone, scHttpVersionNotSupported, scInternalServerError, scLengthRequired, scMethodNotAllowed, scMoved, scMovedPermanently, scMultipleChoices, scNoContent, scNonAuthoritativeInformation, scNotAcceptable, scNotFound, scNotImplemented, scNotModified, scOK, scPartialContent, scPaymentRequired, scPreconditionFailed,
    scProxyAuthenticationRequired, scRedirect, scRedirectKeepVerb, scRedirectMethod, scRequestedRangeNotSatisfiable, scRequestEntityTooLarge, scRequestTimeout, scRequestUriTooLong, scResetContent, scSeeOther, scServiceUnavailable, scSwitchingProtocols, scTemporaryRedirect, scUnauthorized, scUnsupportedMediaType, scUnused, scUpgradeRequired, scUseProxy, scUnknown);

  TTipoRota = (teGetUserTokens, teConfirmOrderIfood, teCancelOrderIfood, teSetReadyIfood, teDispatchIFood, teStatusIfood, teReadyToPickUP, teConsultaFornecedor);


  TdmExpedicaoDelivery = class(TDataModule)
    dsTbEntregadores: TDataSource;
    dsQryExpedicaoDElivery: TDataSource;
    tbExpedicaoDelivery: TFDMemTable;
    tbPolling: TFDMemTable;
    dsPolling: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    tbParametrosIntegracao: TFDMemTable;
    tbCsClientesDelivery: TFDMemTable;
    dsCsClientesDelivery: TDataSource;
    tbEntregadores: TFDMemTable;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    RESTRequest1: TRESTRequest;
    tbCorrecaoCodigos: TFDMemTable;
    dsTbCorrecaoCodigos: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure AbriTabelaDeEntregadores;
    function getSuccesCodeByRoute(ARota: TTipoRota): THttpStatusCode;
    procedure AddBodyForm(ARequisicao: TRESTRequest; ABody: TStringList);
    procedure AddCustomBody(ARequisicao: TRESTRequest; ABody: TStringList);
    procedure AddHeaders(ARequisicao: TRESTRequest; AHeaders: TStringList);
    function getRouteTyPe(ARota: TTipoRota): TRestRequestMethod;
    function ConvertToStatusCode(Value: integer): THttpStatusCode;



    { Private declarations }

  public
    function HTTPRequest(ARota: TTipoRota; URLParam: string; AHeaders, ABody,
      AResponseString: TStringList; AConnectTimeout, AReadTimeout: Integer;
      ATipoDaRequisicao: String): Boolean;

    procedure AtualizaTabelaDeParametros;
    function getContentTypeByRoute(ARota: TTipoRota): string;
    function getURIByRouteType(ARota: TTipoRota): string;

    { Public declarations }
    procedure EfetuaSaidaDoPedido(AcodPedido, ACodEntregador: string; ANomeEntregador: string);
    function getValorParametro(NomeParametro: string): string;
    procedure AssociarCliente(APedidoAtual: TPedidoPlataforma; ACodigoClienteSistema: string);
    procedure CadastraNovoCliente(APedidoAtual: TPedidoPlataforma);
    procedure AtualizaCadastroDoCLiente(APedidoAtual: TPedidoPlataforma);
    function trataJsonInicial(AJSON: string): string;
    function StripNonJson(s: string): string;
  end;

var
  dmExpedicaoDelivery: TdmExpedicaoDelivery;

const
  HTTP_CODES: array[THttpStatusCode] of integer = (202{scAccepted}, 300{scAmbiguous}, 502{scBadGateway}, 400{scBadRequest}, 409{scConflict}, 100{scContinue}, 201{scCreated}, 417{scExpectationFailed}, 403{scForbidden}, 302{scFound}, 504{scGatewayTimeout}, 410{scGone}, 505{scHttpVersionNotSupported}, 500{scInternalServerError}, 411{scLengthRequired}, 405{scMethodNotAllowed}, 301{scMoved}, 301{scMovedPermanently}, 300{scMultipleChoices}, 204{scNoContent}, 203{scNonAuthoritativeInformation}, 406
    {scNotAcceptable}, 404{scNotFound}, 501{scNotImplemented}, 304{scNotModified}, 200{scOK}, 206{scPartialContent}, 402{scPaymentRequired}, 412{scPreconditionFailed}, 407{scProxyAuthenticationRequired}, 302{scRedirect}, 307{scRedirectKeepVerb}, 303{scRedirectMethod}, 416{scRequestedRangeNotSatisfiable}, 413{scRequestEntityTooLarge}, 408{scRequestTimeout}, 414{scRequestUriTooLong}, 205{scResetContent}, 303{scSeeOther}, 503{scServiceUnavailable}, 101{scSwitchingProtocols}, 307{scTemporaryRedirect}, 401{scUnauthorized}, 415{scUnsupportedMediaType}, 306{scUnused}, 426{scUpgradeRequired}, 305{scUseProxy}, 0{scUnknown}
      );
  URL_BaseIFood: string = 'https://merchant-api.ifood.com.br';
  ClientIDIfood: string = 'a869f921-7adf-46e1-aba5-dcec111a8015';
  ClientSecretIfood: string = 'mo3zltdkej1ufweuqnli4ge77z7hbwdrn2gpspx7wyiak7o6vne6ykjhtny53j3j6nbuptpwb9el8218ym9nqklem106esj6lqs';

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmExpedicaoDelivery.DataModuleCreate(Sender: TObject);
begin
  AtualizaTabelaDeParametros;
  AbriTabelaDeEntregadores;
end;

procedure TdmExpedicaoDelivery.AbriTabelaDeEntregadores;
begin
  try
    try
      dm.getMemTable(tbEntregadores, 'select codigo, NOME_ENTREGADOR from entregadores where status=1 order by NOME_ENTREGADOR');
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao popular tabela de entregadores! ' + sLineBreak + sLineBreak + E.Message, 'Ok');
        raise Exception.Create('Erro ao popular tabela de entregadores');
      end;
    end;

  finally

  end;
end;

procedure TdmExpedicaoDelivery.DataModuleDestroy(Sender: TObject);
begin

  tbExpedicaoDelivery.Active := false;
  tbEntregadores.Active := false;
  tbPolling.active := false;
  tbParametrosIntegracao.Active := false;
  tbCorrecaoCodigos.Active := false;

  FreeAndNil(tbExpedicaoDelivery);
  FreeAndNil(tbEntregadores);
  FreeAndNil(tbPolling);
  FreeAndNil(tbParametrosIntegracao);
  FreeAndNil(tbCorrecaoCodigos);

end;

procedure TdmExpedicaoDelivery.AtualizaTabelaDeParametros();
begin
  DM.getMemTable(tbParametrosIntegracao, 'select * from INTEGRACOES_PARAMETROS where codigo_plataforma=1');
end;

function TdmExpedicaoDelivery.getValorParametro(NomeParametro: string): string;
begin

  try
    tbParametrosIntegracao.Locate('PARAMETRO', VarArrayOf([NomeParametro]), [loCaseInsensitive]);
    Result := tbParametrosIntegracao.FieldByName('valor').Value;
  finally

  end;

end;

procedure TdmExpedicaoDelivery.EfetuaSaidaDoPedido(AcodPedido: string; ACodEntregador: string; ANomeEntregador: string);
var
  ts: TIBTransaction;
  LQuery: TIBQuery;
begin

  ts := TIBTransaction.Create(self);
  ts.DefaultDatabase := dm.dbrestaurante;
  ts.Active := false;
  ts.Active := true;

  LQuery := TIBQuery.Create(Self);
  LQuery.Database := dm.dbrestaurante;
  LQuery.Transaction := ts;
  LQuery.Active := false;

  try
    try
      LQuery.SQL.clear;
      LQuery.sql.add('update pedidos_delivery set cod_entregador=' + QuotedStr(ACodEntregador) + ',status=2,nome_entregador=' + Quotedstr(ANomeEntregador) + ',hora_saida=current_timestamp');
      LQuery.SQL.add(' where codigo=' + Quotedstr(AcodPedido));
      LQuery.ExecSQL;
      ts.commit;
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao atualizar a saída do pedido. ' + sLineBreak + e.Message, 'Ok');
        dm.adicionaLog('Erro ao atualizar saída do pedido. ' + E.Message);
        dm.adicionaLog(LQuery.SQL.Text);
      end;
    end;

  finally
    LQuery.Active := false;
    FreeAndNil(LQuery);
    FreeAndNil(ts);
  end;
end;

procedure TdmExpedicaoDelivery.AssociarCliente(APedidoAtual: TPedidoPlataforma; ACodigoClienteSistema: string);
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(self);

  try

    try
      LSQL.Clear;
      LSQL.Add('update integracoes_clientes c set c.cod_cliente_sistema=' + Inttostr(StrToInt(ACodigoClienteSistema)) + ' where c.id=' + Inttostr(APedidoAtual.idClientePlataforma));

      dm.executaSQL(LSQL.Text);
      dm.getDadosDoPedido(APedidoAtual);

      if APedidoAtual.retirarNoLocal = false then
        AtualizaCadastroDoCLiente(APedidoAtual);

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao associar cliente da plataforma ao sistema' + sLineBreak + sLineBreak + E.Message, 'Ok');
        raise Exception.Create('Erro ao associar cliente da plataforma ao sistema');
      end
    end;
  finally
    tbAux.Close;
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);
  end
end;

procedure TdmExpedicaoDelivery.AtualizaCadastroDoCLiente(APedidoAtual: TPedidoPlataforma);
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(self);
  APedidoAtual.cliente.Nome := AnsiUpperCase(TiraAcentos(APedidoAtual.cliente.Nome));
  try
    try
      LSQL.Clear;
      LSQL.Add('update clientes_delivery cd set cd.nome=' + Quotedstr(APedidoAtual.cliente.Nome) + ',');
      LSQL.add(' cd.endereco=' + Quotedstr(APedidoAtual.Endereco.Endereco) + ',');
      LSQL.Add('  cd.cod_bairro=' + IntTostr(APedidoAtual.CodBairroSistema) + ',');
      case APedidoAtual.cliente.codPlataforma of
        1:
          begin
          end;
        2:
          begin
            LSQL.Add('  cd.telefone=' + Quotedstr(APedidoAtual.cliente.telefone) + ',');
          end
      else
        begin
          LSQL.Add('  cd.telefone=' + Quotedstr(APedidoAtual.cliente.telefone) + ',');
        end;

      end;

      LSQL.Add('  cd.complemento=' + Quotedstr(UpperCase(APedidoAtual.Complemento)));
      LSQL.Add('  ,cd.referencia1=' + Quotedstr(''));
      LSQL.Add('  where cd.codigo=' + Quotedstr(Poem_Zeros(APedidoAtual.codClienteSistema, 5)));
      dm.adicionaLog(LSQL.Text);
      dm.executaSQL(LSQL.Text);

    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro ao atualizar o cadastro do cliente no sistema ' + sLineBreak + sLineBreak + E.Message, 'Ok');
        raise Exception.Create('Erro ao atualizar o cadastro do cliente no sistema');
      end
    end
  finally
    tbAux.Close;
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);
  end;

end;

procedure TdmExpedicaoDelivery.CadastraNovoCliente(APedidoAtual: TPedidoPlataforma);
var
  LSQL: TStringList;
  tbAux: TFDMemTable;
  LCodigoCliente: string;
begin

  LSQL := TStringList.Create;
  tbAux := TFDMemTable.Create(self);
  LCodigoCliente := dm.geraCodigo('G_CLIENTES_DELIVERY', 5);
  APedidoAtual.cliente.Nome := AnsiUpperCase(TiraAcentos(APedidoAtual.cliente.Nome));

  try
    try
      LSQL.Clear;
      LSQL.Add('insert into clientes_delivery (codigo, nome,telefone,celular,endereco,');
      LSQL.Add('cod_bairro,complemento) values (');
      LSQL.Add(QUotedstr(LCodigoCliente) + ',');
      LSQL.Add(QuotedStr(APedidoAtual.cliente.Nome) + ',');
      LSQL.Add(Quotedstr(APedidoAtual.cliente.telefone) + ',');
      LSQL.Add(Quotedstr(APedidoAtual.cliente.telefone) + ',');
      LSQL.add(Quotedstr(UpperCase(APedidoAtual.Endereco.Endereco)) + ',');
      LSQL.Add(IntTostr(APedidoAtual.CodBairroSistema) + ',');
      LSQL.Add(Quotedstr(UpperCase(APedidoAtual.Complemento)) + ')');
      dm.adicionaLog(LSQL.Text);
      dm.executaSQL(LSQL.Text);
      AssociarCliente(APedidoAtual, LCodigoCliente);
    except
      on E: Exception do
      begin
        dm.exibe_painel_erro('Erro realizar o cadastro do cliente no sistema ' + sLineBreak + sLineBreak + E.Message, 'Ok');
        raise Exception.Create('Erro realizar o cadastro do cliente no sistema ');
      end
    end
  finally
    tbAux.Close;
    FreeAndNil(LSQL);
    FreeAndNil(tbAux);
  end;
end;

function TdmExpedicaoDelivery.getURIByRouteType(ARota: TTipoRota): string;
begin
  case ARota of
    teConfirmOrderIfood:
      result := URL_BaseIFood + '/order/v1.0/orders/:URLParam_0/confirm';
    teDispatchIFood:
      result := URL_BaseIFood + '/order/v1.0/orders/:URLParam_0/dispatch';
    teReadyToPickUP:
      result := URL_BaseIFood + '/order/v1.0/orders/:URLParam_0/readyToPickup';
    teCancelOrderIfood:
      result := URL_BaseIFood + '/order/v1.0/orders/:URLParam_0/requestCancellation';
    teGetUserTokens:
      result := URL_BaseIFood + '/authentication/v1.0/oauth/token';
    teStatusIfood:
      result := URL_BaseIFood + '/merchant/v1.0/merchants/:URLParam_0/status';
    teConsultaFornecedor:
      result := 'https://publica.cnpj.ws/cnpj/:URLParam_0';

  end;
end;

function TdmExpedicaoDelivery.getContentTypeByRoute(ARota: TTipoRota): string;
begin

  case ARota of
    teConfirmOrderIfood:
      result := 'application/json';
    teDispatchIFood:
      result := '*/*';
    teReadyToPickUP:
      result := '*/*';

    teCancelOrderIfood:
      result := 'application/json';
    teGetUserTokens:
      result := 'application/x-www-form-urlencoded';
    teStatusIfood:
      result := 'application/json';
      {
    teGetOrderDetails:
      result := 'orders/';
    teGetOrderPayments:
      result := 'payments/';
    teGetUserCredentials:
      result := 'application/x-www-form-urlencoded';

       }
  end;

end;

function TdmExpedicaoDelivery.getRouteTyPe(ARota: TTipoRota): TRestRequestMethod;
begin
  case ARota of
    teConfirmOrderIfood:
      result := rmPost;
    teDispatchIFood:
      result := rmPost;
    teReadyToPickUP:
      result := rmPost;
    teCancelOrderIfood:
      result := rmPOST;
    teGetUserTokens:
      result := rmPost;
    teStatusIfood:
      Result := rmGET;
    teConsultaFornecedor:
      result := rmGET;

  end;
end;

function TdmExpedicaoDelivery.getSuccesCodeByRoute(ARota: TTipoRota): THttpStatusCode;
begin
  case ARota of

    teConfirmOrderIfood:
      result := scAccepted;
    teCancelOrderIfood:
      result := scAccepted;

{
    tePolling:
      result := scOK;
    teGetOrderDetails:
      result := scOK;
    teGetOrderPayments:
      result := scOK;
    teGetUserCredentials:
      result := scok;
 }
  end;
end;

procedure TdmExpedicaoDelivery.AddHeaders(ARequisicao: TRESTRequest; AHeaders: TStringList);
var
  AParam: TRESTRequestParameter;
  I: Integer;
begin
  for I := 0 to AHeaders.Count - 1 do
  begin
    AParam := TRESTRequestParameter.Create(ARequisicao.Params);
    AParam.Kind := pkHTTPHEADER;
    AParam.Name := trim(AHeaders.Names[I]);
    AParam.Value := trim(AHeaders.ValueFromIndex[I]);
    AParam.Options := [poDoNotEncode];
  end;
end;

procedure TdmExpedicaoDelivery.AddBodyForm(ARequisicao: TRESTRequest; ABody: TStringList);
var
  AParam: TRESTRequestParameter;
  I: Integer;
begin
  for I := 0 to ABody.Count - 1 do
  begin
    AParam := TRESTRequestParameter.Create(ARequisicao.Params);
    AParam.Name := triM(ABody.Names[I]);
    AParam.Value := triM(ABody.ValueFromIndex[I]);
    AParam.Options := [poDoNotEncode];
    AParam.ContentType := 'application/x-www-form-urlencoded';
  end;
end;

procedure TdmExpedicaoDelivery.AddCustomBody(ARequisicao: TRESTRequest; ABody: TStringList);
var
  AParam: TRESTRequestParameter;
begin

  AParam := TRESTRequestParameter.Create(ARequisicao.Params);
  AParam.Name := 'bodyE6F48B38F5CF428EBB4450B1DD2EE28F';
  AParam.Value := ABody.Text;
  AParam.Options := [poDoNotEncode];
  AParam.Kind := pkREQUESTBODY;
  AParam.ContentType := 'application/json';

end;

function TdmExpedicaoDelivery.HTTPRequest(ARota: TTipoRota; URLParam: string; AHeaders: TStringList; ABody: TStringList; AResponseString: TStringList; AConnectTimeout: Integer; AReadTimeout: Integer; ATipoDaRequisicao : String ): Boolean;
var
  LSuccessCode: THttpStatusCode;
  LURI: string;
  Resposta: string;
  LBuffer: TBytes;
  Request: TRESTRequest;
  Response: TRESTResponse;
  ResponseCode: THttpStatusCode;
  I: Integer;
begin

  Request := TRESTRequest.Create(self);
  Response := TRESTResponse.Create(self);

  AResponseString.Clear;
  result := false;

  try
    try
      RESTClient1.BaseURL := getURIByRouteType(ARota);
      RESTClient1.BaseURL := StringReplace(RESTClient1.BaseURL, ':URLParam_0', URLParam, [rfReplaceAll, rfIgnoreCase]);

      RESTClient1.ContentType := 'application/json';
      LSuccessCode := getSuccesCodeByRoute(ARota);
      Request.Client := RESTClient1;
      Request.Response := Response;
      Request.AssignedValues := RESTRequest1.AssignedValues;
      Request.Method := getRouteTyPe(ARota);

      Request.ConnectTimeout := AConnectTimeout * 1000;
      Request.ReadTimeout := AReadTimeout * 1000;
      AddHeaders(Request, AHeaders);

      if ((Request.Method in [rmPOST, rmPUT]) and (trim(ABody.Text) <> '')) then
      begin

        if ATipoDaRequisicao = 'application/x-www-form-urlencoded'
        then
            begin
              RESTClient1.ContentType := 'application/x-www-form-urlencoded';
              AddBodyForm(Request, ABody)
            end
        else
          begin
            AddCustomBody(Request, ABody);
          end;



      end;

      try
        try
          Request.Execute;
        except
          on E: Exception do
          begin
            raise Exception.Create(e.Message);
            result := false;
          end;
        end;

        ResponseCode := ConvertToStatusCode(Response.StatusCode);
        if not (ResponseCode in [scInternalServerError, scNotFound, scBadRequest]) then
        begin

          if ResponseCode in [LSuccessCode, scNoContent, scOk, scAccepted] then
          begin

            Resposta := Response.Content;
            AResponseString.Text := Resposta;
            result := true;
          end
          else
          begin
            AResponseString.Clear;
            AResponseString.Add('Url: ' + RESTClient1.BaseURL);
            AResponseString.Add('Status: ' + Response.StatusText);
            AResponseString.Add('Retorno: ' + Response.Content);
            result := false;
          end;
        end;

      except
        on E: Exception do
        begin
          AResponseString.Clear;
          AResponseString.Add('Status: ' + Response.StatusText);
          AResponseString.Add('Retorno: ' + Response.Content);

          raise Exception.Create('Erro na requisição Http ' + e.Message);
          AResponseString.Clear;
          result := false;
        end;
      end;

    except
      on E: Exception do
      begin
        raise Exception.Create('Erro ao fazer requisição http!' + sLineBreak + sLineBreak + E.Message);
        result := false;
      end;

    end;

  finally

    FreeAndNil(Request);
    FreeAndNil(Response);

  end;
end;

function TdmExpedicaoDelivery.ConvertToStatusCode(Value: integer): THttpStatusCode;
begin
  for Result := Low(THttpStatusCode) to High(THttpStatusCode) do
    if Value = HTTP_CODES[Result] then
      Exit;

  Result := scUnknown;
end;

function TdmExpedicaoDelivery.trataJsonInicial(AJSON: string): string;
begin

  AJSON := StripNonJson(AJSON);
  Insert('{"RES":', AJSON, 0);
  Insert('}', AJSON, AJSON.Length + 1);
  result := Trim(AJSON);
end;

function TdmExpedicaoDelivery.StripNonJson(s: string): string;
var
  ch: Char;
  inString: Boolean;
begin
  Result := '';
  inString := False;
  for ch in s do
  begin
    if ch = '"' then
      inString := not inString;
    if TCharacter.IsWhiteSpace(ch) and not inString then
      Continue;
    Result := Result + ch;
  end;
end;

end.

