unit uCapturaImagem;

interface

uses
  System.SysUtils, System.JSON;

type
  TLogImagem = class
  private
    FId: Integer;
    FGuid: string;
    FMesa: string;
    FHora: string;
    FImagem: string;
    FNomeProduto: string;
    FQuantidade: Double;
    procedure SetImagem(const Value: string);
    procedure SetNomeProduto(const Value: string);
    procedure SetQuantidade(const Value: Double);
  public
    property Id: Integer read FId write FId;
    property Guid: string read FGuid write FGuid;
    property Mesa: string read FMesa write FMesa;
    property Hora: string read FHora write FHora;
    property Imagem: string read FImagem write FImagem;
    property NomeProduto: string read FNomeProduto write FNomeProduto;
    property Quantidade: Double read FQuantidade write FQuantidade;
    function ToJSON: string;
    class procedure FromJSON(const JSONString: string; AInstance: TLogImagem); static;
    class function TrocaPontoPVirgula(Valor: string): string; static;
    class function TrocaVirgPPto(Valor: string): string; static;
  end;

implementation

{ TReserva }

procedure TLogImagem.SetImagem(const Value: string);
begin
  FImagem := Value;
end;

procedure TLogImagem.SetNomeProduto(const Value: string);
begin
  FNomeProduto := Value;
end;

procedure TLogImagem.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

function TLogImagem.ToJSON: string;
var
  LJson: TJSONObject;
begin
  Result := '';
  LJson := TJSONObject.Create;
  try
    LJson.AddPair('Id', TJSONNumber.Create(FId));
    LJson.AddPair('Guid', FGuid);
    LJson.AddPair('Mesa', FMesa);
    LJson.AddPair('Hora', FHora);
    LJson.AddPair('Imagem', FImagem);
    LJson.AddPair('NomeProduto', FNomeProduto);
    LJson.AddPair('Quantidade', TrocaVirgPPto(FloatToStr(FQuantidade)));
    Result := LJson.ToJSON;
  finally
    FreeAndNil(LJson);
  end;
end;

class procedure TLogImagem.FromJSON(const JSONString: string; AInstance: TLogImagem);
var
  JSONObject: TJSONObject;
begin

  JSONObject := TJSONObject.ParseJSONValue(JSONString) as TJSONObject;
  try
    AInstance.FId := JSONObject.GetValue('Id').Value.ToInteger;
    AInstance.FGuid := JSONObject.GetValue('Guid').Value;
    AInstance.FMesa := JSONObject.GetValue('Mesa').Value;
    AInstance.FHora := JSONObject.GetValue('Hora').Value;
    AInstance.Imagem := JSONObject.GetValue('Imagem').Value;
    AInstance.NomeProduto := JSONObject.GetValue('NomeProduto').Value;
    AInstance.Quantidade := StrToFloat(TrocaPontoPVirgula(JSONObject.GetValue('Quantidade').Value));

  finally
    JSONObject.Free;
  end;
end;

class function TLogImagem.TrocaVirgPPto(Valor: string): string;
var
  i: Integer;
begin
  if Valor <> ' ' then
  begin
    for i := 0 to Length(Valor) do
    begin
      if Valor[i] = '.' then
      begin
        Valor[i] := ',';
      end
      else if Valor[i] = ',' then
      begin
        Valor[i] := '.';
      end;
    end;
  end;
  Result := Valor;
end;

class function TLogImagem.TrocaPontoPVirgula(Valor: string): string;
//
// Troca a virgula pelo ponto em um valor Float
//
var
  i: Integer;
begin
  if Valor <> ' ' then
  begin
    for i := 0 to Length(Valor) do
    begin
      if Valor[i] = ',' then
      begin
        Valor[i] := '.';
      end
      else if Valor[i] = '.' then
      begin
        Valor[i] := ',';
      end;
    end;
  end;
  Result := Valor;
end;

end.

