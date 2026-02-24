unit uuDmIntegracoes;

interface

uses
  System.SysUtils, System.Classes,

  Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf;

type
  TdmIntegracoes = class(TDataModule)
    qryCsBairrosSistema: TFDQuery;
    dsIntegracoesBairro: TDataSource;
    dsBairrosSistema: TDataSource;
    qryConsultaEmpresas: TFDQuery;
    dsCsPlataformas: TDataSource;
    qryCsFormasPagamento: TFDQuery;
    dsFormasPagamento: TDataSource;
    tbIntegraBairros: TFDMemTable;
    tbIntegraFormasPagto: TFDMemTable;
    dsIntegraFormaPagto: TDataSource;
    FDQuery1: TFDQuery;
    TEMP: TDataSource;
    tbIntegracoesParametros: TFDMemTable;
    csParametros: TDataSource;
    tbIntegraBairrosID: TLargeintField;
    tbIntegraBairrosNOME: TStringField;
    tbIntegraBairrosCOD_BAIRRO_SISTEMA: TIntegerField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmIntegracoes: TdmIntegracoes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmIntegracoes.DataModuleCreate(Sender: TObject);
begin
  dmIntegracoes.qryCsBairrosSistema.Active  := true;
  dmIntegracoes.qryConsultaEmpresas.Active     := true;
  dmIntegracoes.qryCsFormasPagamento.active    := true;

end;

procedure TdmIntegracoes.DataModuleDestroy(Sender: TObject);
begin
  tbIntegraBairros.Close;
  tbIntegraFormasPagto.Close;
  qryCsBairrosSistema.Close;
  qryConsultaEmpresas.Close;
  qryCsFormasPagamento.Close;
  tbIntegracoesParametros.Close;
end;

end.
