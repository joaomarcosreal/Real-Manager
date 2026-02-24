unit uuDmContasAPagar;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  uuRealDialog, RealFramework, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  TdmContasAPagar = class(TDataModule)
    tbItensCompraTemp: TFDMemTable;
    tbItensCompraTempcodItem: TStringField;
    qryParticipantes: TFDQuery;
    dsParticipantes: TDataSource;
    qryCsPlanoContas: TFDQuery;
    dsQryCsPlanoContas: TDataSource;
    qryContasBancarias: TFDQuery;
    dsContasBancarias: TDataSource;
    dsContasAPagar: TDataSource;
    qryContasAPagar: TFDMemTable;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    LLancouUmTitulo: Boolean;
    procedure CloseDatasets;
    procedure OpenDatasets;


    { Private declarations }
  public
    { Public declarations }
    procedure setLancouTitulo(ALancado: boolean);
    function getLancouTitulo: boolean;
  end;

var
  dmContasAPagar: TdmContasAPagar;

implementation

uses
  uu_data_module, uu_frm_principal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmContasAPagar.setLancouTitulo(ALancado: boolean);
begin
  LLancouUmTitulo := ALancado;
end;

function TdmContasAPagar.getLancouTitulo: boolean;
begin
  result := LLancouUmTitulo;
end;

procedure TdmContasAPagar.DataModuleDestroy(Sender: TObject);
begin
  CloseDatasets;
end;

procedure TdmContasAPagar.DataModuleCreate(Sender: TObject);
begin
  OpenDatasets;
end;

procedure TdmContasAPagar.OpenDatasets;
begin
  qryParticipantes.Active := true;
  qryCsPlanoContas.Active := true;
  qryContasBancarias.active := True;

end;

procedure TdmContasAPagar.CloseDatasets;
begin
  try
    qryParticipantes.Active := false;
    qryCsPlanoContas.Active := false;
    qryContasBancarias.active := false;
    qryContasAPagar.active := false;
  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao fechar os datasets no DM de contas à pagar.+' + sLineBreak + sLineBreak + E.message);
    end;

  end;

end;

end.

