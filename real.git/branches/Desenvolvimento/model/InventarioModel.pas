unit InventarioModel;

interface


 type Inventario = class
  private
    FCodigo: integer;
    FDataSistema: TDateTime;
    FDataInventario: TDateTime;
    FDataSo: TDatetime;
    FTotalInventario: double;
    FUsuarioResponsavel: string;
    FCodEmpresa: string;
    FcodUsuario: string;
    FNomeUsuario: string;
    FTotalPerdas: double;
    FcodHistorico: string;
    Fobservacoes: string;

    procedure Setcodigo(const Value: integer);
    procedure SetDataInventario(const Value: TDateTime);
    procedure SetDataSistema(const Value: TDateTime);
    procedure SetDataSo(const Value: TDatetime);
    procedure SetCodEmpresa(const Value: string);
    procedure SetcodHistorico(const Value: string);
    procedure SetcodUsuario(const Value: string);
    procedure SetNomeUsuario(const Value: string);
    procedure SetTotalInventario(const Value: double);
    procedure SetTotalPerdas(const Value: double);
    procedure SetUsuarioResponsavel(const Value: string);
    procedure Setobservacoes(const Value: string);


   public
     property Codigo : integer read Fcodigo write Setcodigo;
     property DataInventario : TDateTime read FDataInventario write SetDataInventario;
     property DataSistema : TDateTime read FDataSistema write SetDataSistema;
     property DataSo : TDatetime read FDataSo write SetDataSo;
     property codHistorico : string read FcodHistorico write SetcodHistorico;
     property codUsuario : string read FcodUsuario write SetcodUsuario;
     property NomeUsuario : string read FNomeUsuario write SetNomeUsuario;
     property UsuarioResponsavel : string read FUsuarioResponsavel write SetUsuarioResponsavel;
     property CodEmpresa : string read FCodEmpresa write SetCodEmpresa;
     property TotalPerdas : double read FTotalPerdas write SetTotalPerdas;
     property TotalInventario : double read FTotalInventario write SetTotalInventario;
     property observacoes : string read Fobservacoes write Setobservacoes;

 end;

implementation

{ Inventario }

procedure Inventario.SetCodEmpresa(const Value: string);
begin
  FCodEmpresa := Value;
end;

procedure Inventario.SetcodHistorico(const Value: string);
begin
  FcodHistorico := Value;
end;

procedure Inventario.Setcodigo(const Value: integer);
begin
  Fcodigo := Value;
end;



procedure Inventario.SetcodUsuario(const Value: string);
begin
  FcodUsuario := Value;
end;

procedure Inventario.SetDataInventario(const Value: TDateTime);
begin

end;

procedure Inventario.SetDataSistema(const Value: TDateTime);
begin
  FDataSistema := Value;
end;

procedure Inventario.SetDataSo(const Value: TDatetime);
begin
  FDataSo := Value;
end;

procedure Inventario.SetNomeUsuario(const Value: string);
begin
  FNomeUsuario := Value;
end;

procedure Inventario.Setobservacoes(const Value: string);
begin
  Fobservacoes := Value;
end;

procedure Inventario.SetTotalInventario(const Value: double);
begin
  FTotalInventario := Value;
end;

procedure Inventario.SetTotalPerdas(const Value: double);
begin
  FTotalPerdas := Value;
end;

procedure Inventario.SetUsuarioResponsavel(const Value: string);
begin
  FUsuarioResponsavel := Value;
end;

end.
