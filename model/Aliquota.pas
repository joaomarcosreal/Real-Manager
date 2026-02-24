unit Aliquota;

interface

type
  TAliquota = class
  private
    Fpercentual: Double;
    FDescricao: string;
    FCodigo: string;
    FSPED: string;
    FCFOP_SPED: string;
    Fparametro: string;
    FSintegra: string;
    FCST_SPED: string;
    FBaseICMS: Boolean;
    procedure SetBaseICMS(const Value: Boolean);
    procedure SetCFOP_SPED(const Value: string);
    procedure SetCodigo(const Value: string);
    procedure SetCST_SPED(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure Setparametro(const Value: string);
    procedure Setpercentual(const Value: Double);
    procedure SetSintegra(const Value: string);
    procedure SetSPED(const Value: string);
  published
    property Codigo: string read FCodigo write SetCodigo;
    property Descricao: string read FDescricao write SetDescricao;
    property percentual: Double read Fpercentual write Setpercentual;
    property parametro: string read Fparametro write Setparametro;
    property SPED: string read FSPED write SetSPED;
    property CFOP_SPED: string read FCFOP_SPED write SetCFOP_SPED;
    property CST_SPED: string read FCST_SPED write SetCST_SPED;
    property Sintegra: string read FSintegra write SetSintegra;
    property BaseICMS: Boolean read FBaseICMS write SetBaseICMS;
  end;

implementation

{ TAliquota }

procedure TAliquota.SetBaseICMS(const Value: Boolean);
begin
  FBaseICMS := Value;
end;

procedure TAliquota.SetCFOP_SPED(const Value: string);
begin
  FCFOP_SPED := Value;
end;

procedure TAliquota.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TAliquota.SetCST_SPED(const Value: string);
begin
  FCST_SPED := Value;
end;

procedure TAliquota.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TAliquota.Setparametro(const Value: string);
begin
  Fparametro := Value;
end;

procedure TAliquota.Setpercentual(const Value: Double);
begin
  Fpercentual := Value;
end;

procedure TAliquota.SetSintegra(const Value: string);
begin
  FSintegra := Value;
end;

procedure TAliquota.SetSPED(const Value: string);
begin
  FSPED := Value;
end;

end.

