unit uuDMInventarios;

interface

uses
  System.SysUtils, System.Classes, uu_data_module, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmInventarios = class(TDataModule)
    qryHistoricosInventarios: TFDQuery;
    dsQryHistoricosInventario: TDataSource;
    tbItensInventarioTemp: TFDMemTable;
    tbItensInventarioTempCOD_PRODUTO: TStringField;
    qryCsProdutos: TFDQuery;
    tbItensInventarioTempDESCRICAO: TStringField;
    tbItensInventarioTempQTDE_SISTEMA: TBCDField;
    tbItensInventarioTempQTDE_APURADA: TBCDField;
    tbItensInventarioTempAJUSTE: TBCDField;
    tbItensInventarioTempESTOQUE_FINAL: TBCDField;
    tbItensInventarioTempCOD_UNIDADE: TStringField;
    dsItensIventario: TDataSource;
    tbItensInventarioTempDESC_UNIDADE: TStringField;
    tbItensInventarioTempTOTAL_AJUSTE: TCurrencyField;
    tbItensInventarioTempCUSTO: TCurrencyField;
    qryCsProdutosCOD_PRODUTO: TStringField;
    qryCsProdutosDESCRICAO: TStringField;
    qryCsProdutosESTOQUE_ATUAL: TFMTBCDField;
    qryCsProdutosDESCRICAO_UNIDADE: TStringField;
    qryCsProdutosGRUPO: TStringField;
    dsQryCsProdutos: TDataSource;
    qryCsProdutosVALOR_CUSTO: TBCDField;
    qryCsProdutosVALOR_ESTOQUE: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmInventarios: TdmInventarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmInventarios.DataModuleCreate(Sender: TObject);
begin
   qryHistoricosInventarios.Active :=  true;
   qryHistoricosInventarios.First;

   qryCsProdutos.Active := true;
   qryCsProdutos.First;

end;

end.
