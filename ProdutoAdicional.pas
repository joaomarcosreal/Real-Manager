unit ProdutoAdicional;

interface
uses
  System.SysUtils;

  type
   TProdutoAdicional = class
  private
    Fvalor: Double;
    FidGrupoAdicional: integer;
    Fid: integer;
    FcodProduto: string;
    procedure SetcodProduto(const Value: string);
    procedure Setid(const Value: integer);
    procedure SetidGrupoAdicional(const Value: integer);
    procedure Setvalor(const Value: Double);
   published
    property id : integer read Fid write Setid;
    property idGrupoAdicional : integer read FidGrupoAdicional write SetidGrupoAdicional;
    property codProduto : string read FcodProduto write SetcodProduto;
    property valor : Double read Fvalor write Setvalor;


   end;
implementation

{ TProdutoAdicional }

procedure TProdutoAdicional.SetcodProduto(const Value: string);
begin
  FcodProduto := Value;
end;

procedure TProdutoAdicional.Setid(const Value: integer);
begin
  Fid := Value;
end;

procedure TProdutoAdicional.SetidGrupoAdicional(const Value: integer);
begin
  FidGrupoAdicional := Value;
end;

procedure TProdutoAdicional.Setvalor(const Value: Double);
begin
  Fvalor := Value;
end;

end.
