unit uuDMProducaoSubprodutos;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client, frxDBSet,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Stan.Async,
  FireDAC.DApt, frxClass, FireDAC.Comp.DataSet, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf;

type
  TdmProducaoSubprodutos = class(TDataModule)
    qryHistoricosProducao: TFDQuery;
    dsQryHistoricosProducao: TDataSource;
    tbSubprodutosProducao: TFDMemTable;
    tbSubprodutosProducaocodProduto: TStringField;
    tbSubprodutosProducaocustoUnitario: TCurrencyField;
    tbSubprodutosProducaocustoTotal: TCurrencyField;
    dsTbProdutosProducaoTemp: TDataSource;
    tbSubprodutosProducaoDescricao: TStringField;
    tbSubprodutosProducaopercentualReceita: TBCDField;
    tbSubprodutosProducaoUnidade: TStringField;
    tbSubprodutosProducaocodUnidade: TStringField;
    dsFichaProducao: TDataSource;
    tbFichaProducao: TFDMemTable;
    tbSubprodutosProducaoqtdeProduzida: TBCDField;
    dsListagemProducao: TDataSource;
    tbSubprodutosProducaorendimentoReceita: TBCDField;
    qryRelFichaProducao: TFDQuery;
    DtqryRelFichaProducao: TfrxDBDataset;
    qryRelOrdemProducao: TFDQuery;
    dtQryRelOrdemProducao: TfrxDBDataset;
    qryProdutosOrdemProducao: TFDQuery;
    DtQryProdutosOrdemProducao: TfrxDBDataset;
    qryInsumosOrdemProducao: TFDQuery;
    dtqryInsumosOrdemProducao: TfrxDBDataset;
    tbListagemProducao: TFDMemTable;
    dsInsumosProcessamento: TDataSource;
    tbInsumosProcessamento: TFDMemTable;
    tbInsumosProcessamentoID: TLargeintField;
    tbInsumosProcessamentoCOD_PRODUTO: TStringField;
    tbInsumosProcessamentoDESCRICAO: TStringField;
    tbInsumosProcessamentoCODUNIDADE: TStringField;
    tbInsumosProcessamentoUNIDADE: TStringField;
    tbInsumosProcessamentoPB: TFMTBCDField;
    tbInsumosProcessamentoPERC_PERDA: TFMTBCDField;
    tbInsumosProcessamentoPL: TFMTBCDField;
    tbInsumosProcessamentoPE: TFMTBCDField;
    tbInsumosProcessamentoQTDE_RETIRADA: TFMTBCDField;
    tbInsumosProcessamentoQTDE_UTILIZADA: TFMTBCDField;
    tbInsumosProcessamentoQTDE_PERDA: TFMTBCDField;
    tbInsumosProcessamentoQTDE_SOBRA: TFMTBCDField;
    tbInsumosProcessamentoPERCENTUAL_PERDA: TFMTBCDField;
    tbInsumosProcessamentoDESVIO_PERDA: TFMTBCDField;
    tbInsumosProcessamentoDESVIO_QUANTIDADE: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure tbSubprodutosProducaoBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmProducaoSubprodutos: TdmProducaoSubprodutos;

implementation

uses
  uu_data_module;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmProducaoSubprodutos.DataModuleCreate(Sender: TObject);
begin
  qryHistoricosProducao.Active := true;
  tbSubprodutosProducao.Active := true;
end;

procedure TdmProducaoSubprodutos.DataModuleDestroy(Sender: TObject);
begin
  qryHistoricosProducao.Active := false;
  tbSubprodutosProducao.Active := false;
  tbFichaProducao.Active := false;
  tbInsumosProcessamento.active := false;
end;

procedure TdmProducaoSubprodutos.tbSubprodutosProducaoBeforePost(DataSet: TDataSet);
begin
  if DataSet.State = dsEdit then
  begin
    if tbSubprodutosProducaoqtdeProduzida.Value <= 0 then
    begin
      dm.exibe_painel_erro('Quantidade deve ser maior que zero!', 'Ok');
      DataSet.Cancel;
    end
    else
    begin
      tbSubprodutosProducaopercentualReceita.Value := ((tbSubprodutosProducaoqtdeProduzida.Value * 100) / tbSubprodutosProducaorendimentoReceita.Value);
    end;
  end;
end;

end.

