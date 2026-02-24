unit GrupoAdicionalController;

interface

uses
  GrupoAdicionalDAO, GrupoAdicional, system.SysUtils,
  System.Classes, URealDatasets;

type
  TGrupoAdicionalController = class
  private
    function Validar(AGrupoAdicional: TGrupoAdicional): Boolean;
  public
    procedure Cadastrar(AGrupoAdicional: TGrupoAdicional; AConexao: TRealConnection);
    procedure Get(AGrupoAdicional: TGrupoAdicional; AConexao: TRealConnection);
    procedure Atualizar(AGrupoAdicional: TGrupoAdicional; AConexao: TRealConnection);
  end;

implementation

{ TGrupoAdicionalController }

procedure TGrupoAdicionalController.Atualizar(AGrupoAdicional: TGrupoAdicional; AConexao: TRealConnection);
var
  LGrupoAdicionalDAO: TGrupoAdicionalDAO;
begin

  LGrupoAdicionalDAO := TGrupoAdicionalDAO.Create;

  try
    try
      if Validar(AGrupoAdicional) then
        LGrupoAdicionalDAO.Atualizar(AGrupoAdicional, AConexao);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    FreeAndNil(LGrupoAdicionalDAO);
  end;

end;

procedure TGrupoAdicionalController.Cadastrar(AGrupoAdicional: TGrupoAdicional; AConexao: TRealConnection);
var
  LGrupoAdicionalDAO: TGrupoAdicionalDAO;
begin

  LGrupoAdicionalDAO := TGrupoAdicionalDAO.Create;

  try
    try
      if Validar(AGrupoAdicional) then
      LGrupoAdicionalDAO.Cadastrar(AGrupoAdicional, AConexao);

    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    FreeAndNil(LGrupoAdicionalDAO);
  end;

end;

procedure TGrupoAdicionalController.Get(AGrupoAdicional: TGrupoAdicional; AConexao: TRealConnection);
var
  LGrupoAdicionalDAO: TGrupoAdicionalDAO;
begin

  LGrupoAdicionalDAO := TGrupoAdicionalDAO.Create;

  try
    try

      LGrupoAdicionalDAO.Get(AGrupoAdicional, AConexao);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
  finally
    FreeAndNil(LGrupoAdicionalDAO);
  end;

end;

function TGrupoAdicionalController.Validar(AGrupoAdicional: TGrupoAdicional): Boolean;
begin
  Result := False;
  try
    try
      if AGrupoAdicional.Unico = true then
       begin
         AGrupoAdicional.QtdeMinima :=1;
         AGrupoAdicional.QtdeMaxima :=1;
       end;

      if (AGrupoAdicional.QtdeMinima =1) and (AGrupoAdicional.QtdeMaxima =1) then
       AGrupoAdicional.Unico := true;


      if (trim(AGrupoAdicional.Nome) = '') then
        raise Exception.Create('Nome do grupo de adicional inválido!');

      if (trim(AGrupoAdicional.Descricao) = '') then
        raise Exception.Create('Descrição do grupo inválida!');

      if AGrupoAdicional.QtdeMinima > AGrupoAdicional.QtdeMaxima then
        raise Exception.Create('Quantidade mínima não pode ser maior que a quantidade máxima!');

      if AGrupoAdicional.tipo = 1 then
      begin
        if AGrupoAdicional.QtdeMinima <= 0 then
        begin
          raise Exception.Create('Se o grupo for obrigatório, a quantidade mínima deve ser maior que zero!');
        end;
        if AGrupoAdicional.QtdeMaxima <= 0 then
        begin
          raise Exception.Create('Se o grupo for obrigatório, a quantidade mínima deve ser maior que zero!');
        end;
      end;

      Result := true;
    except
      on E: Exception do
      begin
         raise Exception.Create(e.Message);
      end;

    end;
  finally

  end;

end;

end.

