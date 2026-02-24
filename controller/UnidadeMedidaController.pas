unit UnidadeMedidaController;

interface

uses
  UnidadeMedida, UnidadeMedidaDAO, system.SysUtils, System.Classes,
  URealDatasets;

type
  TUnidadeMedidaController = class
  private
    function Validar(AUnidadeMedida: TUnidadeMedida): Boolean;
  public

    procedure CreateNew(AUnidadeMedida: TUnidadeMedida; AConexao: TRealConnection);
    procedure Read(AUnidadeMedida: TUnidadeMedida; AConexao: TRealConnection);
    procedure Update(AUnidadeMedida: TUnidadeMedida; AConexao: TRealConnection);
  end;

implementation

{ TUnidadeMedidaController }

function TUnidadeMedidaController.Validar(AUnidadeMedida: TUnidadeMedida): Boolean;
begin
  result := False;

  if trim(AUnidadeMedida.Descricao) = '' then
    raise Exception.Create('Descrição da unidade inválida!');

  if Length(Trim(AUnidadeMedida.Descricao)) < 5 then
    raise Exception.Create('Descrição da unidade é muito pequena. Defina uma descrição com mais detalhes!');

  if Length(Trim(AUnidadeMedida.Sigla)) < 2 then
    raise Exception.Create('Sigla da unidade inválida. Defina siglas com mais de 2 caracteres!');

  if AUnidadeMedida.valor <= 0 then
    raise Exception.Create('Valor absoluto da unidade deve ser maior que zero!');

  result := true;
end;

procedure TUnidadeMedidaController.CreateNew(AUnidadeMedida: TUnidadeMedida; AConexao: TRealConnection);
var
  LUnidadeMedidaDAO: TUnidadeMedidaDAO;
begin

  LUnidadeMedidaDAO := TUnidadeMedidaDAO.Create;

  try
    try
      if Validar(AUnidadeMedida) then
        LUnidadeMedidaDAO.CreateNew(AUnidadeMedida, AConexao);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    FreeAndNil(LUnidadeMedidaDAO);
  end;

end;

procedure TUnidadeMedidaController.Update(AUnidadeMedida: TUnidadeMedida; AConexao: TRealConnection);
var
  LUnidadeMedidaDAO: TUnidadeMedidaDAO;
begin

  LUnidadeMedidaDAO := TUnidadeMedidaDAO.Create;

  try
    try
      if Validar(AUnidadeMedida) then
        LUnidadeMedidaDAO.Update(AUnidadeMedida, AConexao);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    FreeAndNil(LUnidadeMedidaDAO);
  end;

end;

procedure TUnidadeMedidaController.Read(AUnidadeMedida: TUnidadeMedida; AConexao: TRealConnection);
var
  LUnidadeMedidaDAO: TUnidadeMedidaDAO;
begin

  LUnidadeMedidaDAO := TUnidadeMedidaDAO.Create;

  try
    try

      LUnidadeMedidaDAO.Read(AUnidadeMedida, AConexao);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    FreeAndNil(LUnidadeMedidaDAO);
  end;

end;

end.

