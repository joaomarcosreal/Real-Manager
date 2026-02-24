unit PaisDAO;

interface

uses PaisModel,  IBX.IBQuery, IBX.IBDatabase, uu_data_module, System.SysUtils;



   type TPaisDAO = class
     public
      function getDados(APais : TPais) : boolean;
      function cadastrar(APais : TPais) : boolean;
   end;

implementation

{ TPaisDAO }


{ TPaisDAO }

function TPaisDAO.cadastrar(APais: TPais): boolean;
begin

end;

function TPaisDAO.getDados(APais: TPais): boolean;
var
  LQryConsulta: TIBquery;
  LTransacao: TIBTransaction;
begin

  Ltransacao := TIBTransaction.Create(nil);
  Ltransacao.Params.Add('read_committed');
  Ltransacao.Params.Add('rec_version');
  Ltransacao.Params.Add('nowait');


  LQryConsulta := TIBquery.Create(nil);
  LQryConsulta.Database := dm.dbrestaurante;
  LQryConsulta.Transaction := Ltransacao;

  try
    Ltransacao.DefaultDatabase := dm.dbrestaurante;
    Ltransacao.Active := false;
    Ltransacao.Active := true;

    LQryConsulta.Active := false;
    LQryConsulta.SQL.Clear;
    LQryConsulta.SQL.Add('select p.codigo, p.nome from paises p where p.codigo='+Quotedstr(APais.Codigo));
    LQryConsulta.Active := true;
    LQryConsulta.FetchAll;

    if LQryConsulta.IsEmpty  then
      Result := false
    else
     begin
       APais.Codigo := LQryConsulta.FieldByName('codigo').Value;
       APais.Nome   := LQryConsulta.FieldByName('nome').Value;
       Result := true;
     end;

  finally
    LQryConsulta.Active := false;
    LTransacao.Active := false;
    FreeAndNil(LQryConsulta);
    FreeAndNil(LTransacao);
  end;
end;

end.
